# Spring Project 3조


쌍용강북교육센터

git_hub 기반의 스프링을 활용한 실전 프레임워크 설계와 구축 개발자

스프링 실습 프로젝트 3조 독수리5형제 팀

쇼핑몰 서비스 개발 프로젝트.

## Team

독수리5형제 

- 김영재: Project Manager

- 김태영

- 마성익

- 전창건

- 황인배

## 프로젝트 진행 동기 및 목적

1. 기본적으로 상품소개, 판매서비스를 제공하고  심플하고 직관적인 UI를 통해 상품에 대한 고객의 편의성뿐만 아니라
1.  쇼핑몰 CEO가 상품등록 등의 기능을 통해 직접 관리할 수 있는 차별  화된 서비스를 제공
1. Java, Oracle, Web(HTML, CSS, JavaScript), Web Programming(Servlet, JSP), Spring Framework 등 Spring Web MVC 개발 전반에 걸쳐 주요 기술을 숙달할 수 있다.

## 아이템 선정 동기
- 개발자로서 가장 사회에서 많이 접하게 될 아이템을 주제로 선정.
> 2015년 성인 20-40대 기준 인터넷 쇼핑 이용률은 72% 2016년 11월 온라인 쇼핑몰 600만개 돌파 최대 한달 50만개의 쇼핑몰 오픈

