//
//  ContactTableViewCell.swift
//  iosContactTableView
//
//  Created by Екатерина Иванова on 16.08.2022.
//

import UIKit

final class ContactTableViewCell: UITableViewCell {
    
    var contact: Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                jobTitleDetailedLabel.text = " \(jobTitle) "
            }
            if let country = contactItem.country {
                countryImageView.image = UIImage(named: country)
            }
        }
    }
    
    private let profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let jobTitleDetailedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .white
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
        
        settingCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    private func settingCell() {
        //настройка аватарки
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        //настройка поля объединяющего имя и позицию
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        //настройка имени
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        //настройка описания позиции
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        
        //настройка аватарки страны
        countryImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
        countryImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
}


