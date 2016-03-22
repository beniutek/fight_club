// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  disableSubmitButton();

  $("#addButton").on("click", function () {
    if ($(".skillSelect").length > 4) {
      alert("Only 5 skills allowed");
      return false;
    }
    addFighterSkillElement();
  });

  $("#removeButton").on("click", function () {
    if ($(".skillSelect").length == 1) {
      alert("At least one skill should be present");
      return false;
    }
    $(".skillSelect").last().remove();
    var optionsToDisable = $("[id^=fighter_fighter_skills_attributes] option:selected");
    handleSelectChange(optionsToDisable, $("select [id!=skill_id]"));
    enableSubmitButton(optionsToDisable);
  });

  $(".skillsGroup").on("change", function() {
    var optionsToDisable = $("[id^=fighter_fighter_skills_attributes] option:selected");

    handleSelectChange(optionsToDisable, $("select [id!=skill_id]"));

    enableSubmitButton(optionsToDisable);
  });

  $('#submitButton').on('click', function () { $('option').removeAttr('disabled'); });

  $('.fromPc').on('change', function(event) { handleImageInput(event,'.fromNet') });
  $('.fromNet').on('change', function(event) { handleImageInput(event,'.fromPc') });
});

function handleImageInput(element, target) {
  if(element.currentTarget.value === '' || element.currentTarget.value === 'undefined' ) {
    $(target).removeAttr('disabled');
  } else {
    $(target).attr('disabled','disabled');
  }
}


function enableSubmitButton(options) {
  var button = $('#submitButton');
  var optionsValues = $.map(options,function(option) { return option.value });
  if( optionsValues.indexOf("") === -1 && optionsValues.length > 0) {
    button.removeAttr('disabled');
  } else {
    button.attr('disabled','disabled');
  }
}

function disableSubmitButton() {
  $('#submitButton').attr('disabled','disabled');
}

function incrementName(name, number) {
  return name.replace(/\d+/, number);
}

function addFighterSkillElement() {
  var newType = $(".skillSelect").first().clone().addClass("skillSelect");
  var incrementBy = $(".skillSelect").length;
  var select = newType[0].children[0];
  var input = newType[0].children[1];

  newType[0].children[0].name = incrementName(select.name, incrementBy);
  newType[0].children[0].id = incrementName(select.id, incrementBy);
  newType[0].children[1].name = incrementName(input.name, incrementBy);
  newType[0].children[1].id = incrementName(input.id, incrementBy);

  disableSubmitButton();
  newType.appendTo(".skillsGroup");
}
