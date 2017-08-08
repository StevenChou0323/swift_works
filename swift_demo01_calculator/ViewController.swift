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
        let buttonZero = CalculatorButton(frame: CGRect(x: space, y: screenHeight - buttonHeight - space, width: buttonWidth * 2 + space, height: buttonHeight), title : "0")
        buttonZero.contentVerticalAlignment = .center
        buttonZero.contentHorizontalAlignment = .left
        buttonZero.titleEdgeInsets = UIEdgeInsetsMake(0, buttonWidth / 2, 0.0, 0.0)
        self.view.addSubview(buttonZero);
        
        let buttonPoint = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: screenHeight - buttonHeight - space, width: buttonWidth, height: buttonHeight), title : ".")
        self.view.addSubview(buttonPoint);
        
        
        let buttonEqual = CalculatorButton(frame: CGRect(x: space + buttonPoint.frame.origin.x + buttonPoint.frame.size.width, y: screenHeight - buttonHeight - space, width: buttonWidth, height: buttonHeight), title : "=")
        self.view.addSubview(buttonEqual);
       
        //數字123 符號+
        let buttonOne = CalculatorButton(frame: CGRect(x: space , y: screenHeight - buttonHeight * 2 - space * 2, width: buttonWidth, height: buttonHeight), title : "1")
        self.view.addSubview(buttonOne);
    
        let buttonTwo = CalculatorButton(frame: CGRect(x: space + buttonOne.frame.origin.x + buttonOne.frame.size.width , y: screenHeight - buttonHeight * 2 - space * 2, width: buttonWidth, height: buttonHeight), title : "2")
        self.view.addSubview(buttonTwo);
        
        
        let buttonThree = CalculatorButton(frame: CGRect(x: space + buttonTwo.frame.origin.x + buttonTwo.frame.size.width , y: screenHeight - buttonHeight * 2 - space * 2, width: buttonWidth, height: buttonHeight), title : "3")
        self.view.addSubview(buttonThree);
        
        let buttonPlus = CalculatorButton(frame: CGRect(x: space + buttonThree.frame.origin.x + buttonThree.frame.size.width , y: screenHeight - buttonHeight * 2 - space * 2, width: buttonWidth, height: buttonHeight), title : "+")
        self.view.addSubview(buttonPlus);
        
//        let buttonTwo = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: screenHeight - buttonWidth - space, width: buttonWidth, height: buttonHeight), title : ".")
//        self.view.addSubview(buttonTwo);
//
//        
//        let buttonThree = CalculatorButton(frame: CGRect(x: space + buttonZero.frame.origin.x + buttonZero.frame.size.width, y: screenHeight - buttonWidth - space, width: buttonWidth, height: buttonHeight), title : ".")
//        self.view.addSubview(buttonThree);


        
//        let buttonOne = CalculatorButton(frame: CGRect(x: buttonZero.frame.origin.x + space + buttonWidth, y: buttonZero.frame.origin.y, width: buttonWidth, height: buttonHeight), title : "1")
//        self.view.addSubview(buttonOne);
//        
//        let buttonTwo = CalculatorButton(frame: CGRect(x: buttonZero.frame.origin.x + space + buttonWidth, y: buttonZero.frame.origin.y, width: buttonWidth, height: buttonHeight), title : "1")
//        self.view.addSubview(buttonTwo);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

