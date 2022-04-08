//
//  ImageWithTelop.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2022/04/09.
//  Copyright © 2022 taisei. All rights reserved.
//

import UIKit

class ImageWithTelop: UIView {
    
    @IBOutlet weak var originalImageView: UIImageView!
    
    func configure(_ originalImage: UIImage) {
        originalImageView.image = originalImage
    }
}
