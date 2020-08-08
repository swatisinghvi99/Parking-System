<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
   
<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "parking";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

%>

<!DOCTYPE html>
<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Admin - Home</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Custom fonts for this template-->
  <link href="assets_admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="assets_admin/css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this page -->
  <link href="assets_admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">
<% 
 response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
 %>
<%
    	if(session.getAttribute("email")==null){
    		response.sendRedirect("login1.jsp");
    	}
 %>
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar sidebar-dark accordion" style="background: #1e4356;" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="adminindex.jsp">
        
        <div class="sidebar-brand-text mx-3"><img src="assets/img/logo.png" width="116.91px" height="39.99px" ></div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item">
        <a class="nav-link" href="adminindex.jsp">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Add/Manage
      </div>
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseCategory"
          aria-expanded="true" aria-controls="collapseCategory">
          <i class="fas fa-fw fa-shopping-cart" ></i>
          <span>Category</span>
        </a>
        <div id="collapseCategory" class="collapse" aria-labelledby="headingCategory" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            
            <a class="collapse-item" href="addvehicle.jsp">Add Vehicle</a>
            <a class="collapse-item" href="managevehicles.jsp">Manage Vehicles</a>
            
          </div>
        </div>
      </li>
      <!-- Nav Item - Pages Collapse Menu -->
       <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRates"
          aria-expanded="true" aria-controls="collapseRates">
          <i class="fas fa-fw fa-rupee-sign" ></i>
          <span>Rates</span>
        </a>
        <div id="collapseRates" class="collapse" aria-labelledby="headingRates" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            
            <a class="collapse-item" href="addrate.jsp">Add Rate</a>
            <a class="collapse-item" href="managerates.jsp">Manage Rates</a>
            
          </div>
        </div>
      </li>
      <li class="nav-item">
         <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
          aria-controls="collapseTwo">
          <i class="fas fa-fw fa-car"></i>
          <span>Parking Locations</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
    
            <a class="collapse-item" href="addslot.jsp">Add Location</a>
            <a class="collapse-item" href="manageslots.jsp">Manage Locations</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
       View
      </div>
