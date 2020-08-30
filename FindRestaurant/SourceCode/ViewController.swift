//
//  ViewController.swift
//  xh244_P5
//
//  Created by 胡雪枫 on 2020/6/15.
//  Copyright © 2020 胡雪枫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var filterCollectionView: UICollectionView!
    var restaurantCollectionView: UICollectionView!
    var searchController: UISearchController!
    
    let padding: CGFloat = 8
    let restaurantReuseIdentifier = "restaurantCellReuseIdentifier"
    let filterReuseIdentifier = "filterCellReuseIdentifier"
    
    let mexican = Filter(filterName: "Mexican")
    let american = Filter(filterName: "American")
    let asian = Filter(filterName: "Asian")
    let greek = Filter(filterName: "Greek")
    let fastfood = Filter(filterName: "Fast Food")
    let seafood = Filter(filterName: "Seafood")
    let breakast = Filter(filterName: "Breakfast")
    let lunch = Filter(filterName: "Lunch")
    let dinner = Filter(filterName: "Dinner")
    let cheap = Filter(filterName: "$")
    let acceptable = Filter(filterName: "$$")
    var filters = [Filter]()
    var selectedCells = [IndexPath]()
    
    let chipotle = Restaurant(imageName: "chipotle", restaurantName: "Chipotle", cuisine: ["Mexican"], time: ["Lunch", "Dinner"], priceLevel: "$")
    let chick = Restaurant(imageName: "chick-fill-a", restaurantName: "Chick-Fill-A", cuisine: ["American", "Fast Food"], time: ["Lunch"], priceLevel: "$")
    let pokeland = Restaurant(imageName: "pokeland", restaurantName: "Pokeland", cuisine: ["Seafood"], time: ["Lunch", "Dinner"], priceLevel: "$$")
    let ctb = Restaurant(imageName: "ctb", restaurantName: "College Town Bagle", cuisine: ["American"], time: ["Breakfast", "Lunch"], priceLevel: "$$")
    let fourseasons = Restaurant(imageName: "fourseasons", restaurantName: "Four Seasons", cuisine: ["Asian"], time: ["Lunch", "Dinner"], priceLevel: "$$")
    let aladdins = Restaurant(imageName: "aladdins", restaurantName: "Aladdins", cuisine: ["Greek"], time: ["Lunch","Dinner"], priceLevel: "$$")
    var restaurants1 = [Restaurant]()
    var restaurants2 = [Restaurant]()
    var searchResults = [Restaurant]()
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    var isFiltering: Bool {
      return searchController.isActive && !isSearchBarEmpty
    }


    
    let restaurantLayout = UICollectionViewFlowLayout()
    let restaurantLayout1 = UICollectionViewFlowLayout()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My Restaurants"
        view.backgroundColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0.8, alpha: 0.7)

        navigationController?.navigationBar.barTintColor = UIColor(displayP3Red: 0.2, green: 0.3, blue: 0.8, alpha: 0.7)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        extendedLayoutIncludesOpaqueBars = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Table", style: .plain, target: self, action: #selector(changeLayout))
        
        filters = [mexican, american, asian, greek, fastfood, seafood, breakast, lunch, dinner, cheap, acceptable]
        restaurants1 = [chipotle, chick, pokeland, ctb, fourseasons, aladdins]
        restaurants2 = [chipotle, chick, pokeland, ctb, fourseasons, aladdins]
        
        let filterLayout = UICollectionViewFlowLayout()
        filterLayout.scrollDirection = .horizontal
        filterLayout.minimumInteritemSpacing = padding
        filterLayout.minimumLineSpacing = padding
        filterLayout.sectionInset = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
        
        restaurantLayout.scrollDirection = .vertical
        restaurantLayout.minimumInteritemSpacing = 5
        restaurantLayout.minimumLineSpacing = padding
        restaurantLayout.sectionInset = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
        
        restaurantLayout1.scrollDirection = .vertical
        restaurantLayout1.minimumInteritemSpacing = 5
        restaurantLayout1.minimumLineSpacing = padding
        restaurantLayout1.sectionInset = UIEdgeInsets(top: 0.0, left: padding, bottom: 0.0, right: padding)
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Restaurant"
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: filterLayout)
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.allowsSelection = true
        filterCollectionView.allowsMultipleSelection = true
        filterCollectionView.backgroundColor = .lightGray
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        filterCollectionView.dataSource = self
        filterCollectionView.delegate = self
        view.addSubview(filterCollectionView)
        
        restaurantCollectionView = UICollectionView(frame: .zero, collectionViewLayout: restaurantLayout)
        restaurantCollectionView.translatesAutoresizingMaskIntoConstraints = false
        restaurantCollectionView.backgroundColor = .lightGray
        restaurantCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: restaurantReuseIdentifier)
        restaurantCollectionView.dataSource = self
        restaurantCollectionView.delegate = self
        view.addSubview(restaurantCollectionView)

        setupConstraints()
        
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            filterCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
            filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filterCollectionView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            restaurantCollectionView.topAnchor.constraint(equalTo: filterCollectionView.bottomAnchor),
            restaurantCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            restaurantCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            restaurantCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func filterContentForSearchText(_ searchText: String) {
      searchResults = restaurants1.filter { (restaurant: Restaurant) -> Bool in
        return restaurant.restaurantName.lowercased().contains(searchText.lowercased())
      }
      
      restaurantCollectionView.reloadData()
    }

    

    
    @objc func changeLayout() {
        
        if navigationItem.rightBarButtonItem?.title == "Table" {
            navigationItem.rightBarButtonItem?.title = "Grid"
            restaurantCollectionView.reloadData()
            
        }
        else {
            navigationItem.rightBarButtonItem?.title = "Table"
            restaurantCollectionView.reloadData()
        }
    }
        
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.filterCollectionView{
            return filters.count
        }
        else if isFiltering {
            return searchResults.count
        }
        else {
            return restaurants2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.filterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            
            cell.configure(filter: filters[indexPath.item])
            return cell
        }
        else if isFiltering{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantReuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
            
            cell.configure(restaurant: searchResults[indexPath.item])
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantReuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
            
            cell.configure(restaurant: restaurants2[indexPath.item])
            return cell
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.filterCollectionView {
            let width = (collectionView.frame.width - 4 * padding) / 4.0
            let height = (collectionView.frame.height - 0.2 * padding)
            return CGSize(width: width, height: height)
        }
        else {
            if navigationItem.rightBarButtonItem?.title == "Table" {
                let width = (collectionView.frame.width - 3 * padding) / 2.0
                let height = (collectionView.frame.height - 3 * padding) / 4.0
                return CGSize(width: width, height: height)
            }
            else {
                let width = (collectionView.frame.width - 3 * padding)
                let height = (collectionView.frame.height - 3 * padding) / 4.0
                return CGSize(width: width, height: height)
            }

        }
    }
    
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.filterCollectionView {
            selectedCells.append(indexPath)
            
            if restaurants2.count == restaurants1.count {
                let requirement = filters[indexPath.item].filterName
                restaurants2 = restaurants1.filter({$0.cuisine.contains(requirement) || $0.time.contains(requirement) || $0.priceLevel == requirement})
            }
            else {
                restaurants2 = []
                for selectedCell in selectedCells {
                    let requirement = filters[selectedCell.item].filterName
                    restaurants2 = restaurants2 + restaurants1.filter({$0.cuisine.contains(requirement) || $0.time.contains(requirement) || $0.priceLevel == requirement})
                }

            }
            restaurantCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == self.filterCollectionView {
            if let removedCell = selectedCells.firstIndex(of: indexPath) {
                selectedCells.remove(at: removedCell)
                if selectedCells == [] {
                    restaurants2 = restaurants1
                }
                else {
                    for selectedCell in selectedCells {
                        let requirement = filters[selectedCell.item].filterName
                        restaurants2 = restaurants1.filter({$0.cuisine.contains(requirement) || $0.time.contains(requirement) || $0.priceLevel == requirement})
                    }
                }
                
            }
           restaurantCollectionView.reloadData()
        }
    }
    
}

extension ViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)

    }
    
}



    




