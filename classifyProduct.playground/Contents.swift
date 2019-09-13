import UIKit

func classifyProduct(num1: Int, num2: Int) -> String{
    let product = num1 * num2
    if product < 0{
        return("negative")
    }else if product == 0{
        return("zero")
    }
}
