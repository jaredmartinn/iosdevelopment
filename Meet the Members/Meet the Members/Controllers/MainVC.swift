//
//  MainVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    // Create a property for our timer, we will initialize it in viewDidLoad
    var timer: Timer?
    var time: Int?=nil
    var buttonarr: [UIButton] = []
    var curranswer: String = ""
    var correct: Int=0
    var paused: Bool=false
    
    // MARK: STEP 7: UI Customization
    // Action Items:
    // - Customize your imageView and buttons.
    
    let imageView: UIImageView = {
        let view = UIImageView()
        
        // MARK: >> Your Code Here <<
    
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let buttons: [UIButton] = {
        return (0..<4).map { index in
            let button = UIButton()
            
            //button=buttonarr[index]
            // Tag the button its index
            button.tag = index
            
            // MARK: >> Your Code Here <<
            button.setTitleColor(.black, for: .normal)
            button.tintColor = .black
            
            
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }
        
    }()

    let stats: UIButton = {
        let button = UIButton()
        
        button.setTitle("Stats", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let pause: UIButton = {
        let button = UIButton()
        
        button.setTitle("Pause", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: STEP 10: Stats Button
    // Action Items:
    // - Follow the examples you've seen so far, create and
    // configure a UIButton for presenting the StatsVC. Only the
    // callback function `didTapStats(_:)` was written for you.
    
    // MARK: >> Your Code Here <<
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        // Create a timer that calls timerCallback() every one second
        if (paused==false){
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
        }
        
        // MARK: STEP 6: Adding Subviews and Constraints
        // Action Items:
        // - Add imageViews and buttons to the root view.
        // - Create and activate the layout constraints.
        // - Run the App
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            //imageView.centerXAnchor.constraint(equalTo: imageView.centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300)
        ])
        view.addSubview(buttons[0])
        NSLayoutConstraint.activate([
            //buttons[0].topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),
            buttons[0].leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -150),
            //imageView.centerXAnchor.constraint(equalTo: imageView.centerYAnchor),
            //buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            buttons[0].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
        view.addSubview(buttons[1])
        NSLayoutConstraint.activate([
            //buttons[1].topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),
            buttons[1].leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            //imageView.centerXAnchor.constraint(equalTo: imageView.centerYAnchor),
            //buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            buttons[1].bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
        view.addSubview(buttons[2])
        NSLayoutConstraint.activate([
            //buttons[1].topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),
            buttons[2].topAnchor.constraint(equalTo: buttons[0].bottomAnchor, constant: 30),
            //imageView.centerXAnchor.constraint(equalTo: imageView.centerYAnchor),
            //buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            buttons[2].leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -150)
        ])
        view.addSubview(buttons[3])
        NSLayoutConstraint.activate([
            //buttons[1].topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 100),
            buttons[3].topAnchor.constraint(equalTo: buttons[1].bottomAnchor, constant: 30),
            //imageView.centerXAnchor.constraint(equalTo: imageView.centerYAnchor),
            //buttons[0].trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            buttons[3].leadingAnchor.constraint(equalTo: buttons[2].trailingAnchor, constant: 30)
        ])
        // Additional Information:
        // If you don't like the default presentation style,
        // you can change it to full screen too! However, in this
        // case you will have to find a way to manually to call
        // dismiss(animated: true, completion: nil) in order
        // to go back.
        //
        // modalPresentationStyle = .fullScreen
        
        // MARK: >> Your Code Here <<
        
        getNextQuestion()
        
        // MARK: STEP 9: Bind Callbacks to the Buttons
        // Action Items:
        // - Bind the `didTapAnswer(_:)` function to the buttons.
        
        // MARK: >> Your Code Here <<
        buttons[0].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[1].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[2].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        buttons[3].addTarget(self, action: #selector(didTapAnswer(_:)), for: .touchUpInside)
        
        view.addSubview(stats)
        NSLayoutConstraint.activate([
            stats.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            stats.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
        ])
        
        view.addSubview(pause)
        NSLayoutConstraint.activate([
            pause.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            pause.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
        pause.addTarget(self, action: #selector(didTapPause(_:)), for: .touchUpInside)
        
        // MARK: STEP 10: Stats Button
        // See instructions above.
        stats.addTarget(self, action: #selector(didTapStats(_:)), for: .touchUpInside)
        
        // MARK: >> Your Code Here <<
    }
    
    // What's the difference between viewDidLoad() and
    // viewWillAppear()? What about viewDidAppear()?
    override func viewWillAppear(_ animated: Bool) {
        // MARK: STEP 13: Resume Game
        // Action Items:
        // - Reinstantiate timer when view appears
        
        // MARK: >> Your Code Here <<
    }
    
    func getNextQuestion() {
        // MARK: STEP 5: Data Model
        // Action Items:
        // - Get a question instance from `QuestionProvider`
        // - Configure the imageView and buttons with information from
        //   the question instance
        let q: QuestionProvider=QuestionProvider()
        let question: QuestionProvider.Question? = q.nextQuestion()
        let image: UIImage = question!.image
        let answer: String = question!.answer
        let choices: [String]=question!.choices
        
        // MARK: >> Your Code Here <<
        imageView.image=image
        let button1: UIButton = {
            let button = UIButton()
            button.setTitle(choices[0], for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let button2: UIButton = {
            let button = UIButton()
            button.setTitle(choices[1], for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let button3: UIButton = {
            let button = UIButton()
            button.setTitle(choices[2], for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        let button4: UIButton = {
            let button = UIButton()
            button.setTitle(choices[3], for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        //buttons[0].tag=button1
        //buttons([button1, button2, button3, button4])
        imageView.image=image
        curranswer = answer
        buttonarr=[button1, button2, button3, button4]
        buttons[0].setTitle(choices[0], for: .normal)
        buttons[1].setTitle(choices[1], for: .normal)
        buttons[2].setTitle(choices[2], for: .normal)
        buttons[3].setTitle(choices[3], for: .normal)
    }
    
    // MARK: STEP 8: Buttons and Timer Callback
    // Action Items:
    // - Complete the callback function for the 4 buttons.
    // - Complete the callback function for the timer instance
    //
    // Additional Information:
    // Take some time to plan what should be in here.
    // The 4 buttons should share the same callback.
    //
    // Add instance properties and/or methods
    // to the class if necessary. You may need to come back
    // to this step later on.
    //
    // Hint:
    // - The timer will fire every one second.
    // - You can use `sender.tag` to identify which button is pressed.
    @objc func timerCallback() {
        
        // MARK: >> Your Code Here <<
        if time==nil {
            time=5
        }
        time!-=1;
        if (!(time==nil) && time!==0){
            let vc = MainVC()
            present(vc, animated: true, completion: nil)
        }
        
    }
    
    @objc func didTapAnswer(_ sender: UIButton) {
        
        // MARK: >> Your Code Here <<
        if sender.currentTitle!==curranswer {
            //sender.setTitleColor(.green, for: .normal)
            correct+=1
            sender.setTitleColor(.green, for: .normal)
            UIView.animate(withDuration: 2, delay: 0.0, options: [.curveLinear, .repeat, .autoreverse], animations: {sender.alpha = 0.01}, completion: nil)
        }
        else{
            sender.setTitleColor(.red, for: .normal)
        }
        let vc = MainVC()
        present(vc, animated: true, completion: nil)
    }
    
    @objc func didTapPause(_ sender: UIButton){
        if (pause.currentTitle=="Pause"){
            paused=true
            pause.setTitle("Resume", for: .normal)
        }
        else{
            paused=false
            pause.setTitle("Pause", for: .normal)
        }
    }
    
    @objc func didTapStats(_ sender: UIButton) {
        
        let vc = StatsVC(data: "Hello", c: correct)
        
        vc.modalPresentationStyle = .fullScreen
        
        // MARK: STEP 11: Going to StatsVC
        // When we are navigating between VCs (e.g MainVC -> StatsVC),
        // we often need a mechanism for transferring data
        // between view controllers. There are many ways to achieve
        // this (initializer, delegate, notification center,
        // combined, etc.). We will start with the easiest one today,
        // which is custom initializer.
        //
        // Action Items:
        // - Pause the game when stats button is tapped
        // - Read the example in StatsVC.swift, and replace it with
        //   your custom init for `StatsVC`
        // - Update the call site here on line 139
        
        present(vc, animated: true, completion: nil)
    }
}
