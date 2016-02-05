$(document).ready(function () {
$('span:contains("Accepted")').closest(".bool").addClass("l-success");
$('span:contains("Declined")').closest(".bool").addClass("l-warning");
});