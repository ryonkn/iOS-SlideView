//
//  ViewController.swift
//  SliderView
//
//  Created by Ryo Nakano on 2015/05/30.
//  Copyright (c) 2015年 Peppermint Club. All rights reserved.
//

import UIKit

// スライダーとスイッチ
class ViewController: UIViewController {

    // 定数
    let BTN_SHOW = 0
    
    // 変数
    var _slider: UISlider?
    var _switch: UISwitch?

    // ロード完了時に呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        let dx: CGFloat = (UIScreen.mainScreen().bounds.size.width-320)/2
        
        // スライダーの生成
        _slider = UISlider();
        _slider!.frame = CGRectMake(dx+10, 20, 300, 32)
        _slider!.minimumValue = 0
        _slider!.maximumValue = 100
        _slider!.value = 50
        self.view.addSubview(_slider!)
        
        // スイッチの生成
        _switch = UISwitch();
        _switch!.frame = CGRectMake(dx+10, 70, 200, 32)
        _switch!.on = true
        self.view.addSubview(_switch!)
        
        // 表示ボタンの生成
        let btnShow = makeButton(CGRectMake(dx+110, 120, 100, 40),
            text: "表示", tag: BTN_SHOW)
        self.view.addSubview(btnShow)
    }

    // ボタンクリック時に呼ばれる
    func onClick(sender: UIButton) {
        if sender.tag == BTN_SHOW {
            var str = "スライダーの値=\(Int(_slider!.value))\nスイッチの値="
            str += _switch!.on ? "ON" : "OFF";
            showAlert(nil, text: str);
        }
    }
    
    // テキストボタンの生成
    func makeButton(rect: CGRect, text: NSString, tag: Int) -> UIButton {
        let button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        button.frame = rect
        button.setTitle(text as String, forState: UIControlState.Normal)
        button.tag = tag
        button.addTarget(self, action: "onClick:",
            forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    // アラートの表示
    func showAlert(title: NSString?, text: NSString?) {
        let alert = UIAlertController(title: title as? String, message: text as? String,
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK",
            style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

