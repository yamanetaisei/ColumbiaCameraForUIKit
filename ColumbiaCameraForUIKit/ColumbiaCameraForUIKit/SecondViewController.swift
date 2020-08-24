//
//  SecondViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var usePhoto:UIImage?
    var answerText: String = ""

    @IBOutlet weak var completePhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completePhotoView.image = addTelop(image: usePhoto!, telop: makeTelop(text: answerText))
        
    }


    @IBAction func trushButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let addImage = completePhotoView.image
        UIImageWriteToSavedPhotosAlbum(addImage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    func makeTelop(text: String) -> UIImage {
        let telop = UIImage(named: "Telop")
        print(text)
        let textLabel = UILabel()
        textLabel.text = text
        textLabel.font = UIFont(name: "HiraKakuProN-W6", size: 30)
        textLabel.layer.shadowColor = UIColor.black.cgColor
        textLabel.frame = CGRect(x:0, y: 0, width: telop!.size.width * 1.1, height: telop!.size.height)
        textLabel.textAlignment = NSTextAlignment.center
        
        UIGraphicsBeginImageContext(CGSize(width: telop!.size.width, height: telop!.size.height))
        telop?.draw(in: CGRect(x: 0, y: 0, width: telop!.size.width, height: telop!.size.height))
        textLabel.drawText(in: textLabel.frame)
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
}
