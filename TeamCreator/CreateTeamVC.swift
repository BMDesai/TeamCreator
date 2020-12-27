//
//  CreateTeamVC.swift
//  Sportzax
//
//  Created by Bhaumik on 29/08/20.
//

import UIKit
import SDWebImage

class CellSelectedTeam: UITableViewCell {
    
    //IBOutlets
    @IBOutlet weak var lblPlayerName : UILabel!
    @IBOutlet weak var lblTeam : UILabel!
    @IBOutlet weak var lblCaptain : UILabel!
    @IBOutlet weak var lblViseCaptain : UILabel!
    @IBOutlet weak var cntrlCaptain : UIControl!
    @IBOutlet weak var cntrlViseCaptain : UIControl!
    @IBOutlet weak var imgTeam : UIImageView!
    
}

struct ModelValueSelection {
    var isOneXValue : Bool!
    var isTwoXValue : Bool!
}

class CreateTeamVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var tbPlayers : UITableView!
    
    @IBOutlet weak var lblMatchVS : UILabel!
    @IBOutlet weak var lblMatchTime : UILabel!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblSubTitle : UILabel!
    @IBOutlet weak var lblPreview : UILabel!
    @IBOutlet weak var lblCreateTeam : UILabel!
    
    @IBOutlet weak var cntrlPreview : UIControl!
    @IBOutlet weak var cntrlCreateTeam : UIControl!
    
    //Variables
    var selectedMatcheData : MatcheData!
//    var selectedContestData : AllContest!
    var arrSelectedPlayers = [TeamData]()
    var arrCaptainSelection = [ModelValueSelection]()
    var matchStartTime = Timer()
    var captainTag = Int()
    var viceCaptainTag = Int()
    var isFromEditTeam = false
    var isFromAddNewTeam = false
    var callBackTeamChange : ((String)->())?
    var editTeamID = ""
    var newCreatedteamId = ""
    var needToDeposit = Int()
//    var razorpayObj : RazorpayCheckout? = nil
//    var modelUsableBalanceData : ModelUsableBalance!
    var isGreaterThanDate = Bool()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialization
        initialization()
    }
     
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        //start Timer
        self.runCountdown()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        //Invalidate timer
        self.matchStartTime.invalidate()
    }
        
        //MARK: - Initialization
    func initialization() {
        //
        self.configureViewFromLocalisation()
        //set title
//        if self.selectedContestData != nil {
//            self.title = self.selectedContestData.title!
//        } else {
            self.title = self.selectedMatcheData.title!
//        }
        //
        for value in arrSelectedPlayers {
            if isFromEditTeam {
                self.arrCaptainSelection.append(ModelValueSelection(isOneXValue: value.isViceCaptain, isTwoXValue: value.isCaptain))
            } else {
                self.arrCaptainSelection.append(ModelValueSelection(isOneXValue: false, isTwoXValue: false))
            }
        }
        //
        self.enableTeam()
        //
        self.lblMatchVS.text! = "\(self.selectedMatcheData.teama!.shortName!) VS \(self.selectedMatcheData.teamb!.shortName!)".uppercased()
        //Remove empty cell
        self.tbPlayers.tableFooterView = UIView()
    }
    
    //Localization
    func configureViewFromLocalisation() {
        self.lblTitle.text! = "Choose Your Captain (C) & Vice Captain (VC)"
        self.lblSubTitle.text! = "(C) will get 2x & (VC) will get 1.5x Points"
        self.lblPreview.text! = "Preview"
//        if self.isFromEditTeam {
//            self.lblCreateTeam.text! = Localization("Save Team")
//        } else {
            self.lblCreateTeam.text! = "Next"
//        }
    }
    
    func runCountdown() {
        self.matchStartTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getRemainTime), userInfo: nil, repeats: true)
    }
    //
    @objc func getRemainTime() {
        let matchTime = Double(self.selectedMatcheData.timestampStart!)
        let date = Date(timeIntervalSince1970: matchTime!)
        let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: date)
//        self.isGreaterThanDate = date.isGreaterThanDate(dateToCompare: Date())
        print("Greater -> \(isGreaterThanDate)")
        self.lblMatchTime.text! = "\(difference.hour!)h \(difference.minute!)m \(difference.second!)s"
    }
}

//MARK: - Action Events
extension CreateTeamVC {
    
