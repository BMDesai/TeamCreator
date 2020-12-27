//
//  PreviewTeamVC.swift
//  Sportzax
//
//  Created by Bhaumik on 12/09/20.
//

import UIKit


class PreviewTeamVC: UIViewController {
    
    //IBOutlets  
    @IBOutlet weak var lblWK: UILabel!
    @IBOutlet weak var lblBatsmen: UILabel!
    @IBOutlet weak var lblAllRounders: UILabel!
    @IBOutlet weak var lblBowler: UILabel!
    
    //Weeket Players
    @IBOutlet weak var cntrlWK1 : UIControl!
    @IBOutlet weak var imgWKPlayer1 : UIImageView!
    @IBOutlet weak var lblWKPlayerName1 : UILabel!
    @IBOutlet weak var lblWKPlayerCredit1 : UILabel!
    @IBOutlet weak var viewWKPlayerCaptain1 : UIView!
    @IBOutlet weak var lblWKPlayerCaptain1 : UILabel!
    
    @IBOutlet weak var cntrlWK2 : UIControl!
    @IBOutlet weak var imgWKPlayer2 : UIImageView!
    @IBOutlet weak var lblWKPlayerName2 : UILabel!
    @IBOutlet weak var lblWKPlayerCredit2 : UILabel!
    @IBOutlet weak var viewWKPlayerCaptain2 : UIView!
    @IBOutlet weak var lblWKPlayerCaptain2 : UILabel!
    
    //Batsmen
    @IBOutlet weak var cntrlBAT1 : UIControl!
    @IBOutlet weak var imgBATPlayer1 : UIImageView!
    @IBOutlet weak var lblBATPlayerName1 : UILabel!
    @IBOutlet weak var lblBATPlayerCredit1 : UILabel!
    @IBOutlet weak var viewBATPlayerCaptain1 : UIView!
    @IBOutlet weak var lblBATPlayerCaptain1 : UILabel!
    
    @IBOutlet weak var cntrlBAT2 : UIControl!
    @IBOutlet weak var imgBATPlayer2 : UIImageView!
    @IBOutlet weak var lblBATPlayerName2 : UILabel!
    @IBOutlet weak var lblBATPlayerCredit2 : UILabel!
    @IBOutlet weak var viewBATPlayerCaptain2 : UIView!
    @IBOutlet weak var lblBATPlayerCaptain2 : UILabel!
    
    @IBOutlet weak var cntrlBAT3 : UIControl!
    @IBOutlet weak var imgBATPlayer3 : UIImageView!
    @IBOutlet weak var lblBATPlayerName3 : UILabel!
    @IBOutlet weak var lblBATPlayerCredit3 : UILabel!
    @IBOutlet weak var viewBATPlayerCaptain3 : UIView!
    @IBOutlet weak var lblBATPlayerCaptain3 : UILabel!
    
    @IBOutlet weak var cntrlBAT4 : UIControl!
    @IBOutlet weak var imgBATPlayer4 : UIImageView!
    @IBOutlet weak var lblBATPlayerName4 : UILabel!
    @IBOutlet weak var lblBATPlayerCredit4 : UILabel!
    @IBOutlet weak var viewBATPlayerCaptain4 : UIView!
    @IBOutlet weak var lblBATPlayerCaptain4 : UILabel!
    
    @IBOutlet weak var cntrlBAT5 : UIControl!
    @IBOutlet weak var imgBATPlayer5 : UIImageView!
    @IBOutlet weak var lblBATPlayerName5 : UILabel!
    @IBOutlet weak var lblBATPlayerCredit5 : UILabel!
    @IBOutlet weak var viewBATPlayerCaptain5 : UIView!
    @IBOutlet weak var lblBATPlayerCaptain5 : UILabel!
    
    //All-Rounders
    @IBOutlet weak var cntrlAR1 : UIControl!
    @IBOutlet weak var imgARPlayer1 : UIImageView!
    @IBOutlet weak var lblARPlayerName1 : UILabel!
    @IBOutlet weak var lblARPlayerCredit1 : UILabel!
    @IBOutlet weak var viewARPlayerCaptain1 : UIView!
    @IBOutlet weak var lblARPlayerCaptain1 : UILabel!
    
    @IBOutlet weak var cntrlAR2 : UIControl!
    @IBOutlet weak var imgARPlayer2 : UIImageView!
    @IBOutlet weak var lblARPlayerName2 : UILabel!
    @IBOutlet weak var lblARPlayerCredit2 : UILabel!
    @IBOutlet weak var viewARPlayerCaptain2 : UIView!
    @IBOutlet weak var lblARPlayerCaptain2 : UILabel!
    
    @IBOutlet weak var cntrlAR3 : UIControl!
    @IBOutlet weak var imgARPlayer3 : UIImageView!
    @IBOutlet weak var lblARPlayerName3 : UILabel!
    @IBOutlet weak var lblARPlayerCredit3 : UILabel!
    @IBOutlet weak var viewARPlayerCaptain3 : UIView!
    @IBOutlet weak var lblARPlayerCaptain3 : UILabel!
    
    //Bowlers
    @IBOutlet weak var cntrlBOWL1 : UIControl!
    @IBOutlet weak var imgBOWLPlayer1 : UIImageView!
    @IBOutlet weak var lblBOWLPlayerName1 : UILabel!
    @IBOutlet weak var lblBOWLPlayerCredit1 : UILabel!
    @IBOutlet weak var viewBOWLPlayerCaptain1 : UIView!
    @IBOutlet weak var lblBOWLPlayerCaptain1 : UILabel!
    
    @IBOutlet weak var cntrlBOWL2 : UIControl!
    @IBOutlet weak var imgBOWLPlayer2 : UIImageView!
    @IBOutlet weak var lblBOWLPlayerName2 : UILabel!
    @IBOutlet weak var lblBOWLPlayerCredit2 : UILabel!
    @IBOutlet weak var viewBOWLPlayerCaptain2 : UIView!
    @IBOutlet weak var lblBOWLPlayerCaptain2 : UILabel!
    
    @IBOutlet weak var cntrlBOWL3 : UIControl!
    @IBOutlet weak var imgBOWLPlayer3 : UIImageView!
    @IBOutlet weak var lblBOWLPlayerName3 : UILabel!
    @IBOutlet weak var lblBOWLPlayerCredit3 : UILabel!
    @IBOutlet weak var viewBOWLPlayerCaptain3 : UIView!
    @IBOutlet weak var lblBOWLPlayerCaptain3 : UILabel!
    
    @IBOutlet weak var cntrlBOWL4 : UIControl!
    @IBOutlet weak var imgBOWLPlayer4 : UIImageView!
    @IBOutlet weak var lblBOWLPlayerName4 : UILabel!
    @IBOutlet weak var lblBOWLPlayerCredit4 : UILabel!
    @IBOutlet weak var viewBOWLPlayerCaptain4 : UIView!
    @IBOutlet weak var lblBOWLPlayerCaptain4 : UILabel!
    
    @IBOutlet weak var cntrlBOWL5 : UIControl!
    @IBOutlet weak var imgBOWLPlayer5 : UIImageView!
    @IBOutlet weak var lblBOWLPlayerName5 : UILabel!
    @IBOutlet weak var lblBOWLPlayerCredit5 : UILabel!
    @IBOutlet weak var viewBOWLPlayerCaptain5 : UIView!
    @IBOutlet weak var lblBOWLPlayerCaptain5 : UILabel!
    
