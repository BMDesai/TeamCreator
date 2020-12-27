//
//  CellTeam.swift
//  Sportzax
//
//  Created by Bhaumik on 30/08/20.
//

import UIKit

class CellTeam: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var viewBG : UIView!
    @IBOutlet weak var lblPlayerName : UILabel!
    @IBOutlet weak var lblTeam : UILabel!
    @IBOutlet weak var lblPoints : UILabel!
    @IBOutlet weak var lblCredits : UILabel!
    @IBOutlet weak var lblAnnounced : UILabel!
    @IBOutlet weak var cntrlDisable : UIControl!
    @IBOutlet weak var imgTeam : UIImageView!
    @IBOutlet weak var imgSelect : UIImageView!
    @IBOutlet weak var cntrlPlayerStatus : UIControl!
    
    @IBOutlet weak var cntrlSelectPlayer : UIControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
