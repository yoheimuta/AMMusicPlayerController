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
    let controlConfig: ControlConfig

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

    public struct ControlConfig {
        let playButtonImage: UIImage
        let pauseButtonImage: UIImage
        let nextButtonImage: UIImage?
        let prevButtonImage: UIImage?
        let shuffleOffImage: UIImage
        let shuffleOnImage: UIImage
        let repeatNoneImage: UIImage
        let repeatOneImage: UIImage
        let repeatAllImage: UIImage
        let volumeMinImage: UIImage
        let volumeMaxImage: UIImage

        public init(playButtonImage: UIImage = fi("play_btn"),
                    pauseButtonImage: UIImage = fi("stop_btn"),
                    nextButtonImage: UIImage? = nil,
                    prevButtonImage: UIImage? = nil,
                    shuffleOffImage: UIImage = fi("icn_shuffle_off"),
                    shuffleOnImage: UIImage = fi("icn_shuffle_on"),
                    repeatNoneImage: UIImage = fi("icn_repeat_off"),
                    repeatOneImage: UIImage = fi("icn_single_repeat_on"),
                    repeatAllImage: UIImage = fi("icn_repeat_on"),
                    volumeMinImage: UIImage = fi("icn_volume_min"),
                    volumeMaxImage: UIImage = fi("icn_volume_on")) {
            self.playButtonImage = playButtonImage
            self.pauseButtonImage = pauseButtonImage
            self.nextButtonImage = nextButtonImage
            self.prevButtonImage = prevButtonImage
            self.shuffleOffImage = shuffleOffImage
            self.shuffleOnImage = shuffleOnImage
            self.repeatNoneImage = repeatNoneImage
            self.repeatOneImage = repeatOneImage
            self.repeatAllImage = repeatAllImage
            self.volumeMinImage = volumeMinImage
            self.volumeMaxImage = volumeMaxImage
        }

        /// default is a default configuration.
        public static let `default` = ControlConfig()
    }

    public init(lyricsLabel: String = "Lyrics",
                confirmConfig: ConfirmConfig = ConfirmConfig.default,
                controlConfig: ControlConfig = ControlConfig.default) {
        self.lyricsLabel = lyricsLabel
        self.confirmConfig = confirmConfig
        self.controlConfig = controlConfig
    }

    /// default is a default configuration.
    public static let `default` = AMMusicPlayerConfig()
}

public func fi(_ name: String) -> UIImage {
    return FrameworkImage.load(named: name)!
}
