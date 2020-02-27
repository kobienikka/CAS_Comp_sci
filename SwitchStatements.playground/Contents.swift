import UIKit

let x = 1

switch x {
    case 0:
        print("X is zero")
    case 1:
        print("X is one")
    case 2:
        print("X is two")
    default:
     print("X is something else")
    
}

enum SchoolDay {
    case aDay
    case bDay
    case cDay
}

//works the same if you delete SchoolDay and just make it .bDay
var today: SchoolDay = SchoolDay.bDay

switch today {
case .aDay:
    print("CAS comp sci is second period")
case .bDay:
    print("CAS comp sci is first period")
case .cDay:
    print("CAS comp sci doesn't meet today")
default:
    print("This isn't even a day")
}
