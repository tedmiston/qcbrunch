// -- Twitter Emoji --

function parseEmojis() {
    twemoji.parse(document.body, {
        ext: '.svg',
        folder: '../2/svg'
    });
}


// -- Last Updated Date --

/**
 * Convert month integer value to month name.
 *
 * @param {number} num - The integer month value where 0 = January, 1 = February, etc.
 * @returns {string} The name of the month.
 */
function getMonthName(num) {
    var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    return months[num];
}

/**
 * Build a string of the month and year for a given date.
 *
 * @param {Object} date - A date object.
 * @returns {string} A string like "January 2017".
 */
function buildDateString(date) {
    var day = date.getDate();
    var month = getMonthName(date.getMonth());
    var year = date.getFullYear();
    return month + ' ' + day + ', ' + year;
}

/**
 * Get the greater of two date strings.
 *
 * @param {string} dateStr1 - A date string.
 * @param {string} dateStr2 - Another date string.
 * @returns {Object} The greater of the two.
 */
function getMaxDate(dateStr1, dateStr2) {
    var d1 = new Date(dateStr1);
    var d2 = new Date(dateStr2);
    return d1 > d2 ? d1 : d2;
}

/**
 * Determine when the site repo was last updated per its HEAD commit via the GitHub API, then populate that month and year on the page.
 */
function checkWhenLastUpdated() {
    // FIXME: getting aggressively rate limited
    // TODO: pull from gh-pages branch

    $("#updated-date").text("April 2018");

    // var updatedDate;
    // $.getJSON("https://api.github.com/repos/tedmiston/qcbrunch/commits/HEAD")
    //     .done(function(data) {
    //         var committerDate = data.commit.author.date;
    //         var authorDate = data.commit.committer.date;

    //         console.log('committerDate =', committerDate);
    //         console.log('authorDate =', authorDate);

    //         var laterDate = getMaxDate(committerDate, authorDate);
    //         updatedDate = buildDateString(laterDate);
    //     })
    //     .fail(function(data) {
    //         updatedDate = "Recently";
    //         // $('#updated-date-container').fadeOut();
    //     })
    //     .always(function(data) {
    //         $("#updated-date").text(updatedDate);
    //     });
}


// -- Filters --

/**
 * Run a function on restaurants that are closed.
 */
function funcClosed(func, duration, hideButtonDisabled, showButtonDisabled) {
    $("#restaurants td:first-child").each(function(){
        const params = { duration };
        if (this.innerHTML.startsWith("<s>")) {
            const tr = $(this.parentElement);
            func === 'hide' ? tr.hide(params) : tr.show(params);
        }
    });

    $("#hideClosedButton").prop('disabled', hideButtonDisabled);
    $("#showClosedButton").prop('disabled', showButtonDisabled);
}

/**
 * Hide restaurants that are closed.
 */
function hideClosed(duration=0) {
    funcClosed('hide', duration, true, false);
}

/**
 * Show restaurants that are closed.
 */
function showClosed(duration=0) {
    funcClosed('show', duration, false, true);
}

/**
 * Dynamically add an emoji badge to newly added or coming soon places.
 *
 */
function addNewBadges() {
    const DAYS_AGO = 60;
    const badgeNew = '🆕';
    const badgeSoon = '🔜';
    const defaultAddedDate = '2016-06-19';  // initial commit
    const defaultOpenedDate = '2016-06-19';  // initial commit

    // Anything added in the past DAYS_AGO days is considered new
    const earliestNewDate = new Date();
    earliestNewDate.setHours(0, 0, 0, 0);
    earliestNewDate.setDate(earliestNewDate.getDate() - DAYS_AGO);

    const places = $("#restaurants td:first-child");
    places.each(function(){
        const tr = $(this.parentElement);
        const dateAdded = Date.parse(tr.data('dateAdded') || defaultAddedDate);
        const dateOpened = Date.parse(tr.data('dateOpened') || defaultOpenedDate);

        // Display new badge for p
        if (dateOpened > dateAdded) {
            this.innerHTML += ' ' + badgeSoon;
        } else if (dateAdded > earliestNewDate) {
            this.innerHTML += ' ' + badgeNew;
        }
    });

    parseEmojis();
}

/**
 * App entrypoint.
 */
function init() {
    checkWhenLastUpdated();
    hideClosed();
    addNewBadges();
}
