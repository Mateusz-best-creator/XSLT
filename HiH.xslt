<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<!-- 
		Step 10
	 -->
	 <xsl:template match="classes[@kind='project']">
		<h3 id="project">Project</h3>
		<p>
			Information about the project.
		</p>
		<table style="width:50%; border: 1px solid black">
			<tr>
				<th>Title of the project</th>
				<th>Score</th>
			</tr>
			<!-- Apply the template for component elements -->
			<xsl:apply-templates select="component"/>
		</table>
	</xsl:template>

	<!-- 
		Step 10
	 -->
	 <!-- Adjusted Template for Component Element -->
	<xsl:template match="component[ancestor::classes/@kind='project']">
		<tr>
			<td>
				<xsl:value-of select="topic"/>
			</td>
			<td>
				<xsl:value-of select="score"/>
			</td>
		</tr>
	</xsl:template>


	<!-- 
		Step 9
	 -->
	 <!-- Template for component element -->
	<xsl:template match="component">
		<li>
			<h3>
				<xsl:value-of select="topic"/>
			</h3>
			<!-- Apply the template for theme elements -->
			<xsl:apply-templates select="theme"/>
		</li>
	</xsl:template>

	<!-- 
		Step 9
	 -->
	 <!-- Template for theme element -->
	<xsl:template match="theme">
		<ul>
			<li>
				<xsl:value-of select="."/>
			</li>
		</ul>
	</xsl:template>


	<!-- 
		Step 7
	 -->
	 <!-- Template for the link element -->
    <xsl:template match="link">
        <a href="{@source}" target="_blank">
            <xsl:value-of select="."/>
        </a>
        <br />
    </xsl:template>

	<!-- 
		Step 7
	 -->
	 <!-- Template to display only the last two links -->
    <xsl:template match="links">
        <xsl:apply-templates select="link[position() &gt; last() - 2]"/>
    </xsl:template>

	<!-- 
		Step 6
	 -->
	 <!-- Template for displaying images with class="right" -->
    <xsl:template match="image">
		<img src="img/Vannevar-Bush.jpg" alt="Vannevar Bush" class="right" title="{.}" />
	</xsl:template>

	<!-- 
		Step 5
	 -->
	<!-- Named template for page navigation menu -->
    <xsl:template name="navigationMenu">
        <nav>
            <ul>
                <li> <a href="#lecture">Lecture</a> </li>
                <li> <a href="#lab">Laboratory</a> </li>
                <li> <a href="#project">Project</a> </li>
                <li> <a href="#links">Links</a> </li>
            </ul>
        </nav>
    </xsl:template>

	<xsl:template match="/">

		<html>
			<head>
				<meta charset="UTF-8" />
				<title>Hypertext hypermedia</title>
				<meta name="viewport" content="width=device-width, initial-scale=1.0" />
				<link rel="stylesheet" href="index.css" />
			</head>
			<body>
				<div id="wrapper">
					<header>
						<h1>Hypertext hypermedia</h1>
					</header>

					<!-- menu for moving within a page -->
					<!-- 
						Step 5
					 -->
					<xsl:call-template name="navigationMenu"/>

					<div id="content">
                        <!-- Content ... -->
                        <h3 id="lecture">Lecture</h3>
                        <p>
                            Information about the lecture.
                            <!-- Reference to the template for displaying images -->
							<!-- 
								Step 6
							 -->
                            <xsl:apply-templates select="course/information/media/image"/>
                        </p>
						<!-- information about lecture -->
						<!-- 
							Step 9
						 -->
						<!-- Display information about laboratory -->
                        <xsl:apply-templates select="course/classes"/>

						<!-- 
							Step 8
						 -->
						 <!-- Display information about lecture themes -->
                        <h3>Lecture Themes</h3>
                        <ol>
                            <xsl:for-each select="course/classes[@kind='lecture']/component/theme">
                                <xsl:sort select="."/>
                                <li>
                                    <!-- Remove xsl:number to avoid nested numbering -->
                                    <xsl:value-of select="."/>
                                </li>
                            </xsl:for-each>
                        </ol>

						<!-- reference to a template that allows to display information about laboratory and project -->


						<h3 id="links">Additional information about HTML and XML</h3>
						<ul>
						<!-- 
							Step 7
						 -->
							 <xsl:apply-templates select="course/information/links"/>
						</ul>

					</div>
					<!-- end content -->
				</div>
				<!-- end wrapper -->
				<footer>
					<xsl:apply-templates select="course/author"/> <!-- reference to a template that allows for displaying information about the name and surname of the student -->
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
	<!-- Step 4 -->
		Copyright 2019, <xsl:value-of select="name"/>_<xsl:value-of select="surname"/>
	</xsl:template>

	<!-- 
		Step 9
	 -->
	<xsl:template match="classes">
		<xsl:if test="@kind='laboratory'">
			<h3 id="lab">Laboratory</h3>
			<p>
				Information about the laboratory.
			</p>
			<ol>
				<!-- Apply the template for component elements -->
				<xsl:apply-templates select="component"/>
			</ol>
		</xsl:if>
	</xsl:template>



<!--
		<nav>
			<ul>
				<li> <a href="#lecture">Lecture</a> </li>
				<li> <a href="#lab">Laboratory</a> 	</li>
				<li> <a href="#project">Project</a> </li>
				<li> <a href="#links">Links</a> 		</li>
			</ul>
		</nav>	
	</xsl:template>
-->

<!--
				<h3 id="lab">Laboratory</h3>
				<p>
				Information about the laboratory.
				</p>	
				<ol>
					<li>......
						<ul>
							<li>...... </li>
						</ul>
					</li>

				</ol>
-->

<!--
			<h3 id="project">Project</h3>
			<p>
				Information about the project.
			</p>
			<table style="width:50%; border: 5px solid red">
				<tr>
					<th>Title of the project</th>
					<th>Score</th>
				</tr>
				
			</table>
-->

</xsl:stylesheet>
