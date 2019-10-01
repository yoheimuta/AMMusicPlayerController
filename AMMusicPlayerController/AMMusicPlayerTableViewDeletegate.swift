//
//  AMMusicPlayerTableViewDeletegate.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/26.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import Foundation
import SPStorkController

public class AMMusicPlayerTableViewDeletegate: NSObject, UITableViewDelegate {
    weak var tableView: UITableView!
    private var cellHeightList: [IndexPath: CGFloat] = [:]

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            SPStorkController.scrollViewDidScroll(scrollView)
        }
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        if let height = cellHeightList[indexPath] {
            return height
        }
        return tableView.estimatedRowHeight
    }

    public func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if !cellHeightList.keys.contains(indexPath) {
            cellHeightList[indexPath] = cell.frame.size.height
        }
    }
}
