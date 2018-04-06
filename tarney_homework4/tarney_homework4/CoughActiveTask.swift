//
//  CoughActiveTask.swift
//  tarney_homework4
//
//  Created by Brandon Tarney on 4/5/18.
//  Copyright © 2018 Johns Hopkins University. All rights reserved.
//

import ResearchKit

public var CoughActiveTask: ORKOrderedTask {
    return ORKOrderedTask.audioTask(withIdentifier: "CoughTask", intendedUseDescription: "Cough into the microphone.", speechInstruction: "*please cough*", shortSpeechInstruction: "*please cough*", duration: 7, recordingSettings: nil, checkAudioLevel: false, options: ORKPredefinedTaskOption.excludeAccelerometer)
}
