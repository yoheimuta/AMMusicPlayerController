//
//  AMMusicPlayerTableViewDataSource+Rx.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/10/01.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import RxCocoa
import RxSwift

extension Reactive where Base: AMMusicPlayerTableViewDataSource {
    var playerDidFail: ControlEvent<Error> {
        return ControlEvent(events: base.playerFailureRelay.asObservable())
    }
}
