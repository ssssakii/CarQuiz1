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
    //問題の写真
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionText: UITextView!
    
    var csvData: [Question] = []
    
    //今の問題番号
    var nowIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = GeneralManager.InitView()
        
        LoadCSV()        // ----- CSVファイル読み込み
        QuestionInit()
        
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
        infoLabel.text = csvData[nowIndex].infoText
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
            resultView.addSubview(resultLabel)
            let view: [UIView] = [infoView,resultView]
            if(AnswerCheck("0")){
                resultLabel.text = "正解"
                alert.show(type: TKSWBackgroundType.BrightBlur, views: view)
            }else{
                resultLabel.text = "不正解"
                alert.show(type: TKSWBackgroundType.Blur, views: view)
                
            }
            alert.didDissmissAllViews = {
                self.nowIndex += 1
                self.QuestionInit()
            }
        }
        //xを選択
        if(sender.tag == 1){
            resultView.addSubview(resultLabel)
            let view: [UIView] = [infoView,resultView]
            if(AnswerCheck("1")){
                resultLabel.text = "正解"
                alert.show(type: TKSWBackgroundType.BrightBlur, views: view)
            }else{
                resultLabel.text = "不正解"
                alert.show(type: TKSWBackgroundType.Blur, views: view)
                
            }
            alert.didDissmissAllViews = {
                self.nowIndex += 1
                self.QuestionInit()
            }
        }
    }
    
    
    func QuestionInit(){
        navigationItem.title = (String) (nowIndex + 1) + "問目"
        self.questionText.text = self.csvData[self.nowIndex].questionText
        if self.csvData[self.nowIndex].imageName != "null"{
            self.imageView.image = UIImage(named: self.csvData[self.nowIndex].imageName)
            AnimationManager.animateImageView(self.imageView)
        }else{
            self.imageView.image = nil
        }
    }
    func AnswerCheck(answer : String) -> Bool{
        if answer == self.csvData[self.nowIndex].correct{
            return true
        }else{
            return false
        }
    }
    
    func LoadCSV(){
        let csvBundle = NSBundle.mainBundle().pathForResource("data", ofType: "csv")
        do {
            var csvData: String = try String(contentsOfFile: csvBundle!, encoding: NSUTF8StringEncoding)
            csvData = csvData.stringByReplacingOccurrencesOfString("\r", withString: "")
            let csvArray = csvData.componentsSeparatedByString("\n")
            for line in csvArray {
                var question : Question! = Question()
                let parts = line.componentsSeparatedByString(",")
                var j: Int = 0
                for part in parts {
                    switch  j {
                    case 1:
                        question.questionText = part
                        break
                    case 2:
                        question.correct = part
                        break
                    case 3:
                        question.infoText = part
                        break
                    case 4:
                        question.imageName = part
                        self.csvData.append(question)
                        break
                    default:
                        break
                    }
                    j += 1
                }
            }
            self.questionText.text = self.csvData[self.nowIndex].questionText
            if self.csvData[self.nowIndex].imageName != "null"{
                self.imageView.image = UIImage(named: self.csvData[self.nowIndex].imageName)
            }else{
                self.imageView.image = nil
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    struct Question {
        var questionText:String!
        var correct:String!
        var infoText:String!
        var imageName:String!
    }
}
