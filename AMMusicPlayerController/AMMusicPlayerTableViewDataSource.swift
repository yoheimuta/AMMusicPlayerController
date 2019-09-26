//
//  AMMusicPlayerTableViewDataSource.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/26.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import RxMusicPlayer
import SPStorkController

public class AMMusicPlayerTableViewDataSource: NSObject, UITableViewDataSource {
    public var player: RxMusicPlayer!

    private enum TableSection: CaseIterable {
        case player
        case lyrics
    }

    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch TableSection.allCases[indexPath.section] {
        case .player:
            let cell = playerCell(tableView)
            cell.run(player)
            return cell
        case .lyrics:
            let cell = lyricsCell(tableView)
            cell.run(player)
            return cell
        }
    }

    public func numberOfSections(in _: UITableView) -> Int {
        return TableSection.allCases.count
    }

    public func tableView(_: UITableView, numberOfRowsInSection sec: Int) -> Int {
        switch TableSection.allCases[sec] {
        case .player:
            return 1
        case .lyrics:
            return 1
        }
    }
}

private func playerCell(_ tableView: UITableView) -> PlayerCell {
    return dequeueCell(tableView: tableView, identifier: "PlayerCell")
}

private func lyricsCell(_ tableView: UITableView) -> LyricsCell {
    return dequeueCell(tableView: tableView, identifier: "LyricsCell")
}

private func dequeueCell<T: UITableViewCell>(tableView: UITableView, identifier: String)
    -> T {
    let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
    guard let cellT = cell as? T else {
        fatalError("Could not dequeue cell with identifier: \(identifier)")
    }
    return cellT
}
