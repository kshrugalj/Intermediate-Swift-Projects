//
//  FoodTableViewController.swift
//  Meal Tracker
//
//  Created by Kshrugal Reddy Jangalapalli on 10/27/24.
//
import UIKit

class FoodTableViewController: UITableViewController {
    var meals : [Meal]{
        let breakfast = Meal(name: "Breakfast", food: [
            Food(name: "Omlette", description: "Fried eggs with vegetables"),
            Food(name: "Cereal", description: "Grains with milk and sugar mixed"),
            Food(name: "Bagel", description: "A bagel with cream cheese and butter")])
        
        let lunch = Meal(name: "Lunch", food: [
            Food(name: "Sandwich", description: "A sandwich with cheese and bread"),
            Food(name: "Salad", description: "A salad with vegetables and dressing"),
            Food(name: "Pizza", description: "A pizza with cheese and sauce")])
        
        let dinner = Meal(name: "Dinner", food: [
            Food(name: "Steak", description: "A steak with vegetables and sauce"),
            Food(name:"Chicken Alfredo", description: "Noodles with chicken strips cooked with alfredo sauce"),
            Food(name:"Pasta", description: "Pasta with vegetables and sauce")])
        
        return [breakfast, lunch, dinner]
        
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
    }
    
}
