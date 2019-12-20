import UIKit

var queue = DispatchQueue(label:"ike", attributes: [.concurrent])

func getName(_ data: Data) -> String? {
    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
        let name = json["name"] as? String {
        return name
    } else {
        return nil
    }
}

//for i in (1...5) {
//    if let url = URL(string: "https://swapi.co/api/people/\(i)/")
//
//    let task = URLSession.shared.dataTask(with: url) {
//
//    }
//}
