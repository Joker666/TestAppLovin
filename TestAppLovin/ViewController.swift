//
//  ViewController.swift
//  TestAppLovin
//
//  Created by Hasan Rafi on 8/30/16.
//  Copyright © 2016 KickBackApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ALIncentivizedInterstitialAd.shared().adDisplayDelegate = self
        ALIncentivizedInterstitialAd.preloadAndNotify(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAd(sender: AnyObject) {
        // This works perfectly
//        if ALInterstitialAd.isReadyForDisplay() {
//            ALInterstitialAd.show()
//        }
        
        if ALIncentivizedInterstitialAd.isReadyForDisplay() {
            ALIncentivizedInterstitialAd.show()
        } else {
            NSLog("Error: Ad is not ready for display")
        }
    }
    
}


extension ViewController: ALAdLoadDelegate {
    func adService(adService: ALAdService, didLoadAd ad: ALAd) {
        NSLog("Ad loaded")
    }
    
    func adService(adService: ALAdService, didFailToLoadAdWithError code: Int32) {
        NSLog("Ad failed to load with error code : \(code)")
    }
}

extension ViewController: ALAdDisplayDelegate {
    func ad(ad: ALAd, wasDisplayedIn view: UIView) {
        NSLog("wasDisplayedIn")
    }
    
    func ad(ad: ALAd, wasClickedIn view: UIView) {
        NSLog("wasClickedIn")
    }
    
    func ad(ad: ALAd, wasHiddenIn view: UIView) {
        NSLog("wasHiddenIn")
    }
}
