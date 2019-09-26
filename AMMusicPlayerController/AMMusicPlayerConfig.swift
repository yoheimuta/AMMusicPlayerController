//
//  AMMusicPlayerConfig.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/26.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import Foundation

/**
 Config.
 */
public struct AMMusicPlayerConfig {
    let lyricsLabel: String
    let confirmConfig: ConfirmConfig

    public struct ConfirmConfig {
        let needConfirm: Bool
        let title: String
        let message: String
        let confirmActionTitle: String
        let cancelActionTitle: String

        public init(needConfirm: Bool = false,
                    title: String = "Need dismiss?",
                    message: String = "",
                    confirmActionTitle: String = "Confirm",
                    cancelActionTitle: String = "Cancel") {
            self.needConfirm = needConfirm
            self.title = title
            self.message = message
            self.confirmActionTitle = confirmActionTitle
            self.cancelActionTitle = cancelActionTitle
        }

        /// default is a default configuration.
        public static let `default` = ConfirmConfig()
    }

    public init(lyricsLabel: String = "Lyrics",
                confirmConfig: ConfirmConfig = ConfirmConfig.default) {
        self.lyricsLabel = lyricsLabel
        self.confirmConfig = confirmConfig
    }

    /// default is a default configuration.
    public static let `default` = AMMusicPlayerConfig()
}
