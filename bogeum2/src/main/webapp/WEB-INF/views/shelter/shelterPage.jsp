<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="../layout/header.jsp"%>
  <link rel="stylesheet" href="/css/reset.css">
  <link rel="stylesheet" href="/css/shelter.css">
  <div class="container">
    <div class="filter_wrap">
      <div class="control-group">
        <h1>조건1</h1>
          <label class="control control--radio">전체
              <input type="radio" name="animal" value="" checked="checked"/>
              <div class="control__indicator"></div>
          </label>
        <label class="control control--radio">강아지
          <input type="radio" name="animal" value="417000"/>
          <div class="control__indicator"></div>
        </label>
        <label class="control control--radio">고양이
          <input type="radio" name="animal" value="422400"/>
          <div class="control__indicator"></div>
        </label>
        <label class="control control--radio">기타
          <input type="radio" name="animal" value="429900"/>
          <div class="control__indicator"></div>
        </label>
      </div>
      <div class="control-group">
        <h1>조건2</h1>
          <label class="control control--radio">전체
              <input type="radio" name="neuter" checked="checked" value=""/>
              <div class="control__indicator"></div>
          </label>
        <label class="control control--radio">중성화
          <input type="radio" name="neuter" value="Y"/>
          <div class="control__indicator"></div>
        </label>
        <label class="control control--radio">비 중성화
          <input type="radio" name="neuter" value="N"/>
          <div class="control__indicator"></div>
        </label>
      </div>
      <div class="control-group">
        <h1>지역</h1>
        <div class="select">
          <select id="city">
            <option value="">전체</option>
            <option value="6110000">서울특별시</option>
            <option value="6260000">부산광역시</option>
            <option value="6270000">대구광역시</option>
            <option value="6280000">인천광역시</option>
            <option value="6290000">광주광역시</option>
            <option value="5690000">세종특별자치시</option>
            <option value="6300000">대전광역시</option>
            <option value="6310000">울산광역시</option>
            <option value="6410000">경기도</option>
            <option value="6420000">강원도</option>
            <option value="6430000">충청북도</option>
            <option value="6440000">충청남도</option>
            <option value="6450000">전라북도</option>
            <option value="6460000">전라남도</option>
            <option value="6470000">경상북도</option>
            <option value="6480000">경상남도</option>
            <option value="6500000">제주특별자치도</option>
          </select>

          <div class="select__arrow"></div>
            <br><br>
            <h1>공고날짜(~)</h1>
            <input type="date" id="notice-date" value="">
        </div>
      </div>
      <button class="adopt-search" onclick="shelterSearch()">찾기</button>
    </div>
      <div id="search-rst"></div>
      <div id="pic-wrap"></div>
      <div class="page_wrap">
          <div class="page_nation"></div>
      </div>
    </div>
  </div>

<script type="text/javascript" src="/js/shelter.js"></script>
<%@ include file="../layout/footer.jsp"%> 

</body>
</html>