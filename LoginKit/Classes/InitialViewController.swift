//
//  InitialViewController.swift
//  LoginKit
//
//  Created by Daniel Lozano Valdés on 12/8/16.
//  Copyright © 2016 danielozano. All rights reserved.
//

import UIKit

protocol InitialViewControllerDelegate: class {

    func didSelectSignup(_ viewController: UIViewController)
    func didSelectLogin(_ viewController: UIViewController)
    func didSelectFacebook(_ viewController: UIViewController)

}

class InitialViewController: UIViewController, BackgroundMovable, Configurable {

    // MARK: - Properties

    weak var delegate: InitialViewControllerDelegate?

    var configuration: Configuration!

    // MARK: Background Movable

    var movableBackground: UIView {
        get {
            return backgroundImageView
        }
    }

    // MARK: Outlet's

    @IBOutlet weak var logoImageView: UIImageView!

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var signupButton: Buttn!

    @IBOutlet weak var loginButton: Buttn!

    @IBOutlet weak var facebookButton: Buttn!

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        initBackgroundMover()
        customizeAppearance()
    }

    override func loadView() {
        self.view = viewFromNib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // MARK: - Setup

    func customizeAppearance() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.delegate = self
        configure(with: configuration)
    }

    func configure(with config: Configuration) {
        backgroundImageView.image = config.backgroundImage
        logoImageView.image = config.logoImage
        signupButton.setTitle(config.signupButtonText, for: .normal)
        signupButton.setTitleColor(config.tintColor, for: .normal)
        loginButton.setTitle(config.loginButtonText, for: .normal)
        loginButton.setTitleColor(config.tintColor, for: .normal)
        facebookButton.setTitle(config.facebookButtonText, for: .normal)
        facebookButton.setTitleColor(config.tintColor, for: .normal)
    }

    // MARK: - Action's

    @IBAction func didSelectSignup(_ sender: AnyObject) {
        delegate?.didSelectSignup(self)
    }

    @IBAction func didSelectLogin(_ sender: AnyObject) {
        delegate?.didSelectLogin(self)
    }

    @IBAction func didSelectFacebook(_ sender: AnyObject) {
        delegate?.didSelectFacebook(self)
    }

}

// MARK: - UINavigationController Delegate

extension InitialViewController: UINavigationControllerDelegate {

    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CrossDissolveAnimation()
    }

}
