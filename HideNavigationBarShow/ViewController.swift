//
//  ViewController.swift
//  HideNavigationBarShow
//
//  Created by Looping on 4/2/16.
//  Copyright © 2016 RidgeCorn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var nextController: UIViewController = {
        var controller = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("ViewController")
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushAndHiddenNavigationBar(sender: UIButton) {
        self.navigationController?.navigationBar.hidden = true
        
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
    
    @IBAction func pushAndShowNavigationBar(sender: UIButton) {
        self.navigationController?.navigationBar.hidden = false
        
        self.navigationController?.pushViewController(nextController, animated: true)
    }
    
}

