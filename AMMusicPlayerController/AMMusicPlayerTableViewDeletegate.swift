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

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            SPStorkController.scrollViewDidScroll(scrollView)
        }
    }
}
