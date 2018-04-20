<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>ERP System</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
 
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/morris.js/0.5.1/morris.min.js"></script>
	
    <script type="text/javascript">
    
    $(function() {
	$(document).ready(function() {
	      $.get({
	          url : 'showCustomer',
	          success : function(res) {         
	        var output="<table border=2px  class='table table-hover'><tr><th scope='col'>Id</th><th scope='col'>Customer</th><th scope='col'>Invoice Date</th><th scope='col'>Number</th><th scope='col'>Salesperson</th><th scope='col'>Due date</th><th scope='col'>Source Document</th><th scope='col'>Status</th></tr>";
	 		var i=0;
	 		$.each(res, function () {
	 		++i;
	 		output+="<tr><td>"+this.id+"</td><td><a id='invo' href='showInvoice?param="+this.id+"' data-value='"+this.id+"'>"+this.customer+"</a></td><td>"+this.invoiceDate+"</td><td>"+this.number+"</td><td>"+this.salesperson+"</td><td>"+this.dueDate+"</td><td>"+this.soureceDocument+"</td><td>"+this.status+"</td></tr>";
	 		}); // onclick='showInvoice("+this.id+");'
	               output+="</table>";
	               document.getElementById("demo").innerHTML = output; 
	               $('#demo').show();
	          },
	       error: function(e){
	     	  console.log(e);
	       }
	       });
	});
	      
	$("#next").click(function(event){
		var p = $(this).data("value");
	    showPage(p);
	    showPage(p);
		$('#next').data('value',p+1);
	    $('#prev').data('value',p-1);
        
	});   
	$("#prev").click(function(event){
		var p = $(this).data("value");
		if(p==0){
			showPage(p);
			$('#next').data('value',1);
		    $('#prev').data('value',0);
		}
		else{
			showPage(p);
			$('#next').data('value',p+1);
		    $('#prev').data('value',p-1);
		}
	}); 
	
	function showPage(p) {
		$.get({
			url : 'nextCustomer',
			data : {
				page : p
			},
			success : function(res) {
				    var output="<table border=2px  class='table table-hover'><tr><th scope='col'>Id</th><th scope='col'>Customer</th><th scope='col'>Invoice Date</th><th scope='col'>Number</th><th scope='col'>Salesperson</th><th scope='col'>Due date</th><th scope='col'>Source Document</th><th scope='col'>Status</th></tr>";
	 				var i=0;
	 		$.each(res, function () {
	 		++i;
	 		output+="<tr><td>"+this.id+"</td><td><a href='showInvoice?param="+this.id+"'>"+this.customer+"</a></td><td>"+this.invoiceDate+"</td><td>"+this.number+"</td><td>"+this.salesperson+"</td><td>"+this.dueDate+"</td><td>"+this.soureceDocument+"</td><td>"+this.status+"</td></tr>";
	 		});
	               output+="</table>";
	               document.getElementById("demo").innerHTML = output;
	               $('#demo').show(); 
			}
		})
	}
});
</script>
    

</head>

<body>
<div id="page" style="display: none;"></div>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="/"><i class="fa fa-dashboard fa-fw"></i>  Customer Invoices</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Customer Invoices / All</h1>
                </div>
                <div class="col-lg-10">
                        <div class="panel-body">
                         <a href="create_invoice"><button type="button" class="btn btn-primary btn-md">Create</button></a>
                        </div>
                </div>
                <div class="col-lg-2">
                    <nav aria-label="Page navigation example">
                      <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Previous" data-value="0" id="prev">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Previous</span>
                          </a>
                        </li>
                        <li class="page-item">
                          <a class="page-link" aria-label="Next" href="#" data-value="1" id="next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Next</span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                </div>
            </div>
        <div class="row">
            <div class="col-lg-12"  id="demo" style="display: none;">
            </div>
        </div>
        </div>

    </div>
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>
    <script src="../dist/js/sb-admin-2.js"></script>
</body>

</html>
