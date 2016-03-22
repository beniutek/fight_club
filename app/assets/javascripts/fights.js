// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(function() {
  var oldFighterValue;
  var oldOpponentValuel;

  $("#fight_fighters_fighter_id").hover(function() {oldFighterValue = this.value});
  $("#fight_fighters_opponent_id").hover(function() {oldOpponentValue = this.value});

  $("[id^=fight_fighters]").on('change', function() {
    if(this.id === 'fight_fighters_fighter_id') {
      fetchFighter(this, oldFighterValue, 'fighter-area');
    } else {
      fetchFighter(this, oldOpponentValue, 'opponent-area');
    }
    handleSelectChange($("[id^=fight_fighters] option:selected"), $("select [id!=skill_id]"));
  });
});

function fetchFighter(context, val, element) {
  $.ajax({
    type: "GET",
    url: '/fighters/' + context.value,
    data: context.value,
    dataType: "JSON",
    success: function(fighter) {renderFighter(fighter, val, element)}
  });
}

function renderFighter(fighter, val, element) {
  if(val !== '' || val !== 'undefined') {
    destroyFighter(val, element);
  }
  $(createFighterImage(fighter)).appendTo('#'+element);
}

function destroyFighter(val, element) {
  $('#' + element + ' > #fighter_' + val).remove();
}

function createFighterImage(fighter) {
  var newElement = document.createElement('img');
  newElement.className = "img-responsive circle-image";
  newElement.id = "fighter_"+fighter.id
  newElement.src = fighter.image.url;
  return newElement;
}