    //variables
//    var arrTeamPlayers = [Player]()
    var arrTeamData = [TeamData]()
    var isFromMyTeamCompleted = false
//    var captainIndex = Int()
//    var viceCaptainIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialization
        self.initialization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func nameSplit(fullName:String) -> String {
        let nameFormatter = PersonNameComponentsFormatter()
        if let nameComps  = nameFormatter.personNameComponents(from: fullName), let firstLetter = nameComps.givenName?.first, let lastName = nameComps.familyName {

            return "\(firstLetter). \(lastName)"  // J. Singh
           
        }
        return ""
    }
    //MARK: - Initialization
    func initialization() {
        //
        self.navigationController?.navigationBar.isHidden = true
        //
        self.cntrlWK1.isHidden = true
        self.cntrlWK2.isHidden = true
        
        self.cntrlBAT1.isHidden = true
        self.cntrlBAT2.isHidden = true
        self.cntrlBAT3.isHidden = true
        self.cntrlBAT4.isHidden = true
        self.cntrlBAT5.isHidden = true
        
        self.cntrlAR1.isHidden = true
        self.cntrlAR2.isHidden = true
        self.cntrlAR3.isHidden = true
        
        self.cntrlBOWL1.isHidden = true
        self.cntrlBOWL2.isHidden = true
        self.cntrlBOWL3.isHidden = true
        self.cntrlBOWL4.isHidden = true
        self.cntrlBOWL5.isHidden = true
        
        self.lblWK.isHidden = true
        self.lblBatsmen.isHidden = true
        self.lblAllRounders.isHidden = true
        self.lblBowler.isHidden = true
        
        if self.arrTeamData.count > 0 {

            self.viewWKPlayerCaptain1.isHidden = true
            self.viewWKPlayerCaptain2.isHidden = true

            self.viewBATPlayerCaptain1.isHidden = true
            self.viewBATPlayerCaptain2.isHidden = true
            self.viewBATPlayerCaptain3.isHidden = true
            self.viewBATPlayerCaptain4.isHidden = true
            self.viewBATPlayerCaptain5.isHidden = true

            self.viewARPlayerCaptain1.isHidden = true
            self.viewARPlayerCaptain2.isHidden = true
            self.viewARPlayerCaptain3.isHidden = true

            self.viewBOWLPlayerCaptain1.isHidden = true
            self.viewBOWLPlayerCaptain2.isHidden = true
            self.viewBOWLPlayerCaptain3.isHidden = true
            self.viewBOWLPlayerCaptain4.isHidden = true
            self.viewBOWLPlayerCaptain5.isHidden = true


            let arrWK = self.arrTeamData.filter {
                $0.playingRole.lowercased() == "wk"
            }
            let arrBAT = self.arrTeamData.filter {
                $0.playingRole.lowercased() == "bat"
            }
            let arrAR = self.arrTeamData.filter {
                $0.playingRole.lowercased() == "all"
            }
            let arrBOWL = self.arrTeamData.filter {
                $0.playingRole.lowercased() == "bowl"
            }
            
            if arrWK.count > 0 {
                self.lblWK.isHidden = false
                if arrWK.count == 1 {
                    self.cntrlWK1.isHidden = false
                    self.cntrlWK2.isHidden = true
//                    self.lblWKPlayerName1.text = arrWK[0].title
                    self.lblWKPlayerName1.text = self.nameSplit(fullName: arrWK[0].title)
                    
                    if self.isFromMyTeamCompleted {
                        self.lblWKPlayerCredit1.text = "\(arrWK[0].points) pts"
                    } else {
                        self.lblWKPlayerCredit1.text = "\(arrWK[0].fantasyPlayerRating) cr"
                    }
                    self.imgWKPlayer1.sd_setImage(with:URL.init(string:  arrWK[0].logoUrl), completed: nil)
                    if arrWK[0].isCaptain {
                        self.lblWKPlayerCaptain1.text = "C"
                        self.viewWKPlayerCaptain1.isHidden = false
                    }
                    if arrWK[0].isViceCaptain {
                        self.lblWKPlayerCaptain1.text = "VC"
                        self.viewWKPlayerCaptain1.isHidden = false
                    }
                } else {
                    self.cntrlWK1.isHidden = false
                    self.cntrlWK2.isHidden = false
//                    self.lblWKPlayerName1.text = arrWK[0].title
                    self.lblWKPlayerName1.text = self.nameSplit(fullName: arrWK[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblWKPlayerCredit1.text = "\(arrWK[0].points) pts"
                    } else {
                        self.lblWKPlayerCredit1.text = "\(arrWK[0].fantasyPlayerRating) cr"
                    }
                    self.imgWKPlayer1.sd_setImage(with:URL.init(string:  arrWK[0].logoUrl), completed: nil)
                    if arrWK[0].isCaptain {
                        self.lblWKPlayerCaptain1.text = "C"
                        self.viewWKPlayerCaptain1.isHidden = false
                    }
                    if arrWK[0].isViceCaptain {
                        self.lblWKPlayerCaptain1.text = "VC"
                        self.viewWKPlayerCaptain1.isHidden = false
                    }

//                    self.lblWKPlayerName2.text = arrWK[1].title
                    self.lblWKPlayerName2.text = self.nameSplit(fullName: arrWK[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblWKPlayerCredit2.text = "\(arrWK[1].points) pts"
                    } else {
                        self.lblWKPlayerCredit2.text = "\(arrWK[1].fantasyPlayerRating) cr"
                    }
                    self.imgWKPlayer2.sd_setImage(with:URL.init(string:  arrWK[1].logoUrl), completed: nil)
                    if arrWK[1].isCaptain {
                        self.lblWKPlayerCaptain2.text = "C"
                        self.viewWKPlayerCaptain2.isHidden = false
                    }
                    if arrWK[1].isViceCaptain {
                        self.lblWKPlayerCaptain2.text = "VC"
                        self.viewWKPlayerCaptain2.isHidden = false
                    }
                }
            }

            if arrBAT.count > 0 {
                self.lblBatsmen.isHidden = false
                //Batsmen
                if arrBAT.count == 1 {

                    self.cntrlBAT1.isHidden = false
                    self.cntrlBAT2.isHidden = true
                    self.cntrlBAT3.isHidden = true
                    self.cntrlBAT4.isHidden = true
                    self.cntrlBAT5.isHidden = true

//                    self.lblBATPlayerName1.text = arrBAT[0].title
                    self.lblBATPlayerName1.text = self.nameSplit(fullName: arrBAT[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].points) pts"
                    } else {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl), completed: nil)
                    if arrBAT[0].isCaptain {
                        self.lblBATPlayerCaptain1.text = "C"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }
                    if arrBAT[0].isViceCaptain {
                        self.lblBATPlayerCaptain1.text = "VC"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }
                }
                if arrBAT.count == 2 {
                    self.cntrlBAT1.isHidden = false
                    self.cntrlBAT2.isHidden = false
                    self.cntrlBAT3.isHidden = true
                    self.cntrlBAT4.isHidden = true
                    self.cntrlBAT5.isHidden = true

//                    self.lblBATPlayerName1.text = arrBAT[0].title
                    self.lblBATPlayerName1.text = self.nameSplit(fullName: arrBAT[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].points) pts"
                    } else {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl), completed: nil)
                    if arrBAT[0].isCaptain {
                        self.lblBATPlayerCaptain1.text = "C"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }
                    if arrBAT[0].isViceCaptain {
                        self.lblBATPlayerCaptain1.text = "VC"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }

//                    self.lblBATPlayerName2.text = arrBAT[1].title
                    self.lblBATPlayerName2.text = self.nameSplit(fullName: arrBAT[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].points) pts"
                    } else {
                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl), completed: nil)

