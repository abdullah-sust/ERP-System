<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="text/javascript" src="/bower_components/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="/bower_components/moment/min/moment.min.js"></script>
  <script type="text/javascript" src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="/bower_components/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
  <link rel="stylesheet" href="/bower_components/bootstrap/dist/css/bootstrap.min.css" />
  <link rel="stylesheet" href="/bower_components/eonasdan-bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.min.css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script type="text/javascript">
    function edit(p){
    	//e.preventDefault();
		console.log($('form[name=editForm]').serialize());
    	$.post({
	         url : 'saveEditInvoice',
	         data : $('form[name=editForm]').serialize(),
	         success : function(res) {
	        	 console.log("QQQQ");
	        	 window.location.href = "/";
	    }
	});
    }
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
                    <h1 class="page-header">Customer Invoices / Edit</h1>
                </div>
<!--                 <div class="panel panel-default"> -->
                <div class="col-lg-12">
                        <div class="panel-body">
                           <!--  <a href="#" class="btn btn-default btn-block">Create</a> -->
                            <!-- <a href="/"><button type="button" class="btn btn-primary btn-md">Save</button></a>
                            <a href="/"><button type="button" class="btn btn-primary btn-md">Discard</button></a> -->
                            <button id="e" name="e" onclick="edit(${customer.id})" class="btn btn-primary btn-md">Save</button>
		                    <a href="/"><button type="button" class="btn btn-primary btn-md">Discard</button></a>
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
                           <form action="editCustomer" method="post"  name="editForm">
                           <input id="id" name="id" value="${customer.id}" hidden>
							  <div class="form-row">
							  <div class="col-lg-12">
		                        <div class="panel-body">
		                            <%-- <button id="edit" name="edit" onclick="edit(${customer.customer})" class="btn btn-primary btn-md">Save</button>
		                             <a href="/"><button type="button" class="btn btn-primary btn-md">Discard</button></a> --%>
		                           <!--  <button id="discard" name="discard" type="button" class="btn btn-primary btn-md">Discard</button> -->
		                        </div>
                			  </div>
							    <div class="form-group col-md-6">
							      <label for="inputEmail4">Customer</label>
							      <%-- <input type="email" class="form-control" id="inputEmail4" placeholder="${customer.customer}"> --%>
							      <select name=customer class="form-control" id="customer" required>
  							      	  <option value="${customer.customer}">${customer.customer}</option>
									  <option value="Agrolait">Agrolait</option>
									  <option value="Agrolait, Laith Jubair">Agrolait, Laith Jubair</option>
									  <option value="Agrolait, Michel Fletcher">Agrolait, Michel Fletcher</option>
									  <option value="Agrolait, Thomas Passot">Agrolait, Thomas Passot</option>
									  <option value="Camptocamp">Camptocamp</option>
									  <option value="Camptocamp, Ayaan Agarwal">Camptocamp, Ayaan Agarwal</option>
									  <option value="Camptocamp, Benjamin Flores">Camptocamp, Benjamin Flores</option>
								  </select>
							    </div>
    							<div class="form-group col-md-6">
    							      <label for="inputPassword4">Invoice Date</label>
							      <%-- <input type="password" class="form-control" id="inputPassword4" placeholder="${customer.invoiceDate}"> --%>
							      <input class="form-control"id="invoiceDate" name="invoiceDate" value="${customer.invoiceDate}" type="date" required>
							    </div>
							  </div>
							  <div class="form-group col-md-6">
							    <label for="inputAddress">Payment Terms</label>
							    <%-- <input type="text" class="form-control" id="inputAddress" placeholder="${customer.paymentTerms}"> --%>
							    <select name="paymentTerms" class="form-control" id="paymentTerms" required>
							    	  <option value="${customer.paymentTerms}">${customer.paymentTerms}</option>
									  <option value="15 Days">15 Days</option>
									  <option value="30% Advance End of Following Month">30% Advance End of Following Month</option>
									  <option value="30 Net Days">30 Net Days</option>
									  <option value="End of Following Month">End of Following Month</option>
									  <option value="Immediate Payment">Immediate Payment</option>
								  </select>
							  </div>
							  <div class="form-group col-md-6">
							    <label for="inputAddress2">Salesperson</label>
							    <%-- <input type="text" class="form-control" id="inputAddress2" placeholder="${customer.salesperson}"> --%>
							    <select name="salesperson" class="form-control" id="salesperson" required>
									  <option value="${customer.salesperson}">${customer.salesperson}</option>
									  <option value="Administrator">Administrator</option>
									  <option value="Demo Portal User">Demo Portal User</option>
									  <option value="Demo User">Demo User</option>
								</select>
							  </div>
<!-- 							  <button type="submit" class="btn btn-primary">Sign in</button> -->
							<div class="form-group col-md-12">
							    <label for="inputAddress"><h3> Invoice Lines</h3></label>
							<!--     <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"> -->
							</div>
                            <div class="form-group col-md-12">
                                <label for="inputAddress"><a href="">Add an item</a></label>
                            <!--     <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St"> -->
                            </div>
							<!-- Table Start -->
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
				                  <tbody>
				                   <c:forEach items="${product}" var="item">
								    <tr>
								        <td><select class='form-control'><option><c:out value="${item.product}"/></option><option>[CARD] Graphics Card</option><option>[C-Case] Computer Case</option><option>[CONS_DEL01] Server</option><option>[CONS_DEL02] Little server</option><option>[CONS_DEL03] Basic Computer</option><option>[CPUi5] Processor Core i5 2.70 Ghz</option><option>[E-COM01] iPad Retina Display (White, 16 GB)</option></select></td>
								        <td><input type='text' class='form-control' value="<c:out value="${item.description}"/>"/></td>
								        <td><input type='number' class='form-control' value="<c:out value="${item.quantity}"/>"/></td>
								        <td><input type='number' class='form-control' value="<c:out value="${item.unitPrice}"/>"/></td>
								        <td><input type='number' class='form-control' value="<c:out value="${item.amount}"/>"/></td>
								        <td><input type='number' class='form-control' value="<c:out value="${item.total}"/>"/></td>
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
    <script src="../vendor/jquery/jquery.min.js"></script>

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
