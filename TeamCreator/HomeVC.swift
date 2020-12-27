//
//  HomeVC.swift
//  Sportzax
//
//  Created by Bhaumik on 21/08/20.
//

import UIKit
import SDWebImage

class CellUpcomingMatch: UITableViewCell {

    @IBOutlet weak var lblMatchName : UILabel!
    @IBOutlet weak var lblMatchTime : UILabel!
    @IBOutlet weak var lblTeamA : UILabel!
    @IBOutlet weak var lblTeamB : UILabel!
    @IBOutlet weak var imgTeamA : UIImageView!
    @IBOutlet weak var imgTeamB : UIImageView!
    
    
}

class HomeVC: UIViewController {

    //Outlets
    @IBOutlet weak var tblUpcomingMatche : UITableView!
    
    //variables
    var modelMatches : ModelUpcomingMatches!
    var pullControl = UIRefreshControl()
    var isLoaderHide = false
    var timer = Timer()
    
    //
    var token = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialization
        self.initialization()
    }
        
    //MARK: - Initialization
    func initialization() {
        //Register nib cell
//        self.tblUpcomingMatche.register(UINib(nibName: "CellUpcomingMatch", bundle: nil), forCellReuseIdentifier: "CellUpcomingMatch")
        //Remove empty cell
        self.tblUpcomingMatche.tableFooterView = UIView()
        pullControl.addTarget(self, action: #selector(refreshListData(_:)), for: .valueChanged)
        if #available(iOS 10.0, *) {
            self.tblUpcomingMatche.refreshControl = pullControl
        } else {
            self.tblUpcomingMatche.addSubview(pullControl)
        }
        
        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect(style: .prominent)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            tblUpcomingMatche.backgroundView = blurEffectView

        } else {
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            tblUpcomingMatche.backgroundView = blurEffectView

        }
        self.socialLogin()
        
    }
           
    //Localization
    func configureViewFromLocalisation() {
       
        self.navigationItem.title = "Upcoming Match"
    }
    

    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        self.configureViewFromLocalisation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.timer.invalidate()
    }
    
    @objc private func refreshListData(_ sender: Any) {
        //API call
        self.getMatcheList(showLoader: false)
        self.pullControl.endRefreshing()
    }
    
}

