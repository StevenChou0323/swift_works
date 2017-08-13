//
//  ViewController.swift
//  swift_demo01_calculator
//
//  Created by 周建宏 on 2017/8/4.
//  Copyright © 2017年 周建宏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //計算機結果
    var labelResult = CalculatorLabel()
    
    //是否要計算結果
    var isCalculatedResult = false
    
    //是否存在符號
    var isExistSign  = false
    
    //暫存運算式左邊數字
    var calculatorLeft  = ""
    
    //暫存運算式右邊數字
    var calculatorRight = ""
    
    //暫存運算中間符號
    var calculatorSign = ""
    
    //運算式
    var calculatorArray  = [String]()
    
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
        self.view.addSubview(buttonZero);
        buttonZero.addTarget(nil, action: #selector(self.clickNumberButton(sender:)), for: .touchUpInside)
        
        let buttonPoint = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "∙")
        self.view.addSubview(buttonPoint);
        buttonPoint.addTarget(nil, action: #selector(self.clickSignInNumberButton(sender:)), for: .touchUpInside)
        
        let buttonEqual = CalculatorButton(frame: CGRect(x: space + buttonPoint.frame.origin.x + buttonPoint.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "=")
        self.view.addSubview(buttonEqual);
        buttonEqual.addTarget(nil, action: #selector(self.clickSignButton(sender:)), for: .touchUpInside)
        
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
        
        labelResult.drawText(in : CGRect(x: space, y: buttonPositionY, width: buttonWidth*4 + space*3, height: buttonHeight))

        labelResult.frame = CGRect(x: space, y: buttonPositionY, width: buttonWidth*4 + space*3, height: buttonHeight)
        
        labelResult.textAlignment = .right
        labelResult.numberOfLines = 1
        labelResult.textColor = UIColor.white
        labelResult.backgroundColor = UIColor.black
        labelResult.text = "0"
        labelResult.lineBreakMode = .byTruncatingTail
        labelResult.font = UIFont.systemFont(ofSize: 35)
        self.view.addSubview(labelResult)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func clickNumberButton( sender : UIButton) {
        sender.backgroundColor = UIColor.lightGray
        let buttonTitle = sender.titleLabel?.text

        if isExistSign == true {
            calculatorRight += buttonTitle!
            let index = calculatorRight.index(calculatorRight.startIndex, offsetBy: 0)
            if calculatorRight[index] == "0"{
                calculatorRight = ""
                return;
            }
            
            labelResult.text = calculatorRight
        }else{
            calculatorLeft += buttonTitle!
            let index = calculatorLeft.index(calculatorLeft.startIndex, offsetBy: 0)
            if calculatorLeft[index] == "0"{
                calculatorLeft = ""
                return;
            }
            
            labelResult.text = calculatorLeft
        }
    }
    
    func clickSignInNumberButton( sender : UIButton) {
        let sign = sender.titleLabel?.text
        let signStirng = sign!
        switch signStirng{
            case "AC":
                reset()
            default:
                print("aaaaaa")
        }
        sender.backgroundColor = UIColor.lightGray
    }
    
    func clickSignButton(sender : UIButton){
        print("clickSignButton")
        sender.backgroundColor = UIColor.orange
    }
    
    func reset() {
        calculatorLeft = ""
        calculatorRight = ""
        calculatorSign = ""
        labelResult.text = "0"
        isCalculatedResult = false
        isExistSign  = false
        calculatorArray  = []
    }

}

