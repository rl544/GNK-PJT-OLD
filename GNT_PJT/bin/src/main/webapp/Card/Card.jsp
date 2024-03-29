<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<style scoped>
		@import url("css/Card.css?ver=1");
		@import url("css/Fonts.css?ver=1");
	</style>

	<script>
		$(function() {
			$('#draggable3').click(function() {
				console.log($("containment-wrapper"))
			})
		})
				
		$(function() {
		    $("#draggable3").draggable({ containment: "#containment-wrapper", scroll: false }, { stop: function () {
		        const left_position = $(this).offsetLeft;
		        const top_position = $(this).offsetTop;
		    	}
			});
		});
		
		$(window).on('load', function() {
			$('#card').addClass('loaded');
		});
		
		$(function() {
			var isFront = true;
			var frontFont = 'white';
			var backFont = 'white';
			var backgroundColor = "";
			
			$('.front-card').click(function() {
				$('#front').removeClass('card--front_small');
				$('#front').addClass('card--front');
				$('#back').removeClass('card--back_big');
				$('#back').addClass('card--back');
				$('.card-change-margin').css('margin-top', '0px');
				$('#change-front').removeClass('front-card').removeClass('back-card')
				$('#change-front').addClass('front-card')
				$('#change-back').removeClass('front-card').removeClass('back-card')
				$('#change-back').addClass('back-card')
				console.log($('#draggable3').css('top'))			
				if (isFront == false) {
					$('.emo').css('width', '150px').css('height', '185px')
					left_position = parseInt($('#draggable3').css('left')) * 1.18
					top_position = parseInt($('#draggable3').css('top')) * 1.21
					$('#draggable3').css('left', left_position + 'px').css('top', top_position + 'px');	
				}
				isFront = true;
				if(frontFont=='black') {
					$('.font__color-white').removeClass('font__color-selected')
					$('.font__color-black').addClass('font__color-selected')
				} else {
					$('.font__color-black').removeClass('font__color-selected')
					$('.font__color-white').addClass('font__color-selected')
				}
			})
			
			$('.back-card').click(function() {
				$('#front').removeClass('card--front');
				$('#front').addClass('card--front_small');
				$('#back').removeClass('card--back');
				$('#back').addClass('card--back_big');
				$('.card-change-margin').css('margin-top', '1.2rem');
				$('#change-front').removeClass('front-card').removeClass('back-card')
				$('#change-front').addClass('back-card')
				$('#change-back').removeClass('front-card').removeClass('back-card')
				$('#change-back').addClass('front-card')
				console.log($('#draggable3').css('top'))
				if (isFront == true) {
					$('.emo').css('width', '130px').css('height', '157px')
					left_position = parseInt($('#draggable3').css('left')) * 0.82
					top_position = parseInt($('#draggable3').css('top')) * 0.68
					$('#draggable3').css('left', left_position + 'px').css('top', top_position + 'px');	
				}
				isFront = false;
				if(backFont=='black') {
					$('.font__color-white').removeClass('font__color-selected')
					$('.font__color-black').addClass('font__color-selected')
				} else {
					$('.font__color-black').removeClass('font__color-selected')
					$('.font__color-white').addClass('font__color-selected')
				}
			})
			
			$('.font__color-black').click(function() {
				if (isFront == true) {
					$('.front .card__content').css("color", "black");
					frontFont = 'black'
				} else {
					$('.back .card__ccv').css("color", "black");
					$('.back .card__owner').css("color", "black");
					$('.back .card__expiry-date').css("color", "black");
					$('.back .card__number').css("color", "black");
					backFont = 'black'
				}
				$('.font__color-white').removeClass('font__color-selected')
				$('.font__color-black').addClass('font__color-selected')
			});
			
			$('.font__color-white').click(function() {
				if (isFront == true) {
					$('.front .card__content').css("color", "white");
					frontFont = 'white'
				} else {
					$('.back .card__ccv').css("color", "white");
					$('.back .card__owner').css("color", "white");
					$('.back .card__expiry-date').css("color", "white");
					$('.back .card__number').css("color", "white");
					backFont = 'white'
				}
				$('.font__color-black').removeClass('font__color-selected')
				$('.font__color-white').addClass('font__color-selected')
			});
			
			$('#tab3').click(function() {
				$('#card__content').focus();
			})
			
			$('#card__content').click(function() {
				$('#card__content').focus();
			})
			
			$('#backGroundColorList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					$('#front').css('background-color', '#' + $(this).text())
					$('.emo').css('background-color', '#' + $(this).text())
					backgroundColor = $(this).text();
				} else {
					$('#back').css('background-color', '#' + $(this).text())
				}
			})
			
			$('#emoList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					if ($(this).text() == '미스터 비') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/1.png" class="emo" style="width: 150px; height: 157px;">')
					} else if ($(this).text() == '엔젤 케이') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/2.png" class="emo" style="width: 150px; height: 157px;">')
					} else if ($(this).text() == '바우 와우') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/3.png" class="emo" style="width: 150px; height: 157px;">')
					} else if ($(this).text() == '엔젤 엔') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/4.png" class="emo" style="width: 150px; height: 157px;">')
					} else if ($(this).text() == 'G방울') {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/5.png" class="emo" style="width: 150px; height: 157px;">')
					} else {
						$('#draggable3').empty();
						$('#draggable3').append('<img src="img/6.png" class="emo" style="width: 150px; height: 157px;">')
					}
				} else {
					alert('뒷면에서는 이모티콘을 변경할 수 없다.')
				}
				$('.emo').css('background-color', '#'+backgroundColor);
			})
			
			$('#FontList').on('click', '.item-gradient', function() {
				if (isFront == true) {
					$('.front .card__content').css("font-family", $(this).attr('name'));
				} else {
					$('.back .card__ccv').css("font-family", $(this).attr('name'));
					$('.back .card__owner').css("font-family", $(this).attr('name'));
					$('.back .card__expiry-date').css("font-family", $(this).attr('name'));
					$('.back .card__number').css("font-family", $(this).attr('name'));
				}
			})
			
			$('.change-content').click(function() {
				$('.card__content').text($('.content-input').val())
				$('.content-input').val("")
			})
			
		});
		
		const gradients = [ 
		    '00bd56', 'f9fd50',
		    '26baee', '9fe8fa',
		    '8f71ff', '8bffff', 
		    'c7004c', 'ffaaaa',
		    '55968f', '8acbbb',
		    '226b80', '35b0ab',
		    '3d6cb9', '00fff0',
		    '4d3664', 'bab5f6',
		    'fa4659', 'e9007f',
		    '00b7c2', '4ef037',
		    '303481', 'a100ff',
		    'fc8a15', 'fff6a2',
		    'f9d00f', 'fbff64',
		    '295e6a', '4797b1',
		    'ff0592', 'ffbee3',
		];
		
		const fonts = [
			'덕온공주체:국립한글박물관:DeogonPrincess',
			'한컴 울주 반구대 암각화체:울주문화재단:HancomUljuBangudae',
			'다이어리체:얼리폰트:EarlyFontDiary',
			'혀니고딕:얼리폰트:EF_hyunygothic',
			'마초체:얼리폰트:EF_MACHO',
			'정신차렷체:얼리폰트:EF_WAKEUP',
			'MICE고딕:한국MICE협회X문화체육관광부:MICEGothic Bold',
			'조선100년체:조선일보:ChosunCentennial',
			'밀양영남루체:밀양시:MYYeongnamnu',
			'읏찬체:OK홀딩스대부(주):OKCHAN',
			'읏뚱체:OK홀딩스대부(주):OKDDUNG',
			'평창평화체:평창군:PyeongChangPeace-Bold',
			'평창평화체:평창군:PyeongChangPeace-Light',
			'울산중구전용서체:울산광역시중구:ulsanjunggu',
			'HBIOS-SYS:이민서:HBIOS-SYS',
			'마비옛체:㈜넥슨코리아:MabinogiClassicR',
			'Rix이누아리두리네:이두아리두리네X폰트릭스:RixInooAriDuriR',
			'길벗체 Rainbow:비온뒤무지개재단:GilbeotRainbow',
			'교보손글씨 2020 박도연:교보문고:KyoboHandwriting2020A',
			'상주경천섬체:상주시청X투게더그룹:SANGJUGyeongcheonIsland',
			'KITA:한국무역협회:-KITA-Regular',
			'레페리포인트 Oblique:레페리X윤디자인:LeferiPoint-WhiteObliqueA',
			'HS겨울눈꽃체2.0:토끼네활자공장:HSGyeoulNoonkott20',
			'HS산토끼체:토끼네활자공장:HS-Regular',
			'강원교육튼튼체:강원도교육청X헤움디자인:GangwonEduPowerExtraBoldA',
			'강원교육모두체:강원도교육청X헤움디자인:GangwonEdu_OTFBoldA',
			'수트:SUNN YOUN:SUIT-Medium',
			'충북대직지체:충북대학교:CBNUJIKJI',
			'한림고딕체:한림대학교의료원:HallymGothic-Regular',
			'추사 사랑체:예산군:ChusaLove',
			'카페24 써라운드:카페24:Cafe24Ssurround',
			'원스토어 모바일POP체:(주)원스토어:ONE-Mobile-POP',
		]
		
		$(function() {
			var idx = 0;
			var fontIdx = 0;
			idx = showBackgroundAfter(idx);
			
			$('#arrow-before').click(function() {
				idx = showBackgroundBefore(idx)
				
			})
			
			$('#arrow-after').click(function() {
				idx = showBackgroundAfter(idx)
				if (idx==30) {
					idx = 0
				}
			})
			
			$('li[title=Emoticon]').click(function() {
				const emos = [ 
				    '../Card/img/1.png',
				    '../Card/img/2.png',
				    '../Card/img/3.png',
				    '../Card/img/4.png',
				    '../Card/img/5.png',
				    '../Card/img/6.png'
				];
				const emos_name = ['미스터 비', '엔젤 케이', '바우 와우', '엔젤 엔', 'G방울', '토리']
				$('#emoList').empty();
				for(var i=0; i<emos.length ;i++){
					$('#emoList').append("<li class=item-gradient><img class=tabs-emo src="+emos[i]+"><p>"+emos_name[i]+"</p></li>")
				}
				
			})
			
			$('li[title=Font]').click(function() {
				fontIdx = 0;
				changeFonts(fontIdx)
			})
			
			$('#arrow-before-font').click(function() {
				if (fontIdx==0) {
					fontIdx = 28
				} else {
					fontIdx -= 4
				}
				changeFonts(fontIdx)
			})
			
			$('#arrow-after-font').click(function() {
				if (fontIdx==28) {
					fontIdx = 0
				} else {
					fontIdx += 4
				}
				changeFonts(fontIdx)
			})
			
		})
		
		const showBackgroundBefore = function(idx) {
			$('#backGroundColorList').empty()
			if (idx==0) {
				idx = 20
			} else if (idx==5) {
				idx = 25
			} else {
				idx -= 10
			}
			for(var i=idx; i<idx+5;i++){
				$('#backGroundColorList').append("<li class=item-gradient><div class=gradient style='background-color: #"+gradients[i]+";'></div><p class=start style=color: #"+gradients[i]+";>"+gradients[i]+"</p></li>")
			}
			return idx + 5
		}
		
		const showBackgroundAfter = function(idx) {
			$('#backGroundColorList').empty()
			for(var i=idx; i<idx+5;i++){
				$('#backGroundColorList').append("<li class=item-gradient><div class=gradient style='background-color: #"+gradients[i]+";'></div><p class=start style=color: #"+gradients[i]+";>"+gradients[i]+"</p></li>")
			}
			return idx+5
		}
		
		const changeFonts = function(fontIdx) {
			$('#FontList').empty();
			for(var i=fontIdx; i<fontIdx+4; i++) {
				font_list = fonts[i].split(':')
				var font_name = font_list[0]
				var font_company = font_list[1]
				var font_family = font_list[2] 
				$('#FontList').append("<li class=item-gradient name="+font_family+" style=font-family:"+font_family+"><div style=text-align:center;><p style=font-size:large;>"+font_name+"</p><p>"+font_company+"</p></div><div>GiveNotTake</div></li>")
			}
		}
		
	</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="card">
		<div id="loader-wrapper">            
			<div id="loader"></div>
			<div class="loader-section section-left"></div>
			<div class="loader-section section-right"></div>
		</div>
		<%@ include file="../Common/Nav.jsp" %><br>
		<div class="container">
			<div>
				<div class="d-flex justify-content-between align-items-end" style="border-bottom: 1px solid beige; margin-bottom: 2rem;">
					<h2 class="title">카드 발급</h2>
					<div class="d-flex">
						<div id="change-front" class="front-card">
							앞면
						</div>
						<div id="change-back"  class="back-card" style="margin-left: 2rem;">
							뒷면
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-around">
					<div class="front">
						<div id="front" class="card card--front">
							<div class="row" style="height: 100vh;">
								<div class="col-4 d-flex flex-column justify-content-between">
									<img class="card__logo--front" src="img/bnk_logo.png">
									<div class="d-flex align-items-center">
										<span>&nbsp;&lt;&lt;</span>
										<div class="ic-chip">
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-line"></div>
											<div class="chip-main"></div>
										</div>
									</div>
									<div style="margin-left: 10px; margin-bottom: 10px;">
										<span class="card__content"></span>
									</div>
								</div>
								<div class="col-8">
									<div id="containment-wrapper" style="border: none; height: 100%; padding-right: 30px;">
									  <div id="draggable3" class="draggable ui-widget-content" style="border: none; width: 40%;">
									    <!-- <img src="img/MrB.png" class="emo" style="width: 140%;"> -->
									  </div>
									</div>
								</div>
							</div>
						</div>
						<h5 class="front__hover" style="color: #898989;"><b>앞면</b></h5>
					</div>
					<div class="back">
						<div id="back" class="card card--back">
							<div class="card__strip"></div>
							<div class="card-change-margin">
								<div class="card__signature"></div>
								<div class="card__ccv">303</div>							
							</div>
							<div class="card__number">4111 1111 1111 1111</div>
							<div class="card__expiry-date">10/17</div>
							<div>
								<div class="card__owner">
									yudingg
									<img class="card__logo--back" src="img/bnk_logo.png">							
								</div>
							</div>
						</div>
						<h5 class="back__hover" style="color: #898989;"><b>뒷면</b></h5>
					</div>
				</div>
				<div class="tabs">
				  <input type="radio" id="tab1" name="tab-control" checked>
				  <input type="radio" id="tab2" name="tab-control">
				  <input type="radio" id="tab3" name="tab-control">  
				  <ul>
				    <li title="Background"><label for="tab1" role="button"><br><span>배경색</span></label></li>
				    <li title="Emoticon"><label for="tab2" role="button"><br><span>이모티콘</span></label></li>
				    <li title="Font"><label for="tab3" role="button"><br><span>폰트 적용</span></label></li>
				  </ul>
				  
				  <div class="slider"><div class="indicator"></div></div>
				  <div class="content" style="padding-bottom: 5rem;">
				    <section>
						<h2>Background</h2>
						<div class="d-flex">
							<svg id="arrow-before" width="18px" height="17px" viewBox="0 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="fill: #99eb47;">
							    <g id="prev" transform="translate(8.500000, 8.500000) scale(-1, 1) translate(-8.500000, -8.500000)">
							        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <path d="M-1.48029737e-15,0.56157424 L-1.48029737e-15,16.1929159 L9.708,8.33860465 L-2.66453526e-15,0.56157424 L-1.48029737e-15,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
								</g>
							</svg>
							
							<div id="backGroundColorList" class="d-flex">
							</div>
							<svg id="arrow-after" width="18px" height="17px" viewBox="-1 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="fill: #99eb47;">
							    <g>
							        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
							        <path d="M-4.58892184e-16,0.56157424 L-4.58892184e-16,16.1929159 L9.708,8.33860465 L-1.64313008e-15,0.56157424 L-4.58892184e-16,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
							    </g>
							</svg>
						</div>
			      	</section>
			        <section>
						<h2>Emoticon</h2>
						<div id="emoList" class="d-flex">
						</div>
		          	</section>
			        <section>
						<h2>Font</h2>
						<div class="row">
							<div class="col-3 d-flex justify-content-around" style="flex-direction: column">
								<div>
									<h5><b>8글자 내로 작성하시오.</b></h5>
									<input type="text" class="content-input" maxlength='8'>
									<button class="change-content">작성</button>
								</div>
								<div>
									<h5><b>글자색을 정하시오.</b></h5>
									<div class="d-flex">
										<button class="font__color-black" style="margin-right: 2rem;">검은색</button>
										<button class="font__color-white font__color-selected">흰색</button>
									</div>
								</div>
							</div>
							<div class="col-9 d-flex">
								<svg id="arrow-before-font" width="18px" height="17px" viewBox="0 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: visible; fill: #99eb47;">
								    <g id="prev" transform="translate(8.500000, 8.500000) scale(-1, 1) translate(-8.500000, -8.500000)">
								        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <path d="M-1.48029737e-15,0.56157424 L-1.48029737e-15,16.1929159 L9.708,8.33860465 L-2.66453526e-15,0.56157424 L-1.48029737e-15,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
									</g>
								</svg>
								
								<div id="FontList" class="d-flex">
								</div>
								<svg id="arrow-after-font" width="18px" height="17px" viewBox="-1 0 18 17" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="overflow: visible; fill: #99eb47;">
								    <g>
								        <polygon class="arrow" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <polygon class="arrow-fixed" points="16.3746667 8.33860465 7.76133333 15.3067621 6.904 14.3175671 14.2906667 8.34246869 6.908 2.42790698 7.76 1.43613596"></polygon>
								        <path d="M-4.58892184e-16,0.56157424 L-4.58892184e-16,16.1929159 L9.708,8.33860465 L-1.64313008e-15,0.56157424 L-4.58892184e-16,0.56157424 Z M1.33333333,3.30246869 L7.62533333,8.34246869 L1.33333333,13.4327013 L1.33333333,3.30246869 L1.33333333,3.30246869 Z"></path>
								    </g>
								</svg>
							</div>
						</div>
		          	</section>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>