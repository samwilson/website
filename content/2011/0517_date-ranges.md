---
title: Finding all date ranges (which may be open-ended) that overlap with a given range
date: 2011-05-17T11:43:06+00:00
tags:
  - Programming
  - code snippets
  - date ranges
  - Kieran Benton
  - MySQL
  - SQL
  - Stack Overflow
  - temporal reasoning
  - Work
---
Given a database table listing events and their date ranges: `events { id, start_date, end_date,` … `}`, where either or both of the dates can be _null_, how is one to find all of the events that fall within (even partially) a given date range? (This is pretty much what Kieran Benton [asked](http://stackoverflow.com/questions/143552/comparing-date-ranges) on Stack Overflow, with the addition of the nullability.)

There are twelve possibilities for ranges with respect to the given range A-B:

<p style="text-align:center; font-size:smaller">
  <img src="http://samwilson.id.au/wp-content/uploads/2011/05/timeline-500x77.png" alt="" title="Possible ranges within a given range" width="500" height="77" class="aligncenter size-medium wp-image-720" srcset="https://samwilson.id.au/wp-content/uploads/2011/05/timeline-500x77.png 500w, https://samwilson.id.au/wp-content/uploads/2011/05/timeline-150x23.png 150w, https://samwilson.id.au/wp-content/uploads/2011/05/timeline.png 591w" sizes="(max-width: 500px) 100vw, 500px" /></a><br /> Note that the gradients indicate <em>null</em> start or end dates. <span style="font-size:smaller"><a href="http://samwilson.id.au/wp-content/uploads/2011/05/timeline.png">PNG</a><br /> <a href="http://samwilson.id.au/wp-content/uploads/2011/05/timeline.svg">SVG</a></span>
</p>

The red ranges are the ones that should be included in the result; the orange ones should be omitted. It’s easier to query for the smaller set, which satisfy the following conditions:

<table style="margin:1em auto;text-align:center">
  <tr>
    <td>
    </td>
    
    <p>
      <TD WIDTH=34 >> A</TD><br /> <TD WIDTH=34 >< A</TD><br /> <TD WIDTH=34 >> B</TD><br /> <TD WIDTH=34 >< B</TD><br /> <TD WIDTH=45 >NULL</TD><br /> </TR><br /> 
      
      <TR>
        <br /> 
        
        <TD>
          Start Date
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-left: 1px solid #000000" >
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >End Date</TD><br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >Start Date</TD><br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-right: 1px solid #000000" >
          x
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >End Date</TD><br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >Start Date</TD><br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >End Date</TD><br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> <TD HEIGHT=18 >Start Date</TD><br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          x
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-top: 1px solid #000000; border-right: 1px solid #000000" >
          <BR />
        </TD>
        
        <br />
      </TR>
      
      <br /> 
      
      <TR>
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000">
          End Date
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-left: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000" >
          <BR />
        </TD>
        
        <br /> 
        
        <TD STYLE="border-bottom: 1px solid #000000; border-right: 1px solid #000000" >
          x
        </TD>
        
        <br />
      </TR>
      
      <br /> </TABLE>
    </p>
    
    <p>
      Which corresponds to the following SQL:
    </p>
    
    <pre lang="sql">
SELECT * FROM events
WHERE NOT (
  (start_date IS NOT NULL AND start_date &lt; :A AND end_date IS NOT NULL AND end_date &lt; :A)
  OR (start_date IS NOT NULL AND start_date > :B AND end_date IS NOT NULL AND end_date > :B)
  OR (start_date IS NULL AND end_date IS NOT NULL AND end_date &lt; :A)
  OR (start_date IS NOT NULL AND start_date > :B and end_date IS NULL)
)
</pre>