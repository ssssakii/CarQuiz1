//
//  AnimationManager.swift
//  CarQuiz
//
//  Created by 坂本大介 on 2016/05/24.


import UIKit

class AnimationManager: NSObject {
    
    //ボタン
    class func animateButton(button: UIButton) {
        button.transform = CGAffineTransformMakeScale(0.1, 0.1)
        
        UIView.animateWithDuration(2.0,//２秒かけて動くアニメーション
            delay: 0, // 次の動作の遅れは0秒
            usingSpringWithDamping: 0.2, //あ、Springだ！Dampingという動き　//　バネ
            initialSpringVelocity: 6.0, //Velocity = 速さ
            options: UIViewAnimationOptions.AllowUserInteraction,
            
            animations: {
                button.transform = CGAffineTransformIdentity
            },
            completion: nil)
    }
    
    class func fatButton(button: UIButton) {
        button.transform = CGAffineTransformMakeScale(0.1, 0.1) //初期値を元々の大きさの10分の１に
        UIView.animateWithDuration(2.0,//２秒かけて動くアニメーション
            animations: {
                button.transform = CGAffineTransformMakeScale(1.0, 1.0) //もともとの大きさ
            },
            completion: nil)
    }
    class func animateImageView(imageView: UIImageView) {
        imageView.transform = CGAffineTransformMakeScale(0.1, 0.1)
        UIView.animateWithDuration(2.0,
                                   delay: 0,
                                   usingSpringWithDamping: 0.2,
                                   initialSpringVelocity: 6.0,
                                   options: UIViewAnimationOptions.AllowUserInteraction,
                                   animations: {
                                    imageView.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
}
