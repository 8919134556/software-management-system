var divider = null;

$(document).ready(function() {
  var addedList = [];
  divider = $('.divider');

  $("*[page=true]").each(function() {
    var name = $(this).attr("page-name");
    var index = $(this).attr("page-index");
    var menu = '<li data-position="' + index + '" onclick="changeTab(this, ' + index + ')">' + name + '</li>';

    //Find li with data-position > index, if exist, ~insertBefore~, else ~append~
    if (addedList.length == 0) {
      $(".header .tabs").append(menu);
    } else {
      var added = false;
      for (var i = 0; i < addedList.length; i++) {
        // Adiciona antes do elemento que tiver o índice maior
        if (parseInt(addedList[i]) > parseInt(index)) {
          $(menu).insertBefore(".header .tabs > li[data-position=" + addedList[i] + "]");
          added = true;
          break;
        }
      }

      // Irá cair aqui caso o indice for o maior
      if (!added) {
        $(".header .tabs").append(menu);
      }
    }

    addedList = [];
    $(".header .tabs > li").each(function(index, element) {
      addedList.push($(element).attr("data-position"));
    });

  });

  if (addedList.length > 0) {
    $("*[page=true][page-index!=" + addedList[0] + "]").hide();
    $(".header .tabs li:first-child").addClass("active");
    changeDivider($(".header .tabs li:first-child"));
  }
});

function changeTab(element, position) {
  $(element).addClass("active");
  $(element).siblings(".active").removeClass("active");
  $("*[page=true]").hide();
  $("*[page-index=" + position + "]").show();
  
  changeDivider(element);
}

function changeDivider(element) {
  divider.css({
    left: $(element).offset().left,
    width: $(element).outerWidth()
  });
}