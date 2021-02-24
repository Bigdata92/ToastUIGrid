<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/node_modules/tui-time-picker/dist/tui-time-picker.css">
    <link rel="stylesheet" href="/node_modules/tui-date-picker/dist/tui-date-picker.css">
    <link rel="stylesheet" href="/node_modules/tui-grid/dist/tui-grid.min.css">
    <link rel="stylesheet" href="/node_modules/bootstrap/dist/css/bootstrap.min.css">
    <script src="/node_modules/jquery/dist/jquery.min.js"></script>
    <script src="/node_modules/tui-code-snippet/dist/tui-code-snippet.js"></script>
    <script src="/node_modules/tui-time-picker/dist/tui-time-picker.min.js"></script>
    <script src="/node_modules/tui-date-picker/dist/tui-date-picker.min.js"></script>
    <script src="/node_modules/tui-grid/dist/tui-grid.min.js"></script>
</head>
<style>
    * {
        margin: 0 auto;
    }
</style>
<script>
    var grid;
    window.onload = function () {
      grid = new tui.Grid({
        el: document.getElementById('grid'),
        // data: gridData,
        scrollX: false,
        scrollY: false,
        rowHeaders: ["rowNum"],
        columns: [
            {
            header: 'Name',
            name: 'name'
            },
            {
            header: 'Artist',
            name: 'artist'
            },
            {
            header: 'Type',
            name: 'type'
            },
            {
            header: 'Release',
            name: 'release'
            },
            {
            header: 'Genre',
            name: 'genre'
            }
        ]
      });

      $("button").click(function() {
        $.ajax({
            url:  "ajax/toastList", //"index.js",
            method: "GET",
            dataType: "JSON",
            success: function (result) {
                grid.resetData(eval(result));
            }
        });
      });
    };

    tui.Grid.applyTheme('normal', {
        cell: {
            normal: {
                background: "#fff",
                border: "#e0e0e0",
                showVerticalBorder: true,
                showHorizontalBorder: true,
            },
            header: {
                background: "#eaeaea",
                border: "#e0e0e0",
                showHorizontalBorder: true,
            },
            rowHeader: {
                background: "#eaeaea",
                border: "#e0e0e0",
                showHorizontalBorder: true,
            },
        }
    });
</script>
<body>
    <div id="wrap" style= "width: 90%";>
        <div style="display: flex; flex-flow: row nowrap; margin-bottom: 10px;">
            <div>
                <img src="/node_modules/bootstrap-icons/icons/alarm-fill.svg">List
            </div>
            <div>
                <button type="button" class="btn btn-primary btn-sm">Search</button>
            </div>
        </div>
        <div id="grid"></div>
    </div>
</body>
</html>