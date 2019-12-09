import Foundation

struct Cource : Codable {
    
    let event: Event
    
}

struct Event : Codable {
    
    let title: String
    let dayes: [Day]
    
}

struct Day : Codable {
    let title: String
    let items: [Item]
}

struct Item : Codable {
    
    let title: String
    let timeString: String
    let presenterName: String
    let itemDescription: String
    let links: [Link]
}

struct Link:Codable {
    var url:String
    var title:String
}
