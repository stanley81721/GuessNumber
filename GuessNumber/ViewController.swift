//
//  ViewController.swift
//  GuessNumber
//
//  Created by Stanley on 2017/8/4.
//  Copyright © 2017年 Stanley. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    var numberArray = [Int]()
    
    @IBAction func submitAnswer(_ sender: Any) {
        var inputArray = [Int]()
        if let first = firstTextField.text {
            inputArray.append(Int(first)!)
        }
        if let second = secondTextField.text {
            inputArray.append(Int(second)!)
        }
        if let third = thirdTextField.text {
            inputArray.append(Int(third)!)
        }
        if let fourth = fourthTextField.text {
            inputArray.append(Int(fourth)!)
        }
        
        checkNumber(numberArray: numberArray, inputArray: inputArray)
    }
    
    @IBAction func resetTextField(_ sender: Any) {
        firstTextField.text = ""
        secondTextField.text = ""
        thirdTextField.text = ""
        fourthTextField.text = ""
        answerLabel.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberArray = generateNumber()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateNumber() -> Array<Int> {
        var numberArray = [Int]()
        let randomDistribution = GKShuffledDistribution(lowestValue: 0, highestValue: 9)
        for _ in 0...3 {
            let index  = randomDistribution.nextInt()
            print(index)
            numberArray.append(index)
        }
        return numberArray
    }
    
    func checkNumber(numberArray: Array<Int>, inputArray: Array<Int>) {
        var checkArray = [false, false, false, false]
        var A = 0
        var B = 0
        for i in 0...3 {
            if numberArray[i] == Int(inputArray[i]) {
                A = A + 1
                checkArray[i] = true
            }
        }
        
        for i in 0...3 {
            for j in 0...3 {
                if (!checkArray[j] && numberArray[j] == Int(inputArray[i])) {
                    B = B + 1
                    checkArray[j] = true
                    break
                }
            }
        }
        
        if A == 4 {
            answerLabel.text = "So Luckey"
        } else {
            answerLabel.text = String(A) + "A" + String(B) + "B"
        }
    }
}

