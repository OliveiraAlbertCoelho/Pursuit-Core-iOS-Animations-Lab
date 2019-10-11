//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var distanceSpeed = 2.0
    var distance = 150.0
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    lazy var speedLabel: UILabel = {
        let label = UILabel()
        label.text = "Speed \(distanceSpeed)"
        return label
    }()
    lazy var DistanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Distance \(distance)"
        return label
    }()
    lazy var labelStackVIew: UIStackView = {
        let labelStack = UIStackView()
        labelStack.axis = .horizontal
        labelStack.alignment = .center
        labelStack.distribution = .fillEqually
        labelStack.spacing = 10
        return labelStack
    }()
    lazy var StepperStackView: UIStackView = {
        let stepperStack = UIStackView()
        stepperStack.axis = .horizontal
        stepperStack.alignment = .center
        stepperStack.distribution = .fillEqually
        stepperStack.spacing = 10
        return stepperStack
    }()
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        return buttonStack
    }()
    lazy var BottomStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .fillEqually
        buttonStack.spacing = 10
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateLeftButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move right left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateRightButton(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var distanceStepper: UIStepper = {
        let button = UIStepper()
        button.stepValue = 15.0
        button.value = distance
        button.minimumValue = 0
        button.maximumValue = 1000
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateDistance(sender:)), for: .touchUpInside)
        return button
    }()
    lazy var timeStepper: UIStepper = {
        let button = UIStepper()
        button.value = distanceSpeed
        button.minimumValue = 0.5
        button.stepValue = 0.50
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSpeed(sender:)), for: .touchUpInside)
        return button
    }()
    @IBAction func animateRightButton(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset + CGFloat(distance)
        UIView.animate(withDuration: distanceSpeed) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func animateLeftButton(sender: UIButton) {
        let oldOffset = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffset - CGFloat(distance)
        UIView.animate(withDuration: distanceSpeed) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - CGFloat(distance)
        UIView.animate(withDuration: distanceSpeed) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + CGFloat(distance)
        UIView.animate(withDuration: distanceSpeed) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func animateSpeed(sender: UIStepper) {

    distanceSpeed = sender.value
        speedLabel.text = "Speed \(distanceSpeed)"
    }
    @IBAction func animateDistance(sender: UIStepper) {
        distance = sender.value
        DistanceLabel.text = "Distance \(distance)"
        print(distance)
    }
    
    
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        view.addSubview(BottomStackView)
        addStepperViews()
        view.addSubview(StepperStackView)
        addLabelView()
        view.addSubview(labelStackVIew)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        BottomStackView.addSubview(leftButton)
        BottomStackView.addSubview(rightButton)
    }
    private func addStepperViews(){
        StepperStackView.addSubview(distanceStepper)
        StepperStackView.addSubview(timeStepper)
    }
    private func addLabelView(){
        labelStackVIew.addSubview(DistanceLabel)
        labelStackVIew.addSubview(speedLabel)
    }
    
    private func configureConstraints() {
        constrainBlueSquare()
        constrainUpButton()
        constrainDownButton()
        constrainLeftButton()
        constrainRightButton()
        constrainTimeStepper()
        constrainDistanceStepper()
        constrainTimeLabel()
        constrainDistanceLabel()
        constrainButtonStackView()
        
    }
    
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func constrainRightButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        rightButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    private func constrainLeftButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func constrainDistanceStepper(){
        distanceStepper.translatesAutoresizingMaskIntoConstraints = false
        distanceStepper.heightAnchor.constraint(equalToConstant: 50).isActive = true
        distanceStepper.trailingAnchor.constraint(equalTo: StepperStackView.trailingAnchor).isActive = true
    }
    private func constrainTimeStepper() {
        timeStepper.translatesAutoresizingMaskIntoConstraints = false
        timeStepper.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func constrainTimeLabel(){
        speedLabel.translatesAutoresizingMaskIntoConstraints = false
        speedLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    private func constrainDistanceLabel(){
           DistanceLabel.translatesAutoresizingMaskIntoConstraints = false
           DistanceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
           DistanceLabel.trailingAnchor.constraint(equalTo: labelStackVIew.trailingAnchor).isActive = true
       }
    
    
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 50),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        BottomStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            BottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            BottomStackView.topAnchor.constraint(equalTo: buttonStackView.bottomAnchor, constant: 10),
            BottomStackView.heightAnchor.constraint(equalToConstant: 50),
            BottomStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        StepperStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            StepperStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            StepperStackView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: 10),
            StepperStackView.heightAnchor.constraint(equalToConstant: 50),
            StepperStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
        labelStackVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelStackVIew.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelStackVIew.bottomAnchor.constraint(equalTo: StepperStackView.topAnchor, constant: 10),
            labelStackVIew.heightAnchor.constraint(equalToConstant: 50),
            labelStackVIew.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
        
    }
    
    
}


