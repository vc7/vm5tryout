//
//  AdCell.swift
//  vmfivetryout
//
//  Created by vc7 on 8/15/16.
//  Copyright © 2016 vc7. All rights reserved.
//

import UIKit

class AdCell: UITableViewCell {

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var readMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.bringSubviewToFront(self.readMoreButton)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension AdCell:VANativeAdViewRenderProtocol {
    static func nibForAd() -> UINib {
        return UINib(nibName: "AdCell", bundle: nil)
    }
    
    func nativeVideoView() -> UIView {
        return self.videoView
    }
    
    func clickableViews() -> [AnyObject] {
        return [self.readMoreButton]
    }
}