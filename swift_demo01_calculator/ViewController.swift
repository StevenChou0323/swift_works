//
//  ViewController.swift
//  swift_demo01_calculator
//
//  Created by 周建宏 on 2017/8/4.
//  Copyright © 2017年 周建宏. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //計算結果
    var labelResult = UILabel()
    
    //是否存在左邊數字
    var isExistLeft = false
    
    //是否存在符號
    var isExistSign  = false
    //是否存在右邊數字
    var isExistRight = false
    
    //暫存運算式左邊數字
    var calculatorLeft : Float = 0.0
    
    //暫存運算式右邊數字
    var calculatorRight : Float = 0.0
    
    //暫存運算中間符號
    var calculatorSign = ""
    
    //顯示最多9個數字
    var LIMIT_CHAR_COUNT = 9
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds.size
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        let space = screenWidth * 0.01
        let buttonWidth = screenWidth * 0.225
        let buttonHeight = screenWidth * 0.225
        
        //數字0 符號.=
        var buttonPositionY = screenHeight - buttonHeight - space;

        let buttonZero = CalculatorButton(frame: CGRect(x: space, y: buttonPositionY, width: buttonWidth * 2 + space, height: buttonHeight), title : "0")
        buttonZero.contentVerticalAlignment = .center
        buttonZero.contentHorizontalAlignment = .left
        buttonZero.titleEdgeInsets = UIEdgeInsetsMake(0, buttonWidth / 2, 0.0, 0.0)
        self.view.addSubview(buttonZero)
        buttonZero.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonPoint = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "∙")
        self.view.addSubview(buttonPoint);
        buttonPoint.addTarget(nil, action: #selector(self.clickSignInNumberButton(sender:)), for: .touchUpInside)
        
        let buttonEqual = CalculatorButton(frame: CGRect(x: space + buttonPoint.frame.origin.x + buttonPoint.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "=")
        self.view.addSubview(buttonEqual);
        buttonEqual.addTarget(nil, action: #selector(self.clickResultButton(sender:)), for: .touchUpInside)
        
        //數字123 符號+
        buttonPositionY = screenHeight - buttonHeight * 2 - space * 2;

        let buttonOne = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "1")
        self.view.addSubview(buttonOne);
        buttonOne.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
    
        let buttonTwo = CalculatorButton(frame: CGRect(x: space + buttonOne.frame.origin.x + buttonOne.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "2")
        self.view.addSubview(buttonTwo);
        buttonTwo.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonThree = CalculatorButton(frame: CGRect(x: space + buttonTwo.frame.origin.x + buttonTwo.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "3")
        self.view.addSubview(buttonThree);
        buttonThree.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonPlus = CalculatorButton(frame: CGRect(x: space + buttonThree.frame.origin.x + buttonThree.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "+")
        self.view.addSubview(buttonPlus);
        buttonPlus.addTarget(nil, action: #selector(self.clickSignButton(sender:)), for: .touchUpInside)
        
        //數字456 符號-
        buttonPositionY = screenHeight - buttonHeight * 3 - space * 3;

        let buttonFour = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "4")
        self.view.addSubview(buttonFour);
        buttonFour.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
    
        let buttonFive = CalculatorButton(frame: CGRect(x: space + buttonFour.frame.origin.x + buttonFour.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "5")
        self.view.addSubview(buttonFive);
        buttonFive.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonSix = CalculatorButton(frame: CGRect(x: space + buttonFive.frame.origin.x + buttonFive.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "6")
        self.view.addSubview(buttonSix);
        buttonSix.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonMinus = CalculatorButton(frame: CGRect(x: space + buttonSix.frame.origin.x + buttonSix.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "−")
        self.view.addSubview(buttonMinus);
        buttonMinus.addTarget(nil, action: #selector(self.clickSignButton(sender:)), for: .touchUpInside)

         //數字789 符號x
        buttonPositionY = screenHeight - buttonHeight * 4 - space * 4;

        let buttonSeven = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "7")
        self.view.addSubview(buttonSeven);
        buttonSeven.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
    
        let buttonEight = CalculatorButton(frame: CGRect(x: space + buttonSeven.frame.origin.x + buttonSeven.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "8")
        self.view.addSubview(buttonEight);
        buttonEight.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonNine = CalculatorButton(frame: CGRect(x: space + buttonEight.frame.origin.x + buttonEight.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "9")
        self.view.addSubview(buttonNine);
        buttonNine.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonTimes = CalculatorButton(frame: CGRect(x: space + buttonNine.frame.origin.x + buttonNine.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "×")
        self.view.addSubview(buttonTimes);
        buttonTimes.addTarget(nil, action: #selector(self.clickSignButton(sender:)), for: .touchUpInside)

        //符號AC +/- % /
        buttonPositionY = screenHeight - buttonHeight * 5 - space * 5

        let buttonClean = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "AC")
        self.view.addSubview(buttonClean);
        buttonClean.addTarget(nil, action: #selector(self.clickSignInNumberButton(sender:)), for: .touchUpInside)
    
        let buttonPlusMinus = CalculatorButton(frame: CGRect(x: space + buttonClean.frame.origin.x + buttonClean.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "±")
        self.view.addSubview(buttonPlusMinus);
          buttonPlusMinus.addTarget(nil, action: #selector(self.clickSignInNumberButton(sender:)), for: .touchUpInside)
        
        let buttonPercentage = CalculatorButton(frame: CGRect(x: space + buttonPlusMinus.frame.origin.x + buttonPlusMinus.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "%")
        self.view.addSubview(buttonPercentage);
        buttonPercentage.addTarget(nil, action: #selector(self.clickSignInNumberButton(sender:)), for: .touchUpInside)
        
        let buttonDivided = CalculatorButton(frame: CGRect(x: space + buttonPercentage.frame.origin.x + buttonPercentage.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "÷")
        self.view.addSubview(buttonDivided)
        buttonDivided.addTarget(nil, action: #selector(self.clickSignButton(sender:)), for: .touchUpInside)
        
        buttonPositionY = screenHeight - buttonHeight * 6 - space * 6
        

        labelResult.frame = CGRect(x: space, y: buttonPositionY, width: buttonWidth * 4 + space * 4, height: buttonHeight)
        
        labelResult.textAlignment = .right
        labelResult.textColor = UIColor.white
        labelResult.backgroundColor = UIColor.black
        labelResult.text = "0"
        labelResult.minimumScaleFactor = 0.85
        labelResult.numberOfLines = 1
        labelResult.adjustsFontSizeToFitWidth = true
        labelResult.font = UIFont.systemFont(ofSize: 50)
        self.view.addSubview(labelResult)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickNumberButton( sender : UIButton) {
        
        sender.backgroundColor = UIColor.lightGray
        let buttonTitle = sender.titleLabel?.text

       
        if isExistLeft == true && isExistSign == true && isExistRight == false{
            labelResult.text = "0"
        }
        
        self.limitLabelText(offSet: self.LIMIT_CHAR_COUNT)
        
        var currentText = labelResult.text
        currentText! += buttonTitle!
        
        let convertText = self.convertStringToIntOrDoubleString(StringNum: currentText!)
        
        if isExistSign == true {
            labelResult.text = convertText
            calculatorRight = Float(convertText)!
            isExistRight = true
        }else{
            labelResult.text = convertText
            calculatorLeft = Float(convertText)!
            isExistLeft = true
        }
        
        
        print(" clickNumberButton \(calculatorLeft) \(calculatorSign) \(calculatorRight)")
    }
    
    func clickSignInNumberButton( sender : UIButton) {
        sender.backgroundColor = UIColor.lightGray
        let sign = sender.titleLabel?.text
        let signStirng = sign!
       
        switch signStirng{
            
            case "AC":
                reset()
            
            case "∙":
                //如果數字沒有<9個數字(意思就是>=9個數字) return
                guard (labelResult.text?.characters.count)! < 9 else{
                    return;
                }
                
                if isExistLeft == true && isExistSign == true && isExistRight == false{
                    labelResult.text = "0"
                }
                
                //防止數字有很多小數點的情形
                if labelResult.text?.range(of: ".") != nil{
                    return
                }else{
                   labelResult.text? += "."
                }
                
                if isExistSign == true{
                    calculatorRight = Float(labelResult.text!)!
                    isExistRight = true
                }else{
                    calculatorLeft = Float(labelResult.text!)!
                    isExistLeft = true
                }
            
            case "±":
                
                    if labelResult.text! == "inf"{
                       return
                    }
                    if isExistLeft == true && isExistSign == true && isExistRight == false{
                        labelResult.text = "0"
                    }
                    let isNegativeSignExist = labelResult.text?.hasPrefix("-")
                    if isNegativeSignExist == true{
                        labelResult.text?.remove(at: (labelResult.text?.startIndex)!)
                    }else{
                        labelResult.text?.insert("-", at: (labelResult.text?.startIndex)!)
                    }
                    
                    if isExistSign == true{
                        calculatorRight = Float(labelResult.text!)!
                        isExistRight = true
                    }else{
                        calculatorLeft = Float(labelResult.text!)!
                        isExistLeft = true
                    }
            
            case "%":
            
                let oldString = labelResult.text
                if oldString == "inf"{
                    return
                }
                let newDoubleValue = Double(oldString!)! / 100.0
                var newString:String = String(newDoubleValue)
                var newArray = Array(newString.characters)
                
                var isConvertDoubleToInt = false
                if let dotIndex = newArray.index(of: "."){
                    var startIndex = dotIndex + 1
                    for i in startIndex..<newArray.count{
                        if newArray[i] == "0"{
                            isConvertDoubleToInt = true
                        }else{
                            isConvertDoubleToInt = false
                            break
                        }
                    }
                }
                
                if isConvertDoubleToInt == true{
                    let newIntSting = Int(newDoubleValue)
                    newString = String(newIntSting)
                }
                
                if isExistSign == true{
                    calculatorRight = Float(newString)!
                    labelResult.text = newString
                    isExistRight = true
                }else{
                    calculatorLeft = Float(newString)!
                    labelResult.text = newString
                    isExistLeft = true
                }
            
            default:
                break
        }
        
        print(" clickSignInNumberButton \(calculatorLeft) \(calculatorSign) \(calculatorRight)")
    
    }
    
    func clickSignButton(sender : UIButton){
        sender.backgroundColor = UIColor.orange
        let sign = sender.titleLabel?.text
        let signStirng = sign!
        if isExistRight == true{
            let result = self.calculatorResult()
            let convertResult = self.convertStringToIntOrDoubleString(StringNum: result.originalString)
            print("convertResult \(convertResult)")
            if convertResult == "inf"{
                labelResult.text = "錯誤"
            }else{
                labelResult.text = convertResult
            }
            calculatorLeft = result.originalDouble
            calculatorRight = 0.0
            calculatorSign = ""
            isExistLeft = true
            isExistSign  = false
            isExistRight = false
        }
        switch signStirng {
            
            case "+":
                 isExistSign = true
                 calculatorSign = "+"
            
            case "×":
                isExistSign = true
                calculatorSign = "×"
            
            case "−":
                isExistSign = true
                calculatorSign = "−"
            
            case "÷":
                isExistSign = true
                calculatorSign = "÷"
            
            default:
                break;
        }
        
    }
    
    func convertStringToIntOrDoubleString(StringNum : String ) -> String{
        let oldString = StringNum
        let newDoubleValue = Double(oldString)!
        var newString:String = String(newDoubleValue)
        var newArray = Array(newString.characters)
        
        var isConvertDoubleToInt = false
        if let dotIndex = newArray.index(of: "."){
            var startIndex = dotIndex + 1
            for i in startIndex..<newArray.count{
                if newArray[i] == "0"{
                    isConvertDoubleToInt = true
                }else{
                    isConvertDoubleToInt = false
                    break
                }
            }
        }
        
        if isConvertDoubleToInt == true{
            let newIntSting = Int(newDoubleValue)
            newString = String(newIntSting)
        }
        return newString
    }
    
    func calculatorResult() -> (originalString : String, originalDouble: Float){
   
    
        var floatResult : Float = 0.0;
        switch calculatorSign {
            case "+":
                floatResult = calculatorLeft + calculatorRight
                
            case "×":
                floatResult = calculatorLeft * calculatorRight
            
            case "−":
                floatResult = calculatorLeft - calculatorRight
            
            case "÷":
                floatResult = calculatorLeft / calculatorRight
            
            default:
                break
        }
        
        print("floatResult \(floatResult)")
        print(String(floatResult))
        
        return (String(floatResult),floatResult)
    }
    
    
    func reset() {
        calculatorLeft = 0.0
        calculatorRight = 0.0
        calculatorSign = ""
        isExistLeft = false
        isExistSign  = false
        isExistRight = false
        labelResult.text = "0"
    }
    
    func clickResultButton(sender : UIButton){
        sender.backgroundColor = UIColor.orange
        if isExistRight == true{
            let result = self.calculatorResult()
            let convertResult = self.convertStringToIntOrDoubleString(StringNum: result.originalString)
            print("convertResult \(convertResult)")
            if convertResult == "inf"{
                labelResult.text = "錯誤"
            }else{
                    labelResult.text = convertResult
            }
            
            calculatorLeft = result.originalDouble
            calculatorRight = 0.0
            calculatorSign = ""
            isExistLeft = true
            isExistSign  = false
            isExistRight = false
        }
    }
    
    func limitLabelText(offSet:Int){
        if (labelResult.text?.characters.count)! >= offSet {
            var indexSub = labelResult.text?.index((labelResult.text?.startIndex)! , offsetBy: (offSet - 1))
            var newString = labelResult.text?.substring(to: indexSub!)
            labelResult.text? = newString!
            return
        }
    }
}