                    if arrBAT[1].isCaptain {
                        self.lblBATPlayerCaptain2.text = "C"
                        self.viewBATPlayerCaptain2.isHidden = false
                    }
                    if arrBAT[1].isViceCaptain {
                        self.lblBATPlayerCaptain2.text = "VC"
                        self.viewBATPlayerCaptain2.isHidden = false
                    }
                }
                if arrBAT.count == 3 {

                    self.cntrlBAT1.isHidden = false
                    self.cntrlBAT2.isHidden = false
                    self.cntrlBAT3.isHidden = false
                    self.cntrlBAT4.isHidden = true
                    self.cntrlBAT5.isHidden = true

//                    self.lblBATPlayerName1.text = arrBAT[0].title
                    self.lblBATPlayerName1.text = self.nameSplit(fullName: arrBAT[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].points) pts"
                    } else {
                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl), completed: nil)
                    if arrBAT[0].isCaptain {
                        self.lblBATPlayerCaptain1.text = "C"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }
                    if arrBAT[0].isViceCaptain {
                        self.lblBATPlayerCaptain1.text = "VC"
                        self.viewBATPlayerCaptain1.isHidden = false
                    }


//                    self.lblBATPlayerName2.text = arrBAT[1].title
                    self.lblBATPlayerName2.text = self.nameSplit(fullName: arrBAT[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].points) pts"
                    } else {
                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl), completed: nil)
                    if arrBAT[1].isCaptain {
                        self.lblBATPlayerCaptain2.text = "C"
                        self.viewBATPlayerCaptain2.isHidden = false
                    }
                    if arrBAT[1].isViceCaptain {
                        self.lblBATPlayerCaptain2.text = "VC"
                        self.viewBATPlayerCaptain2.isHidden = false
                    }


//                    self.lblBATPlayerName3.text = arrBAT[2].title
                    self.lblBATPlayerName3.text = self.nameSplit(fullName: arrBAT[2].title)
                    self.lblBATPlayerCredit3.text = "\(arrBAT[2].points) pts"
                    if self.isFromMyTeamCompleted {
                        self.lblBATPlayerCredit3.text = "\(arrBAT[2].points) pts"
                    } else {
                        self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating) cr"
                    }
                    self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl), completed: nil)
                    if arrBAT[2].isCaptain {
                        self.lblBATPlayerCaptain3.text = "C"
                        self.viewBATPlayerCaptain3.isHidden = false
                    }
                    if arrBAT[2].isViceCaptain {
                        self.lblBATPlayerCaptain3.text = "VC"
                        self.viewBATPlayerCaptain3.isHidden = false
                    }
                }
                    if arrBAT.count == 4 {
                        self.cntrlBAT1.isHidden = false
                        self.cntrlBAT2.isHidden = false
                        self.cntrlBAT3.isHidden = false
                        self.cntrlBAT4.isHidden = false
                        self.cntrlBAT5.isHidden = true

//                        self.lblBATPlayerName1.text = arrBAT[0].title
                        self.lblBATPlayerName1.text = self.nameSplit(fullName: arrBAT[0].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].points) pts"
                        } else {
                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl), completed: nil)
                        if arrBAT[0].isCaptain {
                            self.lblBATPlayerCaptain1.text = "C"
                            self.viewBATPlayerCaptain1.isHidden = false
                        }
                        if arrBAT[0].isViceCaptain {
                            self.lblBATPlayerCaptain1.text = "VC"
                            self.viewBATPlayerCaptain1.isHidden = false
                        }

//                        self.lblBATPlayerName2.text = arrBAT[1].title
                        self.lblBATPlayerName2.text = self.nameSplit(fullName: arrBAT[1].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].points) pts"
                        } else {
                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl), completed: nil)
                        if arrBAT[1].isCaptain {
                            self.lblBATPlayerCaptain2.text = "C"
                            self.viewBATPlayerCaptain2.isHidden = false
                        }
                        if arrBAT[1].isViceCaptain {
                            self.lblBATPlayerCaptain2.text = "VC"
                            self.viewBATPlayerCaptain2.isHidden = false
                        }

//                        self.lblBATPlayerName3.text = arrBAT[2].title
                        self.lblBATPlayerName3.text = self.nameSplit(fullName: arrBAT[2].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].points) pts"
                        } else {
                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl), completed: nil)
                        if arrBAT[2].isCaptain {
                            self.lblBATPlayerCaptain3.text = "C"
                            self.viewBATPlayerCaptain3.isHidden = false
                        }
                        if arrBAT[2].isViceCaptain {
                            self.lblBATPlayerCaptain3.text = "VC"
                            self.viewBATPlayerCaptain3.isHidden = false
                        }

//                        self.lblBATPlayerName4.text = arrBAT[3].title
                        self.lblBATPlayerName4.text = self.nameSplit(fullName: arrBAT[3].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].points) pts"
                        } else {
                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer4.sd_setImage(with:URL.init(string:  arrBAT[3].logoUrl), completed: nil)
                        if arrBAT[3].isCaptain {
                            self.lblBATPlayerCaptain4.text = "C"
                            self.viewBATPlayerCaptain4.isHidden = false
                        }
                        if arrBAT[3].isViceCaptain {
                            self.lblBATPlayerCaptain4.text = "VC"
                            self.viewBATPlayerCaptain4.isHidden = false
                        }
                    }
                if arrBAT.count == 5 {
                        self.cntrlBAT1.isHidden = false
                        self.cntrlBAT2.isHidden = false
                        self.cntrlBAT3.isHidden = false
                        self.cntrlBAT4.isHidden = false
                        self.cntrlBAT5.isHidden = false

//                        self.lblBATPlayerName1.text = arrBAT[0].title
                    self.lblBATPlayerName1.text = self.nameSplit(fullName: arrBAT[0].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].points) pts"
                        } else {
                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl), completed: nil)
                        if arrBAT[0].isCaptain {
                            self.lblBATPlayerCaptain1.text = "C"
                            self.viewBATPlayerCaptain1.isHidden = false
                        }
                        if arrBAT[0].isViceCaptain {
                            self.lblBATPlayerCaptain1.text = "VC"
                            self.viewBATPlayerCaptain1.isHidden = false
                        }

//                        self.lblBATPlayerName2.text = arrBAT[1].title
                    self.lblBATPlayerName2.text = self.nameSplit(fullName: arrBAT[1].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].points) pts"
                        } else {
                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl), completed: nil)
                        if arrBAT[1].isCaptain {
                            self.lblBATPlayerCaptain2.text = "C"
                            self.viewBATPlayerCaptain2.isHidden = false
                        }
                        if arrBAT[1].isViceCaptain {
                            self.lblBATPlayerCaptain2.text = "VC"
                            self.viewBATPlayerCaptain2.isHidden = false
                        }

//                        self.lblBATPlayerName3.text = arrBAT[2].title
                    self.lblBATPlayerName3.text = self.nameSplit(fullName: arrBAT[2].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].points) pts"
                        } else {
                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl), completed: nil)
                        if arrBAT[2].isCaptain {
                            self.lblBATPlayerCaptain3.text = "C"
                            self.viewBATPlayerCaptain3.isHidden = false
                        }
                        if arrBAT[2].isViceCaptain {
                            self.lblBATPlayerCaptain3.text = "VC"
                            self.viewBATPlayerCaptain3.isHidden = false
                        }

