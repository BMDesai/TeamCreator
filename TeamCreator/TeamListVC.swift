//
//  TeamListVC.swift
//  TeamCreator
//
//  Created by Bhaumik on 28/11/20.
//  Copyright © 2020 Bhaumik. All rights reserved.
//

import UIKit
import SDWebImage

class CellMyTeam: UITableViewCell {

    @IBOutlet weak var viewBG : UIView!
    @IBOutlet weak var lblTeamTitle : UILabel!
    @IBOutlet weak var lblTeamID : UILabel!
    @IBOutlet weak var lblTeamA : UILabel!
    @IBOutlet weak var lblTeamAPlayers : UILabel!
    @IBOutlet weak var imgTeamCaptain : UIImageView!
    @IBOutlet weak var lblCaptain : UILabel!
    @IBOutlet weak var lblCaptainName : UILabel!
    @IBOutlet weak var lblTeamViseCaptain : UILabel!
    @IBOutlet weak var lblTeamViseCaptainName : UILabel!
    @IBOutlet weak var lblTeamB : UILabel!
    @IBOutlet weak var lblTeamBPlayers : UILabel!
    @IBOutlet weak var imgTeamViseCaptain : UIImageView!
    @IBOutlet weak var lblWk : UILabel!
    @IBOutlet weak var lblWKPlayer : UILabel!
    @IBOutlet weak var lblBAT : UILabel!
    @IBOutlet weak var lblBATPlayer : UILabel!
    @IBOutlet weak var lblAR : UILabel!
    @IBOutlet weak var lblARPlayer : UILabel!
    @IBOutlet weak var lblBOWL : UILabel!
    @IBOutlet weak var lblBOWLPlayer : UILabel!
    @IBOutlet weak var lblEdit : UILabel!
    @IBOutlet weak var cntrlEdit : UIControl!
    @IBOutlet weak var cntrlSelect : UIControl!
    @IBOutlet weak var imgCheck : UIImageView!
    
   
    
}

class TeamListVC: UIViewController {

    //Outlets
    @IBOutlet weak var tblTeam : UITableView!
    
    //variable
    var arrSelectedPlayers = [Any]()
    var teamA = String()
    var teamB = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if #available(iOS 10.0, *) {
            let blurEffect = UIBlurEffect(style: .prominent)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            tblTeam.backgroundView = blurEffectView

        } else {
            let blurEffect = UIBlurEffect(style: .dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            tblTeam.backgroundView = blurEffectView

        }
        arrSelectedPlayers = arrSelectedPlayers.shuffled()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
}

//MARK: - UITableView Delegate and Datasource
extension TeamListVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrSelectedPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellMyTeam") as! CellMyTeam
        
//        let blurredView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//        blurredView.frame = cell.contentView.bounds
//        cell.contentView.addSubview(blurredView)
        
        let dictPlayer = self.arrSelectedPlayers[indexPath.row] as! [TeamData]
        let arrWK = dictPlayer.filter {
            $0.playingRole.lowercased() == "wk"
        }
        let arrBAT = dictPlayer.filter {
            $0.playingRole.lowercased() == "bat"
        }
        let arrAR = dictPlayer.filter {
            $0.playingRole.lowercased() == "all"
        }
        let arrBOWL = dictPlayer.filter {
            $0.playingRole.lowercased() == "bowl"
        }
        cell.lblWKPlayer.text! = "\(arrWK.count)"
        cell.lblBATPlayer.text! = "\(arrBAT.count)"
        cell.lblARPlayer.text! = "\(arrAR.count)"
        cell.lblBOWLPlayer.text! = "\(arrBOWL.count)"
        
        let nameFormatter = PersonNameComponentsFormatter()
        for value in dictPlayer {
            cell.imgTeamCaptain.sd_setImage(with: URL.init(string: value.logoUrl), completed: nil)
            cell.imgTeamViseCaptain.sd_setImage(with: URL.init(string: value.logoUrl), completed: nil)
            if value.isCaptain {
                if let nameComps  = nameFormatter.personNameComponents(from: value.title), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"
                    cell.lblCaptainName.text! = sortName
                }
            }
            
            if value.isViceCaptain {
                if let nameComps  = nameFormatter.personNameComponents(from: value.title), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {
                    
                    let sortName = "\(firstLetter). \(lastName)"
                    cell.lblTeamViseCaptainName.text! = sortName
                }
            }
        }
        
        //        if dictPlayer[indexPath.row].isViceCaptain == false {
        //            cell.lblTeamB.text! = ""
        //        }
        
        let a = arrWK.filter{ $0.team.lowercased() == self.teamA.lowercased() }
        let b = arrBAT.filter{ $0.team.lowercased() == self.teamA.lowercased() }
        let c = arrAR.filter{ $0.team.lowercased() == self.teamA.lowercased() }
        let d = arrBOWL.filter{ $0.team.lowercased() == self.teamA.lowercased() }
        
        let w = arrWK.filter{ $0.team.lowercased() == self.teamB.lowercased() }
        let x = arrBAT.filter{ $0.team.lowercased() == self.teamB.lowercased() }
        let y = arrAR.filter{ $0.team.lowercased() == self.teamB.lowercased() }
        let z = arrBOWL.filter{ $0.team.lowercased() == self.teamB.lowercased() }
        
        cell.lblTeamA.text! = self.teamA
        cell.lblTeamB.text! = self.teamB
        cell.lblTeamAPlayers.text! = "\(a.count+b.count+c.count+d.count)"
        cell.lblTeamBPlayers.text! = "\(w.count+x.count+y.count+z.count)"
        
        cell.lblTeamTitle.text! = "Dream(T\(indexPath.row+1))"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            let viewVC = self.storyboard!.instantiateViewController(withIdentifier: "PreviewTeamVC") as! PreviewTeamVC
        viewVC.arrTeamData = self.arrSelectedPlayers[indexPath.row] as! [TeamData]
            let transition = CATransition()
            transition.duration = 0.5
            transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
            transition.type = CATransitionType.moveIn
            transition.subtype = CATransitionSubtype.fromTop
            self.navigationController?.view.layer.add(transition, forKey: nil)
            self.navigationController?.pushViewController(viewVC, animated: false)
        
//        let allContestVC = self.storyboard!.instantiateViewController(withIdentifier: "PreviewTeamVC") as! PreviewTeamVC
//            allContestVC.selectedMatcheData = self.modelMatches.matcheData![indexPath.row]
//            self.navigationController?.pushViewController(allContestVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 201
    }
}
