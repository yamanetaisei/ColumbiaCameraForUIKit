//
//  ViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func startCamera(_ sender: Any) {
        let picker = UIImagePickerController()
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }
    }
}

