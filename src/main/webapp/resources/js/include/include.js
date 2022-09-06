
// 헤더 검색바 클릭시 border color 변경
const searchBar = document.querySelector('.filter-bar-search>input');
const searchButton = document.querySelector('.filter-bar-search button');

searchBar.onfocus = () => {	// 검색 클릭 시
  searchButton.style.borderColor = '#2370DF';
}

searchBar.onblur = () => { 
  searchButton.style.borderColor = '#eee';
}

// 네비게이션바 설정
// 이동한 페이지가 클래스 or 커뮤니티 페이지면 nav바 색상 고정
const navBoardMenu = document.querySelector('#navBoardMenu');
const navClassMenu = document.querySelector('#navClassMenu');

if( location.href.indexOf('/class') > -1 ) {
  navClassMenu.classList.add('active');
} else {
  navClassMenu.classList.remove('active');
} // if-else

if( location.href.indexOf('/board') > -1 ) {
  navBoardMenu.classList.add('active');
} else {
  navBoardMenu.classList.remove('active');
} // if-else


