<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="html" indent="yes"/>

<xsl:template match="/">

<html>
<head>
    <title>Student Result Dashboard</title>

    <style>
        body {
            font-family: 'Segoe UI', Arial;
            background: linear-gradient(to right, #74ebd5, #ACB6E5);
            text-align: center;
        }

        h2 {
            color: #2c3e50;
        }

        table {
            margin: auto;
            border-collapse: collapse;
            width: 75%;
            background: white;
            border-radius: 10px;
            overflow: hidden;
        }

        th {
            background: #34495e;
            color: white;
            padding: 12px;
        }

        td {
            padding: 10px;
            border-bottom: 1px solid #eee;
        }

        tr:hover {
            background: #f9f9f9;
        }

        .pass { color: green; font-weight: bold; }
        .fail { color: red; font-weight: bold; }
        .topper { background-color: #d4edda; }
    </style>
</head>

<body>

<h2>📊 Student Result Dashboard</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Marks</th>
        <th>Result</th>
        <th>Grade</th>
    </tr>

    <!-- Sort by marks descending -->
    <xsl:for-each select="students/student">
        <xsl:sort select="marks" data-type="number" order="descending"/>

        <tr>
            <!-- Topper highlight -->
            <xsl:if test="marks &gt;= 80">
                <xsl:attribute name="class">topper</xsl:attribute>
            </xsl:if>

            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="name"/></td>
            <td><xsl:value-of select="marks"/></td>

            <!-- Result -->
            <td>
                <xsl:choose>
                    <xsl:when test="marks &gt;= 50">
                        <span class="pass">Pass</span>
                    </xsl:when>
                    <xsl:otherwise>
                        <span class="fail">Fail</span>
                    </xsl:otherwise>
                </xsl:choose>
            </td>

            <!-- Grade -->
            <td>
                <xsl:choose>
                    <xsl:when test="marks &gt;= 80">A</xsl:when>
                    <xsl:when test="marks &gt;= 60">B</xsl:when>
                    <xsl:when test="marks &gt;= 50">C</xsl:when>
                    <xsl:otherwise>F</xsl:otherwise>
                </xsl:choose>
            </td>

        </tr>

    </xsl:for-each>

</table>

<!-- Extra Feature: Count summary -->
<h3>
    Total Students:
    <xsl:value-of select="count(students/student)"/>
</h3>

<h3>
    Passed Students:
    <xsl:value-of select="count(students/student[marks &gt;= 50])"/>
</h3>

</body>

</html>

</xsl:template>
</xsl:stylesheet>