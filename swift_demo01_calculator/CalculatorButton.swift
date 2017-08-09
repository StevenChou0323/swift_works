//
//  CalculatorButton.swift
//  swift_demo01_calculator
//
//  Created by 周建宏 on 2017/8/5.
//  Copyright © 2017年 周建宏. All rights reserved.
//
//
import UIKit

class CalculatorButton : UIButton{
    
    init(frame: CGRect, title : String) {
        super.init(frame: frame)
        self.isEnabled = true
        self.setTitle(title, for: .normal)
        switch title {
        case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9":
            self.backgroundColor = UIColor.lightGray
            self.setTitleColor(.black , for: .normal)
           
            self.addTarget(nil, action: #selector(self.clickNumberUpInsideButton), for: .touchUpInside)
            self.addTarget(nil, action: #selector(self.clickDownButton), for: .touchDown)

        case ".", "+/-", "AC", "%":    

            self.backgroundColor = UIColor.lightGray
            self.setTitleColor(.black , for: .normal)

            self.addTarget(nil, action: #selector(self.clickNumberAndSignUpInsideButton), for: .touchUpInside)
            self.addTarget(nil, action: #selector(self.clickDownButton), for: .touchDown)

        default:
            self.backgroundColor = UIColor.orange
            self.setTitleColor(.white , for: .normal)

            self.addTarget(nil, action: #selector(self.clickSignUpInsideButton), for: .touchUpInside)
            self.addTarget(nil, action: #selector(self.clickDownButton), for: .touchDown)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func clickNumberUpInsideButton( sender : UIButton) {
        print("clickNumberUpInsideButton")
        sender.backgroundColor = UIColor.lightGray
    }

    func clickNumberAndSignUpInsideButton( sender : UIButton) {
        print("clickNumberAndSignUpInsideButton")
        sender.backgroundColor = UIColor.lightGray
    }
    
    func clickSignUpInsideButton(){
        print("clickSignUpInsideButton")
        self.backgroundColor = UIColor.orange
    }

     func clickDownButton(){
        print("clickDownButton")
        self.backgroundColor = UIColor.gray
    }
    
}
