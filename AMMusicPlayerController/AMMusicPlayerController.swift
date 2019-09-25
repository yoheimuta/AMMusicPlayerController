//
//  AMMusicPlayerController.swift
//  AMMusicPlayerController
//
//  Created by YOSHIMUTA YOHEI on 2019/09/25.
//  Copyright © 2019 YOSHIMUTA YOHEI. All rights reserved.
//

import SPStorkController
import UIKit

public class AMMusicPlayerController: UIViewController {

    let tableView = UITableView()
    var lightStatusBar: Bool = false
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return lightStatusBar ? .lightContent : .default
    }

    private var data = [
        "Assembly", "C", "C++", "Java", "JavaScript", "Php", "Python",
        "Swift", "Kotlin", "Assembly", "C", "C++", "Java", "JavaScript",
        "Php", "Python", "Objective-C", "Swift", "Kotlin", "Assembly",
        "C", "C++", "Java", "JavaScript", "Php", "Python", "Objective-C",
    ]

    public func presentPlayer(src: UIViewController,
                              animated flag: Bool = true,
                              completion: (() -> Void)? = nil) {
        let transitionDelegate = SPStorkTransitioningDelegate()
        transitionDelegate.storkDelegate = self
        transitioningDelegate = transitionDelegate
        modalPresentationStyle = .custom
        src.present(self, animated: flag, completion: completion)
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        modalPresentationCapturesStatusBarAppearance = true

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

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

extension AMMusicPlayerController: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.transform = .identity
        return cell
    }

    public func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return data.count
    }

    public func tableView(_: UITableView, commit _: UITableViewCell.EditingStyle, forRowAt _: IndexPath) {
    }
}

extension AMMusicPlayerController: UITableViewDelegate {

    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            SPStorkController.scrollViewDidScroll(scrollView)
        }
    }
}

extension AMMusicPlayerController: SPStorkControllerDelegate {

    public func didDismissStorkByTap() {
        print("SPStorkControllerDelegate - didDismissStorkByTap")
    }

    public func didDismissStorkBySwipe() {
        print("SPStorkControllerDelegate - didDismissStorkBySwipe")
    }
}
