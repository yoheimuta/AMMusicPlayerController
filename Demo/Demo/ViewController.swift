//
//  ViewController.swift
//  Demo
//
//  Created by YOSHIMUTA YOHEI on 2019/09/25.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import AMMusicPlayerController
import UIKit

class ViewController: UIViewController {

    var presentTableControllerButton = UIButton(type: UIButton.ButtonType.system)

    override func viewDidLoad() {
        super.viewDidLoad()

        presentTableControllerButton.setTitle("Show TableController", for: .normal)
        presentTableControllerButton.addTarget(self,
                                               action: #selector(presentModalViewController),
                                               for: .touchUpInside)
        presentTableControllerButton.sizeToFit()
        presentTableControllerButton.center.x = view.frame.width / 2
        presentTableControllerButton.center.y = view.frame.height / 4 * 3
        view.addSubview(presentTableControllerButton)
    }

    @objc func presentModalViewController() {
        let modal = AMMusicPlayerController.make(urls: [
            "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_1473200_1.mp3",
            "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_2160166.mp3",
            "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_4690995.mp3",
            "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_9179181.mp3",
        ].map { URL(string: $0)! }, index: 0)
        modal.presentPlayer(src: self)
    }
}
