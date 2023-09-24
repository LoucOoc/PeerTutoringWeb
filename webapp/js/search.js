var oInp = document.getElementById('inp');
var oBtn = document.getElementById('btn');

oBtn.onclick = function () {
    Search();
}

document.onkeydown = function () {
    if (event.keyCode == 13) {
        Search();
    }
}

//写搜索
function Search() {
    document.search.submit();
}
