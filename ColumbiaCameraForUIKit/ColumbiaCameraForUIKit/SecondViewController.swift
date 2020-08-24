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

        completePhotoView.image = addTelop(image: usePhoto!, telop: UIImage(named: "Telop")!)
        
    }


    @IBAction func trushButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let addImage = completePhotoView.image
        UIImageWriteToSavedPhotosAlbum(addImage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
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
