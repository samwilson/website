<?php

require_once dirname(__DIR__).'/vendor/autoload.php';

$metadata = [
    'title' => '',
    'date' => date('Y-m-d H:i:s'),
    'timezone' => 'Australia/Perth',
    'location' => '',
    'tags' => [ '' ],
];
$yaml = \Symfony\Component\Yaml\Yaml::dump($metadata, 3);
$out = "---\n$yaml---\n";

$filename = dirname(__DIR__).'/content/'.date('Y/md').'.md';
if (file_exists($filename)) {
    echo "File exists: $filename\n";
    exit(1);
}

file_put_contents($filename, $out);
echo "New file created: $filename\n";
