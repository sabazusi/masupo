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

class ViewController: UIViewController, NVActivityIndicatorViewable, UITableViewDelegate, UITableViewDataSource {
    
    var indicator: NVActivityIndicatorView!;
    private let MASUDA_URL = "https://anond.hatelabo.jp";
    var entries: Array<String> = ["a", "b", "c"];
    
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
                    if let title = heads.text {
                        self.entries.append(title)
                    }
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
            self.indicator.stopAnimating()
            // todo: reload data with UITableViewController
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        cell.textLabel!.text = entries[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(entries[indexPath.row]);
    }
    
}

