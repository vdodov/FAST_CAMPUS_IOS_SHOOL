//: [Previous](@previous)
import Foundation

/***************************************************
 1) 업캐스팅과 다운캐스팅에 대하여 설명하고,
 2) 업캐스팅과 다운캐스팅을 시도할 때 사용하는 키워드에 대해 각각 설명
 ***************************************************/
/***************************************************
 1)
 업 캐스팅
 - 상속 관계에 있는 자식 클래스가 부모 클래스로 형 변환하는 것
 - 업캐스팅은 항상 성공하며 as 키워드를 사용
   (자기 자신에 대한 타입 캐스팅도 항상 성공하므로 as 키워드 사용)
 
 다운 캐스팅
 - 형제 클래스나 다른 서브 클래스 등 수퍼 클래스에서 파생된 각종 서브 클래스로의 타입 변환 의미
 - 반드시 성공한다는 보장이 없으므로 옵셔널. as? 또는 as! 를 사용
 
 2)
 - as  : 타입 변환이 확실하게 가능한 경우(업캐스팅, 자기 자신 등) 에만 사용 가능. 그 외에는 컴파일 에러
 - as? : 강제 타입 변환 시도. 변환이 성공하면 Optional 값을 가지며, 실패 시에는 nil 반환
 - as! : 강제 타입 변환 시도. 성공 시 언래핑 된 값을 가지며, 실패 시 런타임 에러 발생
 ***************************************************/



/***************************************************
 TableView에서 셀을 재사용할 때 사용되는 아래의 두 메서드가 각각
 1) 언제 사용되고  2) 차이점은 무엇인지에 대하여 작성
 - (withIdentifier:)
 - dequeueReusableCell(withIdentifier:for:)
 ***************************************************/
/***************************************************
 1) 메서드 사용 시점
 register메서드를 통해 사용할 셀을 등록했거나 스토리보드에서 셀을 만들었을 때
 dequeueReusableCell(withIdentifier:for:) 사용,
 그 외의 경우는 dequeueReusableCell(withIdentifier:) 사용
 
 2) 차이점
 dequeueReusableCell(withIdentifier:)메서드는 반환 타입이 옵셔널이기에
 입력한 ID가 틀리거나 없어도 nil을 반환할 뿐 오류가 발생하지 않지만
 dequeueReusableCell(withIdentifier:for:)메서드는 미리 등록한 ID를 찾지 못하면
 반드시 런타임 에러가 발생
 ***************************************************/




/***************************************************
 safeAreaInsets  /  safeAreaLayoutGuide 의 차이점에 대해 작성
 ***************************************************/
/***************************************************
 safeAreaInsets
 - View와 SafeArea 영역 간의 간격 정보
 - Frame 기반으로 레이아웃을 잡을 때 사용
 
 safeAreaLayoutGuide
 - SafeArea 영역의 경계선 부분
 - AutoLayout 기반으로 레이아웃을 잡을 때 사용
 ***************************************************/




/***************************************************
 아래 두 초기화 메서드(생성자)의 공통점과 차이점에 대해 작성
 - init(frame: CGRect)
 - required init?(coder aDecoder: NSCoder)
 ***************************************************/
/***************************************************
 공통점
 - UIView의 초기화 메서드
 - 초기화 메서드를 별도로 작성하지 않았을 경우는 두 메서드 모두 미구현해도 무관

 차이점
 - init(frame: CGRect)메서드는 코드로 초기화할 때 사용
   required init?(coder aDecoder: NSCoder)메서드는 스토리보드에서 초기화할 때 사용
 - 다른 초기화 메서드를 하나라도 정의할 경우에는
   required init?(coder aDecoder: NSCoder)메서드 역시 반드시 정의해야 하지만(required)
   init(frame: CGRect)메서드는 옵셔널
 ***************************************************/



/***************************************************
 Strong Reference Cycle 에 대해 1) 설명하고 2) 예시 코드 작성
 ***************************************************/
/***************************************************
 서로 다른 (클래스의)인스턴스간 순환(cycle)이 되는 강한 참조를 유지하고 있어
 더 이상 사용되지 않거나 외부에서 접근할 수 있는 수단이 없음에도
 각 인스턴스가 다른 인스턴스를 지속해서 활성 상태로 만들게 되는 상태를 일컬음
 
 class A {
   var b: B?
 }
 class B {
   var a: A
   init(a: A) { self.a = a }
 }
 var a: A? = A()
 var b: B? = B(a: a!)
 a?.b = b
 a = nil
 b = nil
 ***************************************************/



/***************************************************
 Strong, Unowned, Weak 각각의 특징과 차이점에 대해 설명
 ***************************************************/
/***************************************************
 Strong
 - 강한 참조
 - 기본값
 - 인스턴스 참조 시 RC(Reference Count) 1 증가
 
 Unowned
 - 미소유 참조
 - RC 미증가
 - 참조하는 인스턴스 해제 시에도 기존 포인터 주소 유지
 
 Weak
 - 약한 참조
 - RC 미증가
 - 참조하던 인스턴스 해제 시 nil 값으로 변경
 ***************************************************/


//: [Next](@next)
