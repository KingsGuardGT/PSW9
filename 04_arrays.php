<!--
	Nama : Yuni Yustina Siagian
	NIM  : 11421045
	Prodi: D4 TRPL
-->
<!--Array-->
<?php
    define('Maksimum_Diskon1', 5);
    $DataKitaAja = [
        "Sport",
        1 => "Toyota 86",
        '_Persediaan' => 2,
        "Harga" => 775750000
    ];
    ?>
    <!DOCTYPE html>
    <html>
        <head>
            <title>Array</title>
        </head>
        <body><b>Array Daftar Mobil dan Motor Dealer KitaAja Jika Ada Diskon</b><br>
        <?php
        ECHO "Tipe Mobil = ".$DataKitaAja[0].'<br>';
        ECHO "Nama Mobil = ".$DataKitaAja[1].'<br>';
        ECHO "Persediaan = ".$DataKitaAja['_Persediaan'].'<br>';
        ECHO "Harga = Rp.".$DataKitaAja["Harga"].'<br>';
        echo("Harga Setelah Dapat Diskon = RP.".($DataKitaAja["Harga"]*(100-Maksimum_Diskon1)/100)).'<br>';
        ?>
    </body>
</html>
