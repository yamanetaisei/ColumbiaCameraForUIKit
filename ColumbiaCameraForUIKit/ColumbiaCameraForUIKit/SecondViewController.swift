//
//  SecondViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    //完成した画像を表示
    var completePhoto:UIImage?
    
    @IBOutlet weak var completePhotoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        completePhotoView.image = completePhoto
        
    }


    @IBAction func trushButton(_ sender: Any) {
        //現在の画面を終了
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        let addImage = completePhotoView.image
        //アルバムに写真を追加
        UIImageWriteToSavedPhotosAlbum(addImage!, nil, nil, nil)
        self.dismiss(animated: true, completion: nil)
    }
    
}
