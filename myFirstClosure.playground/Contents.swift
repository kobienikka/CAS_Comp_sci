import UIKit
import Foundation

let foo: (Int, Int) -> String = {
    (x:Int, y:Int) in
    let sum = x + y
    let mathSentence:String = "\(x) + \(y) = \(sum)"
    return mathSentence
}

print(foo(9, 56))
