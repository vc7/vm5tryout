//
//  ViewController.swift
//  vmfivetryout
//
//  Created by vc7 on 8/15/16.
//  Copyright © 2016 vc7. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var adCellProvider: VAAdCellProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup table view
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "normal_cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // Setup cell provider
        self.adCellProvider = VAAdCellProvider(placement: "test", adType: kVAAdTypeVideoCard, tableView: self.tableView, forAttributes: self.adAttributes())
        self.adCellProvider?.testMode = true
        self.adCellProvider?.apiKey = "not-applied"
        self.adCellProvider?.loadAds()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


extension ViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("normal_cell", forIndexPath: indexPath)
        cell.textLabel?.text = "row: \(indexPath.row)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController {
    private func adAttributes() -> VANativeAdViewAttributeObject {
        let attribute = VANativeAdViewAttributeObject()
        attribute.customAdViewClass = AdCell.self
        attribute.customAdViewSizeHandler = { width, ratio in
            
            // 這邊我設定 ad 與畫面等寬
            let adWidth = CGRectGetWidth(UIScreen.mainScreen().bounds);
            
            // 高度 80 為預留給 title 和 main image, 其餘的部分, 會被等比例的壓短
            let adHeight = adWidth * ratio + 16.0;
            return CGSize(width: adWidth, height: adHeight);
        }
        return attribute
    }
}

extension ViewController: VAAdCellProviderDataSource {
    func tableView(tableView: UITableView, numberOfAdsInSection section: UInt) -> Int {
        return kVAAdCellProviderNumberOfAdsUnlimited
    }
    
    func tableView(tableView: UITableView, adStartRowInSection section: UInt) -> UInt {
        return 3
    }
    
    func tableView(tableView: UITableView, adOffsetInSection section: UInt) -> UInt {
        return 3
    }
}

extension ViewController: VAAdCellProviderDelegate {
    
    func adCellProvider(adCellProvider: VAAdCellProvider, didLoadAtIndexPath indexPath: NSIndexPath) {
        print("\(#function) \(indexPath)")
    }
    
    func adCellAtIndexPath(indexPath: NSIndexPath, didFailWithError error: NSError) {
        print("\(#function) \(error)")
    }
    
    func adCellProvider(adCellProvider: VAAdCellProvider, didFailAtIndexPath indexPath: NSIndexPath, withError error: NSError) {
        print("\(#function) \(indexPath) \(error)")
    }
    
    func adCellProviderDidClick(adCellProvider: VAAdCellProvider) {
        print("\(#function)")
    }
    
    func adCellProviderDidFinishHandlingClick(adCellProvider: VAAdCellProvider) {
        print("\(#function)")
    }
    
}