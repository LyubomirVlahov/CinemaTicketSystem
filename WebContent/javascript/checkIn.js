function checkIn() {
	var uuid = $("#uuidInput").val();
	if (!uuid || uuid.trim().length == 0) {
		alert("Трябва да въведете уникален номер на резервация.");
		$("#uuidInput").focus();
		return;
	}

	var fDoneCallback = function(body, msg, oResponse) {
		alert("Резервацията беше успешно чекирана.");
		$("#uuidInput").val("");
	};

	var fFailCallback = function(oResponse) {
		if (oResponse.status == 400) {
			alert("Не съществува резервация с посочения уникален идентификационен номер.");
		} else {
			alert("Неуспешно чекиране. Опитайте отново.");
		}
	};

	jQuery.ajax({
		url : "check-in",
		type : "POST",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify({
			reservationUUID : uuid
		})
	}).done(fDoneCallback).fail(fFailCallback);
}