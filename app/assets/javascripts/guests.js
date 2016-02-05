$(document).ready(function () {
$('span:contains("Accepted")').closest(".bool").addClass("label-success");
$('span:contains("Declined")').closest(".bool").addClass("label-danger");
});