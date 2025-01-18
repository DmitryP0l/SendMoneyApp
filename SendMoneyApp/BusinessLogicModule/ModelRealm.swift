//
//  ModelRealm.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 7.01.25.
//
import Foundation
import RealmSwift

class UserRealm: Object {
	@Persisted(primaryKey: true) var id: String = UUID().uuidString
	@Persisted var name: String
	@Persisted var image: String
	@Persisted var balance: Int
	@Persisted var transactions = List<TransactionRealm>()
}

class TransactionRealm: Object {
	@Persisted(primaryKey: true) var id: String = UUID().uuidString
	@Persisted var amount: Int = 0
	@Persisted var date: Date = Date()
	@Persisted var userId: String = ""
	@Persisted var isIncoming: Bool = false
}
