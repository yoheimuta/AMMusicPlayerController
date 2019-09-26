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

    let tableView = UITableView()
    let urls = [
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_1473200_1.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_2160166.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_4690995.mp3",
        "https://storage.googleapis.com/maison-great-dev/oss/musicplayer/tagmp3_9179181.mp3",
    ].map { URL(string: $0)! }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }

    func presentModalViewController(index: Int) {
        let config = AMMusicPlayerConfig(lyricsLabel: "Words",
                                         confirmConfig: AMMusicPlayerConfig.ConfirmConfig(
                                             needConfirm: true,
                                             title: "Dismiss",
                                             message: "Caution",
                                             confirmActionTitle: "OK",
                                             cancelActionTitle: "No"))

        let modal = AMMusicPlayerController.make(urls: urls,
                                                 index: index,
                                                 config: config)
        modal.delegate = self
        modal.presentPlayer(src: self)
    }
}

extension ViewController: AMMusicPlayerDelegate {
    func musicPlayerControllerDidDismissByTap() {
        print("DismissByTap")
    }

    func musicPlayerControllerDidDismissBySwipe() {
        print("DismissBySwipe")
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Song \(indexPath.row + 1)"
        cell.transform = .identity
        return cell
    }

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return urls.count
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt ip: IndexPath) {
        presentModalViewController(index: ip.row)
    }
}
