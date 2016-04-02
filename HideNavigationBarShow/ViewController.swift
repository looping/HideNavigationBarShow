//
//  ViewController.swift
//  HideNavigationBarShow
//
//  Created by Looping on 4/2/16.
//  Copyright © 2016 RidgeCorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    lazy var nextController: ViewController = {
        var controller: ViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("ViewController") as! ViewController
        return controller
    }()
    
    var navigationBarNeedHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(self.navigationBarNeedHidden, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushAndHiddenNavigationBar(sender: UIButton) {
        nextController.navigationBarNeedHidden = true
        
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
    
    @IBAction func pushAndShowNavigationBar(sender: UIButton) {
        nextController.navigationBarNeedHidden = false
        
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
}

