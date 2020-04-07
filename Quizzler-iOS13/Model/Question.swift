//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gilat Blumberger on 06/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Array<String>
    let correct: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        text = q
        answer = a
        correct = correctAnswer
    }
}
