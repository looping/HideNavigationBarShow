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
    var navigationBarHidden = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue()) { 
            self.navigationBarHidden = self.navigationBarNeedHidden
            
            self.navigationController?.setNavigationBarHidden(self.navigationBarHidden, animated: true)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(self.navigationBarHidden, animated: true)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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

