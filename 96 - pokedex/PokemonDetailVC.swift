//
//  PokemonDetailVC.swift
//  96 - pokedex
//
//  Created by Chaloemphol Preedarat on 17.04.16.
//  Copyright © 2016 Chaloemphol Preedarat. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var currentEvoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImage.image = img
        currentEvoImage.image = img

        
        pokemon.downloadPokemonDetails { () -> () in
            //this will be called after download is done.
            self.updateUI()
//            print("oh we get here!")
        }
    }
    
    func updateUI() {
        descLabel.text = pokemon.description
        typeLabel.text = pokemon.type
        defLabel.text = pokemon.defense
        
        heightLabel.text = pokemon.height
        pokedexLabel.text = "\(pokemon.pokedexId)"
        
        weightLabel.text = pokemon.weight
        baseAttackLabel.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            evoLabel.text = "No Evolutions"
            nextEvoImage.hidden = true
        } else {
            nextEvoImage.hidden = false
            nextEvoImage.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLevel != "" {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            evoLabel.text = str
        
        }
        
        
        
        
    }

    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
