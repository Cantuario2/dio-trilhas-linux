<html>

<head>
  <title>Exemplo Serviço PHP no Docker</title>
</head>

<body>

  <?php
  ini_set("display_errors", 1);
  header('Content-Type: text/html; charset=iso-8859-1');

  echo 'Versao Atual do PHP: ' . phpversion() . '<br>';
  $PHP_INI_SCAN_DIR=":/usr/local/etc/conf/php.d php";

  $servername = $docker_servername;
  $username = $docker_username;
  $password = $docker_password;
  $database = $docker_database;

  // Trocar a conexão de mysqli or outro provider depois
  $link = new mysqli($servername, $username, $password, $database);

  if (mysqli_connect_errno()) {
    printf("Connect failed: %s\n", mysqli_connect_error());
    exit();
  }

  $valor_rand1 =  rand(1, 999);
  $valor_rand2 = strtoupper(substr(bin2hex(random_bytes(4)), 1));
  $host_name = gethostname();

  $query = "INSERT INTO dados (AlunoID, Nome, Sobrenome, Endereco, Cidade, Host) VALUES ('$valor_rand1' , '$valor_rand2', '$valor_rand2', '$valor_rand2', '$valor_rand2','$host_name')";

  if ($link->query($query) === TRUE) {
    echo "New record created successfully";
  } else {
    echo "Error: " . $link->error;
  }

  ?>
</body>

</html>