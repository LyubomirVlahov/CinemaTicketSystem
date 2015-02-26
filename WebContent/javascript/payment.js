window.completeCalled = false;
function timer(time, update, complete) {
	var start = new Date().getTime();
	var interval = setInterval(function() {
		var now = time - (new Date().getTime() - start);
		if (now <= 0) {
			clearInterval(interval);
			complete();
		} else{
			update(Math.floor(now / 1000));
		}
	}, 1000); // the smaller this number, the more accurate the timer will be
}

function deleteReservation(reservId){
	if (window.payed || window.deleteCalled) {
		return;
	}
	window.deleteCalled = true;
	var fDoneCallback = function(body, msg, oResponse) {
//		alert("Резервацията ви беше изтрита. Моля направете нова.");
		window.location = "index.jsp";
	};

	var fFailCallback = function(oResponse) {
			console.error("Failed to delete the reservation with id " + reservId);
	};

	jQuery.ajax({
		url : "deleteReservation",
		type : "POST",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify({
			reservationId : reservId
		})
	}).done(fDoneCallback).fail(fFailCallback);
}

function payReservation(reservId){

	var fDoneCallback = function(body, msg, oResponse) {
		window.payed = true;
		window.location = "SuccessfulPayment.jsp?UUID="+body;
	};

	var fFailCallback = function(oResponse) {
		if (oResponse.status == 400) {
			alert("Подали сте навалидно ID за резервация. Моля опитайте отново отново.");
		} else {
			alert("Неуспешно плащане на резервация. Моля опитайте отново.");
		}
	};

	jQuery.ajax({
		url : "payReservation",
		type : "POST",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify({
			reservationId : reservId
		})
	}).done(fDoneCallback).fail(fFailCallback).always(null);
}
