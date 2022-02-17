import UIKit

// Ozcan Biyik
// HW2

// Q 1 :
func temperatureConverter (heat : Double) -> Double{
    let fahrenheit = (heat * 1.8) + 32
    return fahrenheit
}
// RESPONSE 1 : print(temperatureConverter(heat: 50))

// Q 2 :

func rectanglePerimeter (shortEdge : Double, longEdge : Double) {
   
    if (shortEdge > 0 && longEdge > 0) {
        let result = 2 * (shortEdge + longEdge)
        print(result)
    } else {
        print("Check your edges values")
    }
    
}
// RESPONSE 2 : rectanglePerimeter(shortEdge: 5, longEdge: 10)
// rectanglePerimeter(shortEdge: -5, longEdge: 0)


// Q 3 :

func factorial(x : Int) -> Double {
    if x == 0 || x == 1 {
        return 1
    } else if x > 0 {
        var a : Double = 1
        for x in 1...x{
            a *= Double(x)
        }
        return Double(a)
    } else {
        print("You can't enter a negative number value")
        return -1
    }
}
// RESPONSE 3 : factorial(x: 5)

// Q 4 :

func charCount (word : String, char : String) {

    let result = word.components(separatedBy: char).count
    print(result-1)
    
}
// RESPONSE 4 : charCount(word: "kelime", char: "e")

// Q 5 :

func sumOfAngle(edgeN : Int) -> Int {
    
    if edgeN > 2 {
        let sum = (edgeN - 2) * 180
        return sum
    } else {
        print("The entered value must be greater than 2.")
        return 0
    }
    
}

// RESPONSE 5 : sumOfAngle(edgeN: 3)


// Q 6 :

func salarySum (gun : Int) -> Int{
    
    let tresholdV = 160
    let shiftTime = 10
    let extraShiftTime = 20
    let fullSalary = tresholdV * shiftTime
    
    if gun * 24 > 720 {
        print("Bir ayda bu kadar saatten daha fazla çalışamazsınız")
        return 0
    } else {
        if gun * 8 > tresholdV {
            let extraShift = (gun * 8) - tresholdV
            let salarySum = fullSalary + (extraShift * extraShiftTime)
            return salarySum
        } else {
            let salarySum = (gun * 8) * shiftTime
            return salarySum
        }
    }
    
}

// RESPONSE 6 : salarySum(gun: 25)

// Q 7 :

func quotaCalculate (qSum : Int) -> Int {
    if qSum < 50 && qSum > 0{
        return 100
    } else if qSum > 50 {
        let extraQSum = qSum - 50
        return 100 + (extraQSum * 4)
    } else {
        print("The entered value must be greater than 0")
        return -1
    }
}

// RESPONSE 7 : quotaCalculate(qSum: 25)
