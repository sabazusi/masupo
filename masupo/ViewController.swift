//
//  ViewController.swift
//  masupo
//
//  Created by sabazusi on 11/5/17.
//  Copyright © 2017 sabazusi. All rights reserved.
//

import UIKit
import Alamofire
import Kanna
import NVActivityIndicatorView

class ViewController: UIViewController, NVActivityIndicatorViewable {
    
    var indicator: NVActivityIndicatorView!;
    private let MASUDA_URL = "https://anond.hatelabo.jp";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 60, height: 260))
        indicator.color = UIColor.gray
        indicator.type = NVActivityIndicatorType.lineSpinFadeLoader
        
        self.view.addSubview(indicator)
        indicator.startAnimating()
        indicator.center = view.center
        
        self.fetchEntries(page: 1)
    }
    func parseHTML(html: String) -> Void {
        if let doc = Kanna.HTML(html: html, encoding: String.Encoding.utf8) {
            for node in doc.css("div.section") {
                for heads in node.css("h3") {
                    print(heads.text);
                }
            }
        }
    }
    
    func fetchEntries(page: Int) -> Void {
        Alamofire.request(MASUDA_URL).responseString { response in
            print("\(response)");
            if let html = response.result.value {
                self.parseHTML(html: html)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

