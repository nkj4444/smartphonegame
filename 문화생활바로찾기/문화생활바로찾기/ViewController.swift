//
//  ViewController.swift
//  HospitalMap_RE
//
//  Created by 나경종 on 2018. 5. 8..
//  Copyright © 2018년 나경종. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoend: UIButton!
    
    var audioController: AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func doneToPickerViewController(segue:UIStoryboardSegue){
        
    }
    @IBAction func particlepop(_ sender: Any) {
        
        let explore = ExplodeView(frame: CGRect(x: (logoend.imageView?.center.x)!, y: (logoend.imageView?.center.y)!, width: 10, height: 10))
        logoend.imageView?.superview?.addSubview(explore)
        logoend.imageView?.superview?.sendSubview(toBack: explore)
        audioController.playerEffect(name: SoundJing)
        
    }
    @IBOutlet weak var Testimage: UIImageView!
    
 
    var url : String = "https://openapi.gg.go.kr/CultureFestival?Type=xml&pSize=200&pIndex=1&Key=db5a0fa7ccf24e399252c9d2b894093b"
    
    var sgguName : String = "시흥시"
    var sgguCd : String = "41390"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func testani(){
        UIView.animate(
            withDuration: Double(2),
            delay: 0.0,
            options: UIViewAnimationOptions.curveEaseOut,
            animations: {
                
                self.logoend.alpha = 0.0
                self.Testimage.alpha = 0.0
                self.Testimage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                 self.Testimage.transform = CGAffineTransform(rotationAngle: 0)
                 self.Testimage.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                self.Testimage.alpha = 1.0
                self.logoend.alpha = 1.0
               // self.Testimage.color
        },
            completion: nil
        )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToTableView"{
            if let navController = segue.destination as? UINavigationController{
                if let festivalTableViewController = navController.topViewController as?
                    FestivalTableViewController{
                    festivalTableViewController.url = url// + "&SIGUN_CD=" + sgguCd
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        testani()
        
        //self.pickerView.delegate = self;
        //self.pickerView.dataSource = self;
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

