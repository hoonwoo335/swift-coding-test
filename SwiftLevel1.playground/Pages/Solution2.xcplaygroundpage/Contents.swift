//: [Previous](@previous)

import Foundation

/*
 성격유형 검사하기
 https://school.programmers.co.kr/learn/courses/30/lessons/118666
 
 지표 번호    성격 유형
 1번 지표    라이언형(R), 튜브형(T)
 2번 지표    콘형(C), 프로도형(F)
 3번 지표    제이지형(J), 무지형(M)
 4번 지표    어피치형(A), 네오형(N)
 
 choices    뜻
 1    매우 비동의
 2    비동의
 3    약간 비동의
 4    모르겠음
 5    약간 동의
 6    동의
 7    매우 동의
 
 survey    choices    result
 ["AN", "CF", "MJ", "RT", "NA"]    [5, 3, 2, 7, 5]    "TCMA"
 ["TR", "RT", "TR"]    [7, 1, 3]    "RCJA"
*/


func solution1(_ survey:[String], _ choices:[Int]) -> String {
    var result: [String] = Array(repeating: "", count: 4)
    //let choiceNum: [Int] = [1,2,3,4,5,6,7]
    let choicePoint: [Int] = [3,2,1,0,1,2,3]
    let signs: [[String]] = [["R","T"],["C","F"],["J","M"],["A","N"]]
    var totalPoint: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: 4)
    
    func checkChoicePoint(_ fstIdx: Int, _ secIdx: [Int], _ choice: Int) {
        if choice < 4 {
            totalPoint[fstIdx][secIdx[0]] += choicePoint[choice-1]
        }
        else if choice > 4 {
            totalPoint[fstIdx][secIdx[1]] += choicePoint[choice-1]
        }
        
        // result caculate
        if totalPoint[fstIdx][0] > totalPoint[fstIdx][1] || totalPoint[fstIdx][0] == totalPoint[fstIdx][1] {
            result[fstIdx] = signs[fstIdx][0]
        }
        else {
            result[fstIdx] = signs[fstIdx][1]
        }
    }
    
    for i in 0..<survey.count {
        let obj = survey[i]
        let choice = choices[i]
        
        if obj == "RT" || obj == "TR" { // 1
            if obj == "RT" {
                checkChoicePoint(0, [0,1], choice)
            }
            else {
                checkChoicePoint(0, [1,0], choice)
            }
        }
        else if obj == "CF" || obj == "FC" { // 2
            if obj == "CF" {
                checkChoicePoint(1, [0,1], choice)
            }
            else {
                checkChoicePoint(1, [1,0], choice)
            }
        }
        else if obj == "JM" || obj == "MJ" { // 3
            if obj == "JM" {
                checkChoicePoint(2, [0,1], choice)
            }
            else {
                checkChoicePoint(2, [1,0], choice)
            }
        }
        else if obj == "AN" || obj == "NA" { // 4
            if obj == "AN" {
                checkChoicePoint(3, [0,1], choice)
            }
            else {
                checkChoicePoint(3, [1,0], choice)
            }
        }
    }
    
    print("totalPoint - ",totalPoint)
    print("result - ",result)
    
    for i in 0..<result.count {
        if result[i] == "" {
            result[i] = signs[i][0]
        }
    }
    
    return result.joined(separator: "")
}

// refactoring
func solution2(_ survey:[String], _ choices:[Int]) -> String {
    var result: [String] = Array(repeating: "", count: 4)
    let choicePoint: [Int] = [3,2,1,0,1,2,3]
    let signs: [[String]] = [["R","T"],["C","F"],["J","M"],["A","N"]]
    var totalPoint: [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: 4)
    
    func checkChoicePoint(_ fstIdx: Int, _ secIdx: [Int], _ choice: Int) {
        if choice < 4 {
            totalPoint[fstIdx][secIdx[0]] += choicePoint[choice-1]
        }
        else if choice > 4 {
            totalPoint[fstIdx][secIdx[1]] += choicePoint[choice-1]
        }
        
        // result caculate
        if totalPoint[fstIdx][0] > totalPoint[fstIdx][1] || totalPoint[fstIdx][0] == totalPoint[fstIdx][1] {
            result[fstIdx] = signs[fstIdx][0]
        }
        else {
            result[fstIdx] = signs[fstIdx][1]
        }
    }
    
    for i in 0..<survey.count {
        let obj = survey[i]
        let choice = choices[i]
        let char = obj.prefix(1)// 앞글자만 가져오기
        
        for j in 0..<signs.count {
            if char == signs[j][0] {
                checkChoicePoint(j, [0,1], choice)
            }
            else if char == signs[j][1] {
                checkChoicePoint(j, [1,0], choice)
            }
        }
    }
    
    print("totalPoint - ",totalPoint)
    print("result - ",result)
    
    for i in 0..<result.count {
        if result[i] == "" {
            result[i] = signs[i][0]
        }
    }
    
    return result.joined(separator: "")
}

//let survey = ["AN", "CF", "MJ", "RT", "NA"]
//let choices = [5, 3, 2, 7, 5]
let survey = ["TR", "RT", "TR"]
let choices = [7, 1, 3]

let result = solution2(survey, choices)
print(result)

//: [Next](@next)
