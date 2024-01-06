<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="html" indent="yes"/>

	<xsl:variable name="hobbies_info" select="'Informations about my hobbies.'"/>
	<xsl:variable name="hobbies_ranking" select="'Ranking of my hobbies.'"/>
	<xsl:variable name="hobbies_future" select="'Hobbies for the future.'"/>
	<xsl:variable name="books" select="//library/book"/>
    <xsl:variable name="programmingBooks" select="$books[starts-with(category, 'Programming')]"/>
	<xsl:variable name="dataAnalysisBooks" select="$books[substring(category, string-length(category) - 
	string-length('Data Analysis') + 1) = 'Data Analysis']"/>

	<xsl:variable name="time1" select="6.65"/>
	<xsl:variable name="time2" select="4.135"/>
	<xsl:variable name="formattedTime1" select="format-number($time1, '00:00:00.00')"/>
	<xsl:variable name="formattedTime2" select="format-number($time2, '00:00:00')"/>


	<xsl:template match="book">
        <li>
            <h3><xsl:value-of select="title"/></h3>
            <p>Author: <xsl:value-of select="author"/></p>
            <p>Category: <xsl:value-of select="category"/></p>
        </li>
    </xsl:template>
	
	 <xsl:template match="hobbies[@kind='hobbies-table']">
	 	<div class="hobbies-div">
			<h3><xsl:value-of select="$hobbies_info"/></h3>
			<table style="width:50%; border: 1px solid black">
				<tr>
					<th>Name of the hobby</th>
					<th>Hours spend in a day</th>
				</tr>
				<xsl:apply-templates select="component"/>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="hobbies[@kind='hobbies-ranked']">
	 	<div class="hobbies-div">
			<h3><xsl:value-of select="$hobbies_ranking"/></h3>
			<table style="width:50%; border: 1px solid black">
				<tr>
					<th>Name of the hobby</th>
					<th>How much I love it</th>
				</tr>
				<xsl:apply-templates select="component"/>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="hobbies[@kind='hobbies-time']">
	 	<div class="hobbies-div">
			<h3>How long I do each of my hobbies.</h3>
			<table style="width:50%; border: 1px solid black">
				<tr>
					<th>Name of the hobby</th>
					<th>How long I do this</th>
				</tr>
				<xsl:apply-templates select="component"/>
			</table>
		</div>
	</xsl:template>
	<xsl:template match="hobbies[@kind='hobbies-future']">
	 	<div class="hobbies-div">
			<h3><xsl:value-of select="$hobbies_future"/></h3>
			<table style="width:50%; border: 1px solid black">
				<tr>
					<th>Name of the hobby</th>
					<th>When I will start it</th>
				</tr>
				<xsl:apply-templates select="component"/>
			</table>
		</div>
	</xsl:template>

	<xsl:template match="component[ancestor::hobbies/@kind='hobbies-table']">
		<tr>
			<td>
				<xsl:value-of select="topic"/>
			</td>
			<td>
				<xsl:value-of select="score"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="component[ancestor::hobbies/@kind='hobbies-ranked']">
		<tr>
			<td>
				<xsl:value-of select="topic"/>
			</td>
			<td>
				<xsl:value-of select="score"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="component[ancestor::hobbies/@kind='hobbies-time']">
		<tr>
			<td>
				<xsl:value-of select="topic"/>
			</td>
			<td>
				<xsl:value-of select="score"/>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="component[ancestor::hobbies/@kind='hobbies-future']">
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
				<xsl:number format="1. "/>
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

	<xsl:template match="image1">
		<img src="img/running.jpg" alt="Running" class="image1" title="{.}" />
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
							<ul>
								<xsl:for-each select="course/hobbies[@kind='general-list']/component/theme">
									<xsl:sort select="."/>
									<li>
										<xsl:number level="any" format="1. "/>
										<xsl:value-of select="."/>
									</li>
								</xsl:for-each>
							</ul>
							<div id="images" class="all-images">
								<xsl:apply-templates select="course/information/media/image1"/>
								<xsl:apply-templates select="course/information/media/image2"/>
								<xsl:apply-templates select="course/information/media/image3"/>
								<xsl:apply-templates select="course/information/media/image4"/>
							</div>
						</div>

                        <xsl:apply-templates select="course/hobbies"/>
						<div class="about-me">
							<h3 id="about">Additional information about me</h3>
							<ul>
								<xsl:apply-templates select="course/information/links"/>
							</ul>
						</div>
						<div class="programming-books">
							<h2>Programming Books:</h2>
							<ul>
								<xsl:apply-templates select="$programmingBooks"/>
								<p>Time in months to read it: <xsl:value-of select="$formattedTime1"/></p>
							</ul>

							<h2>Data Analysis Books:</h2>
							<ul>
								<xsl:apply-templates select="$dataAnalysisBooks"/>
								<p>Time in months to read it: <xsl:value-of select="$formattedTime2"/></p>
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

	<xsl:template match="hobbies">
		<xsl:if test="@kind='hobbies-list'">
			<div class="lecture-div">
				<h3 id="detail">In detail</h3>
				<p>My hobbies in detail</p>
				<ol>
					<xsl:apply-templates select="component"/>
				</ol>
			</div>
		</xsl:if>
		<xsl:if test="@kind='hobbies-time'">
			<div class="case2-container">
				<h3>Time for each hobby</h3>
				<p>This is the table that shows how much time I spent on each hobby</p>
				<ol>
					<xsl:apply-templates select="component"/>
				</ol>
			</div>
		</xsl:if>
		<xsl:if test="not(@kind='hobbies-list') and (@kind='hobbies-time')">
			<div class="general-container">
				<h3>My hobbies in general</h3>
				<p>This is the general description for all hobbies.</p>
				<ol>
					<xsl:apply-templates select="component"/>
				</ol>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
