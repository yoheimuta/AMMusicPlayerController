//
//  FrameworkImage.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/27.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import UIKit

final class FrameworkImage {
    static func load(named: String) -> UIImage? {
        return UIImage(named: named, in: Bundle(for: self), compatibleWith: nil)
    }
}
