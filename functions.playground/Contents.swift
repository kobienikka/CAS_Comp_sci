import UIKit
import Foundation

//#2
func square(number: Float) -> Float{
    let squared = number * number
    return squared
}

print(square(number: 5))

//#2
func five() -> Int {
    return 5
}

print(five())

//#3
func fullName(first: String, last: String) -> String{
    return first + " " + last
}

print(fullName(first: "Kobie", last: "Nikka"))

//#4
func shout(sentence: String) -> String {
    return sentence + "!"
}

print(shout(sentence: "Oh hey"))

//#5
func Numbername(number: Int) -> String?{
    if number < 10{
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.spellOut
    
        let spellOutText = formatter.string(for: number)!
        return(spellOutText)
    }else {
        return(nil)
    }
}

print(Numbername(number: 7)!)
