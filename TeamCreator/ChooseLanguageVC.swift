//
//  ChooseLanguageVC.swift
//  Sportzax
//
//  Created by Bhaumik on 08/09/20.
//

import UIKit

extension Collection {
    func choose(_ n: Int) -> ArraySlice<Element> { shuffled().prefix(n) }
}
class ChooseLanguageVC: UIViewController {

    //IBOutlets
    @IBOutlet weak var documentPicker : UIPickerView!
    @IBOutlet weak var lblTitle : UILabel!
    @IBOutlet weak var lblCancel : UILabel!
    @IBOutlet weak var lblOk : UILabel!
    @IBOutlet weak var cntrlCancel : UIControl!
    @IBOutlet weak var cntrlOk : UIControl!
    @IBOutlet weak var constTblHeight : NSLayoutConstraint!
    
    //variables
    var documenValues = [Int]()
    var selectedIndex = Int()
    var arrSelectedPlayers = [TeamData]()
    var callBack : (([Any]) -> ())?
    
    var arrSelectedCVC = [Any]()
    var arrSelectedPair = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialization
        self.initialization()
    }
    
    //MARK: - Initialization
    func initialization() {
//        let arr = self.arrSelectedPlayers
//        var copy = [TeamData]()
//        for _ in 1...11 { // just to demonstrate what happens
//            if copy.isEmpty {
//                copy = arr
//                copy.shuffle()
//
//            }
//            let element = copy.removeFirst()
//            print(element.title)
//
//        }
        self.selectedIndex = 1
        self.documenValues = Array(1...110)
    }
    
    //MARK: - viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}
//MARK: - Action Events
extension ChooseLanguageVC {
    
