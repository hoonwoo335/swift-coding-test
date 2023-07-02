//: [Previous](@previous)

import Foundation

/*
 3진법 뒤집기
 https://school.programmers.co.kr/learn/courses/30/lessons/68935
 자연수 n이 매개변수로 주어집니다. n을 3진법 상에서 앞뒤로 뒤집은 후, 이를 다시 10진법으로 표현한 수를 return 하도록 solution 함수를 완성해주세요.
 제한사항
 n은 1 이상 100,000,000 이하인 자연수입니다.
 입출력 예
 n    result
 45    7
 125    229
 
 n (10진법)    n (3진법)    앞뒤 반전(3진법)    10진법으로 표현
 45           1200        0021             7
 */
func solution(_ n:Int) -> Int {
    //print(String(n, radix: 2))//binary
    let tenary = String(n, radix: 3)
    print(tenary)
    print(String(tenary.reversed()))
    
    // 속도는 이게 더 빠르다
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
    
    /*
    // 3진수 변환 날코드 (속도가 위에거 보다 느림)
    // tenary += String(val%3) 바로 뒤집어진 3진수로 값이 나온다.
    var tenary = ""
    
    var val = n
    while(val > 0) {
        tenary += String(val%3)
        val = val / 3
        print(val)
    }
    print(tenary)
    
    return Int(tenary, radix: 3)!
    */
}

let result = solution(45)
print(result)

//: [Next](@next)
