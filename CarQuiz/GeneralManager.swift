//
//  GeneralManager
//
//  Created by 坂本大介 on 2016/04/22.
//

import UIKit

class GeneralManager: NSObject {
    
    //保存している色を呼び出すメソッド
    class func InitView() -> UIColor {
        let saveData: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if saveData.objectForKey("colortag") != nil {
            let color = saveData.objectForKey("colortag") as! Int
            switch color {
            case 1:
                return UIColor.yellowColor()
            case 2:
                return UIColor.greenColor()
            case 3:
                return UIColor.blueColor()
            default:
                print("error!")
            }
        }
        return UIColor.yellowColor()
    }
}
