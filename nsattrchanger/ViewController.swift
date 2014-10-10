//
//  ViewController.swift
//  nsattrchanger
//
//  Created by suisho on 2014/10/09.
//  Copyright (c) 2014年 suisho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var label : UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.label = self.view.viewWithTag(1) as? UILabel
        NSTimer.scheduledTimerWithTimeInterval( 0.5,
            target: self,
            selector: Selector("timer:"),
            userInfo: nil,
            repeats: true)
    }
    
    func createPlaceholder(color : UIColor = UIColor.grayColor(), size : CGSize) -> UIImage{
        let rect = CGRect(origin: CGPoint.zeroPoint, size: size)
        UIGraphicsBeginImageContext(rect.size)
        let contextRef = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(contextRef, color.CGColor)
        CGContextFillRect(contextRef, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
    
    func randomColor() -> UIColor{
        let h : CGFloat = (CGFloat(arc4random()) % 255) / 255
        return UIColor(hue: h, saturation: 0.5, brightness: 0.5, alpha: 1)
    }
    func timer(l : NSTimer){
        let size = CGSize(width: 300, height: 200)
        if let l = label{
            let att = NSTextAttachment()
            att.image = createPlaceholder(color: randomColor(), size: size)
            l.attributedText = NSAttributedString(attachment: att)
            
            //l.attributedText = NSAttributedString(string: "foo")
        }
        
        let ls = NSAttributedString()
        let str = NSTextStorage()
        let lm = NSLayoutManager()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

