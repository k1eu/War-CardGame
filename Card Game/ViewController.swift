//
//  ViewController.swift
//  Card Game
//
//  Created by Tomasz Kielar on 11/03/2019.
//  Copyright © 2019 Tomasz Kielar. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    var taliaPik = [
        "pikONE" : 1,
        "pikTWO" : 2,
        "pikTHREE" : 3,
        "pikFOUR" : 4,
        "pikFIVE" : 5,
        "pikSIX" : 6,
        "pikSEVEN" : 7,
        "pikEIGHT" : 8,
        "pikNINE" : 9,
        "pikTEN" : 10,
        "pikJACK" : 11,
        "pikQUEEN" : 12,
        "pikKING" : 13,
        "pikJOKER" : 14,
        ]
    var taliaKier = [
        "kierONE" : 1,
        "kierTWO" : 2,
        "kierTHREE" : 3,
        "kierFOUR" : 4,
        "kierFIVE" : 5,
        "kierSIX" : 6,
        "kierSEVEN" : 7,
        "kierEIGHT" : 8,
        "kierNINE" : 9,
        "kierTEN" : 10,
        "kierJACK" : 11,
        "kierQUEEN" : 12,
        "kierKING" : 13,
        "kierJOKER" : 14,
        ]
    var taliaTrefl = [
        "treflONE" : 1,
        "treflTWO" : 2,
        "treflTHREE" : 3,
        "treflFOUR" : 4,
        "treflFIVE" : 5,
        "treflSIX" : 6,
        "treflSEVEN" : 7,
        "treflEIGHT" : 8,
        "treflNINE" : 9,
        "treflTEN" : 10,
        "treflJACK" : 11,
        "treflQUEEN" : 12,
        "treflKING" : 13,
        "treflJOKER" : 14,
        ]
    var taliaKaro = [
        "karoONE" : 1,
        "karoTWO" : 2,
        "karoTHREE" : 3,
        "karoFOUR" : 4,
        "karoFIVE" : 5,
        "karoSIX" : 6,
        "karoSEVEN" : 7,
        "karoEIGHT" : 8,
        "karoNINE" : 9,
        "karoTEN" : 10,
        "karoJACK" : 11,
        "karoQUEEN" : 12,
        "karoKING" : 13,
        "karoJOKER" : 14,
        ]

    
    
    
    var wszystkie : [String:Int] = [:]
    var taliaGracz : [String:Int] = [:]
    var taliaKomputer : [String:Int] = [:]
    var taliaNicosci: [String:Int] = [:]
    
    func dodaj (_ name: [String:Int]) {
        for (key,value) in name {
            wszystkie[key] = value
        }
    }
    
    
    func tasuj () {
        for index in 1...14 {
            var holder = wszystkie.randomElement()
            taliaGracz[(holder?.key)!] = holder?.value
            wszystkie.removeValue(forKey: (holder?.key)!)
            
            holder = wszystkie.randomElement()
            taliaKomputer[(holder?.key)!] = holder?.value
            wszystkie.removeValue(forKey: (holder?.key)!)
        }
    }
    
    func gameon() {
        myPlus.isHidden = true
        komputerPlus.isHidden = true
        var ileKart:Int = 0
        var wyswietlacz : String = ""
        var punktyGracz = taliaGracz.count
        var punktyKomp = taliaKomputer.count
        
        func plusyKompDelay(_ seconds: Double) {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.komputerPlus.isHidden = true
                
            }
        }
        func plusyMyDelay(_ seconds: Double) {
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                self.myPlus.isHidden = true
                
            }
        }
        func noClick (_ seconds: Double ) {
            buttonNext.isEnabled = false
            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                
                self.buttonNext.isEnabled = true
            }
        }
        
        if punktyGracz == 0 || punktyKomp == 0 {
            myTalia.isHidden = true
            mojRuch.isHidden = true
            mojRuchNicosci.isHidden = true
            thirdKompMove.isHidden = true
            thirdMove.isHidden = true
            komputerTalia.isHidden = true
            komputerRuchNicosci.isHidden = true
            komputerRuch.isHidden = true
            buttonNext.isHidden = true
            lblaititle.isHidden = true
            lblMyMove.isHidden = true
            
            
            
            titleLbl.isHidden = false
            
            titleLbl.text = "KONIEC GRY"
            wynik.isHidden = false
            wynik.text = "AI:\(punktyKomp) - GRACZ:\(punktyGracz)"
        }
        else {
        
        
        var keyGracz:String,keyKomputer:String,powerGracz:Int,powerKomputer:Int // [key:power] <- oznaczenie
        let ruchGracz = taliaGracz.randomElement() // GRACZ 1 wykonanie ruchu, losowa karta
        let ruchKomputer = taliaKomputer.randomElement() // GRACZ 2 wykonanie ruchu
        keyGracz = (ruchGracz?.key)!
        powerGracz = (ruchGracz?.value)!
        
        keyKomputer = (ruchKomputer?.key)!
        powerKomputer = (ruchKomputer?.value)!
        
        let pomocJa = "Wyrzucasz karte: \(keyGracz)"
        let pomocKomputer = "Komputer rzuca karte: \(keyKomputer)"
        
        let obrazGracz = UIImage(named:keyGracz)
        let obrazKomputer = UIImage(named:keyKomputer)
        mojRuch.image = obrazGracz
        komputerRuch.image = obrazKomputer
        thirdKompMove.image = obrazKomputer
        thirdMove.image = obrazGracz
        
        
        if taliaNicosci.isEmpty == true {
            let mojPosition = mojRuch.layer.position //position
            let kompPosition = komputerRuch.layer.position
            
            func delayWithSecondsKomp(_ seconds: Double) {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.komputerRuch.isHidden = true
                    UIView.animate(withDuration:0.1, delay: 0, options: .allowAnimatedContent, animations: {self.komputerRuch.frame.origin.y -= 370
                    }, completion: nil)
                }
            }
            func delayWithSecondsGracz(_ seconds: Double) {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    self.mojRuch.isHidden = true
                    UIView.animate(withDuration: 0.1, delay: 0, options: .allowAnimatedContent, animations: {self.mojRuch.frame.origin.y += 370
                    }, completion: nil)
                }}
                
            // MOJE NA SRODEK
            UIView.animate(withDuration: 0.5, animations: {
                self.mojRuch.frame.origin.y -= 185
                self.mojRuch.frame.origin.x -= 91
            })
            // KOMP NA SRODEK
            UIView.animate(withDuration: 0.5, animations: {
                self.komputerRuch.frame.origin.y += 185
                self.komputerRuch.frame.origin.x += 91
            })
                
                if powerGracz > powerKomputer {
                    noClick(1.7)
                    ileKart = 1
                    wyswietlacz = "+\(ileKart)"
                    myPlus.text = wyswietlacz
                    myPlus.isHidden = false
                    plusyMyDelay(1.7)
                    taliaGracz[keyKomputer] = powerKomputer
                    taliaKomputer.removeValue(forKey: keyKomputer)
                    
                    
                    
                    let mojPosition = mojRuch.layer.position
                    let kompPosition = komputerRuch.layer.position
                    
                    UIView.animate(withDuration: 0.5, delay: 1, options: .allowAnimatedContent, animations: {self.mojRuch.frame.origin.y += 185
                        self.mojRuch.frame.origin.x += 91}, completion: nil)
                    UIView.animate(withDuration: 0.5, delay: 1, options: .allowAnimatedContent, animations: {self.komputerRuch.frame.origin.y += 185
                        self.komputerRuch.frame.origin.x -= 91}, completion: nil)
                    delayWithSecondsKomp(1.5)
                    wynik.text = "wygrana, zabierasz karty"
                }
                
                else if powerKomputer > powerGracz {
                    noClick(1.7)
                    ileKart = 1
                    wyswietlacz = "+\(ileKart)"
                    komputerPlus.text = wyswietlacz
                    komputerPlus.isHidden = false
                    plusyKompDelay(1.7)
                    taliaKomputer[keyGracz] = powerGracz
                    taliaGracz.removeValue(forKey: keyGracz)
                    let mojPosition = mojRuch.layer.position
                    let kompPosition = komputerRuch.layer.position
                    //MOJE DO KOMPA
                    UIView.animate(withDuration: 0.5, delay: 1, options: .allowAnimatedContent, animations: {self.mojRuch.frame.origin.y -= 185
                        self.mojRuch.frame.origin.x += 91}, completion: nil)
                    //KOMP DO SIEBIE
                    UIView.animate(withDuration: 0.5, delay: 1, options: .allowAnimatedContent, animations: {self.komputerRuch.frame.origin.y -= 185
                        self.komputerRuch.frame.origin.x -= 91}, completion: nil)
                    delayWithSecondsGracz(1.5)
                    wynik.text = "przegrana, oddajesz karty"
                }
                
                
                else if powerKomputer == powerGracz{
                    noClick(1.7)
                    /* talia nicosci przechowuje aktualne karty podczas wojny*/
                    wynik.text = "remis"
                    taliaNicosci[keyGracz] = powerGracz
                    taliaNicosci[keyKomputer] = powerKomputer
                    taliaGracz.removeValue(forKey: keyGracz)
                    taliaKomputer.removeValue(forKey: keyKomputer)
                    /* po rozpoczeciu wojny, druga karta jest zakryta , ponizej dodana do obiegu */
                    var ukrytyKeyGracz:String,ukrytyKeyAI:String,ukrytyPowerGracz:Int,ukrytyPowerAI:Int
                    let ukrytyRuchGracz = taliaGracz.randomElement() // GRACZ 1
                    let ukrytyRuchAI = taliaKomputer.randomElement() // GRACZ 2
                    
                    ukrytyKeyGracz = (ukrytyRuchGracz?.key)!
                    ukrytyPowerGracz = (ukrytyRuchGracz?.value)!
                    
                    ukrytyKeyAI = (ukrytyRuchAI?.key)!
                    ukrytyPowerAI = (ukrytyRuchAI?.value)!
                    
                    mojRuchNicosci.image = UIImage(named:"blacktop")
                    komputerRuchNicosci.image = UIImage(named:"blacktop")
                    UIView.animate(withDuration: 1, animations: {
                        self.mojRuchNicosci.frame.origin.y -= 185
                        self.mojRuchNicosci.frame.origin.x -= 91
                        self.mojRuchNicosci.transform = CGAffineTransform(rotationAngle: .pi / 2)
                    })
                    // KOMP NA SRODEK
                    UIView.animate(withDuration: 1, animations: {
                        self.komputerRuchNicosci.frame.origin.y += 185
                        self.komputerRuchNicosci.frame.origin.x += 91
                        self.komputerRuchNicosci.transform = CGAffineTransform(rotationAngle: .pi / 2)
                    })
                    
                    
                    taliaNicosci[ukrytyKeyGracz] = ukrytyPowerGracz
                    taliaNicosci[ukrytyKeyAI] = ukrytyPowerAI
                    
                    taliaGracz.removeValue(forKey: ukrytyKeyGracz)
                    taliaKomputer.removeValue(forKey: ukrytyKeyAI)

                
                
                }
        } // ZAKONCZENIE 1ST IF
        
        

            else if taliaNicosci.isEmpty == false{
            
                func delayWygrana(_ seconds: Double) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        UIView.animate(withDuration: 0.5, delay: 0, options: .allowAnimatedContent, animations: {
                            self.mojRuchNicosci.frame.origin.y += 185
                            self.mojRuchNicosci.frame.origin.x += 91
                            self.mojRuchNicosci.transform = CGAffineTransform(rotationAngle: 2*(.pi / 2))
                            self.komputerRuchNicosci.frame.origin.y += 185
                            self.komputerRuchNicosci.frame.origin.x -= 91
                            self.komputerRuchNicosci.transform = CGAffineTransform(rotationAngle: 2*(.pi / 2))
                            self.mojRuch.frame.origin.y += 185
                            self.mojRuch.frame.origin.x += 91
                            self.thirdMove.frame.origin.y += 185
                            self.thirdMove.frame.origin.x += 91
                            self.komputerRuch.frame.origin.y += 185
                            self.komputerRuch.frame.origin.x -= 91
                            self.thirdKompMove.frame.origin.y += 185
                            self.thirdKompMove.frame.origin.x -= 91
                            
                        }, completion: nil)
                    }}
                
            func delayKomputerPowrot(_ seconds: Double) {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    UIView.animate(withDuration: 0.1, delay: 0, options: .allowAnimatedContent, animations: {
                        self.komputerRuchNicosci.frame.origin.y -= 370
                        self.komputerRuch.frame.origin.y -= 370
                        self.thirdKompMove.frame.origin.y -= 370
                        
                    }, completion: nil)
                }}
            func delayMojPowrot(_ seconds: Double) {
                DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                    UIView.animate(withDuration: 0.1, delay: 0, options: .allowAnimatedContent, animations: {
                        self.mojRuchNicosci.frame.origin.y += 370
                        self.mojRuch.frame.origin.y += 370
                        self.thirdMove.frame.origin.y += 370
                        
                    }, completion: nil)
                }}
                func delayNaSrodek(_ seconds: Double) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        UIView.animate(withDuration: 0.5, delay: 0, options: .allowAnimatedContent, animations: {
                            self.thirdMove.frame.origin.y -= 185
                            self.thirdMove.frame.origin.x -= 91
                            self.thirdKompMove.frame.origin.y += 185
                            self.thirdKompMove.frame.origin.x += 91
                            
                        }, completion: nil)
                    }}
                
                func delayPrzegrana(_ seconds: Double) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                        UIView.animate(withDuration: 0.5, delay: 0, options: .allowAnimatedContent, animations: {
                            self.mojRuchNicosci.frame.origin.y -= 185
                            self.mojRuchNicosci.frame.origin.x += 91
                            self.mojRuchNicosci.transform = CGAffineTransform(rotationAngle: 2*(.pi / 2))
                            self.komputerRuchNicosci.frame.origin.y -= 185
                            self.komputerRuchNicosci.frame.origin.x -= 91
                            self.komputerRuchNicosci.transform = CGAffineTransform(rotationAngle: 2*(.pi / 2))
                            self.mojRuch.frame.origin.y -= 185
                            self.mojRuch.frame.origin.x += 91
                            self.thirdMove.frame.origin.y -= 185
                            self.thirdMove.frame.origin.x += 91
                            self.komputerRuch.frame.origin.y -= 185
                            self.komputerRuch.frame.origin.x -= 91
                            self.thirdKompMove.frame.origin.y -= 185
                            self.thirdKompMove.frame.origin.x -= 91
                            
                        }, completion: nil)
                    }}
                mojRuch.isHidden = false
                komputerRuch.isHidden = false
                mojRuchNicosci.isHidden = false  // na testy
                komputerRuchNicosci.isHidden = false // =||-
                if powerGracz > powerKomputer {
                    noClick(1.7)// WYGRANA
                    ileKart = 3
                    wyswietlacz = "+\(ileKart)"
                    myPlus.isHidden = false
                    myPlus.text = wyswietlacz
                    plusyMyDelay(1.7)
                    delayNaSrodek(0)
                    delayWygrana(1)
                    delayKomputerPowrot(1.5)
                    
                    for (kij,sila) in taliaNicosci {
                        taliaGracz[kij] = sila
                    }
                    taliaNicosci = [:]
                    wynik.text = "wygrana, zabierasz karty"
                    } // koniec gracz wygral
                else if powerKomputer > powerGracz {
                    noClick(1.7)
                    ileKart = 3
                    wyswietlacz = "+\(ileKart)"
                    komputerPlus.isHidden = false
                    komputerPlus.text = wyswietlacz
                    plusyKompDelay(1.7)
                    delayNaSrodek(0)
                    delayPrzegrana(1)
                    delayMojPowrot(1.5)
                for (kij,sila) in taliaNicosci {
                    taliaKomputer[kij] = sila
                }
                taliaNicosci = [:]
                    wynik.text = "przegrana, oddajesz karty"
            } // koniec gracz przegral
                    
                } // koniec pudelko nicosci not empty
        }
            } // KONIEC FUNKCJI GAME
        
    
    func resetor () {
        
    }
    @IBOutlet weak var wynik: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var lblaititle: UILabel!
    @IBOutlet weak var lblMyMove: UILabel!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var myTalia: UIImageView!
    @IBOutlet weak var komputerTalia: UIImageView!
    @IBOutlet weak var mojRuch: UIImageView!
    @IBOutlet weak var komputerRuch: UIImageView!
    @IBOutlet weak var mojRuchNicosci: UIImageView!
    @IBOutlet weak var komputerRuchNicosci: UIImageView!
    @IBOutlet weak var thirdMove: UIImageView!
    @IBOutlet weak var thirdKompMove: UIImageView!
    @IBOutlet weak var myPlus: UILabel!
    @IBOutlet weak var komputerPlus: UILabel!
    
    
    
    @IBAction func startAgame(_ sender: Any) {
        
        lblaititle.isHidden = false
        lblMyMove.isHidden = false
        buttonStart.isHidden = true
        buttonNext.isHidden = false
        buttonReset.isHidden = false
        wynik.isHidden = true
        titleLbl.isHidden = true
        
        lblaititle.text = "liczba kart: \(taliaKomputer.count)"
        lblMyMove.text = "liczba kart: \(taliaGracz.count)"
        
        
    }
    
    @IBAction func nextCards(_ sender: Any) {
        
        
        gameon()
        buttonNext.setTitle("Next", for: .normal)
        titleLbl.isHidden =  true
        mojRuch.isHidden = false
        wynik.isHidden = false
        komputerRuch.isHidden = false
        myTalia.isHidden = false
        komputerTalia.isHidden = false
        thirdKompMove.isHidden = false
        thirdMove.isHidden = false
        lblaititle.text = "liczba kart: \(taliaKomputer.count)"
        lblMyMove.text = "liczba kart: \(taliaGracz.count)"
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad() /* po tym kod */
        
    
        
        dodaj(taliaPik)
        dodaj(taliaKier)
        dodaj(taliaTrefl)
        dodaj(taliaKaro)
        tasuj()
        
        buttonNext.setTitle("Rozdaj", for: .normal)
        
        
        titleLbl.isHidden = false
        lblaititle.isHidden = true
        lblMyMove.isHidden = true
        buttonNext.isHidden = true
        buttonReset.isHidden = true
        myTalia.isHidden = true
        komputerTalia.isHidden = true
        wynik.isHidden = true
        thirdKompMove.isHidden = true
        thirdMove.isHidden = true
        myPlus.isHidden = true
        komputerPlus.isHidden = true
    }
    
    
    
    @IBAction func resetGame(_ sender: Any) {
        titleLbl.isHidden = false
        thirdKompMove.isHidden = true
        thirdMove.isHidden = true
        lblaititle.isHidden = true
        lblMyMove.isHidden = true
        buttonNext.isHidden = true
        buttonReset.isHidden = true
        buttonStart.isHidden = false
        myTalia.isHidden = true
        komputerTalia.isHidden = true
        buttonNext.setTitle("Rozdaj", for: .normal)
        wszystkie = [:]
        taliaGracz = [:]
        taliaKomputer = [:]
        taliaNicosci = [:]
        dodaj(taliaPik)
        dodaj(taliaKier)
        dodaj(taliaTrefl)
        dodaj(taliaKaro)
        tasuj()
        
        
    }
}


