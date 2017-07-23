// -- Twitter Emoji --

function parseEmojis() {
    twemoji.parse(document.body, {
        ext: '.svg',
        folder: '../svg'
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

    $("#updated-date").text("July 2017");

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
