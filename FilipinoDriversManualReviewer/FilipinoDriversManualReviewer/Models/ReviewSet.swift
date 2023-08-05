//
//  ReviewSet.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

class ReviewSet: Decodable {
    internal init(title: String, subtitle: String, yearEdition: Int, driversLicenseCode: [String], generalDesc: String, list: [QuestionListItem]) {
        self.title = title
        self.subtitle = subtitle
        self.yearEdition = yearEdition
        self.driversLicenseCode = driversLicenseCode
        self.generalDesc = generalDesc
        self.list = list
    }
    
    let title: String
    let subtitle: String
    let yearEdition: Int
    let driversLicenseCode: [String]
    let generalDesc: String
    let list: [QuestionListItem]
    
    var shuffledQuestionSet: [QuestionListItem] {
        Array(list.shuffled().prefix(upTo: 20))
    }
}

class QuestionListItem: Identifiable, Decodable {
    internal init(answer: String, question: String, answerOptions: [AnswerOption]) {
        self.answer = answer
        self.question = question
        self.answerOptions = answerOptions
    }
    
    var id: String { question }
    let answer: String
    let question: String
    let answerOptions: [AnswerOption]
}

extension QuestionListItem: Equatable {
    static func == (lhs: QuestionListItem, rhs: QuestionListItem) -> Bool {
        lhs.id == rhs.id && lhs.answer == rhs.answer
    }
}

class AnswerOption: Identifiable, Decodable {
    var id: String { code }
    let code: String
    let desc: String
    
    init(code: String, desc: String) {
        self.code = code
        self.desc = desc
    }
}

extension AnswerOption: Equatable {
    static func == (lhs: AnswerOption, rhs: AnswerOption) -> Bool {
        lhs.id == rhs.id && lhs.desc == rhs.desc
    }
}
