//
//  SliderView.swift
//  BusinessType.swift
//
//  Created by chenWei on 2017/4/1.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import UIKit

class SliderView: UIView {

    //定义选中按钮记录
    var selectBtn: UIButton?
    
    //小黄条
    var lineV: UIView?
    
    
    //懒加载按钮数组
    lazy var btnList: [UIButton] = {
        let btnList: [UIButton] = []
        
        return btnList
    }()
    
    //相当于写： initWithFrame:
    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.setupUI()

        btnList[0].isSelected = true
        selectBtn = btnList[0]
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //添加三个按钮
    func setupUI(){
        
        //创建三个按钮标题数组
        let btnTitle = ["商品", "商铺", "超市购"]
        //按钮的宽度
//        let btnWidth = UIScreen.main.bounds.size.width / 3
        //设置 frame
//        let frame = CGRect(x: 0, y: 0, width: btnWidth, height: 44)
        //(index, str) 元组 下标，标题
        for (index, str) in btnTitle.enumerated() {
            //创建标题
            let btn = UIButton(title: str, target: self, selector: #selector(changeBtn), events: UIControlEvents.touchUpInside)
            
            btn.setTitleColor(UIColor.red, for: .selected)
            
            btn.tag = index
            
            btn.frame = CGRect(x: CGFloat(index) * btnWidth, y: 0, width: btnWidth, height: 42)
            
            btnList.append(btn)
            
            self.addSubview(btn)
            
            
            
        }
        
       
        
        //添加小黄条
        lineV = UIView()
        lineV!.backgroundColor = UIColor.yellow
        self.addSubview(lineV!)
        lineV!.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(self)
            make.width.equalTo(btnList[0])
            make.height.equalTo(4)
        }
 
        
    }
    
    
    //按钮监听方法
    func changeBtn(button: UIButton){
        
        selectBtn?.isSelected = false
        
        button.isSelected = true
        
        //小黄条的移动距离
        //更新小黄条的 frame
        lineV?.snp.updateConstraints({ (make) in
            
            make.left.equalTo(self).offset( CGFloat(button.tag) * btnWidth)
        })
        
        
        selectBtn = button
        
    }
    
    
    
    
}
