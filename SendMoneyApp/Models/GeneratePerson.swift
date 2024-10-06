//
//  GeneratePerson.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 24.09.24.
//

import Foundation
	///  класс, генерирующий массив с устанавливаемым количеством контактов, с помощью метода generateRandomPerson(count: Int)
class GeneratePerson {
	/// массивы с рандомными именами
	let firstNames = ["John", "Mary", "David", "Jane"]
	let lastNames = ["Smith", "Williams", "Johnson", "Brown"]
	/// Метод, генерирующий рандомное имя на основе массивов firstNames и lastNames
	func generateRandomName() -> String {
		let firstName = firstNames[Int(arc4random_uniform(UInt32(firstNames.count)))]
		let lastName = lastNames[Int(arc4random_uniform(UInt32(lastNames.count)))]
		return "\(firstName) \(lastName)"
	}
/// Метод, генерирующий рандомное число в заданных значениях
	func generateRandomBalance() -> Int {
		let minValue = 100
		let maxValue = 99999
		return Int(arc4random_uniform(UInt32(maxValue - minValue + 1))) + minValue
	}
/// Метод, генерирующий данные типа Person
	func createPersonStructure(name: String, balance: Int) -> Person {
		return Person(imageName: "person.circle", name: name, currentBalance: balance)
	}

	/// Создаем массив из структур Person
	var people = [Person]()
	/// Метод, вызываемый извне и генерирующий массив данных типа Person
	func generateRandomPerson(count: Int) -> [Person] {

		for _ in 0..<count {
			let person = createPersonStructure(name: generateRandomName(), balance: generateRandomBalance())
			people.append(person)
		}
		return people
	}

}

