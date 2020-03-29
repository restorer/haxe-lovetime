<?php

function findDuplicates() {
	$hashes = array();

	foreach (scandir('.') as $name) {
		if (!preg_match('/\.jpg$/i', $name)) {
			continue;
		}

		echo "{$name} ...\n";
		$img = imagecreatefromjpeg($name);

		$imgNew = imagescale($img, 8, 8);
		imagedestroy($img);
		$img = $imgNew;

		imagefilter($img, IMG_FILTER_GRAYSCALE);
		$sum = 0;

		for ($x = 0; $x < 8; $x++) {
			for ($y = 0; $y < 8; $y++) {
				$sum += (imagecolorat($img, $x, $y) & 0xff);
			}
		}

		$mid = (int)($sum / (8 * 8));
		$hash = '';

		for ($x = 0; $x < 8; $x++) {
			for ($y = 0; $y < 8; $y++) {
				$isOne = ((imagecolorat($img, $x, $y) & 0xff) >= $mid);
				$hash .= ($isOne ? '1' : '0');
				// imagesetpixel($img, $x, $y, $isOne ? 0xffffff : 0x000000);
			}
		}

		// imagepng($img, "{$name}.thumb");
		imagedestroy($img);

		$hashes[] = array(
			'name' => $name,
			'hash' => $hash,
		);
	}

	echo "Computing ...\n";
	$already = array();

	for ($i = 0, $len = count($hashes) - 1; $i < $len; $i++) {
		for ($j = $i + 1; $j < $len; $j++) {
			$hi = $hashes[$i]['hash'];
			$hj = $hashes[$j]['hash'];
			$dist = 0;

			for ($k = 0; $k < 8 * 8; $k++) {
				if ($hi[$k] != $hj[$k]) {
					$dist++;
				}
			}

			if ($dist <= 5) {
				$ni = $hashes[$i]['name'];
				$nj = $hashes[$j]['name'];

				echo "{$ni} is similar to {$nj} ({$dist})\n";

				if (!isset($already[$ni])) {
					rename($ni, "s.{$ni}");
					$already[$ni] = true;
				}

				if (!isset($already[$nj])) {
					rename($nj, "s.{$nj}");
					$already[$nj] = true;
				}
			}
		}
	}

	echo "Done\n";
}

function sortByExifDate() {
	$list = array();

	foreach (scandir('.') as $name) {
		if (!preg_match('/\.jpg$/i', $name)) {
			continue;
		}

		$data = exif_read_data($name);

		if ($data === false || !isset($data['FileDateTime'])) {
			continue;
		}

		$list[$name] = $data['FileDateTime'];
	}

	asort($list);
	$index = 0;

	foreach ($list as $k => $v) {
		$index++;
		rename($k, 'x-' . sprintf("%04d", $index) . '.jpg');
	}

	for ($i = 1; $i <= $index; $i++) {
		rename('x-' . sprintf("%04d", $i) . '.jpg', sprintf("%04d", $i) . '.jpg');
	}
}

function resizeImages() {
	foreach (scandir('.') as $name) {
		if (!preg_match('/\d{4}\.jpg$/i', $name)) {
			continue;
		}

		system("convert {$name} -scale 400x400 scaled.{$name}");

		$data1 = exif_read_data($name);
		$data2 = exif_read_data("scaled.{$name}");

		if ($data1['FileDateTime'] != $data2['FileDateTime']) {
			system("exiftool -tagsFromFile {$name} '-FileModifyDate<FileModifyDate' scaled.{$name}");

			$data1 = exif_read_data($name);
			$data2 = exif_read_data("scaled.{$name}");

			if ($data1['FileDateTime'] != $data2['FileDateTime']) {
				echo "{$name} - error\n";
			}
		}
	}
}

function makeAssetInfo() {
	$res = "class PhotoInfo {\n"
		. "    public static var infoMap:Map<String, Int> = [\n";

	foreach (scandir('.') as $name) {
		if (!preg_match('/\.jpg$/i', $name)) {
			continue;
		}

		$data = exif_read_data($name);
		$res .= "        \"{$name}\" => {$data['FileDateTime']},\n";
	}

	$res .= "    ];\n"
		. "}\n";

	file_put_contents('PhotoInfo.hx', $res);
}

// sortByExifDate();
// resizeImages();
// makeAssetInfo();
