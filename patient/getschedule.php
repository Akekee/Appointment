<?php
session_start();
include_once '../assets/conn/dbconnect.php';
$q = $_GET['q'];
$res = mysqli_query($con,"SELECT * FROM doctorschedule WHERE scheduleDate='$q'");
if (!$res) {
die("Error running $sql: " . mysqli_error());
}
?>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <?php
        if (mysqli_num_rows($res)==0) {
        echo "<div class='alert alert-danger' role='alert'>ไม่มีตารางการจองคิวสำหรับวันนี้ กรุณาเลือกวันที่อื่น!!</div>";
        
        } else {
        echo "   <table class='table table-hover'>";
            echo " <thead>";
                echo " <tr>";
                    
                   
                    echo " <th>วันเดือนปี</th>";
                    echo "  <th>เวลา เริ่ม</th>";
                    echo "  <th>เวลา สิ้นสุด</th>";
                    echo " <th>ประเภททันตกรรม</th>";
                    echo " <th>สถานะ</th>";
                    echo "  <th>จองเลย!!</th>";
                    echo " </tr>";
                    echo "  </thead>";
                    echo "  <tbody>";
                while($row = mysqli_fetch_array($res)) {
                ?>
                <tr>
                    <?php
                    // $avail=null;
                    // $btnclick="";
                    
                    if ($row['bookAvail']!='ว่าง') {
                    $avail="danger";
                    $btnstate="disabled";
                    $btnclick="danger";
                    } else {
                    $avail="primary";
                    $btnstate="";
                    $btnclick="primary";
                    }
                    
                   
                    // if ($rowapp['bookAvail']!="available") {
                    // $btnstate="disabled";
                    // } else {
                    // $btnstate="";
                    // }
                   
                    echo "<td>" . $row['scheduleDate'] . "</td>";
                    echo "<td>" . $row['startTime'] . "</td>";
                    echo "<td>" . $row['endTime'] . "</td>";
                    echo "<td>" . $row['service'] . "</td>";
                    echo "<td> <span class='label label-".$avail."'>". $row['bookAvail'] ."</span></td>";
                    echo "<td><a href='appointment.php?&appid=" . $row['scheduleId'] . "&scheduleDate=".$q."' class='btn btn-".$btnclick." btn-xs' role='button' ".$btnstate.">จองเลย</a></td>";
                    // echo "<td><a href='appointment.php?&appid=" . $row['scheduleId'] . "&scheduleDate=".$q."'>Book</a></td>";
                    // <td><button type='button' class='btn btn-primary btn-xs' data-toggle='modal' data-target='#exampleModal'>จองเลย</button></td>";
                    //triggered when modal is about to be shown
                    ?>
                    
                    </script>
                    <!-- ?> -->
                </tr>
                
                <?php
                }
                }
                ?>
            </tbody>
            <!-- modal start -->
            
            
            
            
            
        </body>
    </html>