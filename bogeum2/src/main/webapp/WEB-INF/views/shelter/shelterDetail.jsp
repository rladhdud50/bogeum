<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
  <link rel="stylesheet" href="/css/reset.css">
  <link rel="stylesheet" href="/css/shelterDetail.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--   <div class="header">
    헤더부분
  </div> -->
  <div class = "card-wrapper">
    <div onclick="window.close()" style="cursor: pointer"><i class="fa-solid fa-reply" style="width: 24px"></i></div>
    <div class = "card">
      <!-- card left -->
      <div class = "animal-imgs">
        <div class = "img-display">
          <div class = "img-showcase">
            <img class="img-shelter-animal" src = "${info.popfile}" alt = "유기동물">
<%--            <img src = "${info.popfile}" alt = "캣">--%>
<%--            <img src = "${info.popfile}" alt = "캣">--%>
<%--            <img src = "${info.popfile}" alt = "캣">--%>
          </div>
        </div>
        <div class = "img-select">
<%--          <div class = "img-item">--%>
<%--            <a href = "#" data-id = "1">--%>
<%--              <img src = "${info.popfile}" alt = "캣">--%>
<%--            </a>--%>
<%--          </div>--%>
<%--          <div class = "img-item">--%>
<%--            <a href = "#" data-id = "2">--%>
<%--              <img src = "${info.popfile}" alt = "캣">--%>
<%--            </a>--%>
<%--          </div>--%>
<%--          <div class = "img-item">--%>
<%--            <a href = "#" data-id = "3">--%>
<%--              <img src = "${info.popfile}" alt = "캣">--%>
<%--            </a>--%>
<%--          </div>--%>
<%--          <div class = "img-item">--%>
<%--            <a href = "#" data-id = "4">--%>
<%--              <img src = "${info.popfile}" alt = "캣">--%>
<%--            </a>--%>
<%--          </div>--%>
        </div>
      </div>
      <!-- card right -->
      <div class = "animal-content">
        <h2 class = "animal-title">${info.kindCd}</h2>
        <span class = "animal-link">${info.processState}</span>

  
        <div class = "animal-detail">
<%--          <h2> 상세정보 </h2>--%>
<%--          <p style="font-size: 18px;">고양이 고양이 고양이 </p>--%>
          <ul style="font-size: 16 px;">
<%--            reqNo:요청번호--%>
<%--            kindCd:품종--%>
<%--            sexCd:성별--%>
<%--            neuterYn:중성화여부--%>
<%--            age:나이--%>
<%--            weight:체중--%>
<%--            processState:상태--%>
<%--            careNm:보호소이름--%>
<%--            careAddr:보호소장소--%>
<%--            careTel:보호소전화번호--%>
<%--            noticeSdt:공고시작일--%>
<%--            noticeEdt:공고종료일--%>

            <li>유기번호 : <span>${info.desertionNo}</span></li>
            <li>품종 : <span>${info.kindCd}</span></li>
            <li>성별 :
                <span>
                    <c:if test="${info.sexCd eq 'Q'}">
                        <i class="fa-regular fa-circle-question"></i>
                    </c:if>
                    <c:if test="${info.sexCd eq 'M'}">
                        <img src="/img/male.png" style="width: 24px; height: 24px">
                    </c:if>
                   <c:if test="${info.sexCd eq 'F'}">
                       <img src="/img/female.png" style="width: 24px; height: 24px">
                   </c:if>
                </span>
            </li>
            <li>나이 : <span>${info.age}</span></li>
            <li>무게 : <span>${info.weight}</span></li>
            <li>털색 : <span>${info.colorCd}</span></li>
            <li>특이사항 : <span>${info.specialMark}</span></li>
            <li>보호소 이름: <span>${info.careNm}</span></li>
            <li>보호소 주소: <span>${info.careAddr}</span></li>
            <li>보호소 전화번호: <span>${info.careTel}</span></li>
            <li>공고시작 : <span>${info.noticeSdt}</span></li>
            <li>공고만료 : <span>${info.noticeEdt}</span></li>
          </ul>
        </div>
<%--        <div class = "adopt-info">--%>
<%--          <button type = "button" class = "btn">입양신청</button>--%>
<%--        </div>--%>

      </div>
    </div>
  </div>


<%--  <script>--%>
<%--    /**--%>
<%--     *슬라이드--%>
<%--     */--%>
<%--    const imgs = document.querySelectorAll('.img-select a');--%>
<%--    const imgBtns = [...imgs];--%>
<%--    let imgId = 1;--%>

<%--    imgBtns.forEach((imgItem) => {--%>
<%--        imgItem.addEventListener('click', (event) => {--%>
<%--            event.preventDefault();--%>
<%--            imgId = imgItem.dataset.id;--%>
<%--            slideImage();--%>
<%--        });--%>
<%--    });--%>
<%--    function slideImage(){--%>
<%--        const displayWidth = document.querySelector('.img-showcase img:first-child').clientWidth;--%>

<%--        document.querySelector('.img-showcase').style.transform = `translateX(${- (imgId - 1) * displayWidth}px)`;--%>
<%--    }--%>
<%--    window.addEventListener('resize', slideImage);--%>
<%--  </script>--%>

  <%@ include file="../layout/footer.jsp"%>

  