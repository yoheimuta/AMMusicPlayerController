//
//  LyricsCell.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/26.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import RxMusicPlayer
import RxSwift
import UIKit

class LyricsCell: UITableViewCell {
    @IBOutlet private var lyricsHeader: UILabel!
    @IBOutlet private var lyricsLabel: UILabel!

    private var disposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }

    func run(_ player: RxMusicPlayer,
             config: AMMusicPlayerConfig) {
        lyricsHeader.text = config.lyricsLabel

        player.rx.currentItemLyrics()
            .distinctUntilChanged()
            .drive(lyricsLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
