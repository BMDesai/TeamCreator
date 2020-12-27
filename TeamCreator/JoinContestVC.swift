//
//  JoinContestVC.swift
//  Sportzax
//
//  Created by Bhaumik on 29/08/20.
//

import UIKit
import SDWebImage

class JoinContestVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var viewScrlBG : UIView!
    @IBOutlet weak var scrlMain : UIScrollView!
    
    @IBOutlet weak var lblMatchName : UILabel!
    @IBOutlet weak var lblMatchTime : UILabel!
    @IBOutlet weak var lblWK : UILabel!
    @IBOutlet weak var lblBAT : UILabel!
    @IBOutlet weak var lblAR : UILabel!
    @IBOutlet weak var lblBOWL : UILabel!
    
//    @IBOutlet weak var imgWK : UIImageView!
//    @IBOutlet weak var imgBAT : UIImageView!
//    @IBOutlet weak var imgAR : UIImageView!
//    @IBOutlet weak var imgBOWL : UIImageView!
    
    @IBOutlet weak var lblSelectedWKPlayer : UILabel!
    @IBOutlet weak var lblSelectedBATPlayer : UILabel!
    @IBOutlet weak var lblSelectedARPlayer : UILabel!
    @IBOutlet weak var lblSelectedBOWLPlayer : UILabel!
    
    @IBOutlet weak var lblTotalPlayers : UILabel!
    @IBOutlet weak var lblPlayers : UILabel!
    @IBOutlet weak var lblSelectedSection : UILabel!
    @IBOutlet weak var lblPlayersCredit : UILabel!
    @IBOutlet weak var lblCreditsLeft : UILabel!
    
    @IBOutlet weak var lblInfo : UILabel!
    @IBOutlet weak var lblPlayer : UILabel!
    @IBOutlet weak var lblPoints : UILabel!
    @IBOutlet weak var lblCredits : UILabel!
    
    @IBOutlet weak var cntrlWK : UIControl!
    @IBOutlet weak var cntrlBAT : UIControl!
    @IBOutlet weak var cntrlAR : UIControl!
    @IBOutlet weak var cntrlBOWL : UIControl!
    
    @IBOutlet weak var cntrlPreview : UIControl!
    @IBOutlet weak var cntrlNext : UIControl!
    @IBOutlet weak var lblPreview : UILabel!
    @IBOutlet weak var lblNext : UILabel!
    @IBOutlet weak var viewScrollStick : UIView!
    
    //Variable Declaration
    var matchStartTime = Timer()
    
    var tblWK = UITableView()
    var tblBAT = UITableView()
    var tblAR = UITableView()
    var tblBOWL = UITableView()
    
    var arrWK = [TeamData]()
    var arrBAT = [TeamData]()
    var arrAR = [TeamData]()
    var arrBOWL = [TeamData]()
    //Temparory store data
    var arrTempWK = [TeamData]()
    var arrTempBAT = [TeamData]()
    var arrTempAR = [TeamData]()
    var arrTempBOWL = [TeamData]()
    var tempArray : [TeamData]!
    var mainArray : [TeamData]!
    
    var arrSelectedPlayers = [TeamData]()
    var modelTeam : ModelTeam!
    
    var totalCredits : Double = 100.0
    
    //Variale for get value from other files
    var selectedMatcheData : MatcheData!
//    var selectedContestData : AllContest!
    var totalPlayer = Int()
    var isRemainingPlayer : Bool = false
    //mininum and maximun players range
    var minWK = 1
    var maxWK = 2
    var minBAT = 3
    var maxBAT = 5
    var minAR = 1
    var maxAR = 3
    var minBOWL = 3
    var maxBOWL = 5
    
    var teamA = ""
    var teamB = ""
    //
