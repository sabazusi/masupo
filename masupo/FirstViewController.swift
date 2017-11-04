//
//  FirstViewController.swift
//  masupo
//
//  Created by sabazusi on 10/22/17.
//  Copyright © 2017 sabazusi. All rights reserved.
//

import UIKit
import NVActivityIndicatorView


class FirstViewController: UIViewController {
    
    var indicator: NVActivityIndicatorView!;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 260, height: 260))
        indicator.color = UIColor.red
        indicator.type = NVActivityIndicatorType.lineSpinFadeLoader
        indicator.startAnimating()
        indicator.center = view.center
        print("hai")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

