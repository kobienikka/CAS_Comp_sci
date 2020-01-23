import UIKit

struct Student  {
    let firstName: String
    let lastName: String
    let IQ: Int
}

var myList: [Student] = [
    Student(firstName: "Pablo", lastName: "Escobar", IQ: 300),
    Student(firstName: "JayJay", lastName: "Venegas", IQ: 45),
    Student(firstName: "Miles", lastName: "Malin", IQ: 75),
    Student(firstName: "Elena", lastName: "Fis", IQ: 11),
    Student(firstName: "Kobie", lastName: "Nikka", IQ: 375)
]

func sortByLastName(a: Student, b: Student) -> Bool {
    if a.lastName == b.lastName{
        return a.firstName < b.firstName
    } else {
        return a.lastName < b.lastName
    }
}

func sortByIQ(a: Student, b: Student) -> Bool {
    if a.IQ != b.IQ {
        return a.IQ < b.IQ
    } else {
        if a.lastName == b.lastName{
            return a.firstName < b.firstName
        } else {
            return a.lastName < b.lastName
        }
    }
}

let sortedList = myList.sorted(by: sortByIQ)
for sortedItems in sortedList {
    print("\(sortedItems.firstName) \(sortedItems.lastName) : \(sortedItems.IQ)")
}


let anotherSortedList = myList.sorted(by: {
    (a,b) in
    return a.lastName < b.lastName
})

for anotherItem in anotherSortedList {
    print("\(anotherItem.firstName) \(anotherItem.lastName) : \(anotherItem.IQ)")
}
