//
//  MyCell.swift
//  ApiDemo-Swift
//
//  Created by Jacob su on 7/27/16.
//  Copyright © 2016 suzp1984@gmail.com. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let cvb = self.contentView.bounds
        let imf = self.imageView!.frame
        self.imageView!.frame.origin.x = cvb.size.width - imf.size.width - 15
        self.textLabel!.frame.origin.x = 15
    }

}
