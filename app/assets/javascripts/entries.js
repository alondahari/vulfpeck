$(document).ready(function() {
  'use strict';
  setTimeout(function() {
    const snackbarContainer = document.querySelector('#error-snackbar');
    const notice = $(snackbarContainer).data('notice')
    if ( notice ) {
      snackbarContainer.MaterialSnackbar.showSnackbar({message: notice});
    }
  }, 100)

  $('.up-vote').on('click', function() {
    const el = $(this)
    const id = el.data('id')
    const container = el.closest('.entry')
    const badge = container.find('.mdl-badge')
    const ul = $('ul')
    const li = ul.find('.entry')
    fetch(`/upvote/${id}`, {
      method: 'POST'
    }).then(function(res) {
      return res.json()
    }).then(function(json) {
      badge.attr('data-badge', json.new_votes)
      container.attr('data-votes', json.new_votes)
      li.sort(function(li1, li2) {
        return +$(li1).attr('data-votes') < +$(li2).attr('data-votes')
      })
      li.detach().appendTo(ul)
    })
  })
});
