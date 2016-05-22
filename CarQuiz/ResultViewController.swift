//
//  ResultViewController.swift
//  CarQuiz
//
//  Created by 高田早記 on 2016/05/18.
//  Copyright © 2016年 高田早記. All rights reserved.
//

import UIKit
import Social

class ResultViewController: UIViewController {
    
    var score : Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(2)
        // Do any additional setup after loading the view.
        
        // twitterButton生成
        
    }
    
    /*****Twitter投稿*****/
    @IBAction func tapTwitter(sender: AnyObject) {
        //Twitterダイアログを作る
        let cv = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        //文字追加
        cv.setInitialText("テストで" + ( String ) (score) + "点取ったよ！！")
        //投稿ダイアログを表示する
        self.presentViewController(cv, animated: true, completion: nil)
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
