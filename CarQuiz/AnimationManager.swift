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
        UIView.animateWithDuration(2.0,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 6.0,
            options: UIViewAnimationOptions.AllowUserInteraction,
            animations: {
                button.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
}