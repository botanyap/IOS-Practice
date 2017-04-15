//
//  CustomTableViewCell.swift
//  BoApps
//
//  Created by Macbook Air on 3/31/2560 BE.
//  Copyright © 2560 Botanyap. All rights reserved.
//

import UIKit


//ไฟล์ควบคุมเลเอาท์ โรมหนึ่งโรล
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mTitleLabel:UILabel!
    @IBOutlet weak var mSubTitleLabel:UILabel!
    @IBOutlet weak var mAvatarImage:UIImageView!
    @IBOutlet weak var mYoutubeImage:UIImageView!
    @IBOutlet weak var mCardView:UIView!
    
    //เปรียบเหมือน viewdidload()
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.mCardView.drawAsCircle(radius: 5)
        self.mCardView.dropShadow()
        
         //ทำให้ AvartarImage เป็นวงกลม
        self.mAvatarImage.layer.masksToBounds = true
        self.mAvatarImage.layer.cornerRadius = self.mAvatarImage.bounds.height / 2 //height / 2 เท่ากับรัศมีมัน
        
        self.mYoutubeImage.layer.masksToBounds = true
        self.mYoutubeImage.layer.cornerRadius = 10  //self.mAvatarImage.bounds.height / 2 //height / 2 เท่ากับรัศมีมัน
        // Initialization code
        
        self.backgroundColor = UIColor.clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension UIView {
    
    //func to make circle
    func drawAsCircle(radius:CGFloat? = nil) { //add parameter as optional
        
        self.layer.masksToBounds = true
        
        
        if let cornerRadius = radius { //
            
            self.layer.cornerRadius = cornerRadius
            
        }else{
            
            self.layer.cornerRadius = self.bounds.height / 2
            
        }
        
    }
    
    //func for make shadow
    func dropShadow() {
        
        self.layer.masksToBounds = false
        
        self.layer.shadowColor = UIColor.gray.cgColor
        
        self.layer.shadowOpacity = 0.5
        
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        
        self.layer.shadowRadius = 5
        
        
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
        self.layer.shouldRasterize = true
        
    }
    
}
