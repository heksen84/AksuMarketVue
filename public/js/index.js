// �������� / ������ ���������
function showHideSubcategory() {

 $(".col_item").click(function(e) {

   e.preventDefault();

   $("#categories").hide();
   $("#subcategories").show();

   var subcats = $("*[data-id='"+($(this).index()+1)+"']").show();

 });
}

// ��������� ������
function setMethods() {
 showHideSubcategory();
}

// �������� �����
$( document ).ready(function() {
   setMethods();
});