    @IBAction func tappedOnPreview(_ sender: UIControl) {
        let viewVC = self.storyboard!.instantiateViewController(withIdentifier: "PreviewTeamVC") as! PreviewTeamVC
        viewVC.arrTeamData = self.arrSelectedPlayers
//        viewVC.viceCaptainIndex = viceCaptainTag
//        viewVC.captainIndex = captainTag
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(viewVC, animated: false)
    }

    @IBAction func tappedOnCreateTeam(_ sender: UIControl) {
        if self.isGreaterThanDate == false {
           // self.view.makeToast("Match is already live. You cannot create the team now")
            return
        }
    }
    
    @objc func tappedOnCaptain(_ sender: UIControl) {
        let cell = self.tbPlayers.cellForRow(at: IndexPath.init(row: sender.tag, section: 0)) as! CellSelectedTeam
        
        for (index, value1) in self.arrCaptainSelection.enumerated() {
            if value1.isTwoXValue! == true {
                self.arrCaptainSelection[index].isTwoXValue! = false
                self.arrSelectedPlayers[index].isCaptain = false
            }
        }
        self.captainTag = sender.tag
        self.arrCaptainSelection[sender.tag].isOneXValue! = false
        self.arrCaptainSelection[sender.tag].isTwoXValue! = true
        self.arrSelectedPlayers[sender.tag].isCaptain = true
        self.arrSelectedPlayers[sender.tag].isViceCaptain = false
        cell.lblCaptain.text! = "2x"
        cell.lblCaptain.backgroundColor = AppTheme.mainColor
        cell.lblCaptain.textColor = UIColor.white
        
        cell.lblViseCaptain.text! = "VC"
        cell.lblViseCaptain.backgroundColor = AppTheme.lightGreen
        cell.lblViseCaptain.textColor = UIColor.black
        
        self.tbPlayers.reloadData()
        self.enableTeam()
    }
    
    @objc func tappedOnViseCaptain(_ sender: UIControl) {
        let cell = self.tbPlayers.cellForRow(at: IndexPath.init(row: sender.tag, section: 0)) as! CellSelectedTeam
        
        for (index, value1) in self.arrCaptainSelection.enumerated() {
            if value1.isOneXValue! == true {
                self.arrCaptainSelection[index].isOneXValue! = false
                self.arrSelectedPlayers[index].isViceCaptain = false
            }
        }
        self.viceCaptainTag = sender.tag
        self.arrCaptainSelection[sender.tag].isOneXValue! = true
        self.arrCaptainSelection[sender.tag].isTwoXValue! = false
        self.arrSelectedPlayers[sender.tag].isCaptain = false
        self.arrSelectedPlayers[sender.tag].isViceCaptain = true
        
        cell.lblViseCaptain.text! = "1.5x"
        cell.lblViseCaptain.backgroundColor = AppTheme.mainColor
        cell.lblViseCaptain.textColor = UIColor.white
        
        cell.lblCaptain.text! = "C"
        cell.lblCaptain.backgroundColor = AppTheme.lightGreen
        cell.lblCaptain.textColor = UIColor.black
        
        
        self.tbPlayers.reloadData()
        self.enableTeam()
        
    }
    
    func enableTeam() {
        let arr = self.arrCaptainSelection.filter({ $0.isOneXValue! == true || $0.isTwoXValue! == true })
        if arr.count == 2 {
            self.cntrlCreateTeam.backgroundColor = AppTheme.mainColor
            self.cntrlCreateTeam.isUserInteractionEnabled = true
            self.lblCreateTeam.textColor = UIColor.white
        } else {
            self.cntrlCreateTeam.backgroundColor = UIColor.lightGray
            self.cntrlCreateTeam.isUserInteractionEnabled = false
            self.lblCreateTeam.textColor = UIColor.darkGray
        }

    }
    