## 참고
- [ziozia](https://www.ziozia.co.kr/main.asp)
- [zara](http://www.zara.com/kr/)

## 기능

### 회원

- 로그인
  - 비밀번호 찾기
  - SNS 계정연동
- 회원가입
  - 이메일인증
- 회원관리
  - 수정
  - 탈퇴
- 장바구니
  - 구매
  - 담기
   - 삭제
- 공지 게시판
   - 조회
- 이벤트 게시판
   - 조회
   - 쿠폰받기
- 내가쓴게시물
   - 조회
   - 삭제
- 적립금&쿠폰
   - 조회
- 구매내역 확인
   - 기간별 조회
- 리뷰
  - 등록(사진첨부O)
   - 조회
   - 삭제
- Q&A
   - 등록
   - 조회
   - 삭제
- 상품상세조회
   - 품목별 분류
- 오늘본상품

### 관리자
- 로그인
- 제품관리
   - 등록
   - 수정
   - 삭제
   - 조회
- 게시판 관리
   - 등록
   - 수정
   - 삭제
   - 답글
- 쿠폰&적립금
   - 등록
   - 지급
   - 수정
   - 삭제
- 판매관리
   - 기간별 조회
   - 배송상태 변경
   - 엑셀파일 변환
- 배너
   - 수정
   - 등록

### 기타
- 팀 소개

|일|월|화|수|목|금|토|
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
|03/12|[03/13][01]|[03/14][02]|[03/15][03]|[03/16][04]|[03/17][05]|03/18|
|-|기획|분석|분석|설계<br>(화면구성)|설계<br>(화면구성)|-|
|03/19|[03/20][06]|[03/21][07]|[03/22][08]|[03/23][09]|[03/24][10]|03/25|
|-|설계<br>(문서화)|설계<br>(DB모델링)|설계<br>(쿼리작성)|코딩 컨벤션|기능 구현|-|
|03/26|[03/27][11]|[03/28][12]|[03/29][13]|[03/30][14]|[03/31][15]|04/01|
|-|기능 구현|기능 구현|기능 구현|기능 구현|기능 구현|-|
|04/02|[04/03][16]|[04/04][17]|[04/05][18]|[04/06][19]|[04/07][20]|04/08|
|-|기능 구현|기능 구현|기능 구현|기능 구현|테스트|-|
|04/09|[04/10][21]|[04/11][22]|[04/12][23]|[04/13][24]|[04/14][25]|04/15|
|-|유효성검사|테스트|테스트|발표 준비|발표|-|

![Plan](http://sistfers.github.io/ingsta/docs/plan.png)

[01]: http://sistfers.github.io/ingsta/2017/03/13/planning.html "2017-03-13 기획"
[02]: http://sistfers.github.io/ingsta/2017/03/14/analysis.html "2017-03-14 분석"
[03]: http://sistfers.github.io/ingsta/2017/03/15/analysis.html "2017-03-15 분석"
[04]: http://sistfers.github.io/ingsta/2017/03/16/design.html "2017-03-16 설계"
[05]: http://sistfers.github.io/ingsta/2017/03/17/design.html "2017-03-17 설계"
[06]: http://sistfers.github.io/ingsta/2017/03/20/design.html "2017-03-20 설계"
[07]: http://sistfers.github.io/ingsta/2017/03/21/design.html "2017-03-21 설계"
[08]: http://sistfers.github.io/ingsta/2017/03/22/design.html "2017-03-22 설계"
[09]: http://sistfers.github.io/ingsta/2017/03/23/design.html "2017-03-23 설계"
[10]: http://sistfers.github.io/ingsta/2017/03/24/design.html "2017-03-24 설계"
[11]: http://sistfers.github.io/ingsta/2017/03/27/design.html "2017-03-27 설계"
[12]: http://sistfers.github.io/ingsta/2017/03/28/implementation.html "2017-03-28 구현"
[13]: http://sistfers.github.io/ingsta/2017/03/29/implementation.html "2017-03-29 구현"
[14]: http://sistfers.github.io/ingsta/2017/03/30/implementation.html "2017-03-30 구현"
[15]: http://sistfers.github.io/ingsta/2017/03/31/implementation.html "2017-03-31 구현"
[16]: http://sistfers.github.io/ingsta/2017/04/03/implementation.html "2017-04-03 구현"
[17]: http://sistfers.github.io/ingsta/2017/04/04/implementation.html "2017-04-04 구현"
[18]: http://sistfers.github.io/ingsta/2017/04/05/implementation.html "2017-04-05 구현"
[19]: http://sistfers.github.io/ingsta/2017/04/06/implementation.html "2017-04-06 구현"
[20]: http://sistfers.github.io/ingsta/2017/04/07/implementation.html "2017-04-07 구현"
[21]: http://sistfers.github.io/ingsta/2017/04/10/test.html "2017-04-10 시험"
[22]: http://sistfers.github.io/ingsta/2017/04/11/test.html "2017-04-11 시험"
[23]: http://sistfers.github.io/ingsta/2017/04/12/test.html "2017-04-12 시험"
[24]: http://sistfers.github.io/ingsta/2017/04/13/test.html "2017-04-13 시험"
[25]: http://sistfers.github.io/ingsta/2017/04/14/presentation.html "2017-04-14 발표"



## Repository

[GitHub](http://github.com/sistfers/ingsta)

## Modeling

[Modeling](https://github.com/sistfers/Man-In-Black/tree/master/modeling)

### Entity-Relationship Diagram

![ERD](https://github.com/sistfers/Man-In-Black/blob/master/modeling/Man_In_Black_ERD.png?raw=true)

### Flowchart

![Flowchart](https://github.com/sistfers/Man-In-Black/blob/master/modeling/Flowchart.jpg)

## 개발 환경 및 개발 툴
- [Java SE 8 (Oracle JDK 1.8.x)](http://www.oracle.com/technetwork/java/javase/downloads)
- [Oracle Database 12c Release 1 (12.1.x Enterprise Edition)](http://www.oracle.com/technetwork/database/enterprise-edition/downloads)
- [Spring Tool Suite (3.8.x)](http://spring.io/tools/sts/all)
- [Apache Tomcat (8.5.x)](http://tomcat.apache.org)
- [Apache Maven (3.3.x)](http://maven.apache.org)
- [eXERD](http://exerd.com)
- [Gliffy Diagrams](http://www.gliffy.com)
- [Git](http://git-scm.com)
- [GitHub](http://github.com)
- [Maven Central Repository](http://maven.org)

## 적용 기술 및 라이브러리 의존성
- [Spring Framework 4.3.x](http://projects.spring.io/spring-framework)
- [JUnit 4.12](http://junit.org/junit4)
- [MyBatis 3.4.x](http://www.mybatis.org/mybatis-3)
- [MyBatis-Spring 1.3.x](http://www.mybatis.org/spring)
- [Servlet 3.1.x](http://jcp.org/en/jsr/detail?id=340)
- [JSP 2.3.x](http://jcp.org/en/jsr/detail?id=245)
- [EL 3.0.x](http://jcp.org/en/jsr/detail?id=341)
- [JSTL 1.2.x](http://jcp.org/en/jsr/detail?id=52)
- [JSON Processing](http://jcp.org/en/jsr/detail?id=374)
- [Oracle JDBC Thin Driver 12.2.0.1](http://www.oracle.com/technetwork/database/features/jdbc/jdbc-ucp-122-3110062.html)
- [Oracle 11g Release 2 (11.2) Standard SQL](http://docs.oracle.com/cd/E11882_01/server.112/e41084/ap_standard_sql.htm)
- [Oracle 12c Release 1 (12.1) Standard SQL](http://docs.oracle.com/database/121/SQLRF/ap_standard_sql.htm)
- [HTML5](http://w3.org/TR/html5)
- [CSS3](http://w3.org/TR/CSS)
- [JavaScript (ECMA-262 ECMAScript)](http://ecma-international.org/publications/standards/Ecma-262.htm)
- [jQuery 3.1.x](http://jquery.com)
- [jQuery UI 1.12.x](http://jqueryui.com)
- [Bootstrap 3.3.x](http://bootstrapk.com)
- [Log4j 2.8.x](http://logging.apache.org/log4j)
- [SLF4J 1.7.x](http://slf4j.org)
- [Semantic Versioning](http://semver.org)
- [NAVER Maps](http://github.com/navermaps/maps.js)
- [NAVER SmartEditor](http://github.com/naver/smarteditor2)
- [Daum Maps](http://apis.map.daum.net)
- [Daum Postcode](http://github.com/daumPostcode)
- [Google Maps](http://enterprise.google.com/intl/ko/maps)

## 배포 타겟 서버 런타임 환경 및 브라우저 호환성
- Microsoft Windows 10 Insider Preview
- Oracle Java SE HotSpot Virtual Machine JRE 8u121
- Oracle Database 12c Release 1 Enterprise Edition 12.1.0.2.0
- Apache Tomcat 8.5.12
- Chrome Stable Version

## Site
[GitHub Pages](http://sistfers.github.io/Man-In-Black)

## Repository
[GitHub](http://github.com/sistfers/Man-In-Black)
