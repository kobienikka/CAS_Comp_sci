import UIKit

let xrds: [String: Any] = [
    "name": "Crossroads School",
    "foundingYear": 1971,
    "campusus": [
        "Norton",
        "21st Street"
    ]
]

let name0 = xrds["name"]
let name1 = xrds["name"] as! String
let name2 = xrds["name"] as? String

//option 1 to unwrap
if name2 != nil {
    let unwrappedOptional = name2!
    print("Hello \(unwrappedOptional)")
} else {
    print("Ooooooooooooops")
}

//option 2 to unwrap
let albertosAnswer = name2 ?? "Something else"
print("hello again, \(albertosAnswer)")

//option 3 to unwrap
if let unwrapped = name2 {
    print("Hello another time\(unwrapped)")
} else {
    print("Well, that didn't work...")
}
