(function (document) {
	// Sidebar toggle
	var toggle = document.querySelector(".sidebar-toggle");
	var sidebar = document.querySelector("#sidebar");
	var checkbox = document.querySelector("#sidebar-checkbox");

	document.addEventListener(
		"click",
		function (e) {
			var target = e.target;

			if (!checkbox.checked || sidebar.contains(target) || target === checkbox || target === toggle) return;

			checkbox.checked = false;
		},
		false
	);

	// Adding smooth scroll
	var scroll = new SmoothScroll('a[href*="#"]', {
		speed: 800,
		speedAsDuration: true,
	});

	// Close toc on click
	const closeTocSelector = document.querySelector(".close-toc");
	if (closeTocSelector)
		closeTocSelector.addEventListener("click", function () {
			document.querySelector(".post-toc").classList.add("hide");
		});

	// Table of Contents toggler on click
	const tocIconSelector = document.querySelector(".toc-icon");
	if (tocIconSelector)
		tocIconSelector.addEventListener("click", function () {
			document.querySelector(".post-toc").classList.toggle("hide");
		});

	// Add scroll add active
	function scrollActiveSetup() {
		var scrollDistance = window.pageYOffset || document.documentElement.scrollTop;

		document
			.querySelectorAll(
				".post-content h1, .post-content h2, .post-content h3, .post-content h4,.post-content h5, .post-content h6"
			)
			.forEach(function (section) {
				var sectionTop = section.offsetTop;
				var sectionBottom = sectionTop + section.offsetHeight;

				if (scrollDistance >= sectionTop && scrollDistance <= sectionBottom) {
					const target_id = section.getAttribute("id"),
						target_tag = section.tagName.toLowerCase();
					const tocItemSelector = `.post-toc-item.toc-${target_tag}`;
                    
					// Remove active class from all toc items
					document.querySelectorAll(".post-toc-item.active").forEach(function (item) {
						item.classList.remove("active");
					});
					// Add active class to the current toc item
					document.querySelectorAll(tocItemSelector).forEach(function (item) {
						if (item.querySelector("a").getAttribute("href").includes(target_id))
							item.classList.add("active");
					});
				}
			});
	}
	window.addEventListener("scroll", scrollActiveSetup);
})(document);
