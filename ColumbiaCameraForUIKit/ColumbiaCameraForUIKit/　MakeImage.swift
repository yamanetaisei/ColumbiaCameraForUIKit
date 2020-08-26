//
//  　MakeImage.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/25.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class MakeImage {
    
    func makeTelop(text: String) -> UIImage {
        let telop = UIImage(named: "Telop")
        
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.font = UIFont(name: "HiraKakuProN-W6", size: 30)
        textLabel.frame = CGRect(x:0, y: 0, width: telop!.size.width * 1.1, height: telop!.size.height)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.makeOutLine(strokeWidth: -5.0, oulineColor: .black, foregroundColor: .white)
        UIGraphicsBeginImageContext(CGSize(width: telop!.size.width, height: telop!.size.height))
        telop?.draw(in: CGRect(x: 0, y: 0, width: telop!.size.width, height: telop!.size.height))
        textLabel.draw(textLabel.frame)
        let newTelop = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newTelop!
        
    }
    
    func addTelop(image: UIImage, telop: UIImage) -> UIImage {
        let telopAspectScale = telop.size.height / telop.size.width
        
        let telopResizedSize = CGSize(width: image.size.width, height: image.size.width * CGFloat(Double(telopAspectScale)))
        
        UIGraphicsBeginImageContext(CGSize(width: image.size.width, height: image.size.height))
        
        image.draw(in: CGRect(x: 0, y: 0, width: image.size.width , height: image.size.height))
        
        if image.size.width >= image.size.height {
            telop.draw(in: CGRect(x: 0, y: image.size.height/1.3, width: image.size.width, height: telopResizedSize.height))
        } else {
            telop.draw(in: CGRect(x: 0, y: image.size.height/1.2, width: image.size.width, height: telopResizedSize.height))
        }
    

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func toComplete(image: UIImage, text: String) -> UIImage {
        let telop = makeTelop(text: text)
        let completeImage = addTelop(image: image, telop: telop)
        return completeImage
    }
}
