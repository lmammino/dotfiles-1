#!/usr/bin/env ruby

# $_.tr! "A-Za-z", "N-ZA-Mn-za-m";

input = STDIN.gets

input.tr! "A-Za-z", "N-ZA-Mn-za-m";

puts %{<script type="text/javascript">document.write(
  "<n uers=\\"znvygb:#{$_}\\">#{$_}<\057n>".replace(/[a-zA-Z]/g, function(c){return String.fromCharCode((c<="Z"?90:122)>=(c=c.charCodeAt(0)+13)?c:c-26);}));
</script>};
