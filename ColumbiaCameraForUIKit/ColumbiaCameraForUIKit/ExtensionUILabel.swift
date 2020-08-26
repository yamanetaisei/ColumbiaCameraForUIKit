//
//  ExtensionUILabel.swift
//  ColumbiaCameraForUIKit
//
//  Created by 山根大生 on 2020/08/26.
//  Copyright © 2020 taisei. All rights reserved.
//

import UIKit

extension UILabel{

    /// makeOutLine
    ///
    /// - Parameters:
    ///   - strokeWidth: 線の太さ。負数
    ///   - oulineColor: 線の色
    ///   - foregroundColor: 縁取りの中の色
    func makeOutLine(strokeWidth: CGFloat, oulineColor: UIColor, foregroundColor: UIColor) {
        let strokeTextAttributes = [
            .strokeColor : oulineColor,
            .foregroundColor : foregroundColor,
            .strokeWidth : strokeWidth,
            .font : self.font as Any
        ] as [NSAttributedString.Key : Any]
        self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
    }
}
