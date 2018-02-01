//
//  Question.swift
//  Quizzler
//
//  Created by Mohamd El-abd on 1/14/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    
    let modelQuestion : String
    let modelAnswer : Bool
    
    
    init(text : String , correctAnswer : Bool){
        
        modelQuestion = text
        modelAnswer = correctAnswer
    }
    
    
}
