//
//  ViewController.swift
//  LightTimer
//
//  Created by Home on 01.01.2023.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    
    @IBAction func offAfterTapped(_ sender: Any) {
        
        let _ = createTimerVC(with: "TimerViewController", from: 1)
    }
    
    @IBAction func offInTapped(_ sender: Any) {
        
        let _ = createTimerVC(with: "TimerViewController", from: 2)
    }
    
    
    @IBAction func aboutTapped(_ sender: Any) {
        showAbout()  // shows alert with information about App
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    //MARK: - Private
    
    private func showAbout() {
        let alert = UIAlertController(title: "Про програму", message: "Програму розроблено для автоматичного вимкнення ліхтаріка на телефоні (Ви заснули, а ліхтарик вимкнувся)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Дякую", comment: "Some comment"), style: .default))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    private func createTimerVC(with vcName: String, from buttonNumber: Int) -> TimerViewController {
        let storyboard = UIStoryboard(name: vcName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vcName) as! TimerViewController
        navigationController?.pushViewController(vc, animated: true)
        if buttonNumber == 1 { // checking what content to be shown on the next screen
            vc.buttonNumber = 1
        }
        else
        {
            vc.buttonNumber = 2
        }
        return vc
    }
    
}

