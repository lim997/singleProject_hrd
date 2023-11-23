# Management site

회원 관리 및 수강신청 사이트.



# 프로젝트 개요

"로그인과 회원가입 기능이 포함된 회원 관리 사이트 만들기"라는 주제로 프로젝트를 진행하게 되었다. 조금 더 특별한 내용을 담은 사이트를 만들고 싶어 훈련 기관이라는 권한을 추가하였다.
프로젝트를 진행하면서, 내일배움카드를 통해 강의를 수강하는 나의 상황과 유사한 부분을 발견했다. 이에 착안하여 직업훈련포털 사이트의 디자인을 활용했다.



# 프로젝트 목표

- 로그인과 회원가입 기능이 포함된 회원 관리 사이트 제작.
- 훈련 기관은 수강을 신청한 회원들을 관리하고, 관리자는 일반 회원과 훈련 기관을 관리하는 역할을 수행.
- 다양한 권한과 기능을 추가함으로써, 일반적인 회원 관리 사이트를 뛰어넘어 특별하고 전문적인 사이트를 만드는 것을 목표로 함.



# 프로젝트 일정

 - 2023.07.07 ~ 2023.07.14



# 개발 환경

- 운영 체제 (OS): Windows 10 Pro (64-bit)
- 프로세서: Intel Core i5-9400F @ 2.90GHz
- JDK : JDK 17
- 개발 툴 : Eclipse(4.25), HeidiSQL
- 개발 언어 : Java, JSP, Javascript, jQuery, HTML, CSS
- 프레임워크 : Next.js
- 데이터베이스 : MySQL
- 형상 관리 : Git



# 프로젝트 기능

1. 메인 화면: 로그인 시 권한에 맞는 버튼 활성화.
2. 로그인: 입력한 값이 데이터베이스의 값과 일치하면 해당 정보로 로그인.
3. 회원가입: 중복 확인과 정규식을 이용하여 올바른 값을 입력받음.
4. 마이페이지 : 입력한 정보를 관리. 수강중인 강의가 있을 때는 탈퇴할 수 없음.
5. 수강 신청 조회 : 수강 신청 목록 출력. 신청이 승인되지 않은 경우에 취소 가능.
6. 훈련 관리 : 훈련 강의를 추가하고 수정. 수강 신청을 승인하거나 취소할 수 있으나, 모집 인원보다 많은 인원은 승인 불가.
7. 회원 관리 : 선택한 권한과 일치하는 목록을 출력. 코드의 중복 없이 한 페이지를 두 페이지처럼 활용.
8. 훈련 목록 검색 : 원하는 훈련과정을 출력하고 수강을 신청할 수 있음. 카테고리를 데이터베이스에서 가져와 확장성 있는 코드 사용.



# 화면 구현

1. 메인화면
   
<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/01main.png"/>

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/01main_status.png"/>

2. 로그인

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/02login.png"/>

3. 회원가입

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/03join.png"/>

4. 마이페이지: 정보 관리

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/04edit.png"/>

5. 수강 신청 목록 조회

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/05user_class_list.png"/>

6. 훈련 강의 관리

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/06class_edit.png"/>

7. 훈련별 수강 학생 목록 관리

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/07class_student_list.png"/>

8. 회원 관리

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/08user.png"/>

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/08user_list.png"/>

9. 훈련 목록 조회 및 검색

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/09class_list.png"/>

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/09class_list_search.png"/>

10. 훈련 상세 정보

<img width="60%" src="https://github.com/lim997/singleProject_hrd/blob/main/images/10class_details.png"/>


# 자체 평가

 짧은 기간의 프로젝트임에도 불구하고, 많은 기능을 구현하고자 하여 시간적인 부담을 많이 느꼈다. 이 경험으로 실현 가능한 개발 계획을 세우는 것이 중요하다는 것을 배웠다.
 다음 프로젝트에서는 나만의 디자인을 가진 독창적 사이트를 만들고 싶다는 욕심이 생겼다.
