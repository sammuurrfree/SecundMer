//
//  SecundomerViewController.swift
//  SecundMer
//
//  Created by Преподаватель on 21.10.2021.
//

import UIKit

class SecundomerViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var milliSecundLabel: UILabel!
    @IBOutlet var longRecoginezer: UILongPressGestureRecognizer!
    @IBOutlet var tapCustomRecoginazer: UITapGestureRecognizer!
    
    var isPause = true
    var isHourHide = false
    var timer = Timer()
    var timeCheker = TaimCheker.main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longRecoginezer.minimumPressDuration = 1.5
        tapCustomRecoginazer.numberOfTapsRequired = 4
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLabel.getTextSizeForScreen()
    }


    @objc func timerAction() {
        timeCheker.time += 0.01
        timeCheker.chekTime()
        
        updateLabels()
    }
    
    
    func updateLabels(){
        timeLabel.text = "\(timeCheker.hour):\(timeCheker.minute):\(timeCheker.secund)"
        milliSecundLabel.text = String(Int(timeCheker.time * 100))
    

        if timeCheker.hour > 0{
            if timeCheker.secund < 10{
                if timeCheker.minute < 10{
                    if timeCheker.hour < 10{
                        timeLabel.text = "0\(timeCheker.hour):0\(timeCheker.minute):0\(timeCheker.secund)"
                    }else{
                        timeLabel.text = "\(timeCheker.hour):0\(timeCheker.minute):0\(timeCheker.secund)"
                    }
                }else{
                    if timeCheker.hour < 10{
                        timeLabel.text = "0\(timeCheker.hour):\(timeCheker.minute):0\(timeCheker.secund)"
                    }else{
                        timeLabel.text = "\(timeCheker.hour):\(timeCheker.minute):0\(timeCheker.secund)"
                    }
                }
            }else if timeCheker.minute < 10 {
                if timeCheker.hour < 10{
                    timeLabel.text = "0\(timeCheker.hour):0\(timeCheker.minute):\(timeCheker.secund)"
                }else{
                    timeLabel.text = "\(timeCheker.hour):0\(timeCheker.minute):\(timeCheker.secund)"
                }
            }else if timeCheker.hour < 10{
                timeLabel.text = "0\(timeCheker.hour):\(timeCheker.minute):\(timeCheker.secund)"
            }
        }else{
            if timeCheker.secund < 10{
                if timeCheker.minute < 10{
                    if timeCheker.hour < 10{
                        timeLabel.text = "0\(timeCheker.minute):0\(timeCheker.secund)"
                    }else{
                        timeLabel.text = "0\(timeCheker.minute):0\(timeCheker.secund)"
                    }
                }else{
                    if timeCheker.hour < 10{
                        timeLabel.text = "\(timeCheker.minute):0\(timeCheker.secund)"
                    }else{
                        timeLabel.text = "\(timeCheker.minute):0\(timeCheker.secund)"
                    }
                }
            }else if timeCheker.minute < 10 {
                if timeCheker.hour < 10{
                    timeLabel.text = "0\(timeCheker.minute):\(timeCheker.secund)"
                }else{
                    timeLabel.text = "0\(timeCheker.minute):\(timeCheker.secund)"
                }
            }else if timeCheker.hour < 10{
                timeLabel.text = "\(timeCheker.minute):\(timeCheker.secund)"
            }
        }
    }
    
    
    @IBAction func startPause(_ sender: UIGestureRecognizer) {
        
        if isPause{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        }else{
            timer.invalidate()
        }
        
        isPause = !isPause
        
    }
    
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
        timer.invalidate()
        let vc = storyboard!.instantiateViewController(withIdentifier: "setting")
        present(vc, animated: true)
    }
    
    @IBAction func doubleRecoginazer(_ sender: Any) {
        timer.invalidate()
        timeCheker.clear()
        timeLabel.text = "00:00"
        milliSecundLabel.text = "00"
        isPause = true
        isHourHide = false
        return
    }
    
}
