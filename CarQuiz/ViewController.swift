//
//  ViewController.swift
//  CarQuiz
//
//  Created by 高田早記 on 2016/05/16.
//  Copyright © 2016年 高田早記. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIToolbarDelegate {
    
    private var myToolbar: UIToolbar!
    
    
    //aaaa
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 背景を青色に変更する.
        self.view.backgroundColor = UIColor.cyanColor()
        
        // ツールバーのサイズを決める.
        myToolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 40.0))
        
        // ツールバーの位置を決める.
        myToolbar.layer.position = CGPoint(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height-20.0)
        
        // ツールバーの色を決める.
        myToolbar.barStyle = .BlackTranslucent
        myToolbar.tintColor = UIColor.blackColor()
        myToolbar.backgroundColor = UIColor.whiteColor()
        
        // ボタン１を生成
        let myUIBarButtonYellow: UIBarButtonItem = UIBarButtonItem(title: "Yellow", style: .Plain, target: self, action: "onClickButton:" )
        myUIBarButtonYellow.tag = 1
        
        
        // ボタン２を生成
        let myUIBarButtonGreen: UIBarButtonItem = UIBarButtonItem(title: "Green", style: .Plain, target: self, action: "onClickButton:" )
        myUIBarButtonGreen.tag = 2
        
        // ボタン３を生成
        let myUIBarButtonBlue: UIBarButtonItem = UIBarButtonItem(title: "Blue", style: .Plain, target: self, action: "onClickButton:" )
        myUIBarButtonBlue.tag = 3
        
        
        // ボタンをツールバーに入れる.
        myToolbar.items = [myUIBarButtonYellow, myUIBarButtonGreen, myUIBarButtonBlue]
        
        // ツールバーに追加する.
        self.view.addSubview(myToolbar)
        

    }

    
    /*
    UIBarButtonItemが押された際に呼ばれる.
    */
    func onClickButton(sender: UIBarButtonItem) {
        print(sender.tag)
        switch sender.tag {
        case 1:
            self.view.backgroundColor = UIColor.yellowColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.blueColor()
        default:
            print("error!")
        }
        
        //ユーザーデフォルトにアクセスする方法
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        //UserDefaultsに鍵を使って値を書き込む方法
        saveData.setObject(sender.tag, forKey: "colortag")
        
        //UserDefaultsに鍵を使って値を取り出す方法
        let color = saveData.objectForKey("colortag") as! Int
        
        switch color {
        case 1:
            self.view.backgroundColor = UIColor.yellowColor()
        case 2:
            self.view.backgroundColor = UIColor.greenColor()
        case 3:
            self.view.backgroundColor = UIColor.blueColor()
        default:
            print("error!")
        }
        
    }
    
    @IBAction func toQuestion() {
        self.performSegueWithIdentifier("toQuestionViewController", sender: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