//                        self.lblBATPlayerName4.text = arrBAT[3].title
                    self.lblBATPlayerName4.text = self.nameSplit(fullName: arrBAT[3].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].points) pts"
                        } else {
                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer4.sd_setImage(with:URL.init(string:  arrBAT[3].logoUrl), completed: nil)
                        if arrBAT[3].isCaptain {
                            self.lblBATPlayerCaptain4.text = "C"
                            self.viewBATPlayerCaptain4.isHidden = false
                        }
                        if arrBAT[3].isViceCaptain {
                            self.lblBATPlayerCaptain4.text = "VC"
                            self.viewBATPlayerCaptain4.isHidden = false
                        }

//                        self.lblBATPlayerName5.text = arrBAT[4].title
                    self.lblBATPlayerName5.text = self.nameSplit(fullName: arrBAT[4].title)
                        if self.isFromMyTeamCompleted {
                            self.lblBATPlayerCredit5.text = "\(arrBAT[4].points) pts"
                        } else {
                            self.lblBATPlayerCredit5.text = "\(arrBAT[4].fantasyPlayerRating) cr"
                        }
                        self.imgBATPlayer5.sd_setImage(with:URL.init(string:  arrBAT[4].logoUrl), completed: nil)
                        if arrBAT[4].isCaptain {
                            self.lblBATPlayerCaptain5.text = "C"
                            self.viewBATPlayerCaptain5.isHidden = false
                        }
                        if arrBAT[4].isViceCaptain {
                            self.lblBATPlayerCaptain5.text = "VC"
                            self.viewBATPlayerCaptain5.isHidden = false
                        }
                    }

            }

            if arrAR.count > 0 {
                self.lblAllRounders.isHidden = false
                //All-Rounders
                if arrAR.count == 1 {
                    self.cntrlAR1.isHidden = false
                    self.cntrlAR2.isHidden = true
                    self.cntrlAR3.isHidden = true

//                    self.lblARPlayerName1.text = arrAR[0].title
                    self.lblARPlayerName1.text = self.nameSplit(fullName: arrAR[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblARPlayerCredit1.text = "\(arrAR[0].points) pts"
                    } else {
                        self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating) cr"
                    }
                    self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl), completed: nil)
                    if arrAR[0].isCaptain {
                        self.lblARPlayerCaptain1.text = "C"
                        self.viewARPlayerCaptain1.isHidden = false
                    }
                    if arrAR[0].isViceCaptain {
                        self.lblARPlayerCaptain1.text = "VC"
                        self.viewARPlayerCaptain1.isHidden = false
                    }
                } else {
                    if arrAR.count == 2 {
                        self.cntrlAR1.isHidden = false
                        self.cntrlAR2.isHidden = false
                        self.cntrlAR3.isHidden = true

//                        self.lblARPlayerName1.text = arrAR[0].title
                        self.lblARPlayerName1.text = self.nameSplit(fullName: arrAR[0].title)
                        if self.isFromMyTeamCompleted {
                            self.lblARPlayerCredit1.text = "\(arrAR[0].points) pts"
                        } else {
                            self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating) cr"
                        }
                        self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl), completed: nil)
                        if arrAR[0].isCaptain {
                            self.lblARPlayerCaptain1.text = "C"
                            self.viewARPlayerCaptain1.isHidden = false
                        }
                        if arrAR[0].isViceCaptain {
                            self.lblARPlayerCaptain1.text = "VC"
                            self.viewARPlayerCaptain1.isHidden = false
                        }

//                        self.lblARPlayerName2.text = arrAR[1].title
                        self.lblARPlayerName2.text = self.nameSplit(fullName: arrAR[1].title)
                        if self.isFromMyTeamCompleted {
                            self.lblARPlayerCredit2.text = "\(arrAR[1].points) pts"
                        } else {
                            self.lblARPlayerCredit2.text = "\(arrAR[1].fantasyPlayerRating) cr"
                        }
                        self.imgARPlayer2.sd_setImage(with:URL.init(string:  arrAR[1].logoUrl), completed: nil)
                        if arrAR[1].isCaptain {
                            self.lblARPlayerCaptain2.text = "C"
                            self.viewARPlayerCaptain2.isHidden = false
                        }
                        if arrAR[1].isViceCaptain {
                            self.lblARPlayerCaptain2.text = "VC"
                            self.viewARPlayerCaptain2.isHidden = false
                        }
                    } else {

                        self.cntrlAR1.isHidden = false
                        self.cntrlAR2.isHidden = false
                        self.cntrlAR3.isHidden = false

//                        self.lblARPlayerName1.text = arrAR[0].title
                        self.lblARPlayerName1.text = self.nameSplit(fullName: arrAR[0].title)
                        if self.isFromMyTeamCompleted {
                            self.lblARPlayerCredit1.text = "\(arrAR[0].points) pts"
                        } else {
                            self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating) cr"
                        }
                        self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl), completed: nil)
                        if arrAR[0].isCaptain {
                            self.lblARPlayerCaptain1.text = "C"
                            self.viewARPlayerCaptain1.isHidden = false
                        }
                        if arrAR[0].isViceCaptain {
                            self.lblARPlayerCaptain1.text = "VC"
                            self.viewARPlayerCaptain1.isHidden = false
                        }

//                        self.lblARPlayerName2.text = arrAR[1].title
                        self.lblARPlayerName2.text = self.nameSplit(fullName: arrAR[1].title)
                        if self.isFromMyTeamCompleted {
                            self.lblARPlayerCredit2.text = "\(arrAR[1].points) pts"
                        } else {
                            self.lblARPlayerCredit2.text = "\(arrAR[1].fantasyPlayerRating) cr"
                        }
                        self.imgARPlayer2.sd_setImage(with:URL.init(string:  arrAR[1].logoUrl), completed: nil)
                        if arrAR[1].isCaptain {
                            self.lblARPlayerCaptain2.text = "C"
                            self.viewARPlayerCaptain2.isHidden = false
                        }
                        if arrAR[1].isViceCaptain {
                            self.lblARPlayerCaptain2.text = "VC"
                            self.viewARPlayerCaptain2.isHidden = false
                        }

