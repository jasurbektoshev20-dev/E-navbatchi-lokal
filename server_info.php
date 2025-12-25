<?php
echo "<pre>";
echo "OS: " . PHP_OS . PHP_EOL;
echo "PHP Version: " . PHP_VERSION . PHP_EOL;
echo "Server Software: " . ($_SERVER['SERVER_SOFTWARE'] ?? 'unknown') . PHP_EOL;
echo "</pre>";
