<?php
/*******************************************************************************************
 *           Author    : A'zamjon Rahimjonov                                               *
 *           Contact   : maazs@mail.ru                                                     *
 *           Copyright : free for non-commercial use.                                      *
 *******************************************************************************************/

class DB {

	private $host;
	private $username;
	private $password;
	private $port;
	private $dbname;
	private $error = null;
	private $dbconnect;
	private $result;
	private $persistent;
	private $status;
	
	public function __construct($Host="localhost", $DB="", $User="Anonymous", $Pass="Anonymous", $pesist=0, $PgPort=5432) {
		$this->dbname = $DB;
		$this->host = $Host;
		$this->username = $User;
		$this->password = $Pass;
		$this->persistent = $pesist;
		$this->port = $PgPort;
	}
	
	public function open() {
		$connect = "host={$this->host} port={$this->port} dbname={$this->dbname} user={$this->username} password={$this->password}";

		if ($this->persistent) {
			$this->dbconnect=@pg_pconnect($connect);
		} else {
			$this->dbconnect=@pg_connect($connect);
		}

		if (!$this->dbconnect) {
			header("HTTP/1.1 602 ErrorInConnection");
			die("Cannot connect to database {$this->dbname}");
		} 
	}
	
	public function query($sql) {
		if (version_compare(phpversion(), "4.2.0", "ge")>0) {
			$this->result = @pg_query($this->dbconnect, $sql);
			$this->error = @pg_last_error($this->dbconnect);
		} else {
			$this->result = @pg_exec($this->dbconnect, $sql);
		}
		if (!$this->result) {
			//header("HTTP/1.1 603 ErrorInQuerySyntax");
			echo $this->error;
			//die("Error in SQL query: " . $this->error);
		}
		return ($this->result != false);
	}
		
	public function Error() {
		if (version_compare(phpversion(), "4.2.0", "ge")>0)
			return $this->error = @pg_last_error($this->dbconnect);
	}
	
	public function affectedRows() {
		return (@pg_affected_rows($this->dbconnect));
	}
	
	public function numRows() {
		if (!$this->error && $this->result) {
			if (version_compare(phpversion(), "4.2.0", "ge")>0) {
				return (@pg_num_rows($this->result));
			} else {
				return (@pg_numrows($this->result));
			}
		} else {
			return -1;
		}
	}
		
	public function numFields() {
		if (!$this->error && $this->result) {
			if (version_compare(phpversion(), "4.2.0", "ge")>0) {
				return (@pg_num_fields($this->result));
			} else {
				return (@pg_numfields($this->result));
			}
		} else {
			return -1;
		}
	}
	
	public function fetchObject() {
		return (@pg_fetch_object($this->result));
	}
	
	public function fetchAll() {
		$result = array();
		while($row = @pg_fetch_assoc($this->result)) {
			$result[] = $row;
		}
		return $result;
	}
	
	public function fetchArray() {
		return (@pg_fetch_array($this->result, 0, PGSQL_NUM));
	}
	
	public function fetchAssoc() {
		return (@pg_fetch_assoc($this->result));
	}
	
	public function freeResult() {
		if ($this->result) {
			if (version_compare(phpversion(), "4.2.0", "ge")>0) {
				return (@pg_free_result($this->result));
			} else {
				return (@pg_freeresult($this->result));
			}
		}
	}
	
	public function encode($char) {
		if (version_compare(phpversion(), "4.2.0", "ge")>0) {
			@pg_set_client_encoding($this->dbconnect, $char);
		}
	}
	
	public function UnEscapeBytea($data) {
		return @pg_unescape_bytea($data);
	}

	public function close() {
		@pg_close($this->dbconnect);
	}
}
?>
