//
//  UIButton+Extension.swift
//  BusinessType.swift
//
//  Created by chenWei on 2017/4/1.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import UIKit

extension UIButton {

    //便利构造函数
    convenience init(title: String?, titleColor: UIColor? = UIColor.darkGray, fontSize: CGFloat = 16, image: String? = nil, backGImage: String? = nil, target: Any? = nil, selector: Selector? = nil, events: UIControlEvents? = .touchUpInside){
        self.init()
        
        //可选值使用，需要先做可选绑定
        if let title = title {
            
            self.setTitle(title, for: .normal)
            self.setTitleColor(titleColor, for: .normal)
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        }
        
        if let image = image, let backGImage = backGImage {
            
            self.setImage(UIImage(named: image), for: .normal)
            
            self.setBackgroundImage(UIImage(named: backGImage), for: .normal)
        }
        
        if let target = target, let selector = selector, let events = events {
            
            self.addTarget(target, action: selector, for: events)
        }
        
        
        
    }
    
    
    
    
    

}
