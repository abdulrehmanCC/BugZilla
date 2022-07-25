function toggleSelects() {
  
    var value = $('#bug_type').find(":selected").text();
    //  document.write("something");
    console.log(value, "Hello, world!");
    $('[data-target=bug]').toggle(value === 'bug');
    $('[data-target=bug] select').attr('disable', value !== 'bug');
  
    $('[data-target=feature]').toggle(value == 'feature');
    $('[data-target=feature] select').attr('disable', value !== 'feature');
  }
  