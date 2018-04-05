//
//  ConsentDocument.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/4/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import UIKit
import ResearchKit

public var ConsentDocument : ORKConsentDocument
{
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Consent for Flu Study!"
    
    let contentSectionTypes:[ORKConsentSectionType] = [.overview, .dataGathering, .privacy]
    
    //Define Content Sections for each content Section Type
    var contentSections:[ORKConsentSection] = []
    let overviewContentSection:ORKConsentSection  = ORKConsentSection(type: contentSectionTypes[0])
    overviewContentSection.summary = "This app will attempt to diagnose whether you have the Flu"
    overviewContentSection.content = "By examining your posible flu-like symptoms, combined with other, non-obvious symptoms, we can potentially diagnose whether you have the flu or should at least see a medical professional"
    contentSections.append(overviewContentSection)
    
    let dataContentSection:ORKConsentSection  = ORKConsentSection(type: contentSectionTypes[1])
    dataContentSection.summary = "This app will gather data on you as it gathers your physical and emotional well-being"
    dataContentSection.content = "We will gather information regarding your physical and mental health, such as how do you feel, how much did you sleep, what is your current temperature, etc"
    contentSections.append(dataContentSection)
    
    let privacyContentSection:ORKConsentSection  = ORKConsentSection(type: contentSectionTypes[2])
    privacyContentSection.summary = "This app will ONLY share your data with medical professionals"
    privacyContentSection.content = "The app may share data gathered with medical professionals to further the diagnosis of the Flu and to determine how widespread the disease-is."
    contentSections.append(privacyContentSection)

    consentDocument.sections = contentSections
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
}

