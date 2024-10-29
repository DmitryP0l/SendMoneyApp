//
//  RegistrationRouter.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 15.10.24.
//
// отвечает за навигацию и передачу данных между экранами

import UIKit

/// Протокол определяет логику маршрутизации для экрана Registration Screen
protocol RegistrationRouterLogic {
	func routeToHomePage()
}

final class RegistrationRouter: RegistrationRouterLogic {
	weak var viewController: UIViewController?
	
	/// Метод вызывается для выполнения перехода на экран HomePageScreen
	func routeToHomePage() {
		let homePageVC = HomePageViewController()
		viewController?.navigationController?.pushViewController(homePageVC, animated: true)
	}
}
