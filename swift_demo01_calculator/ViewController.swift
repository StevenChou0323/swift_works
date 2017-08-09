//
//  ViewController.swift
//  swift_demo01_calculator
//
//  Created by 周建宏 on 2017/8/4.
//  Copyright © 2017年 周建宏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


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
        
        let buttonPoint = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : ".")
        self.view.addSubview(buttonPoint);
        
        
        let buttonEqual = CalculatorButton(frame: CGRect(x: space + buttonPoint.frame.origin.x + buttonPoint.frame.size.width, y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "=")
        self.view.addSubview(buttonEqual);
       
        //數字123 符號+
        buttonPositionY = screenHeight - buttonHeight * 2 - space * 2;

        let buttonOne = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "1")
        self.view.addSubview(buttonOne);
    
        let buttonTwo = CalculatorButton(frame: CGRect(x: space + buttonOne.frame.origin.x + buttonOne.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "2")
        self.view.addSubview(buttonTwo);
        
        
        let buttonThree = CalculatorButton(frame: CGRect(x: space + buttonTwo.frame.origin.x + buttonTwo.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "3")
        self.view.addSubview(buttonThree);
        
        let buttonPlus = CalculatorButton(frame: CGRect(x: space + buttonThree.frame.origin.x + buttonThree.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "+")
        self.view.addSubview(buttonPlus);
        
        //數字456 符號-
        buttonPositionY = screenHeight - buttonHeight * 3 - space * 3;

        let buttonFour = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "4")
        self.view.addSubview(buttonFour);
    
        let buttonFive = CalculatorButton(frame: CGRect(x: space + buttonFour.frame.origin.x + buttonFour.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "5")
        self.view.addSubview(buttonFive);
        
        
        let buttonSix = CalculatorButton(frame: CGRect(x: space + buttonFive.frame.origin.x + buttonFive.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "6")
        self.view.addSubview(buttonSix);
        
        let buttonMinus = CalculatorButton(frame: CGRect(x: space + buttonSix.frame.origin.x + buttonSix.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "-")
        self.view.addSubview(buttonMinus);


         //數字789 符號x
        buttonPositionY = screenHeight - buttonHeight * 4 - space * 4;

        let buttonSeven = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "7")
        self.view.addSubview(buttonSeven);
    
        let buttonEight = CalculatorButton(frame: CGRect(x: space + buttonSeven.frame.origin.x + buttonSeven.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "8")
        self.view.addSubview(buttonEight);
        
        
        let buttonNine = CalculatorButton(frame: CGRect(x: space + buttonEight.frame.origin.x + buttonEight.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "9")
        self.view.addSubview(buttonNine);
        
        let buttonTimes = CalculatorButton(frame: CGRect(x: space + buttonNine.frame.origin.x + buttonNine.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "x")
        self.view.addSubview(buttonTimes);

        //符號AC +/- % /
        buttonPositionY = screenHeight - buttonHeight * 5 - space * 5

        let buttonClean = CalculatorButton(frame: CGRect(x: space , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "AC")
        self.view.addSubview(buttonClean);
    
        let buttonPlusMinus = CalculatorButton(frame: CGRect(x: space + buttonClean.frame.origin.x + buttonClean.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "+/-")
        self.view.addSubview(buttonPlusMinus);
        
        
        let buttonPercentage = CalculatorButton(frame: CGRect(x: space + buttonPlusMinus.frame.origin.x + buttonPlusMinus.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "%")
        self.view.addSubview(buttonPercentage);
        
        let buttonDivided = CalculatorButton(frame: CGRect(x: space + buttonPercentage.frame.origin.x + buttonPercentage.frame.size.width , y: buttonPositionY, width: buttonWidth, height: buttonHeight), title : "/")
        self.view.addSubview(buttonDivided)
        
        //計算機結果
        buttonPositionY = screenHeight - buttonHeight * 6 - space * 6
        
        let labelResult = UILabel(frame: CGRect(x: space, y: buttonPositionY, width: buttonWidth * 4 + space * 3, height: buttonHeight))
        self.view.addSubview(labelResult);
        labelResult.text = "0"
        labelResult.backgroundColor = .orange
        
        labelResult.font = UIFont(name: "Arial", size: 25)
        labelResult.textAlignment = .right
        labelResult.numberOfLines = 1
        labelResult.lineBreakMode = .byTruncatingTail

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