//MARK: - UITableView Delegate and Datasource
extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.modelMatches != nil {
            return self.modelMatches.matcheData!.count
        }
        return isLoaderHide == false ? 0 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellUpcomingMatch") as! CellUpcomingMatch
        
        if self.modelMatches != nil {
            
            let data = self.modelMatches.matcheData![indexPath.row]
            cell.lblMatchName.text! = data.competition!.title!
            cell.lblTeamA.text! = data.teama!.shortName!
            cell.lblTeamB.text! = data.teamb!.shortName!
            
//            cell.imgTeamA.setCustomImage(data.teama!.logoUrl!)
//            cell.imgTeamB.setCustomImage(data.teamb!.logoUrl!)
            cell.imgTeamA.sd_setImage(with: URL.init(string: data.teama!.logoUrl!), completed: nil)
            cell.imgTeamB.sd_setImage(with: URL.init(string: data.teamb!.logoUrl!), completed: nil)
//            let matchTime = Double(data.timestampStart!)
//            cell.expiryTimeInterval = matchTime
            //Set Match Countdown
            self.runCountdown()
        }
        
        return cell

    }
    
    //Set match start timer
    func runCountdown() {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(getRemainTime), userInfo: nil, repeats: true)
        RunLoop.current.add(self.timer, forMode: .common)
    }
    
    @objc func getRemainTime() {
        
        let indexPathsArray = tblUpcomingMatche.indexPathsForVisibleRows
        for indexPath in indexPathsArray! {
            let cell = tblUpcomingMatche.cellForRow(at: indexPath) as! CellUpcomingMatch
            let data = self.modelMatches.matcheData![indexPath.row]
            let matchTime = Double(data.timestampStart!)
            let date = Date(timeIntervalSince1970: matchTime!)
            let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: date)
            //cell.lblMatchTime.text = "\(difference.hour!)h \(difference.minute!)m \(difference.second!)s"
            if difference.hour! < 0 || difference.minute! < 0 || difference.second! < 0 {
                let dateFormater : DateFormatter = DateFormatter()
                dateFormater.dateFormat = "hh:mm a, dd MMM"
                cell.lblMatchTime.text = dateFormater.string(from: date)
            } else {
                cell.lblMatchTime.text = "\(difference.hour!)h \(difference.minute!)m \(difference.second!)s"
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            
        let allContestVC = self.storyboard!.instantiateViewController(withIdentifier: "JoinContestVC") as! JoinContestVC
            allContestVC.selectedMatcheData = self.modelMatches.matcheData![indexPath.row]
            self.navigationController?.pushViewController(allContestVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}

//MARK: - API Call
extension HomeVC {
    func socialLogin() {
        
        var param = [String:Any]()
        
        param =
            //                [
            //                    "email": "\(userDict.email!)",
            //                    "fullName": "\(userDict.fullName!)",
            //                    "phone": "",
            //                    "securityPin": "",
            //                    "socialID": "\(userDict.socialID!)",
            //                    "loginVia" : "\(userDict.type!)",
            //                    "profile_pic" : "\(userDict.profilePic!)",
            //                    "dateOfBirth" : "",
            //                    "referBy": "",
            //                    "fcmToken" : "\(fcmToken)"
            //            ]
            [
                "email": "bboom9119@gmail.com",
                "fullName": "Bhaumik Desai",
                "phone": "",
                "securityPin": "",
                "socialID": "114943768645007290818",
                "loginVia" : "google",
                "profile_pic" : "",
                "dateOfBirth" : "",
                "referBy":""
        ]
        //        [
        //            "email": "akhileshmehta1212@gmail.com",
        //            "fullName": "Akhilesh Mehta",
        //            "phone": "",
        //            "securityPin": "",
        //            "socialID": "111155798821450243239",
        //            "loginVia" : "google",
        //            "profile_pic" : "",
        //            "dateOfBirth" : "",
        //            "referBy":"",
        //            "fcmToken": ""
        //        ]
        
        
        var request = URLRequest(url: URL(string: "https://www.rockingbravo.com/api/v1/account/socialLoginFromIOS")!)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: param, options: [])
//        request.addValue("x-auth-token", forHTTPHeaderField: self.token)
        request.addValue("SXySeLCCtp5rNCPX7Z8T9nkj96CvDfFmEjBRpz5L", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            
            do {
                let dict = try JSONSerialization.jsonObject(with: data!) as! [String:Any]
                print(dict)
                    
//                    let dict = json as! [String:Any]
                    let status = dict["status"] as! Bool
                    
                    if  status  {
                        
                        let data = dict["data"] as! [String:Any]
                        //                        let isExisting = getBoolFromDictionary(dictionary: data, key: "isExisting")
                        //                    if isExisting {
                        self.token = data["token"] as! String
                        //                        let userData = getDictionaryFromDictionary(dictionary: data, key: "user")
                        //                        let userID = getStringFromDictionary(dictionary: userData, key: "_id")
                        //                        let email = getStringFromDictionary(dictionary: userData, key: "email")
                        //                        let phone = getStringFromDictionary(dictionary: userData, key: "phone")
                        //                        let fullName = getStringFromDictionary(dictionary: userData, key: "fullName")
                        //                        let referralCode = getStringFromDictionary(dictionary: userData, key: "referralCode")
                        
                        //                        UserInfo.sharedInstance.saveToDefault(value: fullName, Key: DefaultKeys.name)
                        //
                        //                        UserInfo.sharedInstance.saveToDefault(value: userID, Key: DefaultKeys.userID)
                        
                        UserDefaults.standard.setValue(self.token, forKey: "token")
                        
                        //                        UserInfo.sharedInstance.saveToDefault(value: email, Key: DefaultKeys.email)
                        //
                        //                        UserInfo.sharedInstance.saveToDefault(value: phone, Key: DefaultKeys.phone)
                        //
                        //                        UserInfo.sharedInstance.saveToDefault(value: referralCode, Key: DefaultKeys.refrrelCode)
                        //
                        //                        UserInfo.sharedInstance.isUserLogin(isLogin: true)
                        
                        //Get Match List
                        self.getMatcheList(showLoader: false)
                        
                        //                    }
                        //                    else {
                        //                        let viewVC = storyBoards.Login.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
                        //                        viewVC.socialData = self.socialData
                        //                        self.navigationController?.pushViewController(viewVC, animated: true)
                        //                    }
                    } else {
                        
                    }
               
            } catch {
                print("error")
            }
        })
        
        task.resume()
        
        
    }
    func getMatcheList(showLoader:Bool) {

        var request = URLRequest(url: URL(string: "https://www.rockingbravo.com/api/v1/contests/fetchMatches/1")!)
        request.httpMethod = "GET"
//        request.httpBody = try? JSONSerialization.data(withJSONObject: params, options: [])
        request.addValue(self.token, forHTTPHeaderField: "x-auth-token")
        request.addValue("SXySeLCCtp5rNCPX7Z8T9nkj96CvDfFmEjBRpz5L", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            do {
                self.modelMatches = try JSONDecoder().decode(ModelUpcomingMatches.self, from: data!)
                
                DispatchQueue.main.async {
                    self.tblUpcomingMatche.reloadData()
                    
                }
                
            } catch {
                print(error)
            }
        })

        task.resume()
       
    }
}
//extension UIImageView {
//
//    func setCustomImage(_ imgURLString: String?) {
//        guard let imageURLString = imgURLString else {
//            self.image = UIImage(named: "default.png")
//            return
//        }
//        DispatchQueue.global().async { [weak self] in
//            let data = try? Data(contentsOf: URL(string: imageURLString)!)
//            DispatchQueue.main.async {
//                self?.image = data != nil ? UIImage(data: data!) : UIImage(named: "default.png")
//            }
//        }
//    }
//}
extension UIView {
    //Set Corner Radious
    @IBInspectable var cornerRadiushelper:CGFloat {
        
        set {
            self.layer.cornerRadius = newValue
        }
        get {
            return self.layer.cornerRadius
        }
    }
    //Set Round
    @IBInspectable var Round:Bool {
        
        set {
            self.layer.cornerRadius = self.frame.size.height / 2.0
        }
        get {
            return self.layer.cornerRadius == self.frame.size.height / 2.0
        }
    }
    //Set Border Color
    @IBInspectable var borderColor:UIColor {
        
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
    }
    //Set Border Width
    @IBInspectable var borderWidth:CGFloat {
        
        set {
            self.layer.borderWidth = newValue
        }
        get {
            return self.layer.borderWidth
        }
    }
    //Set Shadow to view
       @IBInspectable var ShdwColor:UIColor {
           set {
               self.layer.shadowColor = newValue.cgColor
           }
           get {
               return UIColor(cgColor: self.layer.shadowColor!)
           }
       }
       @IBInspectable var ShdwOffset:CGSize  {
           set {
               self.layer.shadowOffset = newValue
           }
           get {
               return self.layer.shadowOffset
           }
       }
       @IBInspectable var ShdwOpacity:CGFloat {
           set {
               self.layer.shadowOpacity = Float(newValue)
           }
           get {
               return CGFloat(self.layer.shadowOpacity)
           }
       }
       
       @IBInspectable var ShdwRadius:CGFloat {
           set {
               self.layer.shadowRadius = newValue
           }
           get {
               return self.layer.shadowRadius
           }
       }
}
