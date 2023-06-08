<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="/css/ProductSave.css">

<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

	<div id="pro_save_wrap">
        <div class="left_box">
            <form name="ShopSaveForm" action="/saveitem" method="post" id="ShopSaveForm" enctype="multipart/form-data">
            <div class=item_box>
                <label for="category">카테고리</label><br>
                <select class="category" id="category" name="category">
                    <option value="">필수선택</option>
                    <option value="굿즈">굿즈</option>
                    <option value="반려용품">반려용품</option>
                    <option value="매거진">매거진</option>		
                </select>
            </div>
            <div class="item_box">
                <label for="name">상품명</label>
                <input type="text" name="name" id="name">
            </div>
            <div class="item_box">
                <label for="price">상품 금액</label>
                <input type="text" name="price" id="price">
            </div>
            <div class="item_box">
                <label for="count">수량</label>
                <br>
                <input type="text" name="count" id="count">              
            </div>
            <div class="item_box">
                <button type="submit" id="submit" name="submit">등록하기</button>           
            </div>
            
        </div>
        <div class="right_box">
            <div class="notebox1">
                <label for="img">상품 이미지</label>
                <input type="file" name="file"  id="file" multiple="multiple">           
            </div>
            <div class="notebox2">
                <label for="content">상품 상세정보</label>
                <textarea class="summernote2" name="content" id="content"></textarea>
            </div>
        </div>
        </form>
    </div>
    <script type="text/javascript">
        $('.summernote2').summernote({
            height: 350
        });
    </script>
<script type="text/javascript" src="/js/ProductSave.js"></script>
<%@ include file="../layout/footer.jsp" %>