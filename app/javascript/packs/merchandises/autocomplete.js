document.addEventListener('DOMContentLoaded', function() {
    $('#category_name').autocomplete({
        autoFocus: true,  //テキストフィールドの値をフォーカスされたアイテムの値で置き換える
        source: "/merchandises/autocomplete_category.json",
        minLength: 1  //オートコンプリートが動作する文字数を指定
    });
  });