//
//  WelcomeScreenInteractor.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 6.10.24.
//
// отвечает за бизнес логику и хранение данных

import Foundation

/// протокол, который определяет методы, которые Interactor должен реализовать для выполнения бизнес-логики. В данном случае, он содержит метод , который вызывается при нажатии на кнопку в WlcomeScreenViewController.
protocol WelcomeScreenBusinessLogic {
	func startButtonTapped()
}

final class WelcomeScreenInteractor: WelcomeScreenBusinessLogic {
	var presenter: WelcomeScreenPresentationLogic?
	
	func startButtonTapped() {
		presenter?.presentRegistrationScreen()
	}
}
