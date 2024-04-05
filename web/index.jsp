<%-- 
    Document   : index
    Created on : Mar 28, 2024, 9:03:36 AM
    Author     : st
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }
            header {
                background-color: #333;
                color: #fff;
                padding: 10px;
                text-align: center;
            }
            form {
                background-color: #fff;
                padding: 20px;
                margin: 20px auto;
                width: 50%;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            input[type="text"], input[type="submit"] {
                padding: 10px;
                margin-bottom: 10px;
                width: calc(100% - 20px);
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            input[type="submit"] {
                background-color: #333;
                color: #fff;
                cursor: pointer;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <%
            try{
            Connection con = null;
//            PreparedStatement pss = null;
//            ResultSet rss =null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/darshan_14","root","");
            
//            pss = con.prepareStatement("select * from medicine");   
//            rss = pss.executeQuery();
            HttpSession ssn = request.getSession();
            ssn.setAttribute("key", ssn.getId());   
        %>
        <form action="#" method="post" onsubmit="return validation()">
            <table>
                <tr>
                    <td>
                        Enter medicine name:
                    </td>
                    <td><input type="text" name="mname" id="mname"> </td>
                    <!--<td><input type="submit" value="search" id="msearch" </td>-->
                </tr>
                <tr>
                    <td>
                        Enter Manufacturer name:
                    </td>
                    <td><input type="text" name="mfname" id="mfname"> </td>
                    <td><input type="submit" value="search" id="mfsearch" </td>
                </tr>
            </table>
        </form>
        <!--<table border="1">-->
            <!--<tr>-->
                <!--<td>id</td><td>medicine_name</td><td>medicine_detail</td><td>manufacturer_name</td><td>batch_no</td><td>manufacturing_month_year</td><td>expiring_month_year</td>-->
            <!--</tr>-->

            <%
//                while(rss.next()){
            %>
            <!--<tr>-->
                <!--<td><% // out.println(rss.getInt("id"));%></td>-->
                <!--<td><% // out.println(rss.getString("medicine_name"));%></td>-->
                <!--<td><% // out.println(rss.getString("medicine_detail"));%></td>-->
                <!--<td><% // out.println(rss.getString("manufacturer_name"));%></td>-->
                <!--<td><% // out.println(rss.getString("batch_no"));%></td>-->
                <!--<td><% // out.println(rss.getDate("manufacturing_month_year"));%></td>-->
                <td><% // out.println(rss.getDate("expiring_month_year"));}
                    }catch(Exception e){
                        e.printStackTrace();
                    }%></td>
            </tr>
        <!--</table>-->
        <%@include file="display.jsp" %>
        <script>
            function validation(){
                var mname = document.getElementById("mname").value;
                var mfname = document.getElementById("mfname").value;

                if(mname == "" && mfname == ""){
                    alert("must fill atleast one fields");
                    return false;
                }
            }
        </script>
    </body>
</html>

<!--CREATE TABLE `darshan_14`.`medicine` (
  `id` INT NOT NULL,
  `medicine_name` VARCHAR(45) NULL,
  `medicine_detail` VARCHAR(45) NULL,
  `manufacturer_name` VARCHAR(45) NULL,
  `batch_no` VARCHAR(45) NULL,
  `manufacturing_month_year` DATE NULL,
  `expiring_month_year` DATE NULL,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC));-->

<!--INSERT INTO darshan_14.medicine (id, medicine_name, medicine_detail, manufacturer_name, batch_no, manufacturing_month_year, expiring_month_year)
VALUES
(1, 'Paracetamol', 'Pain reliever and fever reducer', 'ABC Pharmaceuticals', '1234501', '2023-06-01', '2024-06-01'),
(2, 'Ibuprofen', 'Nonsteroidal anti-inflammatory drug (NSAID)', 'XYZ Pharma', '6789002', '2023-07-01', '2024-07-01'),
(3, 'Amoxicillin', 'Antibiotic', 'Generic Drugs Inc.', '5432103', '2023-08-01', '2024-08-01'),
(4, 'Aspirin', 'Pain reliever and anti-inflammatory drug', 'ABC Pharmaceuticals', '2468004', '2023-09-01', '2024-09-01'),
(5, 'Loratadine', 'Antihistamine', 'XYZ Pharma', '1357905', '2023-10-01', '2024-10-01'),
(6, 'Cetirizine', 'Antihistamine', 'Generic Drugs Inc.', '9753106', '2023-11-01', '2024-11-01'),
(7, 'Omeprazole', 'Proton-pump inhibitor', 'ABC Pharmaceuticals', '8642007', '2023-12-01', '2024-12-01'),
(8, 'Simvastatin', 'HMG-CoA reductase inhibitor', 'XYZ Pharma', '1122308', '2024-01-01', '2025-01-01'),
(9, 'Metformin', 'Antidiabetic medication', 'Generic Drugs Inc.', '4455609', '2024-02-01', '2025-02-01'),
(10, 'Prednisone', 'Corticosteroid', 'ABC Pharmaceuticals', '7788910', '2024-03-01', '2025-03-01'),
(11, 'Ciprofloxacin', 'Antibiotic', 'XYZ Pharma', '3344511', '2024-04-01', '2025-04-01'),
(12, 'Atorvastatin', 'HMG-CoA reductase inhibitor', 'Generic Drugs Inc.', '5567812', '2024-05-01', '2025-05-01'),
(13, 'Diazepam', 'Anxiolytic', 'ABC Pharmaceuticals', '9900013', '2024-06-01', '2025-06-01'),
(14, 'Gabapentin', 'Anticonvulsant', 'XYZ Pharma', '1123414', '2024-07-01', '2025-07-01'),
(15, 'Tramadol', 'Opioid analgesic', 'Generic Drugs Inc.', '5567815', '2024-08-01', '2025-08-01'),
(16, 'Warfarin', 'Anticoagulant', 'ABC Pharmaceuticals', '3344516', '2024-09-01', '2025-09-01'),
(17, 'Diphenhydramine', 'Antihistamine', 'XYZ Pharma', '7788917', '2024-10-01', '2025-10-01'),
(18, 'Metoprolol', 'Beta blocker', 'Generic Drugs Inc.', '4455618', '2024-11-01', '2025-11-01'),
(19, 'Levothyroxine', 'Thyroid hormone', 'ABC Pharmaceuticals', '9900019', '2024-12-01', '2025-12-01'),
(20, 'Hydrochlorothiazide', 'Diuretic', 'XYZ Pharma', '1123420', '2025-01-01', '2026-01-01'),
(21, 'Lisinopril', 'ACE inhibitor', 'Generic Drugs Inc.', '2233421', '2025-02-01', '2026-02-01'),
(22, 'Metronidazole', 'Antibiotic', 'ABC Pharmaceuticals', '4456622', '2025-03-01', '2026-03-01'),
(23, 'Fluoxetine', 'SSRI antidepressant', 'XYZ Pharma', '7789023', '2025-04-01', '2026-04-01'),
(24, 'Albuterol', 'Bronchodilator', 'Generic Drugs Inc.', '1123524', '2025-05-01', '2026-05-01'),
(25, 'Losartan', 'ARB antihypertensive', 'ABC Pharmaceuticals', '4456725', '2025-06-01', '2026-06-01');-->


