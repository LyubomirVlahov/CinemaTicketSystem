$(".freeSeat").click(function(evnt) {
	var selectedImg = evnt.currentTarget;
	var selectedTableData = selectedImg.parentElement;
	switch (selectedImg.className) {
	case "freeSeat":
		selectedImg.src = "img/selected_seat.png";
		selectedImg.className = "chosenSeat";
		break;
	case "chosenSeat":
		selectedImg.src = "img/free_seat.png";
		selectedImg.className = "freeSeat";
		break;
	default:
		console.error("Invalid selected seat class: " + selectedImg.className);
		break;
	}
});

function requestReservation() {
	var projectionId = getQueryParameter("projectionId");
	var aSeatIds = [];
	var selectedSeatsImages = $(".chosenSeat");
	if (selectedSeatsImages.length == 0) {
		alert("Трябва да изберете поне едно място.");
		return;
	}

	for (var idx = 0; idx < selectedSeatsImages.length; idx++) {
		var seatImg = selectedSeatsImages[idx];
		var seatId = seatImg.getAttribute("seatid");
		aSeatIds.push(new Number(seatId));
	}

	var fDoneCallback = function(body, msg, oResponse) {
		window.location = "Payment.jsp?reservationId=" + body;
	};

	var fFailCallback = function(oResponse) {
		if (oResponse.status == 400) {
			alert("Някои от избраните от вас места са вече резервирани. Моля избере места отново.");
		} else {
			alert("Неуспешно създаване на резервация. Моля опитайте отново.");
		}
		location.reload();
	};

	jQuery.ajax({
		url : "bookNow",
		type : "POST",
		// dataType : "json",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify({
			projectionId : projectionId,
			seatIds : aSeatIds
		})
	}).done(fDoneCallback).fail(fFailCallback);
}

function getQueryParameter(name) {
	name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex
			.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g,
			" "));
}