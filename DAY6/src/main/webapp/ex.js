
let x; // 전역 변수 x 선언. var로 선언해도 동일
function f() {
	let y; // 함수 f() 내에서만 사용되는 지역 변수 y 선언. var로 선언해도 동일
	x = 10; // 전역 변수 x에 10 저장
	y = 20; // 지역 변수 y에 20 저장
	z = 30; // 새로운 전역 변수 z가 선언되고 30이 저장됨
	if(y == 20) {
		let b = 40; // if 블록에서만 사용되는 블록 변수 b 선언
		b++;
		document.write("if 블록 내 블록변수 b = " + b + "<br>");
	} // if문 끝
	// 이곳에서는 블록 변수 b에 접근할 수 없음
	// 이곳에서는 변수 x, y, z에 모두 접근 가능
	document.write("함수 f() 내 지역변수 y = " + y + "<br>");
} //함수 f 끝

f(); // 함수 f() 호출
document.write("전역변수 x = " + x + "<br>");
document.write("전역변수 z = " + z);
document.write("지역변수 z = " + b);
// 이곳에서는 변수 x와 z만 접근 가능, 지역 변수 y와 블록 변수 b는 접근 불가
