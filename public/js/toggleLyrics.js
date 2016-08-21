$(document).ready(function(){
  //initially hide all lyrics
  $('.lyrics').hide();
  //toggle lyric display
  $('.lyricsToggle').click(function(e){
    e.preventDefault();
    var lyricTarget = $(this).attr('id').replace('toggle','');
    //lyrics are hidden, target and expand
    if ($(this).text() === 'Show Lyrics')
    {
      console.log(lyricTarget);
      $('#' + lyricTarget).slideDown(300);
      $(this).text('Hide Lyrics');
    }
    else
    //lyrics are showing, target and hide
    {
      $('#' + lyricTarget).slideUp(300);
      $(this).text('Show Lyrics');
    }
  });
  //initialize video player



});
