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
    
    let makeImage = MakeImage()

    @IBOutlet weak var completePhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completePhotoView.image = makeImage.toComplete(image: usePhoto!, text: answerText)
        
    }


    @IBAction func trushButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let addImage = completePhotoView.image
        UIImageWriteToSavedPhotosAlbum(addImage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
}
