//
//  StoreItemTableViewDiffableDataSource.swift
//  iTunesSearch
//
//  Created by Kshrugal Reddy Jangalapalli on 12/4/24.
//
import UIKit

@MainActor
class StoreItemTableViewDiffableDataSource: UITableViewDiffableDataSource<String, StoreItem> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return snapshot().sectionIdentifiers[section]
        
    }
}

