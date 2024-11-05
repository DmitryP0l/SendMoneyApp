//
//  DataModel.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 29.10.24.
//
// Модуль, включающий общие модели и структуры данных

import Foundation

struct User {
	let id: UUID // Уникальный идентификатор пользователя
	let name: String // Имя пользователя
	let image: String // Имя изображения пользователя
	var balance: Int // Текущий баланс пользователя
}

struct Transaction {
	let id: UUID // Уникальный идентификатор транзакции
	var amount: Int // Сумма транзакции
	var date: Date // Дата транзакции
	var userId: UUID // Идентификатор пользователя, с которым была совершена транзакция
	var isIncoming: Bool // Значение входящей (true) или исходящей (false) транзакции
}

struct MainUser {
	var user: User // Основной пользователь приложения
	var transactions: [Transaction] // Список транзакций основного пользователя
}

struct DataBase {
	var mainUser: MainUser // Основной пользователь
	var otherUsers: [User] // Сторонние пользователи из записной книги
}
