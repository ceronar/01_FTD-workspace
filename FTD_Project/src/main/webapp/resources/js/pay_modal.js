const closebtn = document.querySelector('.closebtn');
const popup = document.querySelector('.popup');
const amount = document.querySelector('.amount');
const modal = document.querySelector('#kakaoModalContainer');

function openKakaoPayModal() {
    modal.style.display = 'block';
}
closebtn.addEventListener('click', function(){
	modal.style.display = 'none';
});