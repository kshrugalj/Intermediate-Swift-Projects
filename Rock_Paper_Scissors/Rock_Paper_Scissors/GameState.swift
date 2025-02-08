//
//  GameState.swift
//  Rock_Paper_Scissors
//
//  Created by Kshrugal Reddy Jangalapalli on 11/30/24.
//
enum GameState{
    case start, win, lose, draw
    
    var status:String{
        switch self{
        case .start:
            return "Rock, Paper, Scissors?"
        case .win:
            return "You Win!"
        case .lose:
            return "You Lose!"
        case .draw:
            return "Draw!"
        }
    }
}
