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
    var lastElementVal = $(".skillSelect").last().children().first()[0].value
    $(".skillSelect").last().remove();
    removeAttribute(lastElementVal,'disabled');

    enableSubmitButton($("[id^=fighter_fighter_skills_attributes] option:selected"));
  });

  $(".skillsGroup").on("change", function() {
    var optionsToDisable = $("[id^=fighter_fighter_skills_attributes] option:selected");
    var allOptions = $("select [id!=skill_id]");
    var valuesToDisable = $.map(optionsToDisable,function(opt) { return opt.value })
    var valuesToFree = $.map(allOptions,function(opt) { return opt.value })

    valuesToFree = getValuesToFree(valuesToFree,valuesToDisable);

    $(valuesToDisable).each(function() { addAttribute(allOptions, this, 'disabled'); });
    $(valuesToFree).each(function() { removeAttribute(allOptions, this, 'disabled'); });

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

function getValuesToFree(arr1,arr2) {
  return $.unique(arr1).filter(function(val) {
    return arr2.indexOf(val) === -1;
  });
}
function addAttribute(element, value, attr) {
  $(element).filter("[value='"+value+"']").attr(attr,attr);
}
function removeAttribute(element, value, attr) {
  $(element).filter("[value='"+value+"']").removeAttr(attr);
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
