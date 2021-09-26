//
//  StatsVC.swift
//  Meet the Members
//
//  Created by Michael Lin on 1/18/21.
//

import UIKit

class StatsVC: UIViewController {
    
    // MARK: STEP 11: Going to StatsVC
    // Read the instructions in MainVC.swift
    
    let dataExample: String
    var correct: Int
    private let statButton: UIButton = {
        let button = UIButton()
        
        //button.setTitle("Start", for: .normal)
        
        button.setTitleColor(.blue, for: .normal)
        // MARK: >> Your Code Here <<
        button.tintColor = .black
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init(data: String, c: Int) {
        self.dataExample = data
        // Delegate rest of the initialization to super class
        // designated initializer.
        self.correct=c
        statButton.setTitle(String(correct), for: .normal)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: >> Your Code Here <<
    
    // MARK: STEP 12: StatsVC UI
    // Action Items:
    // - Initialize the UI components, add subviews and constraints
    
    // MARK: >> Your Code Here <<
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(statButton)
        NSLayoutConstraint.activate([
            statButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            statButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            statButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            statButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300)
        ])
        // MARK: >> Your Code Here <<
    }
}
