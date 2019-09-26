//
//  AMMusicPlayerController.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/25.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import RxMusicPlayer
import RxSwift
import SPStorkController
import UIKit

public class AMMusicPlayerController: UIViewController {
    // Music player.
    public private(set) var player: RxMusicPlayer!

    @IBOutlet private var tableView: UITableView!

    private let disposeBag = DisposeBag()
    private var lightStatusBar: Bool = false
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return lightStatusBar ? .lightContent : .default
    }

    // swiftlint:disable:next weak_delegate
    public var tableViewDelegate = AMMusicPlayerTableViewDeletegate()
    public var tableViewDataSource = AMMusicPlayerTableViewDataSource()

    /**
     Initialize a controller.
     */
    public static func make(player: RxMusicPlayer) -> AMMusicPlayerController {
        let controller = instantiate()
        controller.player = player
        return controller
    }

    /**
     Initialize a controller.
     */
    public static func make(urls: [URL] = [],
                            index: Int = 0) -> AMMusicPlayerController {
        let controller = instantiate()
        controller.player = RxMusicPlayer(items: urls.map { RxMusicPlayerItem(url: $0) })
        controller.player.playIndex = index
        return controller
    }

    private static func instantiate() -> AMMusicPlayerController {
        return UIStoryboard(name: "AMMusicPlayerController", bundle: Bundle(for: self))
            // swiftlint:disable:next force_cast
            .instantiateInitialViewController() as! AMMusicPlayerController
    }

    /**
     Present the player view controller.
     */
    public func presentPlayer(src: UIViewController,
                              animated flag: Bool = true,
                              completion: (() -> Void)? = nil) {
        let transitionDelegate = SPStorkTransitioningDelegate()
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .custom
        src.present(self, animated: flag, completion: completion)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        modalPresentationCapturesStatusBarAppearance = true

        tableViewDelegate.tableView = tableView
        tableView.delegate = tableViewDelegate
        tableViewDataSource.player = player
        tableView.dataSource = tableViewDataSource

        player.rx.currentItemLyrics()
            .do(onNext: { [weak self] _ in
                self?.tableView.reloadRows(at: [IndexPath(row: 0, section: 1)],
                                           with: UITableView.RowAnimation.automatic)
            })
            .drive()
            .disposed(by: disposeBag)

        updateLayout(with: view.frame.size)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        lightStatusBar = true
        UIView.animate(withDuration: 0.3) { () -> Void in
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }

    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateLayout(with: view.frame.size)
    }

    func updateLayout(with size: CGSize) {
        tableView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    }

    @objc func dismissAction() {
        SPStorkController.dismissWithConfirmation(controller: self, completion: nil)
    }
}
