//
//  ViewController.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/24.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.placeholder = "クイズの答えを入力してください(10文字以内)"
            textField.clearButtonMode = .always
            //デリゲードを設定
            textField.delegate = self
        }
    }
    //MakeImageクラスのインスタンスを生成
    let makeImage = MakeImage()
    //入力したテキストをここで管理
    var inputText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func startCamera(_ sender: Any) {
        //インスタンスを生成
        let picker = UIImagePickerController()
        //ソースタイプの指定
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        //動作環境でソースタイプで指定したもの（この場合はカメラ）が使用できるか
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {//Yes
            picker.sourceType = sourceType
            picker.delegate = self
            self.present(picker, animated: true, completion: nil)
        }//No
    }
    //Retuenキーが押下されたときの動作
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる
        textField.resignFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength: Int = 10
        let str = textField.text! + string
        
        if str.count <= maxLength {
            return true
        }
        return false
    }
    //画面タッチ時の動作
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    //写真撮影後の動作
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //次の画面
        let nextVC = storyboard?.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        nextVC.modalPresentationStyle = .fullScreen
        //撮影した画像を変数に代入
        let image = info[.originalImage]
        nextVC.completePhoto = makeImage.toComplete(image: image as! UIImage, text: textField.text ?? "")
        //カメラの画面を終了
        picker.dismiss(animated: true, completion: nil)
        //画面遷移
        self.present(nextVC, animated: true, completion: nil)
    }
}

