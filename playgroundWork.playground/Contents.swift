import UIKit

protocol Athlete{
    func practice()
    func playGame() -> Bool
}

class Student: Athlete{
    func practice() {
        print("practicing!")
    }
    
    func playGame() -> Bool {
        return true
    }
    
    var name:String = ""
    var grade:Int = 0
    var studentID:Int = 0
}

class OlympicScater: Athlete{
    func practice() {
        print("Practicing!")
    }
    
    func playGame() -> Bool {
        return false
    }
    
    
}