//                        self.lblARPlayerName3.text = arrAR[2].title
                        self.lblARPlayerName3.text = self.nameSplit(fullName: arrAR[2].title)
                        if self.isFromMyTeamCompleted {
                            self.lblARPlayerCredit3.text = "\(arrAR[2].points) pts"
                        } else {
                            self.lblARPlayerCredit3.text = "\(arrAR[2].fantasyPlayerRating) cr"
                        }
                        self.imgARPlayer3.sd_setImage(with:URL.init(string:  arrAR[2].logoUrl), completed: nil)
                        if arrAR[2].isCaptain {
                            self.lblARPlayerCaptain3.text = "C"
                            self.viewARPlayerCaptain3.isHidden = false
                        }
                        if arrAR[2].isViceCaptain {
                            self.lblARPlayerCaptain3.text = "VC"
                            self.viewARPlayerCaptain3.isHidden = false
                        }
                    }
                }
            }

            if arrBOWL.count > 0 {
                self.lblBowler.isHidden = false
                //Batsmen
                if arrBOWL.count == 1 {
                    self.cntrlBOWL1.isHidden = false
                    self.cntrlBOWL2.isHidden = true
                    self.cntrlBOWL3.isHidden = true
                    self.cntrlBOWL4.isHidden = true
                    self.cntrlBOWL5.isHidden = true

//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
                    self.lblBOWLPlayerName1.text = self.nameSplit(fullName: arrBOWL[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl), completed: nil)
                    if arrBOWL[0].isCaptain {
                        self.lblBOWLPlayerCaptain1.text = "C"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                    if arrBOWL[0].isViceCaptain {
                        self.lblBOWLPlayerCaptain1.text = "VC"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                }
                if arrBOWL.count == 2 {
                    self.cntrlBOWL1.isHidden = false
                    self.cntrlBOWL2.isHidden = false
                    self.cntrlBOWL3.isHidden = true
                    self.cntrlBOWL4.isHidden = true
                    self.cntrlBOWL5.isHidden = true

//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
                    self.lblBOWLPlayerName1.text = self.nameSplit(fullName: arrBOWL[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl), completed: nil)
                    if arrBOWL[0].isCaptain {
                        self.lblBOWLPlayerCaptain1.text = "C"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                    if arrBOWL[0].isViceCaptain {
                        self.lblBOWLPlayerCaptain1.text = "VC"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }

//                    self.lblBOWLPlayerName2.text = arrBOWL[1].title
                    self.lblBOWLPlayerName2.text = self.nameSplit(fullName: arrBOWL[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl), completed: nil)
                    if arrBOWL[1].isCaptain {
                        self.lblBOWLPlayerCaptain2.text = "C"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }
                    if arrBOWL[1].isViceCaptain {
                        self.lblBOWLPlayerCaptain2.text = "VC"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }
                }
                if arrBOWL.count == 3 {

                    self.cntrlBOWL1.isHidden = false
                    self.cntrlBOWL2.isHidden = false
                    self.cntrlBOWL3.isHidden = false
                    self.cntrlBOWL4.isHidden = true
                    self.cntrlBOWL5.isHidden = true

//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
                    self.lblBOWLPlayerName1.text = self.nameSplit(fullName: arrBOWL[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl), completed: nil)
                    if arrBOWL[0].isCaptain {
                        self.lblBOWLPlayerCaptain1.text = "C"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                    if arrBOWL[0].isViceCaptain {
                        self.lblBOWLPlayerCaptain1.text = "VC"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }

//                    self.lblBOWLPlayerName2.text = arrBOWL[1].title
                    self.lblBOWLPlayerName2.text = self.nameSplit(fullName: arrBOWL[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl), completed: nil)
                    if arrBOWL[1].isCaptain {
                        self.lblBOWLPlayerCaptain2.text = "C"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }
                    if arrBOWL[1].isViceCaptain {
                        self.lblBOWLPlayerCaptain2.text = "VC"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }

//                    self.lblBOWLPlayerName3.text = arrBOWL[2].title
                    self.lblBOWLPlayerName3.text = self.nameSplit(fullName: arrBOWL[2].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl), completed: nil)
                    if arrBOWL[2].isCaptain {
                        self.lblBOWLPlayerCaptain3.text = "C"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }
                    if arrBOWL[2].isViceCaptain {
                        self.lblBOWLPlayerCaptain3.text = "VC"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }
                }
                if arrBOWL.count == 4 {
                    self.cntrlBOWL1.isHidden = false
                    self.cntrlBOWL2.isHidden = false
                    self.cntrlBOWL3.isHidden = false
                    self.cntrlBOWL4.isHidden = false
                    self.cntrlBOWL5.isHidden = true

//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
                    self.lblBOWLPlayerName1.text = self.nameSplit(fullName: arrBOWL[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl), completed: nil)
                    if arrBOWL[0].isCaptain {
                        self.lblBOWLPlayerCaptain1.text = "C"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                    if arrBOWL[0].isViceCaptain {
                        self.lblBOWLPlayerCaptain1.text = "VC"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }

//                    self.lblBOWLPlayerName2.text = arrBOWL[1].title
                    self.lblBOWLPlayerName2.text = self.nameSplit(fullName: arrBOWL[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl), completed: nil)
                    if arrBOWL[1].isCaptain {
                        self.lblBOWLPlayerCaptain2.text = "C"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }
                    if arrBOWL[1].isViceCaptain {
                        self.lblBOWLPlayerCaptain2.text = "VC"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }

//                    self.lblBOWLPlayerName3.text = arrBOWL[2].title
                    self.lblBOWLPlayerName3.text = self.nameSplit(fullName: arrBOWL[2].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl), completed: nil)
                    if arrBOWL[2].isCaptain {
                        self.lblBOWLPlayerCaptain3.text = "C"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }
                    if arrBOWL[2].isViceCaptain {
                        self.lblBOWLPlayerCaptain3.text = "VC"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }

//                    self.lblBOWLPlayerName4.text = arrBOWL[3].title
                    self.lblBOWLPlayerName4.text = self.nameSplit(fullName: arrBOWL[3].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer4.sd_setImage(with:URL.init(string:  arrBOWL[3].logoUrl), completed: nil)
                    if arrBOWL[3].isCaptain {
                        self.lblBOWLPlayerCaptain4.text = "C"
                        self.viewBOWLPlayerCaptain4.isHidden = false
                    }
                    if arrBOWL[3].isViceCaptain {
                        self.lblBOWLPlayerCaptain4.text = "VC"
                        self.viewBOWLPlayerCaptain4.isHidden = false
                    }
                }

                if arrBOWL.count == 5 {
                    self.cntrlBOWL1.isHidden = false
                    self.cntrlBOWL2.isHidden = false
                    self.cntrlBOWL3.isHidden = false
                    self.cntrlBOWL4.isHidden = false
                    self.cntrlBOWL5.isHidden = false

//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
                    self.lblBOWLPlayerName1.text = self.nameSplit(fullName: arrBOWL[0].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl), completed: nil)
                    if arrBOWL[0].isCaptain {
                        self.lblBOWLPlayerCaptain1.text = "C"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }
                    if arrBOWL[0].isViceCaptain {
                        self.lblBOWLPlayerCaptain1.text = "VC"
                        self.viewBOWLPlayerCaptain1.isHidden = false
                    }

//                    self.lblBOWLPlayerName2.text = arrBOWL[1].title
                    self.lblBOWLPlayerName2.text = self.nameSplit(fullName: arrBOWL[1].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl), completed: nil)
                    if arrBOWL[1].isCaptain {
                        self.lblBOWLPlayerCaptain2.text = "C"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }
                    if arrBOWL[1].isViceCaptain {
                        self.lblBOWLPlayerCaptain2.text = "VC"
                        self.viewBOWLPlayerCaptain2.isHidden = false
                    }

//                    self.lblBOWLPlayerName3.text = arrBOWL[2].title
                    self.lblBOWLPlayerName3.text = self.nameSplit(fullName: arrBOWL[2].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl), completed: nil)
                    if arrBOWL[2].isCaptain {
                        self.lblBOWLPlayerCaptain3.text = "C"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }
                    if arrBOWL[2].isViceCaptain {
                        self.lblBOWLPlayerCaptain3.text = "VC"
                        self.viewBOWLPlayerCaptain3.isHidden = false
                    }

//                    self.lblBOWLPlayerName4.text = arrBOWL[3].title
                    self.lblBOWLPlayerName4.text = self.nameSplit(fullName: arrBOWL[3].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer4.sd_setImage(with:URL.init(string:  arrBOWL[3].logoUrl), completed: nil)
                    if arrBOWL[3].isCaptain {
                        self.lblBOWLPlayerCaptain4.text = "C"
                        self.viewBOWLPlayerCaptain4.isHidden = false
                    }
                    if arrBOWL[3].isViceCaptain {
                        self.lblBOWLPlayerCaptain4.text = "VC"
                        self.viewBOWLPlayerCaptain4.isHidden = false
                    }

//                    self.lblBOWLPlayerName5.text = arrBOWL[4].title
                    self.lblBOWLPlayerName5.text = self.nameSplit(fullName: arrBOWL[4].title)
                    if self.isFromMyTeamCompleted {
                        self.lblBOWLPlayerCredit5.text = "\(arrBOWL[4].points) pts"
                    } else {
                        self.lblBOWLPlayerCredit5.text = "\(arrBOWL[4].fantasyPlayerRating) cr"
                    }
                    self.imgBOWLPlayer5.sd_setImage(with:URL.init(string:  arrBOWL[4].logoUrl), completed: nil)
                    if arrBOWL[4].isCaptain {
                        self.lblBOWLPlayerCaptain5.text = "C"
                        self.viewBOWLPlayerCaptain5.isHidden = false
                    }
                    if arrBOWL[4].isViceCaptain {
                        self.lblBOWLPlayerCaptain5.text = "VC"
                        self.viewBOWLPlayerCaptain5.isHidden = false
                    }
                }

            }
        }
//        else {
//            if self.arrTeamPlayers.count <= 0 {
//                return
//            }
//            self.lblWK.isHidden = false
//            self.lblBatsmen.isHidden = false
//            self.lblAllRounders.isHidden = false
//            self.lblBowler.isHidden = false
//
//            self.cntrlWK1.isHidden = false
//            self.cntrlWK2.isHidden = false
//
//            self.cntrlBAT1.isHidden = false
//            self.cntrlBAT2.isHidden = false
//            self.cntrlBAT3.isHidden = false
//            self.cntrlBAT4.isHidden = false
//            self.cntrlBAT5.isHidden = false
//
//            self.cntrlAR1.isHidden = false
//            self.cntrlAR2.isHidden = false
//            self.cntrlAR3.isHidden = false
//
//            self.cntrlBOWL1.isHidden = false
//            self.cntrlBOWL2.isHidden = false
//            self.cntrlBOWL3.isHidden = false
//            self.cntrlBOWL4.isHidden = false
//            self.cntrlBOWL5.isHidden = false
//
//            //self.arrTeamPlayers = self.arrUserTeam
//
//            let arrWK = self.arrTeamPlayers.filter {
//                $0.playingRole!.lowercased() == "wk"
//            }
//            let arrBAT = self.arrTeamPlayers.filter {
//                $0.playingRole!.lowercased() == "bat"
//            }
//            let arrAR = self.arrTeamPlayers.filter {
//                $0.playingRole!.lowercased() == "all"
//            }
//            let arrBOWL = self.arrTeamPlayers.filter {
//                $0.playingRole!.lowercased() == "bowl"
//            }
//
//            if arrWK.count > 0 {
//                //Weeket Keppers
//                if arrWK.count == 1 {
//                    self.cntrlWK2.isHidden = true
//                    self.lblWKPlayerName1.text = arrWK[0].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblWKPlayerCredit1.text = "\(arrWK[0].points!) pts"
//                    } else {
//                        self.lblWKPlayerCredit1.text = "\(arrWK[0].fantasyPlayerRating!) cr"
//                    }
//                    self.imgWKPlayer1.sd_setImage(with:URL.init(string:  arrWK[0].logoUrl!), completed: nil)
//                    if arrWK[0].isCaptain == 1 {
//                        self.lblWKPlayerCaptain1.text = "C"
//                        self.viewWKPlayerCaptain1.isHidden = false
//                    }
//                    if arrWK[0].isViceCaptain == 1 {
//                        self.lblWKPlayerCaptain1.text = "VC"
//                        self.viewWKPlayerCaptain1.isHidden = false
//                    }
//                } else {
//                    self.cntrlWK2.isHidden = false
//                    self.lblWKPlayerName1.text = arrWK[0].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblWKPlayerCredit1.text = "\(arrWK[0].points!) pts"
//                    } else {
//                        self.lblWKPlayerCredit1.text = "\(arrWK[0].fantasyPlayerRating!) cr"
//                    }
//                    self.imgWKPlayer1.sd_setImage(with:URL.init(string:  arrWK[0].logoUrl!), completed: nil)
//                    if arrWK[0].isCaptain == 1 {
//                        self.lblWKPlayerCaptain1.text = "C"
//                        self.viewWKPlayerCaptain1.isHidden = false
//                    }
//                    if arrWK[0].isViceCaptain == 1 {
//                        self.lblWKPlayerCaptain1.text = "VC"
//                        self.viewWKPlayerCaptain1.isHidden = false
//                    }
//
//                    self.lblWKPlayerName2.text = arrWK[1].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblWKPlayerCredit2.text = "\(arrWK[1].points!) pts"
//                    } else {
//                        self.lblWKPlayerCredit2.text = "\(arrWK[1].fantasyPlayerRating!) cr"
//                    }
//                    self.imgWKPlayer2.sd_setImage(with:URL.init(string:  arrWK[1].logoUrl!), completed: nil)
//                    if arrWK[1].isCaptain == 1 {
//                        self.lblWKPlayerCaptain2.text = "C"
//                        self.viewWKPlayerCaptain2.isHidden = false
//                    }
//                    if arrWK[1].isViceCaptain == 1 {
//                        self.lblWKPlayerCaptain2.text = "VC"
//                        self.viewWKPlayerCaptain2.isHidden = false
//                    }
//                }
//            }
//
//            if arrBAT.count > 0 {
//                //Batsmen
//                if arrBAT.count <= 3 {
//
//                    self.cntrlBAT4.isHidden = true
//                    self.cntrlBAT5.isHidden = true
//
//                    self.lblBATPlayerName1.text = arrBAT[0].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].points!) pts"
//                    } else {
//                        self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl!), completed: nil)
//                    if arrBAT[0].isCaptain == 1 {
//                        self.lblBATPlayerCaptain1.text = "C"
//                        self.viewBATPlayerCaptain1.isHidden = false
//                    }
//                    if arrBAT[0].isViceCaptain == 1 {
//                        self.lblBATPlayerCaptain1.text = "VC"
//                        self.viewBATPlayerCaptain1.isHidden = false
//                    }
//
//                    self.lblBATPlayerName2.text = arrBAT[1].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].points!) pts"
//                    } else {
//                        self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl!), completed: nil)
//                    if arrBAT[1].isCaptain == 1 {
//                        self.lblBATPlayerCaptain2.text = "C"
//                        self.viewBATPlayerCaptain2.isHidden = false
//                    }
//                    if arrBAT[1].isViceCaptain == 1 {
//                        self.lblBATPlayerCaptain2.text = "VC"
//                        self.viewBATPlayerCaptain2.isHidden = false
//                    }
//
//                    self.lblBATPlayerName3.text = arrBAT[2].title
//                    self.lblBATPlayerCredit3.text = "\(arrBAT[2].points!) pts"
//                    if self.isFromMyTeamCompleted {
//                        self.lblBATPlayerCredit3.text = "\(arrBAT[2].points!) pts"
//                    } else {
//                        self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl!), completed: nil)
//                    if arrBAT[2].isCaptain == 1 {
//                        self.lblBATPlayerCaptain3.text = "C"
//                        self.viewBATPlayerCaptain3.isHidden = false
//                    }
//                    if arrBAT[2].isViceCaptain == 1 {
//                        self.lblBATPlayerCaptain3.text = "VC"
//                        self.viewBATPlayerCaptain3.isHidden = false
//                    }
//                } else {
//                    if arrBAT.count == 4 {
//                        self.cntrlBAT4.isHidden = false
//                        self.cntrlBAT5.isHidden = true
//
//                        self.lblBATPlayerName1.text = arrBAT[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl!), completed: nil)
//                        if arrBAT[0].isCaptain == 1 {
//                            self.lblBATPlayerCaptain1.text = "C"
//                            self.viewBATPlayerCaptain1.isHidden = false
//                        }
//                        if arrBAT[0].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain1.text = "VC"
//                            self.viewBATPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblBATPlayerName2.text = arrBAT[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl!), completed: nil)
//                        if arrBAT[1].isCaptain == 1 {
//                            self.lblBATPlayerCaptain2.text = "C"
//                            self.viewBATPlayerCaptain2.isHidden = false
//                        }
//                        if arrBAT[1].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain2.text = "VC"
//                            self.viewBATPlayerCaptain2.isHidden = false
//                        }
//
//                        self.lblBATPlayerName3.text = arrBAT[2].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl!), completed: nil)
//                        if arrBAT[2].isCaptain == 1 {
//                            self.lblBATPlayerCaptain3.text = "C"
//                            self.viewBATPlayerCaptain3.isHidden = false
//                        }
//                        if arrBAT[2].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain3.text = "VC"
//                            self.viewBATPlayerCaptain3.isHidden = false
//                        }
//
//                        self.lblBATPlayerName4.text = arrBAT[3].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer4.sd_setImage(with:URL.init(string:  arrBAT[3].logoUrl!), completed: nil)
//                        if arrBAT[3].isCaptain == 1 {
//                            self.lblBATPlayerCaptain4.text = "C"
//                            self.viewBATPlayerCaptain4.isHidden = false
//                        }
//                        if arrBAT[3].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain4.text = "VC"
//                            self.viewBATPlayerCaptain4.isHidden = false
//                        }
//                    } else {
//                        self.cntrlBAT4.isHidden = false
//                        self.cntrlBAT5.isHidden = false
//                        self.lblBATPlayerName1.text = arrBAT[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit1.text = "\(arrBAT[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer1.sd_setImage(with:URL.init(string:  arrBAT[0].logoUrl!), completed: nil)
//                        if arrBAT[0].isCaptain == 1 {
//                            self.lblBATPlayerCaptain1.text = "C"
//                            self.viewBATPlayerCaptain1.isHidden = false
//                        }
//                        if arrBAT[0].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain1.text = "VC"
//                            self.viewBATPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblBATPlayerName2.text = arrBAT[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit2.text = "\(arrBAT[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer2.sd_setImage(with:URL.init(string:  arrBAT[1].logoUrl!), completed: nil)
//                        if arrBAT[1].isCaptain == 1 {
//                            self.lblBATPlayerCaptain2.text = "C"
//                            self.viewBATPlayerCaptain2.isHidden = false
//                        }
//                        if arrBAT[1].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain2.text = "VC"
//                            self.viewBATPlayerCaptain2.isHidden = false
//                        }
//
//                        self.lblBATPlayerName3.text = arrBAT[2].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit3.text = "\(arrBAT[2].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer3.sd_setImage(with:URL.init(string:  arrBAT[2].logoUrl!), completed: nil)
//                        if arrBAT[2].isCaptain == 1 {
//                            self.lblBATPlayerCaptain3.text = "C"
//                            self.viewBATPlayerCaptain3.isHidden = false
//                        }
//                        if arrBAT[2].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain3.text = "VC"
//                            self.viewBATPlayerCaptain3.isHidden = false
//                        }
//
//                        self.lblBATPlayerName4.text = arrBAT[3].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit4.text = "\(arrBAT[3].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer4.sd_setImage(with:URL.init(string:  arrBAT[3].logoUrl!), completed: nil)
//                        if arrBAT[3].isCaptain == 1 {
//                            self.lblBATPlayerCaptain4.text = "C"
//                            self.viewBATPlayerCaptain4.isHidden = false
//                        }
//                        if arrBAT[3].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain4.text = "VC"
//                            self.viewBATPlayerCaptain4.isHidden = false
//                        }
//
//
//                        self.lblBATPlayerName5.text = arrBAT[4].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBATPlayerCredit5.text = "\(arrBAT[4].points!) pts"
//                        } else {
//                            self.lblBATPlayerCredit5.text = "\(arrBAT[4].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBATPlayer5.sd_setImage(with:URL.init(string:  arrBAT[4].logoUrl!), completed: nil)
//                        if arrBAT[4].isCaptain == 1 {
//                            self.lblBATPlayerCaptain5.text = "C"
//                            self.viewBATPlayerCaptain5.isHidden = false
//                        }
//                        if arrBAT[4].isViceCaptain == 1 {
//                            self.lblBATPlayerCaptain5.text = "VC"
//                            self.viewBATPlayerCaptain5.isHidden = false
//                        }
//                    }
//                }
//            }
//
//            if arrAR.count > 0 {
//                //All-Rounders
//                if arrAR.count == 1 {
//                    self.cntrlAR2.isHidden = true
//                    self.cntrlAR3.isHidden = true
//
//                    self.lblARPlayerName1.text = arrAR[0].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblARPlayerCredit1.text = "\(arrAR[0].points!) pts"
//                    } else {
//                        self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating!) cr"
//                    }
//                    self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl!), completed: nil)
//
//                    if arrAR[0].isCaptain == 1 {
//                        self.lblARPlayerCaptain1.text = "C"
//                        self.viewARPlayerCaptain1.isHidden = false
//                    }
//                    if arrAR[0].isViceCaptain == 1 {
//                        self.lblARPlayerCaptain1.text = "VC"
//                        self.viewARPlayerCaptain1.isHidden = false
//                    }
//                } else {
//                    if arrAR.count == 2 {
//                        self.cntrlAR2.isHidden = false
//                        self.cntrlAR3.isHidden = true
//
//                        self.lblARPlayerName1.text = arrAR[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblARPlayerCredit1.text = "\(arrAR[0].points!) pts"
//                        } else {
//                            self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl!), completed: nil)
//                        if arrAR[0].isCaptain == 1 {
//                            self.lblARPlayerCaptain1.text = "C"
//                            self.viewARPlayerCaptain1.isHidden = false
//                        }
//                        if arrAR[0].isViceCaptain == 1 {
//                            self.lblARPlayerCaptain1.text = "VC"
//                            self.viewARPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblARPlayerName2.text = arrAR[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblARPlayerCredit2.text = "\(arrAR[1].points!) pts"
//                        } else {
//                            self.lblARPlayerCredit2.text = "\(arrAR[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgARPlayer2.sd_setImage(with:URL.init(string:  arrAR[1].logoUrl!), completed: nil)
//                        if arrAR[1].isCaptain == 1 {
//                            self.lblARPlayerCaptain2.text = "C"
//                            self.viewARPlayerCaptain2.isHidden = false
//                        }
//                        if arrAR[1].isViceCaptain == 1 {
//                            self.lblARPlayerCaptain2.text = "VC"
//                            self.viewARPlayerCaptain2.isHidden = false
//                        }
//                    } else {
//
//                        self.cntrlAR2.isHidden = false
//                        self.cntrlAR3.isHidden = false
//
//                        self.lblARPlayerName1.text = arrAR[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblARPlayerCredit1.text = "\(arrAR[0].points!) pts"
//                        } else {
//                            self.lblARPlayerCredit1.text = "\(arrAR[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgARPlayer1.sd_setImage(with:URL.init(string:  arrAR[0].logoUrl!), completed: nil)
//                        if arrAR[0].isCaptain == 1 {
//                            self.lblARPlayerCaptain1.text = "C"
//                            self.viewARPlayerCaptain1.isHidden = false
//                        }
//                        if arrAR[0].isViceCaptain == 1 {
//                            self.lblARPlayerCaptain1.text = "VC"
//                            self.viewARPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblARPlayerName2.text = arrAR[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblARPlayerCredit2.text = "\(arrAR[1].points!) pts"
//                        } else {
//                            self.lblARPlayerCredit2.text = "\(arrAR[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgARPlayer2.sd_setImage(with:URL.init(string:  arrAR[1].logoUrl!), completed: nil)
//                        if arrAR[1].isCaptain == 1 {
//                            self.lblARPlayerCaptain2.text = "C"
//                            self.viewARPlayerCaptain2.isHidden = false
//                        }
//                        if arrAR[1].isViceCaptain == 1 {
//                            self.lblARPlayerCaptain2.text = "VC"
//                            self.viewARPlayerCaptain2.isHidden = false
//                        }
//
//                        self.lblARPlayerName3.text = arrAR[2].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblARPlayerCredit3.text = "\(arrAR[2].points!) pts"
//                        } else {
//                            self.lblARPlayerCredit3.text = "\(arrAR[2].fantasyPlayerRating!) cr"
//                        }
//                        self.imgARPlayer3.sd_setImage(with:URL.init(string:  arrAR[2].logoUrl!), completed: nil)
//                        if arrAR[2].isCaptain == 1 {
//                            self.lblARPlayerCaptain3.text = "C"
//                            self.viewARPlayerCaptain3.isHidden = false
//                        }
//                        if arrAR[2].isViceCaptain == 1 {
//                            self.lblARPlayerCaptain3.text = "VC"
//                            self.viewARPlayerCaptain3.isHidden = false
//                        }
//                    }
//                }
//            }
//
//            if arrBOWL.count > 0 {
//                //Batsmen
//                if arrBOWL.count <= 3 {
//
//                    self.cntrlBOWL4.isHidden = true
//                    self.cntrlBOWL5.isHidden = true
//
//                    self.lblBOWLPlayerName1.text = arrBOWL[0].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points!) pts"
//                    } else {
//                        self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl!), completed: nil)
//                    if arrBOWL[0].isCaptain == 1 {
//                        self.lblBOWLPlayerCaptain1.text = "C"
//                        self.viewBOWLPlayerCaptain1.isHidden = false
//                    }
//                    if arrBOWL[0].isViceCaptain == 1 {
//                        self.lblBOWLPlayerCaptain1.text = "VC"
//                        self.viewBOWLPlayerCaptain1.isHidden = false
//                    }
//
//
//                    self.lblBOWLPlayerName2.text = arrBOWL[1].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points!) pts"
//                    } else {
//                        self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl!), completed: nil)
//                    if arrBOWL[1].isCaptain == 1 {
//                        self.lblBOWLPlayerCaptain2.text = "C"
//                        self.viewBOWLPlayerCaptain2.isHidden = false
//                    }
//                    if arrBOWL[1].isViceCaptain == 1 {
//                        self.lblBOWLPlayerCaptain2.text = "VC"
//                        self.viewBOWLPlayerCaptain2.isHidden = false
//                    }
//
//
//                    self.lblBOWLPlayerName3.text = arrBOWL[2].title
//                    if self.isFromMyTeamCompleted {
//                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points!) pts"
//                    } else {
//                        self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating!) cr"
//                    }
//                    self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl!), completed: nil)
//                    if arrBOWL[2].isCaptain == 1 {
//                        self.lblBOWLPlayerCaptain3.text = "C"
//                        self.viewBOWLPlayerCaptain3.isHidden = false
//                    }
//                    if arrBOWL[2].isViceCaptain == 1 {
//                        self.lblBOWLPlayerCaptain3.text = "VC"
//                        self.viewBOWLPlayerCaptain3.isHidden = false
//                    }
//                } else {
//                    if arrBOWL.count == 4 {
//                        self.cntrlBOWL4.isHidden = false
//                        self.cntrlBOWL5.isHidden = true
//
//                        self.lblBOWLPlayerName1.text = arrBOWL[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl!), completed: nil)
//                        if arrBOWL[0].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain1.text = "C"
//                            self.viewBOWLPlayerCaptain1.isHidden = false
//                        }
//                        if arrBOWL[0].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain1.text = "VC"
//                            self.viewBOWLPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName2.text = arrBOWL[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl!), completed: nil)
//                        if arrBOWL[1].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain2.text = "C"
//                            self.viewBOWLPlayerCaptain2.isHidden = false
//                        }
//                        if arrBOWL[1].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain2.text = "VC"
//                            self.viewBOWLPlayerCaptain2.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName3.text = arrBOWL[2].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl!), completed: nil)
//                        if arrBOWL[2].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain3.text = "C"
//                            self.viewBOWLPlayerCaptain3.isHidden = false
//                        }
//                        if arrBOWL[2].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain3.text = "VC"
//                            self.viewBOWLPlayerCaptain3.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName4.text = arrBOWL[3].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer4.sd_setImage(with:URL.init(string:  arrBOWL[3].logoUrl!), completed: nil)
//                        if arrBOWL[3].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain4.text = "C"
//                            self.viewBOWLPlayerCaptain4.isHidden = false
//                        }
//                        if arrBOWL[3].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain4.text = "VC"
//                            self.viewBOWLPlayerCaptain4.isHidden = false
//                        }
//                    } else {
//                        self.cntrlBOWL4.isHidden = false
//                        self.cntrlBOWL5.isHidden = false
//                        self.lblBOWLPlayerName1.text = arrBOWL[0].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit1.text = "\(arrBOWL[0].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer1.sd_setImage(with:URL.init(string:  arrBOWL[0].logoUrl!), completed: nil)
//                        if arrBOWL[0].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain1.text = "C"
//                            self.viewBOWLPlayerCaptain1.isHidden = false
//                        }
//                        if arrBOWL[0].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain1.text = "VC"
//                            self.viewBOWLPlayerCaptain1.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName2.text = arrBOWL[1].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit2.text = "\(arrBOWL[1].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer2.sd_setImage(with:URL.init(string:  arrBOWL[1].logoUrl!), completed: nil)
//                        if arrBOWL[1].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain2.text = "C"
//                            self.viewBOWLPlayerCaptain2.isHidden = false
//                        }
//                        if arrBOWL[1].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain2.text = "VC"
//                            self.viewBOWLPlayerCaptain2.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName3.text = arrBOWL[2].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit3.text = "\(arrBOWL[2].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer3.sd_setImage(with:URL.init(string:  arrBOWL[2].logoUrl!), completed: nil)
//                        if arrBOWL[2].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain3.text = "C"
//                            self.viewBOWLPlayerCaptain3.isHidden = false
//                        }
//                        if arrBOWL[2].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain3.text = "VC"
//                            self.viewBOWLPlayerCaptain3.isHidden = false
//                        }
//
//                        self.lblBOWLPlayerName4.text = arrBOWL[3].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit4.text = "\(arrBOWL[3].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer4.sd_setImage(with:URL.init(string:  arrBOWL[3].logoUrl!), completed: nil)
//                        if arrBOWL[3].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain4.text = "C"
//                            self.viewBOWLPlayerCaptain4.isHidden = false
//                        }
//                        if arrBOWL[3].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain4.text = "VC"
//                            self.viewBOWLPlayerCaptain4.isHidden = false
//                        }
//
//
//                        self.lblBOWLPlayerName5.text = arrBOWL[4].title
//                        if self.isFromMyTeamCompleted {
//                            self.lblBOWLPlayerCredit5.text = "\(arrBOWL[4].points!) pts"
//                        } else {
//                            self.lblBOWLPlayerCredit5.text = "\(arrBOWL[4].fantasyPlayerRating!) cr"
//                        }
//                        self.imgBOWLPlayer5.sd_setImage(with:URL.init(string:  arrBOWL[4].logoUrl!), completed: nil)
//                        if arrBOWL[4].isCaptain == 1 {
//                            self.lblBOWLPlayerCaptain5.text = "C"
//                            self.viewBOWLPlayerCaptain5.isHidden = false
//                        }
//                        if arrBOWL[4].isViceCaptain == 1 {
//                            self.lblBOWLPlayerCaptain5.text = "VC"
//                            self.viewBOWLPlayerCaptain5.isHidden = false
//                        }
//                    }
//                }
//            }
//        }
    }
}

//MARK: - Action Events
extension PreviewTeamVC {
    @IBAction func tappedOnCancel(_ sender: UIControl!) {
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
    }
}
