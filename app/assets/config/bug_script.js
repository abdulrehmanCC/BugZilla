$("input[name='bug[bug_type]']").on('change',function func2() {
    
    console.log('inside chnage method')
    var obj = $("select[name='bug[status]']")[0][2]

    console.log(obj)
    if (this.value==='bug') {
      obj.value = "resolved"
      obj.text = "resolved"

    } else {
      obj.value = "completed"
      obj.text  = "completed"

    }
  })

  function toggleSelects() {
    var check = $("input[name='bug[bug_type]']:checked").val();
    console.log(check);
    var obj3 = $("select[name='bug[status]']")
    var obj = $("select[name='bug[status]']")[0][2]
    if (check==='bug') {
        obj.value = "resolved"
        obj.text = "resolved"
      } else {
        obj.value = "completed"
        obj.text  = "completed"
      }
  }
  $(toggleSelects);


