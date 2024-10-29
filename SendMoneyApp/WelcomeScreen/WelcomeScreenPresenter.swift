//
//  WelcomeScreenPresenter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 6.10.24.
//
// отвечает за подготовку данных к отображению

import Foundation

/// определяет логику презентации для экрана WelcomeScreen
protocol WelcomeScreenPresentationLogic {
	func presentRegistrationScreen()
}
final class WelcomeScreenPresenter: WelcomeScreenPresentationLogic {
	weak var viewController: WelcomeDisplayLogic?
	
	/// метод вызывается интерактором для подготовки данных и передачи их обратно во ViewController
	func presentRegistrationScreen() {
		viewController?.displayRegistrationScreen()
	}
}
