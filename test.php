<?php
$dataSrc="platformsh-scripts/project/03-dummy-posts.json";
$objDummyData = json_decode(file_get_contents($dataSrc, FILE_USE_INCLUDE_PATH), false);
$numPosts=15;
for ($i=0; $i<$numPosts; ++$i) {
	//print_r($objDummyData[$i]);
	$copyright = $objDummyData[$i]->copyright ?? "Public";
	$postBody = <<<ENDPOST
	{$objDummyData[$i]->explanation}

	$copyright ({$objDummyData[$i]->date})
ENDPOST;

	echo "The postBody for post $i is:\n$postBody";

}