//    var editTeam : [Player]!
    var isFromEditTeam = false
    var isFromAddNewTeam = false
    var callBackTeamUpdate : ((String)->())?
    var editTeamID = ""
    var isLoaderHide = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialization
        initialization()
    }
         
    override func viewDidDisappear(_ animated: Bool) {
        //Invalidate timer
        self.matchStartTime.invalidate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
        //start Timer
        self.runCountdown()
    }
    
    //MARK: - Initialization
    func initialization() {
        //set title
//        if self.selectedContestData != nil {
//            self.title = self.selectedContestData.title!
//        } else {
            self.title = self.selectedMatcheData.title!
//        }
        //
        self.viewScrollStick.frame = CGRect(x: 0, y: (self.cntrlWK.frame.origin.y+self.cntrlWK.frame.size.height)-1, width: self.cntrlWK.frame.size.width, height: 2)
        //
        self.configureViewFromLocalisation()
        //
        self.teamA = self.selectedMatcheData.teama!.shortName!
        self.teamB = self.selectedMatcheData.teamb!.shortName!
        self.lblMatchName.text! = "\(teamA) VS \(teamB)".uppercased()
        
        //
        self.changeOnSelection()
        self.lblSelectedSection.text! = "Select WK"
//        self.imgWK.image = UIImage.init(named: "imgWkSelected")
        self.lblWK.textColor = UIColor.black
        //Set tableview frame
        let tabelviewVC = [self.tblWK, self.tblBAT, self.tblAR, self.tblBOWL]
        var idx:Int = 0
        for tableView in tabelviewVC {
            
            tableView.register(UINib(nibName: "CellTeam", bundle: nil), forCellReuseIdentifier: "CellTeam")
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            let originX:CGFloat = CGFloat(idx) * self.view.frame.size.width;
            tableView.frame = CGRect(x: originX, y: 0, width: self.view.frame.size.width, height: self.viewScrlBG.frame.size.height)
            tableView.isScrollEnabled = true
            tableView.bounces = false
            //Remove empty cell
            tableView.tableFooterView = UIView()
            tableView.tag = idx
            tableView.delegate = self
            tableView.dataSource = self
            tableView.separatorInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
            self.scrlMain.addSubview(tableView)
            idx += 1
            
        }
        //Set scrollview content size
        self.scrlMain.contentSize.width = self.view.frame.size.width*4
        
        //Api call
        self.getTeamList(showLoader: false)
    }
    
    //Localization
    func configureViewFromLocalisation() {
        self.lblCreditsLeft.text! =  "Credits Left"
        self.lblPlayers.text! =  "Players"
        self.lblInfo.text! =  "Info"
        self.lblPlayer.text! =  "Player"
        self.lblPoints.text! =  "Points"
        self.lblCredits.text! =  "Credits"
        self.lblPreview.text! =  "Preview"
        self.lblNext.text! =  "Next"
    }
    
    //Set match start timer
    func runCountdown() {
        self.matchStartTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getRemainTime), userInfo: nil, repeats: true)
    }
    //
    @objc func getRemainTime() {
        let matchTime = Double(self.selectedMatcheData.timestampStart!)
        let date = Date(timeIntervalSince1970: matchTime!)
        let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: date)
        self.lblMatchTime.text! = "\(difference.hour!)h \(difference.minute!)m \(difference.second!)s"
    }
    //change image and text color
    func changeOnSelection() {
        
//        self.imgWK.image = UIImage.init(named: "imgWkUnselected")
//        self.imgBAT.image = UIImage.init(named: "imgBatUnselected")
//        self.imgAR.image = UIImage.init(named: "imgAllUnselected")
//        self.imgBOWL.image = UIImage.init(named: "imgBowlerUnselected")
        
        self.lblWK.textColor = UIColor.black
        self.lblBAT.textColor = UIColor.black
        self.lblAR.textColor = UIColor.black
        self.lblBOWL.textColor = UIColor.black
        
    }
    
}

//MARK: - Action Events
extension JoinContestVC {
    @IBAction func tappedOnWk(_ sender: UIControl) {
        self.scrlMain.setContentOffset(CGPoint.init(x: 0, y: 0), animated: true)
    }
    
    @IBAction func tappedOnBAT(_ sender: UIControl) {
        self.scrlMain.setContentOffset(CGPoint.init(x: self.view.frame.size.width*1, y: 0), animated: true)
    }
    
    @IBAction func tappedOnAR(_ sender: UIControl) {
        self.scrlMain.setContentOffset(CGPoint.init(x: self.view.frame.size.width*2, y: 0), animated: true)
    }
    
    @IBAction func tappedOnBOWL(_ sender: UIControl) {
        self.scrlMain.setContentOffset(CGPoint.init(x: self.view.frame.size.width*3, y: 0), animated: true)
    }
    
    @IBAction func tappedOnPreview(_ sender: UIControl) {
        self.selectedPlayers()
        let viewVC = self.storyboard!.instantiateViewController(withIdentifier: "PreviewTeamVC") as! PreviewTeamVC
        viewVC.arrTeamData = self.arrSelectedPlayers
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        self.navigationController?.view.layer.add(transition, forKey: nil)
        self.navigationController?.pushViewController(viewVC, animated: false)
    }
    
    @IBAction func tappedOnNext(_ sender: UIControl) {
        self.selectedPlayers()
        let viewVC = self.storyboard!.instantiateViewController(withIdentifier: "ChooseLanguageVC") as! ChooseLanguageVC
        self.definesPresentationContext = true
        viewVC.arrSelectedPlayers = self.arrSelectedPlayers
        viewVC.modalPresentationStyle = .overFullScreen
        viewVC.callBack = { (value) -> Void in
            let viewVC = self.storyboard!.instantiateViewController(withIdentifier: "TeamListVC") as! TeamListVC
            viewVC.arrSelectedPlayers = value
            viewVC.teamA = self.teamA
            viewVC.teamB = self.teamB
            self.navigationController?.pushViewController(viewVC, animated: true)
        }
        self.present(viewVC, animated: true, completion: nil)

    }
    
    func selectedPlayers() {
        self.arrSelectedPlayers.removeAll()
        let _ = self.arrTempWK.map {
            self.arrSelectedPlayers.append($0)
        }
        let _ = self.arrTempBAT.map {
            self.arrSelectedPlayers.append($0)
        }
        let _ = self.arrTempAR.map {
            self.arrSelectedPlayers.append($0)
        }
        let _ = self.arrTempBOWL.map {
            self.arrSelectedPlayers.append($0)
        }
    }
}

