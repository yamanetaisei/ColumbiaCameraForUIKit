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

        completePhotoView.image = usePhoto
        
    }


    @IBAction func trushButton(_ sender: Any) {
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
    }
}
