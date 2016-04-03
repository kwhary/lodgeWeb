<cfscript>
    if (rc.action eq 'main.default') {
        rc.showNav = 0;
        rc.columnClass = 'twelve';
    } else {
        rc.showNav = 1;
        rc.columnClass = 'nine';
    }
</cfscript>

<!--- Drives the page to the requested content include --->
<cfinclude template="main/pageDriver.cfm">

<!DOCTYPE html>
<!-- paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

    <head>
        <meta charset="utf-8" />
        <!--- <meta name="viewport" content="width=device-width" />--->
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="keywords" content="Freemasonry,Central New Jersey Freemasons,Philo,Philo Lodge,active lodge, active lodge central NJ,growing lodge">
        <meta name="description" content="A very active and vibrant lodge located in central New Jersey">
        <link rel="stylesheet" href="/assets/stylesheets/foundation.min.css" />
        <link rel="stylesheet" href="/assets/stylesheets/general_foundicons.css">
        <link rel="stylesheet" href="/assets/stylesheets/app.css" /><!---  local modifications --->
        <title><cfoutput>#pageTitle# - Philo Lodge No. 243 Free and Accepted Masons,South River N.J. USA</cfoutput></title>
        <!--- Custom Modernizr for Foundation --->
        <script src="/assets/javascripts/modernizr.foundation.js"></script>

        <!--- Included JS Files (Minified) --->
        <script src="/assets/javascripts/foundation.min.js"></script>
        <script src="/assets/javascripts/app.js"></script>
    </head>
    <body>
        <cfif rc.action eq 'main.default'>
            <cfinclude template="main/keyMessageLoaderMobile.cfm">
            <cfoutput>#view('main/key-messages')#</cfoutput>
        </cfif>

        <!-- Header and Nav -->
        <cfoutput>#view('nav/main-nav')#</cfoutput>
        <!-- End Header and Nav -->

        <div class="row">
            <cfif rc.showNav eq 1>
                <div id="defaultSideBar" class="three columns hide-for-small">
                    <cfoutput>#view('nav/left-side-nav')#</cfoutput>
                </div>
            </cfif>

            <div class="<cfoutput>#rc.columnClass#</cfoutput> columns mobile-four panel">
                <!--- NOTE: This is where the real content is rendered... --->
                <cfoutput>#body#</cfoutput>
                </div>
        </div>

            <!--- Footer --->
            <footer class="row">
                <div class="ten columns centered" style="text-align:center;">
                    <p>&copy; Philo Lodge No. 243 &nbsp;Free &amp; Accepted Masons, South River, N.J. USA 08882 - (732) 254-9867 (Tel.)  <i class="general foundicon-phone"></i></p>
                </div>
            </footer>

        <!--- Include the Orbit Scripts --->
        <!--- <cfinclude template="main/orbitInclude.cfm"> --->

        <cfinclude template="main/modalForm.cfm"><!---  Include the Reveal Modal DIV --->

        <!--- allows multiple onload events --->
        <!--- <script src="/assets/javascripts/addLoadEvent.js"></script> --->

        <!--- jQuery and jQuery UI --->
        <!--- <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js'></script>--->
        <!--- <script type='text/javascript' src='javascripts/jquery-ui.js'></script>--->


        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
        <script type="text/javascript">
            _uacct = "UA-2349423-1";
            urchinTracker();
        </script>
    </body>
</html>

<cfdump expand="false" var=#rc# label="##rc##">
<cfdump expand="false" var=#request#>

