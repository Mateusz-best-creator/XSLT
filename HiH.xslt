<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<!-- 
		Step 8
	 -->
	 <!-- Template for lecture themes -->
	<xsl:template match="theme[ancestor::classes/@kind='lecture']">
		<xsl:for-each select="//classes[@kind='lecture']/component/theme">
			<!-- Sort the themes alphabetically -->
			<xsl:sort select="."/>
			<ul>
				<li>
					<!-- Display the theme with numbered list -->
					<xsl:number value="position()" format="1. "/>
					<xsl:value-of select="."/>
				</li>
			</ul>
		</xsl:for-each>
	</xsl:template>

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

	<xsl:template match="image2">
		<img src="img/C__.jpg" alt="C++" class="image1" title="{.}" />
	</xsl:template>
	<xsl:template match="image3">
		<img src="img/c.png" alt="Gym" class="right image1" title="{.}" />
	</xsl:template>
	<xsl:template match="image4">
		<img src="img/gym.jpg" alt="C" class="image1" title="{.}" />
	</xsl:template>
	<xsl:template match="image1">
		<img src="img/running.jpg" alt="Running" class="image1" title="{.}" />
	</xsl:template>

	<!-- 
		Step 5
	 -->
	<!-- Named template for page navigation menu -->
    <xsl:template name="navigationMenu">
        <nav>
            <ul>
                <li class="nav-li"> <a class="nav-link" href="#lecture">Hobbies</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#lab">Images</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#project">Project</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#links">About me</a> </li>
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
						<h1>My Hobby</h1>
					</header>
					<xsl:call-template name="navigationMenu"/>

					<div id="content">
						<div class="hobby-div">
							<h3 id="lecture">Hobbies</h3>
							<p> My favourite hobbies. </p>
							<ol>
								<xsl:for-each select="course/classes[@kind='lecture']/component/theme">
									<xsl:sort select="."/>
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ol>
							<div class="all-images">
								<xsl:apply-templates select="course/information/media/image1"/>
								<xsl:apply-templates select="course/information/media/image2"/>
								<xsl:apply-templates select="course/information/media/image3"/>
								<xsl:apply-templates select="course/information/media/image4"/>
							</div>
						</div>

                        <xsl:apply-templates select="course/classes"/>

						<h3 id="links">Additional information about me</h3>
						<ul>
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
</xsl:stylesheet>
