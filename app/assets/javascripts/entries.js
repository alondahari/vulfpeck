$(document).ready(function() {
  'use strict';
  setTimeout(function() {
    const snackbarContainer = document.querySelector('#error-snackbar');
    const notice = $(snackbarContainer).data('notice')
    if ( notice ) {
      snackbarContainer.MaterialSnackbar.showSnackbar({message: notice});
    }
  }, 100)
});
