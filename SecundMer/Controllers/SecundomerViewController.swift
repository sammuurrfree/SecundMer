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
    
    
    var color: [UIColor] = [.black, .blue, .brown, .cyan, .darkGray, .gray, .green, .lightGray, .lightText, .magenta, .orange, .purple, .red, .systemPurple, .systemPink, .systemYellow]
    var isPause = true
    var isHourHide = false
    var timer = Timer()
    var timeCheker = TaimCheker.main
    let settings = Settings.main
    var animateDurattion = 0.5
    var textSize = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        longRecoginezer.minimumPressDuration = 1.5
        tapCustomRecoginazer.numberOfTapsRequired = 4
        
        milliSecundLabel.isHidden = !settings.showMilliseconds
        view.backgroundColor = settings.backroundColor
        timeLabel.textColor = settings.foregroundColor
        milliSecundLabel.textColor = settings.foregroundColor
        for i in 0..<color.count - 1 {
            if color[i] == settings.backroundColor{
                color.remove(at: i)
            }
        }
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        timeLabel.getTextSizeForScreen()
        
        updateLabels()
    }


    @objc func timerAction() {
        timeCheker.time += 0.01
        timeCheker.chekTime()
        
        if settings.animedetText{
            textAnimate()
        }
        
        updateLabels()
    }
    
    func textAnimate(){
        animateDurattion -= 0.01
        
        if animateDurattion <= 0 {
            timeLabel.textColor = color.randomElement()
            milliSecundLabel.textColor = color.randomElement()
            animateDurattion = 0.5
        }

    }
    
    
    func updateLabels(){
        timeLabel.text = "\(timeCheker.hour):\(timeCheker.minute):\(timeCheker.secund)"
        milliSecundLabel.text = String(Int(timeCheker.time * 100))
    

        if timeCheker.hour > 0 || settings.showHour{
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
