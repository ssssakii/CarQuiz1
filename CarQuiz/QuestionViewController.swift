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
        self.view.backgroundColor = GeneralManager.InitView()
        
        let testView = UIView()
        testView.backgroundColor = UIColor.orangeColor()
        testView.frame = CGRect(x: 40, y: 40, width: 40, height: 40)
        
        let fallView = UIView()
        fallView.backgroundColor = UIColor.redColor()
        fallView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        let staticView = UIView()
        staticView.backgroundColor = UIColor.blueColor()
        staticView.frame = CGRect(x: 250, y: 250, width: 50, height: 50)
        
        let view: [UIView] = [testView,fallView,staticView]
        
        alert.show(type: TKSWBackgroundType.BrightBlur, views: view)
        
        
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
