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
		$('button[type=submit]').click(function(e) { 
			e.preventDefault();                        //preventDefault() method will prevent the action of event
		    //$('input').next().remove();
			console.log($('form[name=customerForm]').serialize());
	//		e.preventDefault();  
	
		 	$.post({
			         url : 'addCustomer',
			         data : $('form[name=customerForm]').serialize(),
			         success : function(res) {         
			            JSON.stringify(res);
			         }
			});
			   
		});
	});
	</script>

</head>
<body>
<div id="demo" style="display: none;">

</div>
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
                    <h1 class="page-header">Customer Invoices / Create New</h1>
                </div>
<!--                 <div class="panel panel-default"> -->
                <div class="col-lg-12">
                        <div class="panel-body">
                       <!-- <a href="#" class="btn btn-default btn-block">Create</a>
                            <a href="/" id="save"><button type="button" class="btn btn-primary btn-md">Save</button></a>
                            <a href="/" id="discard"><button type="button" class="btn btn-primary btn-md">Discard</button></a> -->
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
                           <form action="addCustomer" method="post"  name="customerForm"><!--action="addCustomer"  addCustomer method="post" -->
							  <div class="form-row">
							  <div class="col-lg-12">
		                        <div class="panel-body">
		                            <button id="save" name="save" type="submit" class="btn btn-primary btn-md">Save</button>
		                           <!--  <button id="discard" name="discard" type="button" class="btn btn-primary btn-md">Discard</button> -->
		                        </div>
                			  </div>
							    <div class="form-group col-md-6">
							      <label>Customer</label>
							      <select name="customer" class="form-control" id="customer" required>
  							      	  <option></option>
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
    							      <input class="form-control" id="invoiceDate" name="invoiceDate" value="mm-dd-yyyy" type="date" required>
							  <!--     <input required type="password" class="form-control" id="inputPassword4" placeholder="Invoice Date"> -->
							    </div>
							  </div>
							  
							  <div class="form-group col-md-6">
							    <label for="paymentTerms">Payment Terms</label>
							    <select name="paymentTerms" class="form-control" id="paymentTerms" required>
							    	  <option></option>
									  <option value="15 Days">15 Days</option>
									  <option value="30% Advance End of Following Month">30% Advance End of Following Month</option>
									  <option value="30 Net Days">30 Net Days</option>
									  <option value="End of Following Month">End of Following Month</option>
									  <option value="Immediate Payment">Immediate Payment</option>
								  </select>
							    <!-- <input required type="text" class="form-control" id="inputAddress" placeholder="Payment Terms"> -->
							  </div>
							  
							  <div class="form-group col-md-6">
							    <label for="salesperson">Salesperson</label>
							    <select name="salesperson" class="form-control" id="salesperson" required>
									  <option></option>
									  <option value="Administrator">Administrator</option>
									  <option value="Demo Portal User">Demo Portal User</option>
									  <option value="Demo User">Demo User</option>
								</select>
							    <!-- <input required type="text" class="form-control" id="inputAddress2" placeholder="Salesperson"> -->
							  </div>
							  </form>
							<div>
							    <label for=""><h3> Invoice Lines</h3></label>
							</div>
                            <div>
                                <label for=""><a href="">Add an item</a></label>
                            </div>
							<!-- Table Start -->
							<div class="row">
				            <div class="col-lg-12">
				                <table class="table table-hover">
				                  <thead>
				                    <tr>
				                      <th scope="col">Product</th>
				                      <th scope="col">Description</th>
				                      <th scope="col">Quality</th>
				                      <th scope="col">Unit Price</th>
				                      <th scope="col">Amount</th>
				                      <th scope="col">Total</th>
				                    </tr>
				                  </thead>
				                  <tbody>
				                    <tr>
				                      <td>Mark</td>
				                      <td>Otto</td>
				                      <td>@mdo</td>
				                      <td>Mark</td>
				                      <td>Otto</td>
				                      <td>@mdo</td>
				                    </tr>
				                  </tbody>
				                </table>
				            </div>
                            <div class="col-lg-12" align="right">
                                <u><label><h5><b>Untaxed Amount: $0.00</b></h5></label></u>
                            </div>
                            <div class="col-lg-12" align="right">
                                <u><label><h6><b>Tax: $0.00</b></h6></label></u>
                            </div>
                            <div class="col-lg-12" align="right">
                                <label><h4><b>Total: $0.00</b></h4></label>
                            </div>
        				    </div>
        <!-- Table End -->
							<!-- </form> -->
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
