//
//  ContactListViewCell.swift
//  SendMoneyApp
//
//  Created by Dmitry P on 18.09.24.
//

import UIKit

/// Класс ячейки для табличного вида класса ContactListViewController.
/// Содержит UIImageView для аватара, UILabel для информации о контакте в записной книге

final class ContactListViewCell: UITableViewCell {
	
	// MARK: - Constants
	/// инициализация и настройка UI элементов и констант
	static let identifier = "ContactListViewCell"
	
	let personImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		return imageView
	}()
	
	let personNameLabel: UILabel = {
		let label = UILabel()
		return label
	}()
	
	// MARK: - Init
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Private methods
	/// Настройка ограничений (constrains) для элементов ячейки.
	
	private func setupViews() {
		personImageView.translatesAutoresizingMaskIntoConstraints = false
		personNameLabel.translatesAutoresizingMaskIntoConstraints = false
		
		contentView.addSubview(personImageView)
		contentView.addSubview(personNameLabel)
		
		NSLayoutConstraint.activate([
			personImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			personImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			personImageView.widthAnchor.constraint(equalToConstant: 40),
			personImageView.heightAnchor.constraint(equalToConstant: 40),
			
			personNameLabel.leadingAnchor.constraint(equalTo: personImageView.trailingAnchor, constant: 10),
			personNameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
			]
		)
		personImageView.layer.cornerRadius = 20
		personImageView.clipsToBounds = true
	}
}
