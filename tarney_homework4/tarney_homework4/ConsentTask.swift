//
//  ConsentTask.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/4/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit
import ResearchKit

public var ConsentTask: ORKOrderedTask
{
    var steps = [ORKStep]()
    
    let consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    let signature = consentDocument.signatures!.first
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    
    reviewConsentStep.text = "Review Consent"
    reviewConsentStep.reasonForConsent = "I consent to this app's use of my data and privacy."
    
    steps += [reviewConsentStep]
    
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
    
}

