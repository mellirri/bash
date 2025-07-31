#!/bin/bash

echo "The report is saved to file report.txt"
{
  echo "Web server log report"
  echo "====================="
  echo "Total number of requests: $(wc -l < access.log)"
  echo "Number of unique IP addresses: $(awk '{print $1}' access.log | sort -u | wc -l)"
  echo -e "Number of requests by methods:\n$(awk '{method = substr($6, 2); counts[method]++} END {for (m in counts) print m, counts[m]}'  access.log | sort -k2 -nr)"
  echo "The most popular URL: $(awk '{counts[$7]++} END {for (url in counts) print counts[url], url | "sort -nr | head -1"}' access.log)"
} > report.txt
