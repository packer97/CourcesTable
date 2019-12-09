import WebKit
import UIKit

class LinkViewController: UIViewController {
    
    @IBOutlet weak var linkTableView: UITableView!
    
    
    var links: [Link] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(links.count)")
    }
    
}
extension LinkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return links.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTableViewCell", for: indexPath) as! LinkTableViewCell
        cell.linkLabel.text = links[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let urlString = self.links[indexPath.row].url
        if let url = URL(string: urlString)
        {
            UIApplication.shared.openURL(url)
        }
    }
}

extension LinkViewController: UITableViewDelegate {
    
}
