<?php 
// include './config/connection.php';
session_start();
$dbhostname = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname = "pms_db";

$conn = @new mysqli($dbhostname, $dbusername, $dbpassword, $dbname);
// include './common_service/common_functions.php';

// $patients = getPatients($con);
 
?>
<!DOCTYPE html>
<html lang="en">
<head>
 <?php include './config/site_css_links.php';?>
 <title>Patient History - FUD CLINIC MANAGEMENT SYSTEM</title>

</head>
<body class="hold-transition sidebar-mini dark-mode layout-fixed layout-navbar-fixed">
<!-- Site wrapper -->
<div class="wrapper">
  <!-- Navbar -->

<?php include './config/header.php';
include './config/sidebar.php';?>  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Patient History</h1>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card card-outline card-primary rounded-0 shadow">
        <div class="card-header">
          <h3 class="card-title">Search Patient History</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" title="Collapse">
              <i class="fas fa-minus"></i>
            </button>
           
          </div>
        </div>
        <div class="card-body">
          <form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
             <input type="text" name="pat" class="form-control" placeholder="Enter patient name"><br/>
             <button type="submit" name="submit" class="btn btn-primary btn-lg"><span class="fa fa-search"></span></button>
          </form>

            <div class="clearfix">&nbsp;</div>
            <div class="clearfix">&nbsp;</div>

            <div class="row">
              <div class="col-md-12 table-responsive">
               
                     <?php
                     $i = 0;
                       if(isset($_POST['submit'])){
                        ?>
                         <table class="table table-striped">
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>Gender</th>
                      <th>Search history</th>
                    </tr>
                    <?php 
                        $name = $_POST['pat'];
                        $query = "SELECT * FROM `patients` WHERE `patient_name` LIKE '%$name%'";

                      $result = $conn->query($query);
                      $i = 0;
                      while ($row = $result->fetch_assoc()):
                        $i ++;

                    ?>
                    <tr>
                      <td><?php echo $i; ?></td>
                      <td><?php echo $row['patient_name'] ?></td>
                      <td><?php echo $row['gender'] ?></td>
                      <td><a href="patient_history.php?pat_id=<?php echo $row['id'] ?>">Seach history</a> </td>

                    </tr>
                  <?php endwhile; } ?>
                <?php
                if(isset($_GET['pat_id'])){
                  $id = $_GET['pat_id'];
                ?>
                </table>
                <table id="patient_history" class="table table-striped table-bordered">
                  <colgroup>
                    <col width="10%">
                    <col width="15%">
                    <col width="15%">
                    <col width="40%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                  </colgroup>
                  <thead>
                    <tr class="table text-light">
                      <th class="p-1 text-center">S.No</th>
                      <th class="p-1 text-center">Visit Date</th>
                      <th class="p-1 text-center">Disease</th>
                      <th class="p-1 text-center">Medicine</th>
                      <th class="p-1 text-center">Packing</th>
                      <th class="p-1 text-center">QTY</th>
                      <th class="p-1 text-center">Dosage</th>
                    </tr>
                  </thead>

                  <tbody>
                   
                    <?php
                    $query = "SELECT `m`.`medicine_name`, `md`.`packing`, 
                    `pv`.`visit_date`, `pv`.`disease`, `pmh`.`quantity`, `pmh`.`dosage` 
                    from `medicines` as `m`, `medicine_details` as `md`, 
                    `patient_visits` as `pv`, `patient_medication_history` as `pmh` 
                    where `m`.`id` = `md`.`medicine_id` and 
                    `pv`.`patient_id` = $id and 
                    `pv`.`id` = `pmh`.`patient_visit_id` and 
                    `md`.`id` = `pmh`.`medicine_details_id` 
                    order by `pv`.`id` asc, `pmh`.`id` asc;";

                    $result = $conn->query($query);
                    $x = 0;
                    while($rows = $result->fetch_assoc()):
                      $x ++;
                    ?>
                    <tr>
                      <td><?php echo $x; ?></td>
                       <td><?php echo $rows['visit_date'] ?></td>
                       <td><?php echo $rows['disease'] ?></td>
                       <td><?php echo $rows['medicine_name'] ?></td>
                       <td><?php echo $rows['packing'] ?></td>
                       <td><?php echo $rows['quantity'] ?></td>
                       <td><?php echo $rows['dosage'] ?></td>
                    </tr>
                  <?php endwhile; ?>
                  </tbody>
                </table>
              <?php } ?>
              </div>
            </div>
        </div>
        <!-- /.card-body -->
        
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

<?php include './config/footer.php' ?>  
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<?php include './config/site_js_links.php' ?>

<script>
  showMenuSelected("#mnu_patients", "#mi_patient_history");

  $(document).ready(function() {

    $("#search").click(function() {
      var patientId = $("#patient").val();

      if(patientId !== '') {

        $.ajax({
          url: "ajax/get_patient_history.php",
          type: 'GET', 
          data: {
            'patient_id': patientId
          },
          cache:false,
          async:false,
          success: function (data, status, xhr) {
              $("#history_data").html(data);
          },
          error: function (jqXhr, textStatus, errorMessage) {
            showCustomMessage(errorMessage);
          }
        });

        //alert('hello');

      }

    });


    $("#abc").click(function() {

    });

//event driven programming

  });
</script>

</body>
</html>