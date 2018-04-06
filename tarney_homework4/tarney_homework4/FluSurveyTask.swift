//
//  FluSurveyTask.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/5/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import ResearchKit

public var FluSurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //instructions step
    let instructionStep = ORKInstructionStep(identifier: "InstructionStep")
    instructionStep.title = "Flu Survey"
    instructionStep.text = "Please answer all survey questions to the best of your ability."
    steps += [instructionStep]

    //Text choices in survey
    let textChoices = [
        ORKTextChoice(text: "Yes", value: 0 as NSValue),
        ORKTextChoice(text: "No", value: 1 as NSValue)
    ]
    let questionAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    
    //Do you have a runny nose? (yes/no)
    let runnyNoseQuestionStepTitle = "Do you have a runny nose?"
    let runnyNoseQuestionStep = ORKQuestionStep(identifier: "RunnyNoseQuestionStep", title: runnyNoseQuestionStepTitle, answer: questionAnswerFormat)
    steps += [runnyNoseQuestionStep]
    
    //Have you had any hot flashes today?
    let hotFlashQuestionTitle = "Have you had any hot flashes today?"
    let hotFlashQuestionStep = ORKQuestionStep(identifier: "HotFlashQuestionStep", title: hotFlashQuestionTitle, answer: questionAnswerFormat)
    steps += [hotFlashQuestionStep]
    
    //Have you made contact with someone who had the flu or was otherwise sick?
    let contactQuestionTitle = "Have you made contact with someone who had the flu or was otherwise sick?"
    let contactQuestionStep = ORKQuestionStep(identifier: "ContactQuestionStep", title: contactQuestionTitle, answer: questionAnswerFormat)
    steps += [contactQuestionStep]
    
    //Do you think or feel "sick"?
    let sickQuestionTitle = "Do you think or feel-like you are sick?"
    let sickQuestionStep = ORKQuestionStep(identifier: "SickQuestionStep", title: sickQuestionTitle, answer: questionAnswerFormat)
    steps += [sickQuestionStep]
    
    //Numeric Questions in Survey
    //What is your current temperature? (numeric input)
    //How are you feeling today, on a scale of 1-10? (lower number means you feel LESS well)
//    let feelingQuestionFormat = ORKNumericAnswerFormat.init(style: <#T##ORKNumericAnswerStyle#>, unit: <#T##String?#>, minimum: <#T##NSNumber?#>, maximum: <#T##NSNumber?#>)
    
    //How sore is your body, on a scale of 1-10? (lower number means your feel LESS sore)
    
    //summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Thanks for taking the survey"
    summaryStep.text = "We will contact you with your results shortly"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "FluSurveyTask", steps: steps)
}
