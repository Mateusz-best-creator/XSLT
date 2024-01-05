<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:template match="theme[ancestor::classes/@kind='lecture']">
		<xsl:for-each select="//classes[@kind='lecture']/component/theme">
			<xsl:sort select="."/>
			<ul>
				<li>
					<xsl:number value="position()" format="1. "/>
					<xsl:value-of select="."/>
				</li>
			</ul>
		</xsl:for-each>
	</xsl:template>
	 <xsl:template match="classes[@kind='project']">
	 	<div class="project-div">
			<h3>Informations about my hobbies.</h3>
			<table style="width:50%; border: 1px solid black">
				<tr>
					<th>Name of the hobby</th>
					<th>Hours spend in a day</th>
				</tr>
				<xsl:apply-templates select="component"/>
			</table>
		</div>
	</xsl:template>

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

	<xsl:template match="component">
		<li>
			<h3>
				<xsl:value-of select="topic"/>
			</h3>
			<xsl:apply-templates select="theme"/>
		</li>
	</xsl:template>

	<xsl:template match="theme">
		<ul>
			<li>
				<xsl:value-of select="."/>
			</li>
		</ul>
	</xsl:template>

    <xsl:template match="link">
        <a href="{@source}" target="_blank">
            <xsl:value-of select="."/>
        </a>
        <br />
    </xsl:template>

	<xsl:template match="image2">
		<img src="img/python.jpg" alt="Python" class="image1" title="{.}" />
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

    <xsl:template name="navigationMenu">
        <nav>
            <ul>
                <li class="nav-li"> <a class="nav-link" href="#hobbies">Hobbies</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#images">Images</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#detail">Hobbies In Detail</a> </li>
                <li class="nav-li"> <a class="nav-link" href="#about">About Me</a> </li>
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
							<h3 id="hobbies">Hobbies</h3>
							<p> My favourite hobbies. </p>
							<ol>
								<xsl:for-each select="course/classes[@kind='lecture']/component/theme">
									<xsl:sort select="."/>
									<li>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ol>
							<div id="images" class="all-images">
								<xsl:apply-templates select="course/information/media/image1"/>
								<xsl:apply-templates select="course/information/media/image2"/>
								<xsl:apply-templates select="course/information/media/image3"/>
								<xsl:apply-templates select="course/information/media/image4"/>
							</div>
						</div>

                        <xsl:apply-templates select="course/classes"/>
						<div class="about-me">
							<h3 id="about">Additional information about me</h3>
							<ul>
								<xsl:apply-templates select="course/information/links"/>
							</ul>
						</div>
					</div>
				</div>
				<footer>
					<xsl:apply-templates select="course/author"/>
				</footer>
			</body>
		</html>

	</xsl:template>

	<xsl:template match="author">
		Copyright 2019, <xsl:value-of select="name"/>_<xsl:value-of select="surname"/>
	</xsl:template>

	<xsl:template match="classes">
		<xsl:if test="@kind='laboratory'">
			<div class="lecture-div">
				<h3 id="detail">In detail</h3>
				<p>My hobbies in detail</p>
				<ol>
					<xsl:apply-templates select="component"/>
				</ol>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
