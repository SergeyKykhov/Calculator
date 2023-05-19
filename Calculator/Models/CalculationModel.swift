//
//  CalculationModel.swift
//  Calculator
//
//  Created by Sergey Kykhov on 10.11.2022.
//

import Foundation

class CalculationModel {
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    private var currenHistory = ""

    private func setInvertHistoryValue() {
        guard let number = Double(currentNumber) else { return }

        switch number {
        case ..<0:
            let index = currenHistory.index(currenHistory.endIndex, offsetBy: -2)
            currenHistory.remove(at: index)
        case 0: break
        case 0...:
            let index = currenHistory.index(before: currenHistory.endIndex)
            currenHistory.insert("-", at: index)
        default:
            print("invert history error")
        }
    }

    public func getCalculationHistory(tag: Int) -> String {
        switch tag {
        case 0...9:
            currenHistory += "\(tag)"
        case 10:
            if !currentNumber.contains(".") {
                currenHistory += ","
            }
        case 12...15:
            guard let last = currenHistory.last else { break }
            if last == "+" ||
                last == "-" ||
                last == "*" ||
                last == "/" {
                currenHistory.removeLast()
            }
            currenHistory += currentOperation.rawValue
        case 16:
            currenHistory += "%"
        case 17:
            setInvertHistoryValue()
        default:
            print("error history tag")
            break
        }
        return currenHistory
    }

    public func setNumber(number: Int) {
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }

        if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }
        currentNumber.append(String(number))
    }

    public func getCurrentNumber() -> String {
        currentNumber.stringWithPoint
    }

    public func setOperation(operation: Operations) -> String {

        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "0" }
            firstNumber = number
        } else {
            guard let result = Double(getResult()) else {
                currentOperation = operation
                return firstNumber.stringWithoutZeroFraction.stringWithPoint
            }
            firstNumber = result
        }
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction.stringWithPoint
    }

    public func getResult() -> String {
        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number

        var result = 0.0

        switch currentOperation {
        case .noAction:
            print ("noAction")
            return currentNumber
        case .addition:
            result = firstNumber + secondNumber
        case .substraction:
            result = firstNumber - secondNumber
        case .multyplication:
            result = firstNumber * secondNumber
        case .division:
            if secondNumber == 0 {
                return "ОШИБКА"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }

    public func resetValues() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
        currenHistory = ""
    }

    public func invertValue() {
        guard let number = Double(currentNumber) else {
            currentNumber = "0"
            return }

        switch number {
        case ..<0:
            currentNumber.remove(at: currentNumber.startIndex)
        case ..<0: break
        case 0...:
            currentNumber.insert("-", at: currentNumber.startIndex)
        default:
            print("error inver value")
        }
    }

    public func addPointValue() {
        if !currentNumber.contains(".") {
            currentNumber += currentNumber != "" ? "." : "0."
        }
    }

    public func setPercentNumber() {
        guard let number = Double(currentNumber) else { return }

        if firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
