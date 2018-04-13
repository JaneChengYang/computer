//
//  ViewController.swift
//  computer
//
//  Created by Simon on 2018/4/11.
//  Copyright © 2018年 Simon. All rights reserved.
//

import UIKit
enum Type {
    case add, subtract, multiply,divide, none
}

class ViewController: UIViewController {
    
    var numberOnScreen = 0.0
    var previousNumber = 0.0
    var performingMath = false
    var operation:Type = .none
    var startNew = true
    
    @IBOutlet weak var myText: UILabel!
    //改狀態列
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBAction func numbers(_ sender: UIButton) {
        //因為我有在button上的tag設數字，我的數字是重1開始所以帶到tag時要-1才會是你按到的數字
        let number = sender.tag - 1
        if myText.text != nil {
            if startNew == true {
                myText.text = "\(number)"
                startNew = false
            }else{
                if myText.text == "0" || myText.text == "+" || myText.text == "-" || myText.text == "*"
                    || myText.text == "/"{
                    myText.text = "\(number)"
                }else{
                    myText.text = myText.text! + "\(number)"
                }
            }
            numberOnScreen = Double(myText.text!)! ?? 0
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        myText.text = "0"
        numberOnScreen = 0.0
        previousNumber = 0.0
        performingMath = false
        startNew = true
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        myText.text = "+"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .add
    }
    
    @IBAction func subtractButton(_ sender: UIButton) {
        myText.text = "-"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .subtract
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        myText.text = "*"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .multiply
    }
    
    @IBAction func divideButton(_ sender: UIButton) {
        myText.text = "/"
        previousNumber = numberOnScreen
        performingMath = true
        operation = .divide
    }
    
    @IBAction func answerButton(_ sender: UIButton) {
        if performingMath == true{
            switch operation {
            case .add:
                myText.text  = "\(previousNumber + numberOnScreen)"
            case .subtract:
                myText.text  = "\(previousNumber - numberOnScreen)"
            case .multiply:
                myText.text  = "\(previousNumber * numberOnScreen)"
            case .divide:
                myText.text  = "\(previousNumber / numberOnScreen)"
            case .none:
                myText.text = "0"
            }
            performingMath = false
            startNew = true
        }
    }
    
    @IBAction func pointButton(_ sender: UIButton) {
        if myText.text != nil{
            myText.text = myText.text! + "."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


