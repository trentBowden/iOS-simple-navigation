//
//  SiteTableCell.swift
//  uiKit learning
//
//  Created by Trent Bowden on 19/2/20.
//  Copyright © 2020 Trent Bowden. All rights reserved.
//

import Foundation
import UIKit

class SiteTableViewCell: UITableViewCell {
    
    var site:Site? {
        didSet {
            guard let siteItem = site else {return}
            
            if let name = siteItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let address = siteItem.address {
               addressDetailedLabel.text = " \(address) "
            }
            
            if let image = siteItem.image {
                storedImageView.image = UIImage(named: image)
            }
        }
    }
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
       return img
    }()
    
    let nameLabel:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .gray
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
    }()
    
    let addressDetailedLabel:UILabel = {
      let label = UILabel()
      label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  .black
//        label.backgroundColor =  .blue
      label.layer.cornerRadius = 5
      label.clipsToBounds = true
      label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let containerView:UIView = {
      let view = UIView()
      view.translatesAutoresizingMaskIntoConstraints = false
      view.clipsToBounds = true // this will make sure its children do not go out of the boundary
      return view
    }()
    
    let storedImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Add the components
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(addressDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(storedImageView)
        
        // Align the profile image view
        profileImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        // Align the container view
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.profileImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:40).isActive = true
        
        // Align the name label
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        // Align the job title detailed label
        addressDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true
        addressDetailedLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        addressDetailedLabel.topAnchor.constraint(equalTo:self.nameLabel.bottomAnchor).isActive = true

        
        // Align the country image view
        storedImageView.widthAnchor.constraint(equalToConstant:26).isActive = true
        storedImageView.heightAnchor.constraint(equalToConstant:26).isActive = true
        storedImageView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20).isActive = true
        storedImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
     }
     required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}
