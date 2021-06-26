for (const input of document.querySelectorAll("input.filter")) {
	input.onchange = input.onkeyup = event => {
		for (const table of document.querySelectorAll(input.dataset.target)) {
			filter(table, input);
		}
	}
}

function filter(table, input) {
	const upperQuery = input.value.toUpperCase();
	for (let i = 1; i < table.rows.length; i++) {
		const row = table.rows[i];
		const match = row.textContent.toUpperCase().indexOf(upperQuery) != -1;
		row.style.display = match ? "table-row" : "none";
	}
}

for (const table of document.querySelectorAll("table#instructiontable")) {
	for (const th of table.querySelectorAll("th")) {
		if (th.dataset.sort) {
			th.style.cursor = "pointer";
			th.title = th.title || "Click to sort";
			th.onclick = event => sort(table, th);
		}
	}
}

function sort(table, th) {
	const order = th.dataset.sort != "asc" ? 1 : -1;
	th.dataset.sort = order > 0 ? "asc" : "desc";
	const column = th.cellIndex;
	const collator = new Intl.Collator("en", {
		numeric: th.dataset.type == "number",
		sensitivity: "accent"
	});
	for (const tbody of table.tBodies) {
		const rows = Array.from(tbody.rows);
		rows.sort((a, b) => collator.compare(a.cells[column].textContent, b.cells[column].textContent) * order);
		for (const row of rows) {
			tbody.appendChild(row);
		}
	}
}
