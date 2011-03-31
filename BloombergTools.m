BeginPackage["BloombergTools`"]

BloombergChart::usage="";

Begin["Private`"];

BloombergChart[ticker_:"SPY"] :=
 SystemOpen[
  Export[ToFileName[$TemporaryDirectory, "bloomberg.html"],
   StringReplace[$BloombergChartHTML, "EWZ" -> ticker], "Text"]]

$BloombergChartHTML =
"<html>
   <body>
     <script type=\"text/javascript\">
        var Ticker = \"EWZ\";
       	var Cplay='<div>';
        Cplay+='<object>';
        Cplay+='<param name=\"FlashVars\" \
value=\"ticker='+escape(Ticker)+'\">';
        Cplay+='<param value=\"sameDomain\" \
name=\"allowScriptAccess\">';
        Cplay+='<param \
value=\"http://www.bloomberg.com/flashsrv/chart.swf\" name=\"movie\">';
        Cplay+='<param value=\"high\" name=\"quality\">';
        Cplay+='<param value=\"transparent\" name=\"wmode\">';
        Cplay+='<embed \
pluginspage=\"http://www.macromedia.com/go/getflashplayer\" \
type=\"application/x-shockwave-flash\" allowScriptAccess=\"sameDomain\
\" align=\"middle\" name=\"Bloomberg\" height=\"650\" width=\"726\" \
quality=\"high\" wmode=\"transparent\" \
FlashVars=\"ticker='+escape(Ticker)+'\" \
src=\"http://www.bloomberg.com/flashsrv/chart.swf\"></embed>';
        Cplay+='</object>';
        Cplay+='</div>';
        document.write(Cplay);
     </script>
   </body>
</html>";

End[];
EndPackage[];


