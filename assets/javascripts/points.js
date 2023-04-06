function toggleTablePoints(el) {
  var element = $(el).parents('div').first();
  element.toggleClass('collapsed expended');
  element.children('p').toggleClass('icon-collapsed icon-expended');
  element.children('div').toggleClass('table-collapsed table-expended');
  element.children("div").toggle();
}

function toggleTablesPointsCollapsed(el) {
  var element = $(el).parents('div').parents('div').first();
  if (element.children('div').children('div').hasClass('expended'))
  {
    element.children('div').children('div').removeClass('expended');
    element.children('div').children('div').addClass('collapsed');

    element.children('div').children('div').children('p').removeClass('icon-expended');
    element.children('div').children('div').children('p').addClass('icon-collapsed');

    element.children('div').children('div').children('div').removeClass('table-expended');
    element.children('div').children('div').children('div').addClass('table-collapsed');

    element.children('div').children('div').children('div').hide();
  }
 
}

function toggleTablesPointsExpended(el) {
  var element = $(el).parents('div').parents('div').first();
  if (element.children('div').children('div').hasClass('collapsed'))
  {
    element.children('div').children('div').removeClass('collapsed');
    element.children('div').children('div').addClass('expended');

    element.children('div').children('div').children('p').removeClass('icon-collapsed');
    element.children('div').children('div').children('p').addClass('icon-expended');

    element.children('div').children('div').children('div').removeClass('table-collapsed');
    element.children('div').children('div').children('div').addClass('table-expended');
    
    element.children('div').children('div').children('div').show();
  }
  
}


