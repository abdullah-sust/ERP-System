<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
   <!--  <script type="text/javascript" src="/bower_components/jquery/jquery.min.js"></script> -->
  <!-- <script type="text/javascript" src="/bower_components/moment/min/moment.min.js"></script> -->
  <!-- <script type="text/javascript" src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" /> -->

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<script type="text/javascript">
		/* var i = 0;
		var row, main;
		$(function() {
			$(document).ready(function() {
				console.log("Hello!");
			});
		});
		
		function showNewRow(){
			if(i==0){
				console.log("!"+i);++i;

			}
			else{
				++i;
				var table = document.getElementById("productTable").innerHTML;
				row = "<tr><td><select class='form-control'><option></option><option>[CARD] Graphics Card</option><option>[C-Case] Computer Case</option><option>[CONS_DEL01] Server</option><option>[CONS_DEL02] Little server</option><option>[CONS_DEL03] Basic Computer</option><option>[CPUi5] Processor Core i5 2.70 Ghz</option><option>[E-COM01] iPad Retina Display (White, 16 GB)</option></select></td><td><input type='text' class='form-control'></td><td><input type='number' class='form-control'></td><td><input type='number' class='form-control'></td><td><input type='number' class='form-control'></td><td><p class='form-control'>0.00</p></td></tr>";
				document.getElementById("productTable").innerHTML=row+table;
				$('#demo').show(); 
				console.log("Bye!");
			}
		} */
	</script>
</head>
<body>
    <div id="wrapper">

      <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <!-- <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                        </li> -->
                        <li>
                            <a href="/"><i class="fa fa-dashboard fa-fw"></i>  Customer Invoices</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Customer Invoices / Details</h1>
                </div>
<!--                 <div class="panel panel-default"> -->
                <div class="col-lg-12">
                        <div class="panel-body">
                           <!--  <a href="#" class="btn btn-default btn-block">Create</a> -->
                            <!-- <a href="/editInvoice"><button type="button" class="btn btn-primary btn-md">Edit</button></a> -->
                        </div>
                        <!-- /.panel-body -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        <!-- Table Start -->
        <div class="row">
            <div class="col-lg-12">
            <div class="col-lg-12">
                        <div class="panel-body">
                           <form name="customerForm">
							  <div class="form-group col-md-12">
							      <a href="editInvoice?id=${customer.id}" ><button id="edit" name="edit" type="button" class="btn btn-primary btn-md">Edit</button></a>
							  </div>
							  
							  <div class="form-row">
							    <div class="form-group col-md-6">
							      <label for="inputEmail4">Customer</label>
							      <%-- <p class="form-control" id="inputEmail4">${customer.customer}</p> --%>
							      <input class="form-control" id="customer" readonly="readonly" value="${customer.customer}">
							    </div>
    							<div class="form-group col-md-6">
    							      <label for="inputPassword4">Invoice Date</label>
							      <%-- <p class="form-control" id="inputPassword4">${customer.invoiceDate}</p> --%>
							      <input class="form-control" id="invoiceDate" readonly="readonly" value="${customer.invoiceDate}">
							    </div>
							  </div>
							  <div class="form-group col-md-6">
							    <label for="inputAddress">Payment Terms</label>
							    <%-- <p class="form-control" id="inputAddress">${customer.paymentTerms}</p> --%>
							    <input class="form-control" id="paymentTerms" readonly="readonly" value="${customer.paymentTerms}">
							  </div>
							  <div class="form-group col-md-6">
							    <label for="inputAddress2">Salesperson</label>
							    <%-- <p class="form-control" id="inputAddress2">${customer.salesperson}</p> --%>
							    <input class="form-control" id="salesperson" readonly="readonly" value="${customer.salesperson}">
							  </div>
<!-- 							  <button type="submit" class="btn btn-primary">Sign in</button> -->
							<div class="form-group col-md-12">
							    <label for="inputAddress"><h3> Invoice Lines</h3></label>
							<!--     <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"> -->
							</div>
                            <div class="form-group col-md-12">
                                <label for="inputAddress"><a onclick="showNewRow();" href="#" hidden>Add an item</a></label>
                            <!--     <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"> -->
                            </div>
							<!-- Table Start -->
							<div class="row">
				            	<div class="col-lg-12"  id="demo" style="display: none;">
				            	</div>
				        	</div>
							<div class="row">
				            <div class="col-lg-12">
				                <table class="table table-hover">
				                  <thead>
				                    <tr>
				                      <th scope="col">Product</th>
				                      <th scope="col">Description</th>
				                      <th scope="col">Quantity</th>
				                      <th scope="col">$ Unit Price</th>
				                      <th scope="col">$ Amount</th>
				                      <th scope="col">$ Total</th>
				                    </tr>
				                  </thead>
				                  <tbody id="productTable">
				                  	<c:forEach items="${product}" var="item">
								    <tr>
								        <td><c:out value="${item.product}"/></td>
								        <td><c:out value="${item.description}"/></td>
								        <td><c:out value="${item.quantity}"/></td>
								        <td><c:out value="${item.unitPrice}"/></td>
								        <td><c:out value="${item.amount}"/></td>
								        <td><c:out value="${item.total}"/></td>
								    </tr>
									</c:forEach>
				                  </tbody>
				                </table>
				            </div>
                            <div class="col-lg-12" align="right">
                                <u><label for="inputAddress"><h5>Untaxed Amount: $<c:out value="${amount}"/></h5></label></u>
                            </div>
                            <div class="col-lg-12" align="right">
                                <u><label for="inputAddress"><h6>Tax: $<c:out value="${tax}"/></h6></label></u>
                            </div>
                            <div class="col-lg-12" align="right">
                                <label for="inputAddress"><h4><b>Total: $<c:out value="${total}"/></b></h4></label>
                            </div>
        				    </div>
        <!-- Table End -->
							</form>
                        </div>
                        <!-- /.panel-body -->
                </div>
            </div>
        </div>
        <!-- Table End -->
        
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../vendor/raphael/raphael.min.js"></script>
    <script src="../vendor/morrisjs/morris.min.js"></script>
    <script src="../data/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>








