//
//  CalculatorLabel.swift
//  swift_demo01_calculator
//
//  Created by 周建宏 on 2017/8/11.
//  Copyright © 2017年 周建宏. All rights reserved.
//

import UIKit

class CalculatorLabel : UILabel{
    
    override func drawText(in rect: CGRect) {
        
        let screenSize = UIScreen.main.bounds.size
        let screenWidth = screenSize.width
        let space = screenWidth * 0.01
        let insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: space * 2)
        super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
    }
    
}