<li class="nav-item active">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="true" aria-controls="collapsePages">
          <i class="fas fa-fw fa-table"></i>
          <span>Database</span>
        </a>
        <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="userdata.jsp">User Data</a>
            <a class="collapse-item active" href="parkingdata.jsp">Parking Data</a>
            
          </div>
        </div>
      </li>
      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="reports.jsp">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>Reports</span></a>
      </li>

    

      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <form class="form-inline">
            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
              <i class="fa fa-bars"></i>
            </button>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
           <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=session.getAttribute("fullName") %></span>
                <img class="img-profile rounded-circle" src="assets_admin/img/user.png">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">Database</h1>

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">User Parking Details</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Order ID</th>
                      <th>Customer ID</th>
                      <th>Full Name</th>
                      <th>Number Plate</th>
                      <th>City</th>
                      <th>Location</th>
                      <th>Location Type</th>
                      <th>Date</th>
                      <th>In Time</th>
                      <th>Duration</th>
                      <th>Out Time</th>
                      <th>Vehicle Type</th>
                      <th>Amount</th>
                      <th>Waitlist</th>
                      <th>Amount Status</th>
                      <th>Booking Status</th>
                    </tr>
                  </thead>
        
                  <tbody>
                   <%
                    try{
                    Connection connection = DriverManager.getConnection(connectionUrl+database, userid, password);
                    Statement statement=connection.createStatement();
                    String sql ="select * from parking";
                    ResultSet resultSet = statement.executeQuery(sql);
                    while(resultSet.next()){
                    %>
                    <tr>
                    <td><%=resultSet.getString("id") %></td>
                    <td><%=resultSet.getString("orderid") %></td>
                    <td><%=resultSet.getString("custid") %></td>
                    <td><%=resultSet.getString("fullName") %></td>
                    <td><%=resultSet.getString("vehicle_no") %></td>
                    <td><%=resultSet.getString("city") %></td>
                    <td><%=resultSet.getString("location") %></td>
                    <td><%=resultSet.getString("locationType") %></td>
                    <td><%=resultSet.getString("date") %></td>
                    <td><%=resultSet.getString("in_time") %></td>
                    <td><%=resultSet.getString("duration") %></td>
                    <td><%=resultSet.getString("out_time") %></td>
                    <td><%=resultSet.getString("vehicleType") %></td>
                    <td><%=resultSet.getString("amount") %></td>
                    <td><%=resultSet.getString("waitlist") %></td>
                    <td><%=resultSet.getString("paid_status") %></td>
                    <td><%=resultSet.getString("status") %></td>
                    </tr>
                    <%
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                    %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Waitlisted Users</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Order ID</th>
                                            <th>Customer ID</th>
                                            <th>Full Name</th>
                                            <th>Number Plate</th>
                                            <th>City</th>
                                            <th>Location</th>
                                            <th>Location Type</th>
                                            <th>Date</th>
                                            <th>In Time</th>
                                            <th>Duration</th>
                                             <th>Out Time</th>
                                            <th>Vehicle Type</th>
                                            <th>Amount</th>
                                            <th>Waitlist</th>
                                            <th>Amount Status</th>
                                            <th>Booking Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                    <%
                                        try{
                                        Connection connection2 = DriverManager.getConnection(connectionUrl+database, userid, password);
                                        Statement statement1=connection2.createStatement();
                                        String sql2 ="select * from waitlist";
                                        ResultSet rst = statement1.executeQuery(sql2);
                                        while(rst.next()){
                                        %>
                                        <tr>
                                            <td><%=rst.getString("id") %></td>
                                            <td><%=rst.getString("orderid") %></td>
                                            <td><%=rst.getString("custid") %></td>
                                            <td><%=rst.getString("fullName") %></td>
                                            <td><%=rst.getString("vehicle_no") %></td>
                                            <td><%=rst.getString("city") %></td>
                                            <td><%=rst.getString("location") %></td>
                                            <td><%=rst.getString("locationType") %></td>
                                            <td><%=rst.getString("date") %></td>
                                            <td><%=rst.getString("in_time") %></td>
                                            <td><%=rst.getString("duration") %></td>
                                            <td><%=rst.getString("out_time") %></td>
                                            <td><%=rst.getString("vehicleType") %></td>
                                            <td><%=rst.getString("amount") %></td>
                                            <td><%=rst.getString("waitlist") %></td>
                                            <td><%=rst.getString("paid_status") %></td>
                                            <td><%=rst.getString("status") %></td>
                                            <td>
                                            <ul class="list-inline m-0">
                                            <li class="list-inline-item">
                                              <a href="<%=request.getContextPath()%>/moveuser?id=<%=rst.getString("id")%>&name=<%=rst.getString("fullName")%>"><button class="btn btn-success btn-sm rounded-0" type="button" data-toggle="tooltip" data-placement="top" title="Move"><i class="fa fa-arrow-up"></i></button></a>
                                            </li>
                                            
                                          </ul></td>
                                        </tr>
                                        <%
                                        }
                                        connection2.close();
                                        } catch (Exception e) {
                                        e.printStackTrace();
                                        }
                                        %>
                                    </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>

        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
             &copy; Copyright <strong><span>Swati Singhvi</span></strong>. All Rights Reserved
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">X</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="<%=request.getContextPath()%>/logout">Logout</a>
        </div>
      </div>
    </div>
  </div>

   <!-- Bootstrap core JavaScript-->
  <script src="assets_admin/vendor/jquery/jquery.min.js"></script>
  <script src="assets_admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="assets_admin/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="assets_admin/js/sb-admin-2.min.js"></script>

  <!-- Page level plugins -->
  <script src="assets_admin/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="assets_admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="assets_admin/js/demo/datatables-demo.js"></script>

</body>

</html>
