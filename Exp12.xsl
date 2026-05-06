<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">

<html>
<head>
    <title>Student Management</title>

    <style>
        body {
            font-family: Arial;
            background-color: #f4f6f8;
            text-align: center;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 70%;
            background-color: white;
            box-shadow: 0px 0px 10px gray;
        }

        th {
            background-color: #3498db;
            color: white;
            padding: 10px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>

</head>

<body>

<h2>Student Details</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Branch</th>
        <th>Year</th>
        <th>City</th>
    </tr>

    <!-- Sorting students by name -->
    <xsl:for-each select="students/student">
        <xsl:sort select="name" order="ascending"/>

        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="branch"/></td>
            <td><xsl:value-of select="year"/></td>
            <td><xsl:value-of select="city"/></td>
        </tr>
    </xsl:for-each>

</table>

</body>
</html>

</xsl:template>
</xsl:stylesheet>