//MARK: - API Call
extension JoinContestVC {
    
    func getTeamList(showLoader:Bool) {
        
        var param = [String:Any]()
        
        param = ["teamId": "\(0)", "matchId":"\(self.selectedMatcheData.matchId!)"]
        
        var request = URLRequest(url: URL(string: "https://www.rockingbravo.com/api/v1/contests/getTeam")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
        
        request.addValue(UserDefaults.standard.value(forKey: "token") as! String, forHTTPHeaderField: "x-auth-token")
        request.addValue("SXySeLCCtp5rNCPX7Z8T9nkj96CvDfFmEjBRpz5L", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
           // print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
              //  print(json)
                do{
                    self.modelTeam = try JSONDecoder().decode(ModelTeam.self, from: data!)
                    
                    self.arrWK = self.modelTeam.teamData.filter { $0.playingRole.lowercased() == "wk" }.sorted(by: { (value, value1) -> Bool in
                        value.fantasyPlayerRating > value1.fantasyPlayerRating
                    })
                    
                    self.arrBAT = self.modelTeam.teamData.filter { $0.playingRole.lowercased() == "bat" }.sorted(by: { (value, value1) -> Bool in
                        value.fantasyPlayerRating > value1.fantasyPlayerRating
                    })
                    
                    self.arrAR = self.modelTeam.teamData.filter { $0.playingRole.lowercased() == "all" }.sorted(by: { (value, value1) -> Bool in
                        value.fantasyPlayerRating > value1.fantasyPlayerRating
                    })
                    
                    self.arrBOWL = self.modelTeam.teamData.filter { $0.playingRole.lowercased() == "bowl" }.sorted(by: { (value, value1) -> Bool in
                        value.fantasyPlayerRating > value1.fantasyPlayerRating
                    })
                    

                } catch {
                    print(error)
                }
                
                DispatchQueue.main.async {
                    self.tblWK.reloadData()
                    self.tblBAT.reloadData()
                    self.tblAR.reloadData()
                    self.tblBOWL.reloadData()
                }

            } catch {
                print("error")
            }
        })

        task.resume()
        
    }
}

//MARK: - UIScrollView Delegate Methods
extension JoinContestVC : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrlMain {
            let width = scrollView.frame.width
            let page = Int(round(scrollView.contentOffset.x/width))
            if page == 0 {
                self.lblSelectedSection.text! = "Select WK"
                self.changeOnSelection()
//                self.imgWK.image = UIImage.init(named: "imgWkSelected")
                self.lblWK.textColor = UIColor.green
            } else if page == 1 {
                self.lblSelectedSection.text! = "Select BAT"
                self.changeOnSelection()
//                self.imgBAT.image = UIImage.init(named: "imgBatSelected")
                self.lblBAT.textColor = UIColor.green
            } else if page == 2 {
                self.lblSelectedSection.text! = "Select AR"
                self.changeOnSelection()
//                self.imgAR.image = UIImage.init(named: "imgAllSelected")
                self.lblAR.textColor = UIColor.green
            } else if page == 3 {
                self.lblSelectedSection.text! = "Select BOWL"
                self.changeOnSelection()
//                self.imgBOWL.image = UIImage.init(named: "imgBowlerSlected")
                self.lblBOWL.textColor = UIColor.green
            }
            
            self.viewScrollStick.frame = CGRect(x: (scrollView.contentOffset.x/4), y: (self.cntrlWK.frame.origin.y+self.cntrlWK.frame.size.height)-1, width: self.cntrlWK.frame.size.width, height: 2)
        }
    }
}

//MARK: - UITableview Delegate and Datasourse
extension JoinContestVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblWK {
            return self.arrWK.count > 0 ? self.arrWK.count :  isLoaderHide == false ? 0 : 0
        }
        if tableView == self.tblBAT {
            return self.arrBAT.count > 0 ? self.arrBAT.count :  isLoaderHide == false ? 0 : 0
        }
        if tableView == self.tblAR {
            return self.arrAR.count > 0 ? self.arrAR.count :  isLoaderHide == false ? 0 : 0
        }
        if tableView == self.tblBOWL {
            return self.arrBOWL.count > 0 ? self.arrBOWL.count : isLoaderHide == false ? 0 : 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTeam") as! CellTeam
//        cell.cntrlPlayerStatus.addTarget(self, action: #selector(playerStatus(_:)), for: .touchUpInside)
        cell.cntrlPlayerStatus.tag = indexPath.row
        if tableView == self.tblWK && self.arrWK.count > 0 {
            self.setCellData(dictData: self.arrWK[indexPath.row], cell: cell, tempArrayCount: self.arrTempWK.count, maxPlayer: maxWK)
        }
        if tableView == self.tblBAT && self.arrBAT.count > 0 {
            self.setCellData(dictData: self.arrBAT[indexPath.row], cell: cell, tempArrayCount: self.arrTempBAT.count, maxPlayer: maxBAT)
        }
        if tableView == self.tblAR && self.arrAR.count > 0 {
            self.setCellData(dictData: self.arrAR[indexPath.row], cell: cell, tempArrayCount: self.arrTempAR.count, maxPlayer: maxAR)
        }
        if tableView == self.tblBOWL && self.arrBOWL.count > 0 {
            self.setCellData(dictData: self.arrBOWL[indexPath.row], cell: cell, tempArrayCount: self.arrTempBOWL.count, maxPlayer: maxBOWL)
        }
        
        return cell
    }
    
