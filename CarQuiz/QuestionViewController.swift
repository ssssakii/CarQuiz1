//
//  QuestionViewController.swift
//  CarQuiz
//
//  Created by 高田早記 on 2016/05/18.
//  Copyright © 2016年 高田早記. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        /*
        //ユーザーデフォルトにアクセスする方法
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        //UserDefaultsに鍵を使って値を書き込む方法
        //saveData.setObject(sender.tag, forKey: "colortag")
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
        */
        self.view.backgroundColor = GeneralManager.InitView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
