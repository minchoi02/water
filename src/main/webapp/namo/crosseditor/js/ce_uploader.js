var pe_Tq={Upload:function(form,pe_bGC,pe_afZ,pe_bZB,pe_bYa,pe_bZn){ce$(form).ajaxForm({formData:pe_bZn,url:pe_bGC,beforeSend:function(e){pe_afZ();},complete:function(xhr){pe_bZB(xhr);},pe_cdJ:function(event,position,total,pe_bNT){var pe_cdZ=pe_bNT+'\x25';},error:function(response,status,request){pe_bYa();}}).submit();}};