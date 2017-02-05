$(document).ready(function () {
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        var dateFormat = "mm.dd.yy",
          from = $("#from")
            .datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 2,
                dateFormat: 'dd.mm.yy'
            })
            .on("change", function () {
                to.datepicker("option", "minDate", getDate(this));
            }),
          to = $("#to").datepicker({
              defaultDate: "+1w",
              changeMonth: true,
              numberOfMonths: 2,
              dateFormat: 'dd.mm.yy',
          })
          .on("change", function () {
              from.datepicker("option", "maxDate", getDate(this));
          });

        function getDate(element) {
            var date;
            try {
                date = $.datepicker.parseDate(dateFormat, element.value);
            } catch (error) {
                date = null;
            }
            return date;
        }
    }
});