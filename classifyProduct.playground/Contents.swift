import UIKit

func classifyProduct(num1: Int, num2: Int) -> String{
    let product = num1 * num2
    if product < 0{
        return("negative")
    }else if product == 0{
        return("zero")
    }else if product > 30{
        return("big")
    }else if product < 30 && product > 0{
        return("small")
    }else{
        return("IDK what kinda number this")
    }
}

print(classifyProduct(num1: 3, num2: 5))
