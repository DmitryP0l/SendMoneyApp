//
//  WelcomeScreenRouter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 6.10.24.
//
// отвечает за навигацию и передачу данных между экранами

import UIKit

/// определяет логику маршрутизации для экрана WelcomeScreen
protocol WelcomeScreenRouterLogic {
	func routeToRegistrationScreen()
}

final class WelcomeScreenRouter: WelcomeScreenRouterLogic {
	weak var viewController: UIViewController?
	
	/// метод вызывается для выполнения перехода на экран RegistrationScreen
	func routeToRegistrationScreen() {
		let registrationVC = RegistrationViewController()
		viewController?.navigationController?.pushViewController(registrationVC, animated: true)
	}
}
