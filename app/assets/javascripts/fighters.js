// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function () {
  disable_submit_button();

  $("#addButton").on("click", function () {
    if ($(".skillSelect").length > 4) {
      alert("Only 5 skills allowed");
      return false;
    }
    add_fighter_skill_element();
  });

  $("#removeButton").on("click", function () {
    if ($(".skillSelect").length == 1) {
      alert("At least one skill should be present");
      return false;
    }
    var lastElementVal = $(".skillSelect").last().children().first()[0].value
    $(".skillSelect").last().remove();
    removeAttribute(lastElementVal,'disabled');

    enable_submit_button($("[id^=fighter_fighter_skills_attributes] option:selected"));
  });

  $(".skillsGroup").on("change", function() {
    var options_to_disable = $("[id^=fighter_fighter_skills_attributes] option:selected");
    var all_options = $("select [id!=skill_id]");
    var values_to_disable = $.map(options_to_disable,function(opt) { return opt.value })
    var values_to_free = $.map(all_options,function(opt) { return opt.value })

    values_to_free = get_values_to_free(values_to_free,values_to_disable);

    $(values_to_disable).each(function() { addAttribute(all_options, this, 'disabled'); });
    $(values_to_free).each(function() { removeAttribute(all_options, this, 'disabled'); });

    enable_submit_button(options_to_disable);
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


function enable_submit_button(options) {
  var button = $('#submitButton');
  var options_values = $.map(options,function(option) { return option.value });
  if( options_values.indexOf("") === -1 && options_values.length > 0) {
    button.removeAttr('disabled');
  } else {
    button.attr('disabled','disabled');
  }
}

function disable_submit_button() {
  $('#submitButton').attr('disabled','disabled');
}

function get_values_to_free(arr1,arr2) {
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

function incremented_name(name, number) {
  return name.replace(/\d+/, number);
}

function add_fighter_skill_element() {
  var newType = $(".skillSelect").first().clone().addClass("skillSelect");
  var incrementBy = $(".skillSelect").length;
  var select = newType[0].children[0];
  var input = newType[0].children[1];

  newType[0].children[0].name = incremented_name(select.name, incrementBy);
  newType[0].children[0].id = incremented_name(select.id, incrementBy);
  newType[0].children[1].name = incremented_name(input.name, incrementBy);
  newType[0].children[1].id = incremented_name(input.id, incrementBy);

  disable_submit_button();
  newType.appendTo(".skillsGroup");
}
