/* global analytics twemoji */

// -- Twitter Emoji --

function parseEmojis() {
  twemoji.parse(document.body, {
    ext: '.svg',
    folder: '../2/svg',
  });
}


// -- Filters --

/**
 * Run a function on restaurants that are closed.
 */
function funcClosed(func, duration, hideButtonDisabled, showButtonDisabled) {
  $('#restaurants td:first-child').each(function hideOrShow() {
    const params = { duration };
    if (this.innerHTML.startsWith('<s>')) {
      const tr = $(this.parentElement);
      if (func === 'hide') {
        tr.hide(params);
      } else {
        tr.show(params);
      }
    }
  });

  $('#hideClosedButton').prop('disabled', hideButtonDisabled);
  $('#showClosedButton').prop('disabled', showButtonDisabled);
}

/**
 * Hide restaurants that are closed.
 */
function hideClosed(duration = 0) {
  funcClosed('hide', duration, true, false);
  analytics.track('Archived Hidden', { duration });
}

/**
 * Show restaurants that are closed.
 */
// eslint-disable-next-line no-unused-vars
function showClosed(duration = 0) {
  funcClosed('show', duration, false, true);
  analytics.track('Archived Shown', { duration });
}

/**
 * Dynamically add an emoji badge to newly added or coming soon places.
 *
 */
function addNewBadges() {
  const DAYS_AGO = 90;
  const badgeNew = '🆕';
  const badgeSoon = '🔜';
  const defaultAddedDate = '2016-06-19'; // initial commit
  const defaultOpenedDate = '2016-06-19'; // initial commit

  const today = new Date();
  today.setHours(0, 0, 0, 0);

  // Anything added in the past DAYS_AGO days is considered new
  const earliestNewDate = new Date();
  earliestNewDate.setHours(0, 0, 0, 0);
  earliestNewDate.setDate(earliestNewDate.getDate() - DAYS_AGO);

  const places = $('#restaurants td:first-child');
  places.each(function addBadges() {
    const tr = $(this.parentElement);
    const dateAdded = new Date(Date.parse(tr.data('dateAdded') || defaultAddedDate));
    const dateOpened = new Date(Date.parse(tr.data('dateOpened') || defaultOpenedDate));

    // new = recently opened or recently added
    if (((dateOpened >= earliestNewDate) || (dateAdded >= earliestNewDate))
        && dateOpened <= today) {
      this.innerHTML += ` ${badgeNew}`;
    }

    // soon = opening in the future
    if (dateOpened > today) {
      this.innerHTML += ` ${badgeSoon}`;
    }
  });

  parseEmojis();
}

/**
 * App entrypoint.
 */
// eslint-disable-next-line no-unused-vars
function init() {
  hideClosed();
  addNewBadges();
}
