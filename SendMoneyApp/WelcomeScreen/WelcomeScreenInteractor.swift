//
//  WelcomeScreenInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 6.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation

/// протокол, который определяет методы, которые Interactor должен реализовать для выполнения бизнес-логики. В данном случае, он содержит метод , который вызывается при нажатии на кнопку в ViewController.
protocol WelcomeScreenBusinessLogic {
	func startButtonTapped()
}
/// протокол, определяющий методы для отображения данных в WelcomeViewController
protocol WelcomeDisplayLogic: AnyObject {
	func displayRegistrationScreen()
}

class WelcomeScreenInteractor: WelcomeScreenBusinessLogic {
	var presenter: WelcomeScreenPresentationLogic?
	
	func startButtonTapped() {
		presenter?.presentRegistrationScreen()
	}
}
