var options = {
	url: "assets/countries.json",

	getValue: "name",

	list: {
		match: {
			enabled: true
		}
	}
};

$("#autocomplete-countries").easyAutocomplete(options);
