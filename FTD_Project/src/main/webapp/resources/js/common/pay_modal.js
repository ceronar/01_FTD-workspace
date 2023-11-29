const closebtn = document.querySelector('.closebtn');
const popup = document.querySelector('.popup');
const amount = document.querySelector('.amount');
const amountV = document.querySelector('.amountValue');

function modal(){ //결제창 on-off
	popup.style.display = 'block';
}
closebtn.addEventListener('click', function(){
	popup.style.display = 'none';
});