//
//  ViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    var answerText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.placeholder = "クイズの答えを入力してください"
        textField.clearButtonMode = .always
        textField.delegate = self
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    
}

