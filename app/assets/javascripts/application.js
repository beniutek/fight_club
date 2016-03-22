// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tether
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

function handleSelectChange(optionsToDisable, allOptions) {
  var valuesToDisable = $.map(optionsToDisable,function(opt) { return opt.value })
  var valuesToFree = $.map(allOptions,function(opt) { return opt.value })

  valuesToFree = getValuesToFree(valuesToFree,valuesToDisable);

  $(valuesToDisable).each(function() { addAttribute(allOptions, this, 'disabled'); });
  $(valuesToFree).each(function() { removeAttribute(allOptions, this, 'disabled'); });
}

function addAttribute(element, value, attr) {
  $(element).filter("[value='"+value+"']").attr(attr,attr);
}
function removeAttribute(element, value, attr) {
  $(element).filter("[value='"+value+"']").removeAttr(attr);
}
function getValuesToFree(arr1,arr2) {
  return $.unique(arr1).filter(function(val) {
    return arr2.indexOf(val) === -1;
  });
}
