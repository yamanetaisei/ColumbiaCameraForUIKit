//
//  SecondViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var completePhoto:UIImage?
    
    let makeImage = MakeImage()

    @IBOutlet weak var completePhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completePhotoView.image = completePhoto
        
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
