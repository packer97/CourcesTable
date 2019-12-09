import WebKit
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    var items: [Item] = []
    var titles: [Day] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300

    
            APIServices.shared.getObject(method: APIServices.eventMethod, params: ["id" : "F95908B6-492E-4D4A-B780-66E9DFE413E4"])
            {[weak self] (result : Cource?, error: Error?) in
                if let error = error {
                    print("\(error)")
                } else if let result = result {
                    print("\(result)")
                    self?.update(from: result)
                }
            }
        }
    
}

extension ViewController: UITableViewDataSource {
    private func update(from result: Cource) {
        navigationItem.title = result.event.title
        items = result.event.dayes.compactMap { day in
            return day.items.first
        }
        titles = result.event.dayes
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.titleLabel.text = items[indexPath.row].title
        cell.descriptionLabel.text = items[indexPath.row].itemDescription
        cell.dateTitleLabel.text = titles[indexPath.row].title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowLinks" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let linksVC = segue.destination as! LinkViewController
                linksVC.links = items[indexPath.row].links
            }
        }
    }
    
}
extension ViewController: UITableViewDelegate {
}

