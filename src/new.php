<?php

require_once dirname(__DIR__).'/vendor/autoload.php';

$metadata = [
    'title' => '',
    'date' => date('Y-m-d H:i:s O'),
    'timezone' => 'Australia/Perth',
    'location' => 'Fremantle',
    'tags' => [ '' ],
];
$yaml = \Symfony\Component\Yaml\Yaml::dump($metadata, 3, 2);
$out = "---\n$yaml---\n";

$yearDir = dirname(__DIR__).'/content/'.date('Y');
if (!is_dir($yearDir)) {
    echo "Creating directory: $yearDir\n";
    mkdir($yearDir);
}

$filename = $yearDir.'/'.date('md').'.md';
if (file_exists($filename)) {
    echo "File exists: $filename\n";
    exit(1);
}

file_put_contents($filename, $out);
echo "New file created: $filename\n";
