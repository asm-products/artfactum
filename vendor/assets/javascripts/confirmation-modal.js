(function() {
  var TwitterBootstrapConfirmBox;

  $.fn.twitter_bootstrap_confirmbox = {
    defaults: {
      title: null,
      proceed: "OK",
      proceed_class: "btn proceed",
      cancel: "Cancel",
      cancel_class: "btn cancel",
      fade: false
    }
  };

  TwitterBootstrapConfirmBox = function(message, element, callback) {
    var $dialog;
    $dialog = $('<div class="modal" id="confirmation_dialog"><div class="modal-dialog"><div class="modal-content"><div class="modal-header"> <button type="button" class="close" data-dismiss="modal">×</button> <h3>...</h3> </div> <div class="modal-body"></div> <div class="modal-footer"></div> </div></div></div>');
    if (element.data("confirm-fade") || $.fn.twitter_bootstrap_confirmbox.defaults.fade) {
      $dialog.addClass("fade");
    }
    return $dialog.find(".modal-header").find("h3").html(element.data("confirm-title") || $.fn.twitter_bootstrap_confirmbox.defaults.title || window.top.location.origin).end().end().find(".modal-body").html(message.toString().replace(/\n/g, "<br />")).end().find(".modal-footer").append($("<a />", {
      href: "#",
      "data-dismiss": "modal"
    }).html(element.data("confirm-cancel") || $.fn.twitter_bootstrap_confirmbox.defaults.cancel).addClass($.fn.twitter_bootstrap_confirmbox.defaults.cancel_class).addClass(element.data("confirm-cancel-class")).click(function(event) {
      event.preventDefault();
      return $dialog.modal("hide");
    }), $("<a />", {
      href: "#"
    }).html(element.data("confirm-proceed") || $.fn.twitter_bootstrap_confirmbox.defaults.proceed).addClass($.fn.twitter_bootstrap_confirmbox.defaults.proceed_class).addClass(element.data("confirm-proceed-class") || "btn-primary").click(function(event) {
      event.preventDefault();
      $dialog.modal("hide");
      return callback();
    })).end().on("hidden", function() {
      return $(this).remove();
    }).modal("show").appendTo(document.body);
  };

  $.rails.allowAction = function(element) {
    var answer, message;
    message = element.data("confirm");
    answer = false;
    if (!message) {
      return true;
    }
    if ($.rails.fire(element, "confirm")) {
      TwitterBootstrapConfirmBox(message, element, function() {
        var allowAction, evt;
        if ($.rails.fire(element, "confirm:complete", [answer])) {
          allowAction = $.rails.allowAction;
          $.rails.allowAction = function() {
            return true;
          };
          if (element.get(0).click) {
            element.get(0).click();
          } else if (typeof Event !== "undefined" && Event !== null) {
            evt = new Event("click", {
              bubbles: true,
              cancelable: true,
              view: window,
              detail: 0,
              screenX: 0,
              screenY: 0,
              clientX: 0,
              clientY: 0,
              ctrlKey: false,
              altKey: false,
              shiftKey: false,
              metaKey: false,
              button: 0,
              relatedTarget: document.body.parentNode
            });
            element.get(0).dispatchEvent(evt);
          } else if ($.isFunction(document.createEvent)) {
            evt = document.createEvent("MouseEvents");
            evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, document.body.parentNode);
            element.get(0).dispatchEvent(evt);
          }
          return $.rails.allowAction = allowAction;
        }
      });
    }
    return false;
  };

}).call(this);
