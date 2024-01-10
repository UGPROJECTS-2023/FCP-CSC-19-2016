<?php 
global $msg;
// include './config/connection.php';
session_start();
$dbhostname = "localhost";
$dbusername = "root";
$dbpassword = "";
$dbname = "pms_db";

$conn = @new mysqli($dbhostname, $dbusername, $dbpassword, $dbname);
// include './common_service/common_functions.php';

// $patients = getPatients($con);


if(isset($_POST['submit'])){
	$reg = strtoupper($_POST['reg']);
	$name = $_POST['name'];
	$record = $_POST['record'];
	$gender = $_POST['gender'];

	if($query = $conn->query("INSERT INTO `lab_records` (`reg`, `name`, `records`, `gender`) VALUES ('$reg', '$name', '$record', '$gender')")){
		$msg = "<div class = 'alert alert-success'>Lab record added successfully</div>";
	}
	else{
		$msg = "<div class = 'alert alert-danger'>Failed to add lab record</div>";
	}
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
	<title>Lab Records</title>
	<?php include './config/site_css_links.php';?>

 <?php include './config/data_tables_css.php';?>
</head>
<body class="hold-transition sidebar-mini dark-mode layout-fixed layout-navbar-fixed">
<div class="wrapper">
	<?php include './config/header.php';
include './config/sidebar.php';?>  
<div class="content-wrapper">
	<section class="content-header">
		<div class="container-fluid">
			<h1>Patient Lab History</h1>
		</div>
	</section>

	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8">
					<div class="card">

						<div class="card-header">
							<h5><span class="fa fa-search"></span> Search Patient Lab History</h5>
						</div>
						<div class="card-body">
							<form method="POST" action="<?php echo $_SERVER['PHP_SELF'] ?>">
								<div class="input-group">
									<input type="text" name="patient_reg" placeholder="Patient Reg No" class="form-control">
									<div class="input-group-btn">
										<button type="submit" name="search" class="btn btn-primary btn-block">
											<span class="fa fa-search"></span>
										</button>
									</div>
								</div>
							</form>
						</div>
						<div class="container-fluid">
							<table class="table table-striped">
								<?php 
							if(isset($_POST['search'])){
								$name = strtoupper($_POST['patient_reg']);
								$query = $conn->query("SELECT * FROM `lab_records` WHERE `reg` = '$name'");
								if($query->num_rows == 0){
									echo "<div class = 'alert alert-danger'>Record not found for <b>$name</b></div>";
								}
								else{
									$t = 0;
									while($row = $query->fetch_assoc()){
										$t++;
						?>
						<tr>
							<td><?php echo $t; ?></td>
							<td><?php echo $row['reg']; ?></td>
							<td><?php echo $row['name']; ?></td>
							<td><?php echo $row['gender']; ?></td>
							<td><?php echo $row['records']; ?></td>
							<td><?php echo $row['date']; ?></td>
						</tr>
						<?php 

									}
								}
							}
						?>
							</table>
							
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<?php echo $msg; ?>
						<div class="card-header">
							<h5><span class="fa fa-plus"></span> Add Lab History</h5>
						</div>
						<div class="card-body">
							<form method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
								<div class="form-group">
									<input type="text" name="reg" placeholder="Enter patient reg no" class="form-control" required>
								</div>
								<div class="form-group">
									<input type="text" name="name" placeholder="Enter patient name" class="form-control" required>
								</div>
								<div class="form-group">
									<select name="gender" class="form-control">
										<option value="Male">Male</option>
										<option value="Female">Female</option>
									</select>
								</div>
								<div class="form-group">
									<label>Enter Lab/Diagnosis Record</label>
									<textarea name="record" class="form-control" rows="7" required></textarea>
								</div>
								<div class="form-group">
									<button type="submit" name="submit" class="btn btn-primary btn-block">Add Lab Record</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</div>

<?php include './config/site_js_links.php' ?>
</body>
</html>