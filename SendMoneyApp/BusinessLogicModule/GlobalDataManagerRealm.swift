//
//  GlobalDataRealm.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 7.01.25.
//

import Foundation
import RealmSwift

protocol GlobalDataManagerRealmProtocol {
	func getMainUser() -> UserRealm?
	func getOtherUsers() -> Results<UserRealm>
	func addTransaction(transaction: TransactionRealm)
	func updateUser(user: UserRealm)
}

class GlobalDataManagerRealm: GlobalDataManagerRealmProtocol {
	private let realm = try! Realm()
	
	/// Получение основного пользователя, запрос через фильтр Main User
	func getMainUser() -> UserRealm? {
		return realm.objects(UserRealm.self).filter("name == 'Main User'").first
	}
	/// Получение списка контактов, запрос через фильтр не Main User
	func getOtherUsers() -> RealmSwift.Results<UserRealm> {
		return realm.objects(UserRealm.self).filter("name != 'Main User'")
	}
	/// Добавление транзакции
	func addTransaction(transaction: TransactionRealm) {
		try! realm.write({
			realm.add(transaction)
		})
	}
	/// Обновление данных пользователя
	func updateUser(user: UserRealm) {
		try! realm.write({
			realm.add(user, update: .modified)
		})
	}
}
