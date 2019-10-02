//
//  AMMusicPlayerError.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/10/01.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import AVFoundation
import Foundation
import RxMusicPlayer

public enum AMMusicPlayerError: Error {
    case internalError(Error)
    case playerError(err: Error)
    case playerItemErrorLog(log: AVPlayerItemErrorLog)

    init(err: Error) {
        switch err {
        case let RxMusicPlayerError.playerItemMetadataFailed(err):
            self = .playerError(err: err)
        case let RxMusicPlayerError.playerItemFailed(err):
            self = .playerError(err: err)
        case let RxMusicPlayerError.playerItemError(log: log):
            self = .playerItemErrorLog(log: log)
        default:
            self = .internalError(err)
        }
    }
}
