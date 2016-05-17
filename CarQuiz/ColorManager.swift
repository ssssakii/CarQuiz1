//
//  ColorManager.swift
//  CarQuiz
//
//  Created by 坂本大介 on 2016/05/24.
//

import UIKit

//色を管理するクラス

class ColorManager: UIColor {
    
    class func MainColor1() -> UIColor {
        return UIColor(red: 102.0 / 255.0, green: 183.0 / 255.0, blue: 188.0 / 255.0, alpha: 1.0)
    }
    
    class func MainColor2() -> UIColor {
        return UIColor(red: 223.0 / 255.0, green: 82.0 / 255.0, blue: 88.0 / 255.0, alpha: 1.0)
    }
    
    class func LightGray() -> UIColor {
        return UIColor(red: 82.0 / 255.0, green: 203.0 / 255.0, blue: 203.0 / 255.0, alpha: 1.0)
    }
    class func DarkGray() -> UIColor {
        return UIColor(red: 82.0 / 255.0, green: 203.0 / 255.0, blue: 203.0 / 255.0, alpha: 1.0)
    }
    
    
    class func CarWhite() -> UIColor {
        return UIColor(red: 258.0 / 255.0, green: 241.0 / 255.0, blue: 247.0 / 255.0, alpha: 1.0)
    }
    
    class func facebookMessengerBlue() -> UIColor {
        return UIColor(red: 18.0 / 255.0, green: 104.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0)
    }
}