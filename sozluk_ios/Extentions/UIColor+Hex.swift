//
//  UIColor+Hex.swift
//  sozluk_ios
//
//  Created by mahmut akyol on 28.04.2018.
//  Copyright © 2018 mahmut akyol. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 10))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
