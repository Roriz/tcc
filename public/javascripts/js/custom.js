window.loading = function(show) {
    if (!alertify.loadingDialog) {
        alertify.dialog('loadingDialog', function() {
            return {
                main: function(content) {
                    $(this.elements.header).addClass('hide');
                    $(this.elements.footer).addClass('hide');
                    $(this.elements.body).parent().addClass('loadingDialog');
                    this.setContent(content);
                }
            };
        })
        alertify.dialog('loadingDialog').set({
            transition: 'fade',
            title: '',
            closable: false,
            closableByDimmer: false,
            pinnable: false,
            pinned: false,
            movable: false,
            maximizable: false,
            moveBounded: false,
            resizable: false,
            message: ''
        })

    }
    if (show) {;
        alertify.loadingDialog($('<svg>').addClass('loading-circle').attr('width', '65px').attr('height', '65px').attr('viewBox', '0 0 66 66').append(
            $('<circle>').addClass('loading-path').attr('fill', 'none').attr('stroke-width', '6').attr('stroke-linecap', 'round').attr('cx', '33').attr('cy', '33').attr('r', '30')
        )[0].outerHTML);
    } else {
        alertify.closeAll();
    }
}