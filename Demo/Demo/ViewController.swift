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
        let modal = AMMusicPlayerController()
        modal.presentPlayer(src: self)
    }
}
