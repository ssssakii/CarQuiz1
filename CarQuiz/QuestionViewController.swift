//
//  QuestionViewController.swift
//  CarQuiz
//
//  Created by 高田早記 on 2016/05/18.
//  Copyright © 2016年 高田早記. All rights reserved.
//

import UIKit
import TKSwarmAlert

class QuestionViewController: UIViewController {
    
    let alert = TKSwarmAlert()

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
    
    //○がtag==0 Xがtag==1
    @IBAction func AnswerAction(sender: AnyObject) {
        let infoView = UIView()
        infoView.backgroundColor = UIColor.blueColor()
        infoView.layer.cornerRadius = 10
        infoView.clipsToBounds = true
        infoView.frame = CGRect(x: self.view.center.x - 130, y: 100, width: 260, height: 160)
        let infoLabel : UILabel  = UILabel(frame: CGRect(x: 10, y: 10, width: 240, height: 140))
        infoLabel.numberOfLines = 0
        infoLabel.textColor = UIColor.whiteColor()
        infoLabel.text = "高田早記のメンター名はさきんちょである。"
        infoView.addSubview(infoLabel)
        
        let resultView = UIView()
        resultView.backgroundColor = UIColor.redColor()
        resultView.frame = CGRect(x: self.view.center.x - 100, y: 300, width: 200, height: 100)
        resultView.layer.cornerRadius = 30
        resultView.clipsToBounds = true
        let resultLabel : UILabel  = UILabel(frame: CGRect(x: 10, y: 10, width: 180, height: 80))
        resultLabel.numberOfLines = 0
        resultLabel.textColor = UIColor.whiteColor()
        resultLabel.textAlignment = NSTextAlignment.Center
        
        //○を選択
        if(sender.tag == 0){
            resultLabel.text = "正解"
            resultView.addSubview(resultLabel)
            let view: [UIView] = [infoView,resultView]
            alert.show(type: TKSWBackgroundType.BrightBlur, views: view)
        }
        //xを選択
        if(sender.tag == 1){
            resultLabel.text = "不正解"
            resultView.addSubview(resultLabel)
            let view: [UIView] = [infoView,resultView]
            alert.show(type: TKSWBackgroundType.Blur, views: view)
        }
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
