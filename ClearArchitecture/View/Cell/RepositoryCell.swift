//
//  RepositoryCell.swift
//  ClearArchitecture
//
//  Created by Storm Ng on 2020/02/20.
//  Copyright © 2020 Storm Ng. All rights reserved.
//

import UIKit
import Reusable
import Kingfisher

class RepositoryCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var ownedAvatarImageView: UIImageView!
    @IBOutlet private weak var repositoryTitleLabel: UILabel!
    @IBOutlet private weak var repositoryDescriptionLabel: UILabel!
    
    var repository: Repository! {
        didSet {
            setupUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupUI() {
        let urlString = repository.owner?.avatar_url ?? ""
        ownedAvatarImageView.kf.setImage(with: URL(string: urlString))
        repositoryTitleLabel.text = repository.full_name
        repositoryDescriptionLabel.text = repository.description
    }
    
}