//    @objc func playerStatus(_ sender: UIControl) {
//        let viewVC = storyBoards.Main.instantiateViewController(withIdentifier: "PlayerInfoVC") as! PlayerInfoVC
//        var playerId = ""
//        var playerName = ""
//        if self.lblSelectedSection.text! == "Select WK" {
//            let arr = self.arrWK.filter { $0.pid == self.arrWK[sender.tag].pid }
//            playerId = "\(arr[0].pid)"
//            playerName = "\(arr[0].title)"
//        }
//        if self.lblSelectedSection.text! == "Select BAT" {
//            let arr = self.arrBAT.filter { $0.pid == self.arrBAT[sender.tag].pid }
//            playerId = "\(arr[0].pid)"
//            playerName = "\(arr[0].title)"
//        }
//        if self.lblSelectedSection.text! == "Select AR" {
//            let arr = self.arrAR.filter { $0.pid == self.arrAR[sender.tag].pid }
//            playerId = "\(arr[0].pid)"
//            playerName = "\(arr[0].title)"
//        }
//        if self.lblSelectedSection.text! == "Select BOWL" {
//            let arr = self.arrBOWL.filter { $0.pid == self.arrBOWL[sender.tag].pid }
//            playerId = "\(arr[0].pid)"
//            playerName = "\(arr[0].title)"
//        }
//        viewVC.playerId = "\(playerId)"
//        viewVC.playerName = "\(playerName)"
//        self.navigationController?.pushViewController(viewVC, animated: true)
//    }
    
    func setCellData(dictData:TeamData!, cell: CellTeam, tempArrayCount: Int, maxPlayer: Int) {
        cell.lblPlayerName.text! = dictData.title
        cell.lblTeam.text! = dictData.team
        cell.lblPoints.text! = "\(dictData.seriesPoints) pts"
        cell.lblCredits.text! = "\(dictData.fantasyPlayerRating) pts"
        cell.imgTeam.sd_setImage(with:URL.init(string:  dictData.logoUrl), completed: nil)
//        cell.imgTeam.setCustomImage(dictData.logoUrl)
        cell.lblAnnounced.text! = dictData.isAnnounce ? "● Announced" : ""
        
        if self.isRemainingPlayer == true {
            if dictData.fantasyPlayerRating <= self.totalCredits {
                cell.cntrlDisable.isHidden = true
                cell.viewBG.backgroundColor = UIColor.white
                cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
            } else {
                cell.cntrlDisable.isHidden = false
                cell.viewBG.backgroundColor = UIColor.white
                cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
            }
            if dictData.isSelected == true {
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                cell.cntrlDisable.isHidden = true
            }
            
        } else {
            if dictData.isSelected == true {
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                cell.cntrlDisable.isHidden = true
            } else {
                if tempArrayCount < maxPlayer {
                    cell.viewBG.backgroundColor = UIColor.white
                    cell.cntrlDisable.isHidden = true
                    cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                } else {
                    cell.cntrlDisable.isHidden = false
                    cell.viewBG.backgroundColor = UIColor.white
                    cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.viewWillLayoutSubviews()
        self.view.layoutIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! CellTeam
        
        if tableView == self.tblWK {
            if self.arrTempWK.count >= 0 && self.arrTempWK.count <= maxWK && self.arrWK[indexPath.row].isSelected == false{
                
                self.arrWK[indexPath.row].isSelected = true
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                self.arrTempWK.append(self.arrWK[indexPath.row])
                
                var min_wk_count = Int()
                if (self.arrTempWK.count == 0) {
                    min_wk_count = 1
                } else {
                    min_wk_count = self.arrTempWK.count
                }
                var min_all_count = Int()
                if (self.arrTempAR.count == 0)
                {
                    min_all_count = 1
                } else {
                    min_all_count = self.arrTempAR.count
                }
                
                var min_bat_count = Int()
                if (self.arrTempBAT.count == 0)
                {
                    min_bat_count = 3
                } else {
                    if self.arrTempBAT.count <= 3 {
                        min_bat_count = 3
                    } else {
                        min_bat_count = self.arrTempBAT.count
                    }
                }
                var min_bowl_count = Int()
                if (self.arrTempBOWL.count == 0)
                {
                    min_bowl_count = 3
                } else {
                    if self.arrTempBOWL.count <= 3 {
                        min_bowl_count = 3
                    } else {
                        min_bowl_count = self.arrTempBOWL.count
                    }
                }
                
                let countWK = 11 - min_all_count - min_bowl_count - min_bat_count
                
               
                if (countWK < self.arrTempWK.count) {
                    if let index = self.arrTempWK.firstIndex( where: { $0.pid == self.arrWK[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                       // self.totalCredits = self.totalCredits-Double(self.arrWK[indexPath.row].fantasyPlayerRating!)
                        
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrWK[indexPath.row].isSelected = false
                        self.arrTempWK.remove(at: index)
                    }
                    
                    self.showToastMSG(message: "Sorry! you cannot select more than \(self.arrTempWK.count) wicket-keepers")
                    tblWK.reloadData()
                    return
                } else if self.arrTempWK.count > maxWK {
                    if let index = self.arrTempWK.firstIndex( where: { $0.pid == self.arrWK[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrWK[indexPath.row].isSelected = false
                        self.arrTempWK.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxWK) wicket-keepers")
                    tblWK.reloadData()
                    return
                }
                
               let a = self.arrTempWK.filter{ $0.team.lowercased() == self.teamA.lowercased() }
               let b = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamA.lowercased() }
               let c = self.arrTempAR.filter{ $0.team.lowercased() == self.teamA.lowercased() }
               let d = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamA.lowercased() }
               
               let w = self.arrTempWK.filter{ $0.team.lowercased() == self.teamB.lowercased() }
               let x = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamB.lowercased() }
               let y = self.arrTempAR.filter{ $0.team.lowercased() == self.teamB.lowercased() }
               let z = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamB.lowercased() }
               
               if a.count+b.count+c.count+d.count > 7 || w.count+x.count+y.count+z.count > 7 {
                    if let index = self.arrTempWK.firstIndex( where: { $0.pid == self.arrWK[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrWK[indexPath.row].isSelected = false
                        self.arrTempWK.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than 7 players from single team")
                    tblWK.reloadData()
                    return
                }
                
                if self.totalPlayer == 10 {

                    if Double(self.arrWK[indexPath.row].fantasyPlayerRating) <= self.totalCredits
                    {
                        self.isRemainingPlayer = false
                    } else {
                        
                        self.isRemainingPlayer = true
                        if let index = self.arrTempWK.firstIndex( where: { $0.pid == self.arrWK[indexPath.row].pid // Will found index of matched id
                        }){
                            cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                            self.arrWK[indexPath.row].isSelected = false
                            self.arrTempWK.remove(at: index)
                        }
                        tblWK.reloadData()
                        return
                    }
                }
                if self.totalPlayer == 11 {
                    return
                }
                
                if self.arrTempWK.count == maxWK {
                    for row in 0..<tableView.numberOfRows(inSection: 0) {
                        if self.arrWK[row].isSelected == true {
                            self.arrWK[row].isSelected = true
                        } else {
                            self.arrWK[row].isSelected = false
                            
                        }
                    }
                    self.tblWK.reloadData()
                }
                
                self.totalCredits = self.totalCredits-Double(self.arrWK[indexPath.row].fantasyPlayerRating)
                
            } else {
                if self.arrTempWK.count <= maxWK && self.arrWK[indexPath.row].isSelected == true {
                    if let index = self.arrTempWK.firstIndex( where: { $0.pid == self.arrWK[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        self.totalCredits = Double(self.arrWK[indexPath.row].fantasyPlayerRating) + self.totalCredits
                        
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrWK[indexPath.row].isSelected = false
                        self.arrTempWK.remove(at: index)
                        for row in 0..<tableView.numberOfRows(inSection: 0) {
                            if self.arrWK[row].isSelected == true {
                                self.arrWK[row].isSelected = true
                                
                            } else {
                                self.arrWK[row].isSelected = false
                                
                            }
                        }
                        self.tblWK.reloadData()
                    }
                }
                if self.arrTempWK.count == maxWK && self.arrWK[indexPath.row].isSelected == false {
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxWK) wicket-keepers")
                }
            }
            self.lblSelectedWKPlayer.text! = "\(self.arrTempWK.count)"
        }
        if tableView == self.tblBAT {
            if self.arrTempBAT.count >= 0 && self.arrTempBAT.count <= maxBAT && self.arrBAT[indexPath.row].isSelected == false{
                
                self.arrBAT[indexPath.row].isSelected = true
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                self.arrTempBAT.append(self.arrBAT[indexPath.row])
                
                var min_wk_count = Int()
                if (self.arrTempWK.count == 0) {
                    min_wk_count = 1
                } else {
                    min_wk_count = self.arrTempWK.count
                }
                var min_all_count = Int()
                if (self.arrTempAR.count == 0)
                {
                    min_all_count = 1
                } else {
                    min_all_count = self.arrTempAR.count
                }
                
                var min_bat_count = Int()
                if (self.arrTempBAT.count == 0)
                {
                    min_bat_count = 3
                } else {
                    if self.arrTempBAT.count <= 3 {
                        min_bat_count = 3
                    } else {
                        min_bat_count = self.arrTempBAT.count
                    }
                }
                var min_bowl_count = Int()
                if (self.arrTempBOWL.count == 0)
                {
                    min_bowl_count = 3
                } else {
                    if self.arrTempBOWL.count <= 3 {
                        min_bowl_count = 3
                    } else {
                        min_bowl_count = self.arrTempBOWL.count
                    }
                }
                
                let countBAT = 11 - min_wk_count - min_bowl_count - min_all_count
                
               
                if (countBAT < self.arrTempBAT.count) {
                     if let index = self.arrTempBAT.firstIndex( where: { $0.pid == self.arrBAT[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBAT[indexPath.row].isSelected = false
                        self.arrTempBAT.remove(at: index)
                    }
                    
                    self.showToastMSG(message: "Sorry! you cannot select more than \(self.arrTempBAT.count) batsmen")
                    tblBAT.reloadData()
                    return
                } else if self.arrTempBAT.count > maxBAT {
                    if let index = self.arrTempBAT.firstIndex( where: { $0.pid == self.arrBAT[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBAT[indexPath.row].isSelected = false
                        self.arrTempBAT.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxBAT) batsmen")
                    tblBAT.reloadData()
                   
                    return
                }
                
                let a = self.arrTempWK.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let b = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let c = self.arrTempAR.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let d = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                
                let w = self.arrTempWK.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let x = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let y = self.arrTempAR.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let z = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                
                if a.count+b.count+c.count+d.count > 7 || w.count+x.count+y.count+z.count > 7 {
                    if let index = self.arrTempBAT.firstIndex( where: { $0.pid == self.arrBAT[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBAT[indexPath.row].isSelected = false
                        self.arrTempBAT.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than 7 players from single team")
                    tblBAT.reloadData()
                    return
                }
                
                if self.totalPlayer == 10 {
                    
                    if    Double(self.arrBAT[indexPath.row].fantasyPlayerRating) <= self.totalCredits
                    {
                        
                        self.isRemainingPlayer = false
                    } else {
                        
                        self.isRemainingPlayer = true
                        if let index = self.arrTempBAT.firstIndex( where: { $0.pid == self.arrBAT[indexPath.row].pid // Will found index of matched id
                        }){
                            cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                            self.arrBAT[indexPath.row].isSelected = false
                            self.arrTempBAT.remove(at: index)
                        }
                        tblBAT.reloadData()
                        return
                    }
                }
                if self.totalPlayer == 11 {
                    return
                }
                
                if self.arrTempBAT.count == maxBAT {
                    for row in 0..<tableView.numberOfRows(inSection: 0) {
                        if self.arrBAT[row].isSelected == true {
                            self.arrBAT[row].isSelected = true
                            
                        } else {
                            self.arrBAT[row].isSelected = false
                            
                        }
                    }
                    self.tblBAT.reloadData()
                }
                
                self.totalCredits = self.totalCredits-Double(self.arrBAT[indexPath.row].fantasyPlayerRating)
            } else {
                if self.arrTempBAT.count <= maxBAT && self.arrBAT[indexPath.row].isSelected == true {
                    if let index = self.arrTempBAT.firstIndex( where: { $0.pid == self.arrBAT[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        self.totalCredits = Double(self.arrBAT[indexPath.row].fantasyPlayerRating) + self.totalCredits
                        
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBAT[indexPath.row].isSelected = false
                        self.arrTempBAT.remove(at: index)
                        for row in 0..<tableView.numberOfRows(inSection: 0) {
                            if self.arrBAT[row].isSelected == true {
                                self.arrBAT[row].isSelected = true
                                
                            } else {
                                self.arrBAT[row].isSelected = false
                                
                            }
                        }
                        self.tblBAT.reloadData()
                    }
                }
                if self.arrTempBAT.count == maxBAT && self.arrBAT[indexPath.row].isSelected == false {
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxBAT) batsmen")
                }
            }
            self.lblSelectedBATPlayer.text! = "\(self.arrTempBAT.count)"
        }
        if tableView == self.tblAR {
            if self.arrTempAR.count >= 0 && self.arrTempAR.count <= maxAR && self.arrAR[indexPath.row].isSelected == false{
                
                self.arrAR[indexPath.row].isSelected = true
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                self.arrTempAR.append(self.arrAR[indexPath.row])
                
                var min_wk_count = Int()
                if (self.arrTempWK.count == 0) {
                    min_wk_count = 1
                } else {
                    min_wk_count = self.arrTempWK.count
                }
                var min_all_count = Int()
                if (self.arrTempAR.count == 0)
                {
                    min_all_count = 1
                } else {
                    min_all_count = self.arrTempAR.count
                }
                
                var min_bat_count = Int()
                if (self.arrTempBAT.count == 0)
                {
                    min_bat_count = 3
                } else {
                    if self.arrTempBAT.count <= 3 {
                        min_bat_count = 3
                    } else {
                        min_bat_count = self.arrTempBAT.count
                    }
                }
                
                var min_bowl_count = Int()
                if (self.arrTempBOWL.count == 0)
                {
                    min_bowl_count = 3
                } else {
                    if self.arrTempBOWL.count <= 3 {
                        min_bowl_count = 3
                    } else {
                        min_bowl_count = self.arrTempBOWL.count
                    }
                }
                let countAR = 11 - min_wk_count - min_bowl_count - min_bat_count
                
                
                if (countAR < self.arrTempAR.count) {
                    if let index = self.arrTempAR.firstIndex( where: { $0.pid == self.arrAR[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrAR[indexPath.row].isSelected = false
                        self.arrTempAR.remove(at: index)
                    }
                    
                    self.showToastMSG(message: "Sorry! you cannot select more than \(self.arrTempAR.count) allrounders")
                    tblAR.reloadData()
                    return
                } else if self.arrTempAR.count > maxAR {
                    if let index = self.arrTempAR.firstIndex( where: { $0.pid == self.arrAR[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrAR[indexPath.row].isSelected = false
                        self.arrTempAR.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxAR) allrounders")
                    tblAR.reloadData()
                    
                    return
                }
                
                let a = self.arrTempWK.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let b = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let c = self.arrTempAR.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let d = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                
                let w = self.arrTempWK.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let x = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let y = self.arrTempAR.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let z = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                
                if a.count+b.count+c.count+d.count > 7 || w.count+x.count+y.count+z.count > 7 {
                    if let index = self.arrTempAR.firstIndex( where: { $0.pid == self.arrAR[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrAR[indexPath.row].isSelected = false
                        self.arrTempAR.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than 7 players from single team")
                    tblAR.reloadData()
                    return
                }
                
                if self.totalPlayer == 10 {

                    if Double(self.arrAR[indexPath.row].fantasyPlayerRating) <= self.totalCredits
                    {
                        
                        self.isRemainingPlayer = false
                    } else {
                        
                        self.isRemainingPlayer = true
                        if let index = self.arrTempAR.firstIndex( where: { $0.pid == self.arrAR[indexPath.row].pid // Will found index of matched id
                        }){
                            cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                            self.arrAR[indexPath.row].isSelected = false
                            self.arrTempAR.remove(at: index)
                        }
                        tblAR.reloadData()
                        return
                    }
                }
                if self.totalPlayer == 11 {
                    return
                }
                
                if self.arrTempAR.count == maxAR {
                    for row in 0..<tableView.numberOfRows(inSection: 0) {
                        if self.arrAR[row].isSelected == true {
                            self.arrAR[row].isSelected = true
                            
                        } else {
                            self.arrAR[row].isSelected = false
                            
                        }
                    }
                    self.tblAR.reloadData()
                }
                
                self.totalCredits = self.totalCredits-Double(self.arrAR[indexPath.row].fantasyPlayerRating)
                
            } else {
                if self.arrTempAR.count <= maxAR && self.arrAR[indexPath.row].isSelected == true {
                    if let index = self.arrTempAR.firstIndex( where: { $0.pid == self.arrAR[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        self.totalCredits = Double(self.arrAR[indexPath.row].fantasyPlayerRating) + self.totalCredits
                        
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrAR[indexPath.row].isSelected = false
                        self.arrTempAR.remove(at: index)
                        for row in 0..<tableView.numberOfRows(inSection: 0) {
                            if self.arrAR[row].isSelected == true {
                                self.arrAR[row].isSelected = true
                                
                            } else {
                                self.arrAR[row].isSelected = false
                                
                            }
                        }
                        self.tblAR.reloadData()
                    }
                }
                if self.arrTempAR.count == maxAR && self.arrAR[indexPath.row].isSelected == false {
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxAR) allrounders")
                }
            }
            self.lblSelectedARPlayer.text! = "\(self.arrTempAR.count)"
        }
        if tableView == self.tblBOWL {
            if self.arrTempBOWL.count >= 0 && self.arrTempBOWL.count <= maxBOWL && self.arrBOWL[indexPath.row].isSelected == false{
                
                self.arrBOWL[indexPath.row].isSelected = true
                cell.imgSelect.image = UIImage(named:"imgPlayerSelected")
                cell.viewBG.backgroundColor = UIColor.green
                self.arrTempBOWL.append(self.arrBOWL[indexPath.row])
                
                var min_wk_count = Int()
                if (self.arrTempWK.count == 0) {
                    min_wk_count = 1
                } else {
                    min_wk_count = self.arrTempWK.count
                }
                var min_all_count = Int()
                if (self.arrTempAR.count == 0)
                {
                    min_all_count = 1
                } else {
                    min_all_count = self.arrTempAR.count
                }
                
                var min_bat_count = Int()
                if (self.arrTempBAT.count == 0)
                {
                    min_bat_count = 3
                } else {
                    if self.arrTempBAT.count <= 3 {
                        min_bat_count = 3
                    } else {
                        min_bat_count = self.arrTempBAT.count
                    }
                }
                var min_bowl_count = Int()
                if (self.arrTempBOWL.count == 0)
                {
                    min_bowl_count = 3
                } else {
                    if self.arrTempBOWL.count <= 3 {
                        min_bowl_count = 3
                    } else {
                        min_bowl_count = self.arrTempBOWL.count
                    }
                }
                
                let countBOWL = 11 - min_wk_count - min_bat_count - min_all_count
                
                
                if (countBOWL < self.arrTempBOWL.count) {
                    if let index = self.arrTempBOWL.firstIndex( where: { $0.pid == self.arrBOWL[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBOWL[indexPath.row].isSelected = false
                        self.arrTempBOWL.remove(at: index)
                    }
                    
                    self.showToastMSG(message: "Sorry! you cannot select more than \(self.arrTempBOWL.count) bowlers")
                    tblBOWL.reloadData()
                    return
                } else if self.arrTempBOWL.count > maxBOWL {
                    if let index = self.arrTempBOWL.firstIndex( where: { $0.pid == self.arrBOWL[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBOWL[indexPath.row].isSelected = false
                        self.arrTempBOWL.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxBOWL) bowlers")
                    tblBOWL.reloadData()
                    
                    return
                }
                
                let a = self.arrTempWK.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let b = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let c = self.arrTempAR.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                let d = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamA.lowercased() }
                
                let w = self.arrTempWK.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let x = self.arrTempBAT.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let y = self.arrTempAR.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                let z = self.arrTempBOWL.filter{ $0.team.lowercased() == self.teamB.lowercased() }
                
                if a.count+b.count+c.count+d.count > 7 || w.count+x.count+y.count+z.count > 7 {
                    if let index = self.arrTempBOWL.firstIndex( where: { $0.pid == self.arrBOWL[indexPath.row].pid // Will found index of matched id
                    }){
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBOWL[indexPath.row].isSelected = false
                        self.arrTempBOWL.remove(at: index)
                    }
                    self.showToastMSG(message: "Sorry! you cannot select more than 7 players from single team")
                    tblBOWL.reloadData()
                    return
                }
                
                if self.totalPlayer == 10 {

                    if Double(self.arrBOWL[indexPath.row].fantasyPlayerRating) <= self.totalCredits
                    {
                        
                        self.isRemainingPlayer = false
                    } else {
                        
                        self.isRemainingPlayer = true
                        if let index = self.arrTempBOWL.firstIndex( where: { $0.pid == self.arrBOWL[indexPath.row].pid // Will found index of matched id
                        }){
                            cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                            self.arrBOWL[indexPath.row].isSelected = false
                            self.arrTempBOWL.remove(at: index)
                        }
                        tblBOWL.reloadData()
                        return
                    }
                }
                if self.totalPlayer == 11 {
                    return
                }
                
                if self.arrTempBOWL.count == maxBOWL {
                    for row in 0..<tableView.numberOfRows(inSection: 0) {
                        if self.arrBOWL[row].isSelected == true {
                            self.arrBOWL[row].isSelected = true
                            
                        } else {
                            self.arrBOWL[row].isSelected = false
                            
                        }
                    }
                    self.tblBOWL.reloadData()
                }
                
                self.totalCredits = self.totalCredits-Double(self.arrBOWL[indexPath.row].fantasyPlayerRating)
                
            } else {
                if self.arrTempBOWL.count <= maxBOWL && self.arrBOWL[indexPath.row].isSelected == true {
                    if let index = self.arrTempBOWL.firstIndex( where: { $0.pid == self.arrBOWL[indexPath.row].pid // Will found index of matched id
                    }){
                        self.isRemainingPlayer = false
                        self.totalCredits = Double(self.arrBOWL[indexPath.row].fantasyPlayerRating) + self.totalCredits
                        
                        cell.imgSelect.image = UIImage(named:"imgPlayerUnselected")
                        self.arrBOWL[indexPath.row].isSelected = false
                        self.arrTempBOWL.remove(at: index)
                        for row in 0..<tableView.numberOfRows(inSection: 0) {
                            if self.arrBOWL[row].isSelected == true {
                                self.arrBOWL[row].isSelected = true
                                
                            } else {
                                self.arrBOWL[row].isSelected = false
                                
                            }
                        }
                        self.tblBOWL.reloadData()
                    }
                }
                if self.arrTempBOWL.count == maxBOWL && self.arrBOWL[indexPath.row].isSelected == false {
                    self.showToastMSG(message: "Sorry! you cannot select more than \(maxBOWL) bowlers")
                }
            }
            self.lblSelectedBOWLPlayer.text! = "\(self.arrTempBOWL.count)"
        }
        self.totalPlayer = self.arrTempWK.count + self.arrTempBAT.count + self.arrTempAR.count + self.arrTempBOWL.count

        
        self.lblPlayersCredit.text! = "\(totalCredits)/100"
        self.lblTotalPlayers.text! = "\(self.totalPlayer)/11"

        self.enableButton()
    }

    func showToastMSG(message: String) {
//        self.view.makeToast(message)
    }
    
    func enableButton() {
        if self.totalPlayer == 11 {
            self.cntrlNext.backgroundColor = UIColor.black
            self.cntrlNext.isUserInteractionEnabled = true
            self.lblNext.textColor = UIColor.white
        } else {
            self.cntrlNext.backgroundColor = UIColor.lightGray
            self.cntrlNext.isUserInteractionEnabled = false
            self.lblNext.textColor = UIColor.darkGray
        }
    }
}
