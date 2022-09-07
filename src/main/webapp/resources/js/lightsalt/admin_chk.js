//  <script src="js/admin_chk.js"></script> 등록하기

// ==========================================
//            공통 체크박스
//===========================================

// 목록 체크 박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#select_chkAll").click(function () {
        if ($("#select_chkAll").is(":checked")) $("input[name=select_chk]").prop("checked", true);
        else $("input[name=select_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=select_chk]").click(function () {
        var total = $("input[name=select_chk]").length;
        var checked = $("input[name=select_chk]:checked").length;

        if (total != checked) $("#select_chkAll").prop("checked", false);
        else $("#select_chkAll").prop("checked", true);
    });
});

// ==========================================
//          페이지 개별 체크박스
//===========================================

// 회원 유형 체크박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#usertype_chkAll").click(function () {
        if ($("#usertype_chkAll").is(":checked")) $("input[name=usertype_chk]").prop("checked", true);
        else $("input[name=usertype_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=usertype_chk]").click(function () {
        var total = $("input[name=usertype_chk]").length;
        var checked = $("input[name=usertype_chk]:checked").length;

        if (total != checked) $("#usertype_chkAll").prop("checked", false);
        else $("#usertype_chkAll").prop("checked", true);
    });
});

// 수신동의 유형 체크박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#agmtype_chkAll").click(function () {
        if ($("#agmtype_chkAll").is(":checked")) $("input[name=agmtype_chk]").prop("checked", true);
        else $("input[name=agmtype_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=agmtype_chk]").click(function () {
        var total = $("input[name=agmtype_chk]").length;
        var checked = $("input[name=agmtype_chk]:checked").length;

        if (total != checked) $("#agmtype_chkAll").prop("checked", false);
        else $("#agmtype_chkAll").prop("checked", true);
    });
});

// 회원상태 체크박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#userstatus_chkAll").click(function () {
        if ($("#userstatus_chk").is(":checked")) $("input[name=userstatus_chk]").prop("checked", true);
        else $("input[name=userstatus_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=userstatus_chk]").click(function () {
        var total = $("input[name=userstatus_chk]").length;
        var checked = $("input[name=userstatus_chk]:checked").length;

        if (total != checked) $("#userstatus_chkAll").prop("checked", false);
        else $("#userstatus_chkAll").prop("checked", true);
    });
});

// 게시판명 체크 박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#boardtype_chkAll").click(function () {
        if ($("#boardtype_chkAll").is(":checked")) $("input[name=boardtype_chk]").prop("checked", true);
        else $("input[name=boardtype_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=boardtype_chk]").click(function () {
        var total = $("input[name=boardtype_chk]").length;
        var checked = $("input[name=boardtype_chk]:checked").length;

        if (total != checked) $("#boardtype_chkAll").prop("checked", false);
        else $("#boardtype_chkAll").prop("checked", true);
    });
});

// 결제 상태 체크 박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#paystatus_chkAll").click(function () {
        if ($("#paystatus_chkAll").is(":checked")) $("input[name=paystatus_chk]").prop("checked", true);
        else $("input[name=paystatus_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=paystatus_chk]").click(function () {
        var total = $("input[name=paystatus_chk]").length;
        var checked = $("input[name=paystatus_chk]:checked").length;

        if (total != checked) $("#paystatus_chkAll").prop("checked", false);
        else $("#paystatus_chkAll").prop("checked", true);
    });
});

// 환불 상태 체크 박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#refund_chkAll").click(function () {
        if ($("#refund_chkAll").is(":checked")) $("input[name=refund_chk]").prop("checked", true);
        else $("input[name=refund_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=refund_chk]").click(function () {
        var total = $("input[name=refund_chk]").length;
        var checked = $("input[name=refund_chk]:checked").length;

        if (total != checked) $("#refund_chkAll").prop("checked", false);
        else $("#refund_chkAll").prop("checked", true);
    });
});

// 클래스 상태 체크박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#status_chkAll").click(function () {
        if ($("#status_chkAll").is(":checked")) $("input[name=status_chk]").prop("checked", true);
        else $("input[name=status_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=status_chk]").click(function () {
        var total = $("input[name=status_chk]").length;
        var checked = $("input[name=status_chk]:checked").length;

        if (total != checked) $("#status_chkAll").prop("checked", false);
        else $("#status_chkAll").prop("checked", true);
    });
});

// 클래스 유형 체크박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#classtype_chkAll").click(function () {
        if ($("#classtype_chkAll").is(":checked")) $("input[name=classtype_chk]").prop("checked", true);
        else $("input[name=classtype_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=classtype_chk]").click(function () {
        var total = $("input[name=classtype_chk]").length;
        var checked = $("input[name=classtype_chk]:checked").length;

        if (total != checked) $("#classtype_chkAll").prop("checked", false);
        else $("#classtype_chkAll").prop("checked", true);
    });
});

// 결제 수단 체크 박스
$(document).ready(function () {
    // 전체 체크박스 클릭 시
    $("#paytype_chkAll").click(function () {
        if ($("#paytype_chkAll").is(":checked")) $("input[name=paytype_chk]").prop("checked", true);
        else $("input[name=paytype_chk]").prop("checked", false);
    });
    // 개별 체크박스 클릭시 '전체'체크박스 해제
    $("input[name=paytype_chk]").click(function () {
        var total = $("input[name=paytype_chk]").length;
        var checked = $("input[name=paytype_chk]:checked").length;

        if (total != checked) $("#paytype_chkAll").prop("checked", false);
        else $("#paytype_chkAll").prop("checked", true);
    });
});