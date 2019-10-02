//
//  AMMusicPlayerDelegate.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/26.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import Foundation

public protocol AMMusicPlayerDelegate: class {
    func musicPlayerControllerDidDismissByTap()
    func musicPlayerControllerDidDismissBySwipe()
    func musicPlayerControllerDidFail(controller: AMMusicPlayerController?,
                                      err: AMMusicPlayerError)
}
