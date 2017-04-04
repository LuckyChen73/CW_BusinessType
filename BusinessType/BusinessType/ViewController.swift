//
//  ViewController.swift
//  BusinessType
//
//  Created by chenWei on 2017/4/4.
//  Copyright © 2017年 陈伟. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //MARK:1- 懒加载视图
    //头部视图
    lazy var topHeadV: UIView = {
        let topV = UIView()
        topV.backgroundColor = UIColor.purple
        return topV
    }()
    //中间视图
    lazy var middleV: UIView = {
        let middleV = SliderView()
        middleV.backgroundColor = UIColor.white
        return middleV
    }()
    //底部视图
    lazy var bottomV: UIScrollView = {
        let bottomV = UIScrollView()
        bottomV.backgroundColor = UIColor.brown
        return bottomV
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        
        //布局
        self.setupUI()
        
    }
    
    //MARK:2- 视图布局
    func setupUI(){
        
        //添加视图
        view.addSubview(topHeadV)
        view.addSubview(middleV)
        view.addSubview(bottomV)
        
        //约束
        topHeadV.snp.makeConstraints { (make) in
            make.height.equalTo(KTopHeadVHeight)
            make.left.right.top.equalTo(view)
        }
        
        middleV.snp.makeConstraints { (make) in
            make.height.equalTo(KSliderVHeight)
            make.left.right.equalTo(view)
            make.top.equalTo(topHeadV.snp.bottom).offset(0)
        }
        
        bottomV.snp.makeConstraints { (make) in
            make.top.equalTo(middleV.snp.bottom).offset(0)
            make.left.right.bottom.equalTo(view)
            
        }
        
        
        
        //创建三个控制器
        let vcArr = ["CQGoodsListController","CQStoreListController","CQMarketListController"]
        
        for (index, vcStr) in vcArr.enumerated() {
            
            let childVcClass = "BusinessType" + "." + "\(vcStr)"
            
            
            let cls = NSClassFromString(childVcClass) as? UIViewController.Type
            //根据类型创建对应的对象
            //创建控制器
            
            let vc = cls!.init()
            
            //设置 vc 的 frame
            vc.view.frame = CGRect(x: KUIScreenWidth * CGFloat(index), y: 0, width: KUIScreenWidth, height: KScrollVHeight)
            
            print("\(vc)")
            
            //把控制器做为当前控制器的子控制器
            self.addChildViewController(vc)
            bottomV.addSubview(vc.view)
            vc.didMove(toParentViewController: self)

        }
        
        
        //设置 scrollView 的滚动范围
        bottomV.contentSize = CGSize(width: KUIScreenWidth * 3, height: KScrollVHeight)
        
    }

}
