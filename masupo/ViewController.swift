//
//  ViewController.swift
//  masupo
//
//  Created by sabazusi on 11/5/17.
//  Copyright © 2017 sabazusi. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    var indicator: NVActivityIndicatorView!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 260))
        indicator.color = UIColor.gray
        indicator.type = NVActivityIndicatorType.lineSpinFadeLoader
        
        self.view.addSubview(indicator)
        indicator.startAnimating()
        indicator.center = view.center
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

