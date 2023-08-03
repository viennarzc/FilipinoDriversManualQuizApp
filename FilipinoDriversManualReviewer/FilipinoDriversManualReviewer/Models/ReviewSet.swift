//
//  ReviewSet.swift
//  FilipinoDriversManualReviewer
//
//  Created by Viennarz Curtiz on 8/3/23.
//

import Foundation

class ReviewSet: Decodable {
    let title: String
    let subtitle: String
    let yearEdition: Int
    let driversLicenseCode: [String]
    let generalDesc: String
    let list: [QuestionListItem]
}

class QuestionListItem: Decodable {
    let answer: String
    let question: String
    let answerOptions: [AnswerOption]
}

class AnswerOption: Decodable {
    let code: String
    let desc: String
}

//{
//  "subtitle" : "Light (B, B1, B2)",
//  "title" : "Nonprofessional",
//  "yearEdition" : 2021,
//  "driversLicenseCode" : [
//    "B",
//    "B1",
//    "B2"
//  ],
//  "generalDesc" : "Light",
//  "list" : [
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : ""
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : ""
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "turn your wheels toward the curb"
//        }
//      ],
//      "answer" : "",
//      "question" : "When parking downhill, you must"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "turn your wheels away from the curb"
//        }
//      ],
//      "answer" : "",
//      "question" : "When parking uphill, you must:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : "A solid yellow or white line on the road means:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : "A red flag or red light must be attached to any load that extends over:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Poor coordination of body movements and lack of self-judgment"
//        }
//      ],
//      "answer" : "",
//      "question" : "one (1.0) meter from the body of the vehicle"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : "In a toll gate, a red X light/sign means:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "edge of the road"
//        }
//      ],
//      "answer" : "",
//      "question" : " What does a flashing red light mean"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Left arm bent at elbow, hand pointing up"
//        }
//      ],
//      "answer" : "",
//      "question" : "What hand signal must a driver give when he/she wants to turn right?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "One car length apart"
//        }
//      ],
//      "answer" : "",
//      "question" : "At a normal speed, what is the safety rule when following behind another car?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : ""
//        }
//      ],
//      "answer" : "",
//      "question" : "A driver of a vehicle approaching a crossing or intersection shall:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "2-second rule"
//        }
//      ],
//      "answer" : "",
//      "question" : "At a normal speed, keeping one's distance lessens the risk of road crash. One good rule is to leave a car length or follow the __________."
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Look out for cyclists/ motorcyclists filtering through the traffic"
//        }
//      ],
//      "answer" : "",
//      "question" : "What should you do if you drive in heavy traffic and want to change lanes?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "At intersections and when approaching a bridge, curve, or a crest\nSolid yellow or white line, shoulder of the road, railroad, hospital and school zone, busy streets"
//        }
//      ],
//      "answer" : "",
//      "question" : "Where should you NOT overtake?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Perpetual forfeiture of driver's license"
//        }
//      ],
//      "answer" : "",
//      "question" : "What is the maximum penalty for driving under the influence of liquor or prohibited drugs?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Make a signal"
//        }
//      ],
//      "answer" : "",
//      "question" : "What should be done first when changing lanes?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "acceleration lane (continuity lane)"
//        }
//      ],
//      "answer" : "",
//      "question" : "When merging on expressway, you have to make full use of the:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Do NOT drive or consult a doctor before driving"
//        }
//      ],
//      "answer" : "",
//      "question" : "What should a driver do when he is under medication that can affect his driving?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "NEVER permitted"
//        }
//      ],
//      "answer" : "",
//      "question" : "Crossing a double solid yellow line is ___________"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : ""
//        }
//      ],
//      "answer" : "",
//      "question" : "What must a driver do when an elderly person crosses the pedestrian lane?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "left lane/first lane (leftmost)"
//        }
//      ],
//      "answer" : "",
//      "question" : "On a two-lane road with normal traffic situation, overtaking is only allowed at the:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Prepare to slow down and stay on your lane for a safer travel"
//        }
//      ],
//      "answer" : "",
//      "question" : "What should you do when your vehicle is approaching a crest?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "decrease your reaction time, impair your judgment, and give you a false sense of confidence"
//        }
//      ],
//      "answer" : "",
//      "question" : "Drinking any amount of alcohol while driving may:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "vehicles turning on that direction shall proceed"
//        }
//      ],
//      "answer" : "",
//      "question" : "A green arrow traffic light means:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "warn other road users of your presence"
//        }
//      ],
//      "answer" : "",
//      "question" : "Motor vehicle's horn is used to:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "The vehicles within the roundabout"
//        }
//      ],
//      "answer" : "",
//      "question" : "Which vehicles have the right-of- way at a rotunda or roundabout?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Listening to loud music, using mobile phone or gadget, watching videos, rubbernecking, and engaging in long conversations with passenger/s"
//        }
//      ],
//      "answer" : "",
//      "question" : "What could be a reason for a driver to lose his concentration in driving?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "when turning into a driveway"
//        }
//      ],
//      "answer" : "",
//      "question" : "In a single solid yellow line, you are allowed to cross only:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "stop at a safe side of the road to answer or make a call"
//        }
//      ],
//      "answer" : "",
//      "question" : "If you are driving and you need to use your mobile phone, you should:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Slow down and prepare to stop\nStudents are expected to cross the street"
//        }
//      ],
//      "answer" : "",
//      "question" : "What should you do if the school service is parked on the other side of the highway while the hazard warning light is on?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "either on the right or the left lane if it is free from obstruction"
//        }
//      ],
//      "answer" : "",
//      "question" : "On a one-way road, overtaking is permitted:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Police patrols and authorized Traffic Enforcer’s vehicle"
//        }
//      ],
//      "answer" : "",
//      "question" : " What vehicles are allowed to use a red and blue flashing light (blinker)?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "using mobile phone while driving"
//        }
//      ],
//      "answer" : "",
//      "question" : "One of the prohibited driving acts that could place your life at risk is"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Rightmost lane"
//        }
//      ],
//      "answer" : "",
//      "question" : "In which lane should you take upon merging on the expressway?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "illegal modification"
//        }
//      ],
//      "answer" : "",
//      "question" : "If a driver operates a motor vehicle with a blinking/running/flashing brake light, he/she will be apprehended for:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "NO, not in any time\nIt may cause confusion to other motorists and it may cause road crash"
//        }
//      ],
//      "answer" : "",
//      "question" : "Are you allowed to leave your motor vehicle while the engine is running at a complete stop on the road?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "low level or leaking brake fluid"
//        }
//      ],
//      "answer" : "",
//      "question" : "This could be one of the possible causes of road crash, if neglected:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "child restraint system"
//        }
//      ],
//      "answer" : "",
//      "question" : "Under R.A. No. 11229, a child twelve (12) years old and below cannot sit at the back seat of a moving vehicle without the use of a ________________"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "to warn a hazard ahead (such as vehicle being towed, and road works ahead)"
//        }
//      ],
//      "answer" : "",
//      "question" : "While driving on the road, the driver is allowed to use warning (hazard) lights if needed:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "be patient, expect them to make mistakes"
//        }
//      ],
//      "answer" : "",
//      "question" : "When following a student-driver, you should:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "pull and stop into a passing place when loading or unloading"
//        }
//      ],
//      "answer" : "",
//      "question" : "You are driving on a single-lane road with passing places only at the right, you should:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "Continue driving in that lane until it is safe to return to the proper lane"
//        }
//      ],
//      "answer" : "",
//      "question" : " You are approaching a busy junction with several lanes that has road markings. Suddenly, you entered the wrong lane. What should you do?"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "NOT park anytime, unless you are or with a PWD\nPWD parking spaces are intended only for PWDs"
//        }
//      ],
//      "answer" : "",
//      "question" : "You entered a fully occupied parking area except for a vacant PWD parking space. You can:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "making an emergency call at a safe place"
//        }
//      ],
//      "answer" : "",
//      "question" : "You CANNOT use your mobile phone while driving, unless ______________________."
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "on the lay-by"
//        }
//      ],
//      "answer" : "",
//      "question" : "When driving on expressways, you may stop to attend or call for an emergency:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "move to the other lane with care"
//        }
//      ],
//      "answer" : "",
//      "question" : "You are driving on the leftmost of a multiple-lane road and you see signs of a closed road ahead. You should:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "pedestrians and motor vehicles with the first priority right-of-way"
//        }
//      ],
//      "answer" : "",
//      "question" : "Before turning, you are required to give way to:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "slow down to stop and give way"
//        }
//      ],
//      "answer" : "",
//      "question" : "When an emergency vehicle is approaching behind you with a siren and flashing lights, you must:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "slow down to stop and give way"
//        }
//      ],
//      "answer" : "",
//      "question" : "When an emergency vehicle is approaching behind you with a siren and flashing lights, you must:"
//    },
//    {
//      "answerOptions" : [
//        {
//          "code" : "",
//          "desc" : "traffic enforcer"
//        }
//      ],
//      "answer" : "",
//      "question" : "You are only allowed to stop on expressways when instructed by a ________________"
//    }
//  ]
//}