    @IBAction func tappedOnClose(_ sender:UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getAllPossibleTeams() -> [Any] {
        let arr = self.arrSelectedPlayers
        var copy = [TeamData]()
        for _ in (1...11) {
            if copy.isEmpty {
                copy = arr
                copy.shuffle()
                
            }
            let element = copy.removeFirst()
            print(element.title)
            
            var xx = Int()
            if let indexxx = self.arrSelectedPlayers.firstIndex( where: { $0.pid == element.pid //
            }){
                xx = indexxx
            }
            print("Captain -----> \(self.arrSelectedPlayers[xx].title)")
            for valuee in 0...9 { 
                for (row, _) in self.arrSelectedPlayers.enumerated() {
                    self.arrSelectedPlayers[row].isCaptain = false
                    self.arrSelectedPlayers[row].isViceCaptain = false
                }
                self.arrSelectedPlayers[xx].isCaptain = true
                if valuee != xx {
                    if self.arrSelectedPlayers[valuee].isViceCaptain == false {
                        self.arrSelectedPlayers[valuee].isViceCaptain = true
                    }
                } else {
                    self.arrSelectedPlayers[self.arrSelectedPlayers.count-1].isViceCaptain = true
                }
                for (row, _) in self.arrSelectedPlayers.enumerated() {
                    if self.arrSelectedPlayers[row].isCaptain == true {
                        self.arrSelectedPlayers[row].isCaptain = true
                    } else {
                        self.arrSelectedPlayers[row].isCaptain = false
                    }
                    if self.arrSelectedPlayers[row].isViceCaptain == true {
                        self.arrSelectedPlayers[row].isViceCaptain = true
                    } else {
                        self.arrSelectedPlayers[row].isViceCaptain = false
                    }
                }
                
                self.arrSelectedCVC.append(self.arrSelectedPlayers)
            }
        }
        return self.arrSelectedCVC
    }
    
    func getSelectedTeams() -> [Any] {
            
            for _ in (1...self.selectedIndex) {
                for (row, _) in self.arrSelectedPlayers.enumerated() {
                    self.arrSelectedPlayers[row].isCaptain = false
                    self.arrSelectedPlayers[row].isViceCaptain = false
                }
                let arr = self.arrSelectedPlayers
                var copy = [TeamData]()
                
                if copy.isEmpty {
                    copy = arr
                    copy.shuffle()
                    
                }
                let element = copy.removeFirst()
                print(element.title)
                
                var xx = Int()
                if let indexxx = self.arrSelectedPlayers.firstIndex( where: { $0.pid == element.pid //
                }){
                    xx = indexxx
                }
                print("Captain -----> \(self.arrSelectedPlayers[xx].title)")
               // for valuee in 0...9 { // just to demonstrate what happens
                    
                    self.arrSelectedPlayers[xx].isCaptain = true
//                    if valuee != xx {
//                        if self.arrSelectedPlayers[valuee].isViceCaptain == false {
                let arrrr = self.arrSelectedPlayers.filter {
                    $0.pid != element.pid
                }
                
                 let yy = self.getVCIndex(arr: arrrr)
                    self.arrSelectedPlayers[yy].isViceCaptain = true
                
//                        }
//                    } else {
//                        self.arrSelectedPlayers[self.arrSelectedPlayers.count-1].isViceCaptain = true
//                    }
                    for (row, _) in self.arrSelectedPlayers.enumerated() {
                        if self.arrSelectedPlayers[row].isCaptain == true {
                            self.arrSelectedPlayers[row].isCaptain = true
                        } else {
                            self.arrSelectedPlayers[row].isCaptain = false
                        }
                        if self.arrSelectedPlayers[row].isViceCaptain == true {
                            self.arrSelectedPlayers[row].isViceCaptain = true
                        } else {
                            self.arrSelectedPlayers[row].isViceCaptain = false
                        }
                    }
                    self.arrSelectedCVC.append(self.arrSelectedPlayers)
               // }
            }
            return self.arrSelectedCVC
        }
    
    func getVCIndex(arr:[TeamData]) -> Int {
        let arr1 = arr.choose(1)
        var yy = Int()
        if let indexxx = arr.firstIndex( where: { $0.pid == arr1[0].pid //
        }){
            yy = indexxx
        }
        return yy
    }
    
    func checkk() -> ArraySlice<TeamData> {
        var arr1 = ArraySlice<TeamData>()
        
        for _ in (1...self.selectedIndex) {
            
            arr1 = self.arrSelectedPlayers.choose(2)
            print(arr1[0].title)
            print(arr1[1].title)
            arr1[0].isSelected = false
            arr1[1].isSelected = false
            
            for value in self.arrSelectedPair {
                let ar = value as! ArraySlice<TeamData>
                let arrrr = ar.filter {
                $0.pid == arr1[0].pid && $0.isSelected == false || $0.pid == arr1[1].pid && $0.isSelected == false
                }
                if arrrr.count > 0 {
//                    print(arrrr[0].title)
                    arr1 = self.checkk()
                    break
                }
            }
            print("===========================")
            print(arr1[0].title)
            print(arr1[1].title)
            self.arrSelectedPair.append(arr1)
        }
        print(self.arrSelectedPair.count)
//        print(self.arrSelectedPair)
        return arr1
    }
    
    func check() -> ArraySlice<TeamData> {
        var arr1 = ArraySlice<TeamData>()
        arr1 = self.arrSelectedPlayers.choose(2)
        //print(self.arrSelectedCVC.count)
        for value  in self.arrSelectedCVC {
            let ar = value as! [TeamData]
            //print(ar)
            let arrrr = ar.filter {
                
                $0.pid == arr1[0].pid && $0.isCaptain == true || $0.pid == arr1[1].pid && $0.isViceCaptain == true
                
            }

            if arrrr.count > 0 {
//                print(arrrr[0].title)
                arr1 = self.check()
//                print(arr1[0].title)
//                print(arr1[1].title)
                break
            }
        }
        
        return arr1
    }
    func abc() -> [Any] {
        for _ in (1...self.selectedIndex) {
            //            print(value)
            for (row, _) in self.arrSelectedPlayers.enumerated() {
                self.arrSelectedPlayers[row].isCaptain = false
                self.arrSelectedPlayers[row].isViceCaptain = false
                
            }
            let arr1 = self.check()
            
            //            print("Captain -----> \(arr1[0].title)")
            //            print("Visecaptain-----> \(arr1[1].title)")
            
            if let index = self.arrSelectedPlayers.firstIndex( where: { $0.pid == arr1[0].pid
            }){
                if self.arrSelectedPlayers[index].isCaptain == false && arr1[0].isViceCaptain == false{
                    self.arrSelectedPlayers[index].isCaptain = true
                } else {
                    print("Already captain")
                }
            }
            if let index = self.arrSelectedPlayers.firstIndex( where: { $0.pid == arr1[1].pid
            }){
                if self.arrSelectedPlayers[index].isViceCaptain == false && arr1[1].isCaptain == false {
                    self.arrSelectedPlayers[index].isViceCaptain = true
                } else {
                    print("Already visecaptain")
                }
            }
            for (row, _) in self.arrSelectedPlayers.enumerated() {
                if self.arrSelectedPlayers[row].isCaptain == true {
                    self.arrSelectedPlayers[row].isCaptain = true
                } else {
                    self.arrSelectedPlayers[row].isCaptain = false
                }
                if self.arrSelectedPlayers[row].isViceCaptain == true {
                    self.arrSelectedPlayers[row].isViceCaptain = true
                } else {
                    self.arrSelectedPlayers[row].isViceCaptain = false
                }
            }
            self.arrSelectedCVC.append(self.arrSelectedPlayers)
            
        }
        print(arrSelectedCVC.count)
        
        return self.arrSelectedCVC
    }
    @IBAction func tappedOnOk(_ sender:UIControl) {

//        self.checkPair()
//        let arr = self.abc()
//        let arr = self.getAllPossibleTeams()
//        let _ = self.checkk()
        
        let arr = self.getSelectedTeams()
        self.dismiss(animated: true, completion: nil)

        self.callBack!(arr)
        
    }
    
    @IBAction func tappedOnBG(_ sender:UIControl) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//MARK: -  Pickerview Delegete
extension ChooseLanguageVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return documenValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(documenValues[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        self.selectedIndex = self.documenValues[row]
       // checkPair()
        self.view.endEditing(true)
    }
    
}
