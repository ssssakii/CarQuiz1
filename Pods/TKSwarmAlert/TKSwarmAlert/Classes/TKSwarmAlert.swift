//
//  SWAlert.swift
//  SWAlertView
//
//  Created by Takuya Okamoto on 2015/08/18.
//  Copyright (c) 2015年 Uniface. All rights reserved.
//

import UIKit

public typealias Closure=()->Void

public class TKSwarmAlert {
    
    public var didDissmissAllViews: Closure?

    private var staticViews: [UIView] = []
    var animationView: FallingAnimationView?
    var blurView: TKSWBackgroundView?

    public init() {
        
    }
    
    public func addNextViews(views:[UIView]) {
        self.animationView?.nextViewsList.append(views)
    }
    
    public func addSubStaticView(view:UIView) {
        view.tag = -1
        self.staticViews.append(view)
    }
    
    public func show(type type:TKSWBackgroundType ,views:[UIView]) {
        let window:UIWindow? = UIApplication.sharedApplication().keyWindow
        if window != nil {
            let frame:CGRect = window!.bounds
            blurView = TKSWBackgroundView(frame: frame)
            animationView = FallingAnimationView(frame: frame)
            
            
            let showDuration:NSTimeInterval = 0.2

            for staticView in staticViews {
                let originalAlpha = staticView.alpha
                staticView.alpha = 0
                animationView?.addSubview(staticView)
                UIView.animateWithDuration(showDuration) {
                    staticView.alpha = originalAlpha
                }
            }
            window!.addSubview(blurView!)
            window!.addSubview(animationView!)
            blurView?.show(type: type, duration:showDuration) {
                self.spawn(views)
            }

            animationView?.willDissmissAllViews = {
                let fadeOutDuration:NSTimeInterval = 0.2
                for v in self.staticViews {
                    UIView.animateWithDuration(fadeOutDuration) {
                        v.alpha = 0
                    }
                }
                UIView.animateWithDuration(fadeOutDuration) {
                    self.blurView?.alpha = 0
                }
            }
            animationView?.didDissmissAllViews = {
                self.blurView?.removeFromSuperview()
                self.animationView?.removeFromSuperview()
                self.didDissmissAllViews?()
                for staticView in self.staticViews {
                    staticView.alpha = 1
                }
            }
        }
    }
    
    public func spawn(views:[UIView]) {
        self.animationView?.spawn(views)
    }
}