    func setJsonAraay() -> [[String: Any]] {
        var result = [[String: Any]]()
        
        for value in self.arrSelectedPlayers {
            let dict: [String: Any] = [
                "batting_style" : value.battingStyle  ,
                "birthdate" : value.birthdate ,
//                "birthplace" : value.birthplace,
                "bowling_style" : value.bowlingStyle ,
                "country" : value.country ,
                "fantasy_player_rating" : value.fantasyPlayerRating ,
                "fielding_position" : value.fieldingPosition ,
                "first_name" : value.firstName ,
//                "isAnnounce" : value.isAnnounce,
                "is_captain" : value.isCaptain ? 1  : 0   ,
//                "isSelected" : value.isSelected,
                "is_vice_captain" : value.isViceCaptain ? 1  : 0  ,
                "last_name" : value.lastName ,
                "logo_url" : value.logoUrl ,
                "middle_name" : value.middleName ,
//                "national_flag" : value.nationalFlag,
                "nationality" : value.nationality! ,
                "pid" : value.pid ,
                "playing_role" : value.playingRole ,
                "points" : value.points ,
                "recent_appearance" : value.recentAppearance ,
                "recent_match" : value.recentMatch ,
//                "seriesPoints" : value.seriesPoints,
                "short_name" : value.shortName ,
                "team" : value.team ,
                "thumb_url" : value.thumbUrl ,
                "title" : value.title ,
//                "primary_team" : value.primaryTeam,
                "is_man_of_the_match" : 0
            ]
            result.append(dict)
        }
        
       return result
    }
    

}


//MARK: - UITableview Delegate and Datasourse
extension CreateTeamVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSelectedPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellSelectedTeam") as! CellSelectedTeam
        
        cell.lblPlayerName.text! = self.arrSelectedPlayers[indexPath.row].title
        cell.lblTeam.text! = self.arrSelectedPlayers[indexPath.row].team
        cell.imgTeam.sd_setImage(with: URL.init(string: self.arrSelectedPlayers[indexPath.row].logoUrl), completed: nil)
//        cell.imgTeam.setCustomImage(self.arrSelectedPlayers[indexPath.row].logoUrl)
        cell.cntrlCaptain.addTarget(self, action: #selector(tappedOnCaptain(_:)), for: .touchUpInside)
        cell.cntrlCaptain.tag = indexPath.row
        cell.cntrlViseCaptain.addTarget(self, action: #selector(tappedOnViseCaptain(_:)), for: .touchUpInside)
        cell.cntrlViseCaptain.tag = indexPath.row
        
        if self.arrCaptainSelection[indexPath.row].isTwoXValue! == true {
           
            cell.lblCaptain.text! = "2x"
            cell.lblCaptain.backgroundColor = AppTheme.mainColor
            cell.lblCaptain.textColor = UIColor.white
           
            self.arrCaptainSelection[indexPath.row].isTwoXValue! = true
            
            cell.lblViseCaptain.text! = "VC"
            cell.lblViseCaptain.backgroundColor = AppTheme.lightGreen
            cell.lblViseCaptain.textColor = UIColor.black
        } else if self.arrCaptainSelection[indexPath.row].isOneXValue! == true {
            
            cell.lblViseCaptain.text! = "1.5x"
            cell.lblViseCaptain.backgroundColor = AppTheme.mainColor
            cell.lblViseCaptain.textColor = UIColor.white
           
            self.arrCaptainSelection[indexPath.row].isOneXValue! = true
            
            cell.lblCaptain.text! = "C"
            cell.lblCaptain.backgroundColor = AppTheme.lightGreen
            cell.lblCaptain.textColor = UIColor.black
        } else {
            
            cell.lblCaptain.text! = "C"
            cell.lblCaptain.backgroundColor = AppTheme.lightGreen
            cell.lblCaptain.textColor = UIColor.black
        
            self.arrCaptainSelection[indexPath.row].isOneXValue! = false
            self.arrCaptainSelection[indexPath.row].isTwoXValue! = false
            
            cell.lblViseCaptain.text! = "VC"
            cell.lblViseCaptain.backgroundColor = AppTheme.lightGreen
            cell.lblViseCaptain.textColor = UIColor.black
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
struct AppTheme {
    static let mainColor = UIColor.init(red: 3.0/255.0, green: 141.0/255.0, blue: 14.0/255.0, alpha: 1.0) //green
    static let lightGreen = UIColor.init(red: 234.0/255.0, green: 244.0/255.0, blue: 234.0/255.0, alpha: 1.0)//
    static let darkLight =  UIColor.init(red: 168.0/255.0, green: 192.0/255.0, blue: 170.0/255.0, alpha: 1.0) //Text color
    static let selectedCellLight =  UIColor.init(red: 204.0/255.0, green: 255.0/255.0, blue: 214.0/255.0, alpha: 1.0) //Cell color
}
