<?php
/*
 * 这个库是由nusoap.php修改而成的
 * 我们将数据传输格式由xml改为json
 */
$GLOBALS['_transient']['static']['jws_base']['globalDebugLevel'] = 9;

/**
*
* jws_base
* JsonWebService的基础类，其他类都需要继承此类
* @access   public
*/
class jws_base {
	/**
	 * $title和$version决定http头部
	 * User-Agent: $title/$version
	 */
	var $title = 'JsonWebService';
	var $version = '0.1';
	
	
	var $write_log = false; // 是否开启日志
	
	
    /**
     * 错误记录 (通过方法 getError/setError 操作)
	 *
	 * @var string
	 * @access private
	 */
	var $error_str = '';
    /**
     * 调试记录 (通过方法 debug/appendDebug/clearDebug/getDebug 操作)
	 *
	 * @var string
	 * @access private
	 */
    var $debug_str = '';
	/**
	 * 该实例的调试等级
	 *
	 * @var	integer
	 * @access private
	 */
	var $debugLevel;

	/**
	* 构造函数
	*
	* @access	public
	*/
	function jws_base() {
		$this->debugLevel = $GLOBALS['_transient']['static']['jws_base']['globalDebugLevel'];
	}

	/**
	* gets the global debug level, which applies to future instances
	*
	* @return	integer	Debug level 0-9, where 0 turns off
	* @access	public
	*/
	function getGlobalDebugLevel() {
		return $GLOBALS['_transient']['static']['jws_base']['globalDebugLevel'];
	}

	/**
	* sets the global debug level, which applies to future instances
	*
	* @param	int	$level	Debug level 0-9, where 0 turns off
	* @access	public
	*/
	function setGlobalDebugLevel($level) {
		$GLOBALS['_transient']['static']['jws_base']['globalDebugLevel'] = $level;
	}

	/**
	* gets the debug level for this instance
	*
	* @return	int	Debug level 0-9, where 0 turns off
	* @access	public
	*/
	function getDebugLevel() {
		return $this->debugLevel;
	}

	/**
	* sets the debug level for this instance
	*
	* @param	int	$level	Debug level 0-9, where 0 turns off
	* @access	public
	*/
	function setDebugLevel($level) {
		$this->debugLevel = $level;
	}

	/**
	* adds debug data to the instance debug string with formatting
	*
	* @param    string $string debug data
	* @access   private
	*/
	function debug($string){
		if ($this->debugLevel > 0) {
			$this->appendDebug($this->getmicrotime().' '.get_class($this).": $string\n");
		}
	}

	/**
	* adds debug data to the instance debug string without formatting
	*
	* @param    string $string debug data
	* @access   public
	*/
	function appendDebug($string){
		if ($this->debugLevel > 0) {
			// it would be nice to use a memory stream here to use
			// memory more efficiently
			$this->debug_str .= $string;
		}
	}

	/**
	* clears the current debug data for this instance
	*
	* @access   public
	*/
	function clearDebug() {
		// it would be nice to use a memory stream here to use
		// memory more efficiently
		$this->debug_str = '';
	}

	/**
	* gets the current debug data for this instance
	*
	* @return   debug data
	* @access   public
	*/
	function &getDebug() {
		// it would be nice to use a memory stream here to use
		// memory more efficiently
		return $this->debug_str;
	}


	/**
	* returns error string if present
	*
	* @return   mixed error string or false
	* @access   public
	*/
	function getError(){
		if($this->error_str != ''){
			return $this->error_str;
		}
		return false;
	}

	/**
	* sets error string
	*
	* @return   boolean $string error string
	* @access   private
	*/
	function setError($str){
		$this->error_str = $str;
	}


	/**
    * returns the time in ODBC canonical form with microseconds
    *
    * @return string The time in ODBC canonical form with microseconds
    * @access public
    */
	function getmicrotime() {
		if (function_exists('gettimeofday')) {
			$tod = gettimeofday();
			$sec = $tod['sec'];
			$usec = $tod['usec'];
		} else {
			$sec = time();
			$usec = 0;
		}
		return strftime('%Y-%m-%d %H:%M:%S', $sec) . '.' . sprintf('%06d', $usec);
	}

	/**
	 * Returns a string with the output of var_dump
	 *
	 * @param mixed $data The variable to var_dump
	 * @return string The output of var_dump
	 * @access public
	 */
    function varDump($data) {
		ob_start();
		var_dump($data);
		$ret_val = ob_get_contents();
		ob_end_clean();
		return $ret_val;
	}
	
	/**
	 * 写入调试日志内容
	 * @param $data array 写入内容
	 * @param $type string client或server
	 */
	function writeLog($data, $type){
		$dir = dirname(__FILE__).'/../runtime/log/jws/';
		if(!file_exists($dir)){
			mkdir($dir, 0777, true);
			$result = mkdir($dir, 0777, true);
			chown($dir, 'www');
		}
		
		$file = $dir.date('Y-m-d').'-'.$type.'.log';
		$f = @fopen($file, 'a');
		if ($f) {
			@flock($f, LOCK_EX);
			$write_content = "[".date('Y-m-d H:i:s')."]\n$data\n\n";
			@fwrite($f, $write_content);
			@fclose($f);
		}
		@chmod($file,0777);
	}

	/**
	* represents the object as a string
	*
	* @return	string
	* @access   public
	*/
	function __toString() {
		return $this->varDump($this);
	}
}

/**
* Contains information for a jws fault.
* Mainly used for returning faults from deployed functions
* in a server instance.
* @author   Dietrich Ayala <dietrich@ganx4.com>
* @version  $Id: jws.php,v 1.123 2010/04/26 20:15:08 snichol Exp $
* @access public
*/
class jws_fault extends jws_base {
	/**
	 * The fault code (client|server)
	 * @var string
	 * @access private
	 */
	var $faultcode;
	/**
	 * The fault actor
	 * @var string
	 * @access private
	 */
	var $faultactor;
	/**
	 * The fault string, a description of the fault
	 * @var string
	 * @access private
	 */
	var $faultstring;
	/**
	 * The fault detail, typically a string or array of string
	 * @var mixed
	 * @access private
	 */
	var $faultdetail;

	/**
	* constructor
    *
    * @param string $faultcode (jws-ENV:Client | jws-ENV:Server)
    * @param string $faultactor only used when msg routed between multiple actors
    * @param string $faultstring human readable error message
    * @param mixed $faultdetail detail, typically a string or array of string
	*/
	function jws_fault($faultcode,$faultactor='',$faultstring='',$faultdetail=''){
		parent::jws_base();
		$this->faultcode = $faultcode;
		$this->faultactor = $faultactor;
		$this->faultstring = $faultstring;
		$this->faultdetail = $faultdetail;
	}

	/**
	* serialize a fault
	*
	* @return	string	The serialization of the fault instance.
	* @access   public
	*/
	function serialize(){
		$return_msg = 
		    json_encode(
    	        array(
                    'faultcode' => $this->faultcode,
                    'faultactor' => $this->faultactor,
                    'faultstring' => $this->faultstring,
                    'detail' => $this->faultdetail,
                ));
		return $return_msg;
	}
}



/**
* transport class for sending/receiving data via HTTP and HTTPS
* 该版本暂不考虑HTTPS，如果需要实现对于HTTPS的支持，PHP需要具有CRUL扩展
* @access public
*/
class jws_transport_http extends jws_base {
	var $url = '';
	var $uri = '';
	var $digest_uri = '';
	var $scheme = '';
	var $host = '';
	var $port = '';
	var $path = '';
	var $request_method = 'POST';
	var $protocol_version = '1.0';
	var $encoding = '';
	var $outgoing_headers = array();
	var $incoming_headers = array();
	var $incoming_cookies = array();
	var $outgoing_payload = '';
	var $incoming_payload = '';
	var $response_status_line;	// HTTP response status line
	var $persistentConnection = false;
	var $digestRequest = array();

	/**
	* constructor
	*
	* @param string $url The URL to which to connect
	* @param array $curl_options User-specified cURL options
	* @param boolean $use_curl Whether to try to force cURL use
	* @access public
	*/
	function jws_transport_http($url){
		parent::jws_base();
		$this->debug("ctor url=$url");
		$this->setURL($url);
		$this->setHeader('User-Agent', $this->title.'/'.$this->version);
	}


	/**
	* sets an HTTP header
	*
	* @param string $name The name of the header
	* @param string $value The value of the header
	* @access private
	*/
	function setHeader($name, $value) {
		$this->outgoing_headers[$name] = $value;
		$this->debug("set header $name: $value");
	}

	/**
	* unsets an HTTP header
	*
	* @param string $name The name of the header
	* @access private
	*/
	function unsetHeader($name) {
		if (isset($this->outgoing_headers[$name])) {
			$this->debug("unset header $name");
			unset($this->outgoing_headers[$name]);
		}
	}

	/**
	* sets the URL to which to connect
	*
	* @param string $url The URL to which to connect
	* @access private
	*/
	function setURL($url) {
		$this->url = $url;

		$u = parse_url($url);
		foreach($u as $k => $v){
			$this->debug("parsed URL $k = $v");
			$this->$k = $v;
		}
		
		// add any GET params to path
		if(isset($u['query']) && $u['query'] != ''){
            $this->path .= '?' . $u['query'];
		}
		
		// set default port
		if(!isset($u['port'])){
			if($u['scheme'] == 'https'){
				$this->port = 443;
			} else {
				$this->port = 80;
			}
		}
		
		$this->uri = $this->path;
		$this->digest_uri = $this->uri;
		
		// build headers
		if (!isset($u['port'])) {
			$this->setHeader('Host', $this->host);
		} else {
			$this->setHeader('Host', $this->host.':'.$this->port);
		}
	}

	/**
	* establish an HTTP connection
	*
	* @param    integer $timeout set connection timeout in seconds
	* @param	integer $response_timeout set response timeout in seconds
	* @return	boolean true if connected, false if not
	* @access   private
	*/
	function connect($connection_timeout=30,$response_timeout=30){
		$this->debug("connect connection_timeout $connection_timeout, response_timeout $response_timeout, scheme $this->scheme, host $this->host, port $this->port");
		$host = $this->host;
		$port = $this->port;


		// munge host if using OpenSSL
		if ($this->scheme == 'ssl') {
			$host = 'ssl://' . $host;
		}
		$this->debug('calling fsockopen with host ' . $host . ' connection_timeout ' . $connection_timeout);

		// open socket
		if($connection_timeout > 0){
			$this->fp = @fsockopen( $host, $this->port, $this->errno, $this->error_str, $connection_timeout);
		} else {
			$this->fp = @fsockopen( $host, $this->port, $this->errno, $this->error_str);
		}
	
		// test pointer
		if(!$this->fp) {
			$msg = 'Couldn\'t open socket connection to server ' . $this->url;
			if ($this->errno) {
				$msg .= ', Error ('.$this->errno.'): '.$this->error_str;
			} else {
				$msg .= ' prior to connect().  This is often a problem looking up the host name.';
			}
			$this->debug($msg);
			$this->setError($msg);
			return false;
		}
	
		// set response timeout
		$this->debug('set response timeout to ' . $response_timeout);
		socket_set_timeout( $this->fp, $response_timeout);

		$this->debug('socket connected');
		return true;

    }

	/**
	* sends the jws request and gets the jws response via HTTP[S]
	*
	* @param    string $data message data
	* @param    integer $timeout set connection timeout in seconds
	* @param	integer $response_timeout set response timeout in seconds
	* @param	array $cookies cookies to send
	* @return	string data
	* @access   public
	*/
	function send($data, $timeout=0, $response_timeout=30, $cookies=NULL) {
		
		$this->debug('entered send() with data of length: '.strlen($data));

		$this->tryagain = true;
		$tries = 0;
		while ($this->tryagain) {
			$this->tryagain = false;
			if ($tries++ < 2) {
				// make connnection
				if (!$this->connect($timeout, $response_timeout)){
					return false;
				}
				
				// send request
				if (!$this->sendRequest($data, $cookies)){
					return false;
				}
				
				// get response
				//debug_return_data_by_guoxk
				$respdata = $this->getResponse();
			} else {
				$this->setError("Too many tries to get an OK response ($this->response_status_line)");
			}
		}		
		$this->debug('end of send()');
		return $respdata;
	}


	
	/**
	* use http encoding
	*
	* @param    string $enc encoding style. supported values: gzip, deflate, or both
	* @access   public
	*/
	function setEncoding($enc='gzip, deflate') {
		if (function_exists('gzdeflate')) {
			$this->protocol_version = '1.1';
			$this->setHeader('Accept-Encoding', $enc);
			if (!isset($this->outgoing_headers['Connection'])) {
				$this->setHeader('Connection', 'close');
				$this->persistentConnection = false;
			}
			// deprecated as of PHP 5.3.0
			//set_magic_quotes_runtime(0);
			$this->encoding = $enc;
		}
	}

	/**
	 * Writes the payload, including HTTP headers, to $this->outgoing_payload.
	 *
	 * @param	string $data HTTP body
	 * @param	string $cookie_str data for HTTP Cookie header
	 * @return	void
	 * @access	private
	 */
	function buildPayload($data, $cookie_str = '') {
		// Note: for cURL connections, $this->outgoing_payload is ignored,
		// as is the Content-Length header, but these are still created as
		// debugging guides.

		// add content-length header
		if ($this->request_method != 'GET') {
			$this->setHeader('Content-Length', strlen($data));
		}

		// start building outgoing payload:
		$uri = $this->uri;
		$req = "$this->request_method $uri HTTP/$this->protocol_version";
		$this->debug("HTTP request: $req");
		$this->outgoing_payload = "$req\r\n";

		// loop thru headers, serializing
		foreach($this->outgoing_headers as $k => $v){
			$hdr = $k.': '.$v;
			$this->debug("HTTP header: $hdr");
			$this->outgoing_payload .= "$hdr\r\n";
		}

		// add any cookies
		if ($cookie_str != '') {
			$hdr = 'Cookie: '.$cookie_str;
			$this->debug("HTTP header: $hdr");
			$this->outgoing_payload .= "$hdr\r\n";
		}

		// header/body separator
		$this->outgoing_payload .= "\r\n";
		
		// add data
		$this->outgoing_payload .= $data;
	}

	/**
	* sends the jws request via HTTP[S]
	*
	* @param    string $data message data
	* @param	array $cookies cookies to send
	* @return	boolean	true if OK, false if problem
	* @access   private
	*/
	function sendRequest($data, $cookies = NULL) {
		// build cookie string
		$cookie_str = $this->getCookiesForRequest($cookies, (($this->scheme == 'ssl') || ($this->scheme == 'https')));

		// build payload
		$this->buildPayload($data, $cookie_str);

        if(!fputs($this->fp, $this->outgoing_payload, strlen($this->outgoing_payload))) {
        	$this->setError('couldn\'t write message data to socket');
        	$this->debug('couldn\'t write message data to socket');
        	return false;
        }
        $this->debug('wrote data to socket, length = ' . strlen($this->outgoing_payload));
        return true;
	}

	/**
	* gets the jws response via HTTP[S]
	*
	* @return	string the response (also sets member variables like incoming_payload)
	* @access   private
	*/
	function getResponse(){
		$this->incoming_payload = '';
	    
	    // loop until headers have been retrieved
	    $data = '';
	    while (!isset($lb)){

			// We might EOF during header read.
			if(feof($this->fp)) {
				$this->incoming_payload = $data;
				$this->debug('found no headers before EOF after length ' . strlen($data));
				$this->debug("received before EOF:\n" . $data);
				$this->setError('server failed to send headers');
				return false;
			}

			$tmp = fgets($this->fp, 256);
			$tmplen = strlen($tmp);
			$this->debug("read line of $tmplen bytes: " . trim($tmp));

			if ($tmplen == 0) {
				$this->incoming_payload = $data;
				$this->debug('socket read of headers timed out after length ' . strlen($data));
				$this->debug("read before timeout: " . $data);
				$this->setError('socket read of headers timed out');
				return false;
			}

			$data .= $tmp;
			$pos = strpos($data,"\r\n\r\n");
			if($pos > 1){
				$lb = "\r\n";
			} else {
				$pos = strpos($data,"\n\n");
				if($pos > 1){
					$lb = "\n";
				}
			}
			// remove 100 headers
			if (isset($lb) && preg_match('/^HTTP\/1.1 100/',$data)) {
				unset($lb);
				$data = '';
			}
		}
		// store header data
		$this->incoming_payload .= $data;
		$this->debug('found end of headers after length ' . strlen($data));
		// process headers
		$header_data = trim(substr($data,0,$pos));
		$header_array = explode($lb,$header_data);
		$this->incoming_headers = array();
		$this->incoming_cookies = array();
		foreach($header_array as $header_line){
			$arr = explode(':',$header_line, 2);
			if(count($arr) > 1){
				$header_name = strtolower(trim($arr[0]));
				$this->incoming_headers[$header_name] = trim($arr[1]);
				if ($header_name == 'set-cookie') {
					// TODO: allow multiple cookies from parseCookie
					$cookie = $this->parseCookie(trim($arr[1]));
					if ($cookie) {
						$this->incoming_cookies[] = $cookie;
						$this->debug('found cookie: ' . $cookie['name'] . ' = ' . $cookie['value']);
					} else {
						$this->debug('did not find cookie in ' . trim($arr[1]));
					}
    			}
			} else if (isset($header_name)) {
				// append continuation line to previous header
				$this->incoming_headers[$header_name] .= $lb . ' ' . $header_line;
			}
		}
		
		// loop until msg has been received
		if (isset($this->incoming_headers['transfer-encoding']) && strtolower($this->incoming_headers['transfer-encoding']) == 'chunked') {
			$content_length =  2147483647;	// ignore any content-length header
			$chunked = true;
			$this->debug("want to read chunked content");
		} elseif (isset($this->incoming_headers['content-length'])) {
			$content_length = $this->incoming_headers['content-length'];
			$chunked = false;
			$this->debug("want to read content of length $content_length");
		} else {
			$content_length =  2147483647;
			$chunked = false;
			$this->debug("want to read content to EOF");
		}
		$data = '';
		do {
            if ($chunked) {
				$tmp = fgets($this->fp, 256);
				$tmplen = strlen($tmp);
				$this->debug("read chunk line of $tmplen bytes");
				if ($tmplen == 0) {
					$this->incoming_payload = $data;
					$this->debug('socket read of chunk length timed out after length ' . strlen($data));
					$this->debug("read before timeout:\n" . $data);
					$this->setError('socket read of chunk length timed out');
					return false;
				}
				$content_length = hexdec(trim($tmp));
				$this->debug("chunk length $content_length");
			}
			$strlen = 0;
		    while (($strlen < $content_length) && (!feof($this->fp))) {
		    	$readlen = min(8192, $content_length - $strlen);
				$tmp = fread($this->fp, $readlen);
				$tmplen = strlen($tmp);
				$this->debug("read buffer of $tmplen bytes");
				if (($tmplen == 0) && (!feof($this->fp))) {
					$this->incoming_payload = $data;
					$this->debug('socket read of body timed out after length ' . strlen($data));
					$this->debug("read before timeout:\n" . $data);
					$this->setError('socket read of body timed out');
					return false;
				}
				$strlen += $tmplen;
				$data .= $tmp;
			}
			if ($chunked && ($content_length > 0)) {
				$tmp = fgets($this->fp, 256);
				$tmplen = strlen($tmp);
				$this->debug("read chunk terminator of $tmplen bytes");
				if ($tmplen == 0) {
					$this->incoming_payload = $data;
					$this->debug('socket read of chunk terminator timed out after length ' . strlen($data));
					$this->debug("read before timeout:\n" . $data);
					$this->setError('socket read of chunk terminator timed out');
					return false;
				}
			}
		} while ($chunked && ($content_length > 0) && (!feof($this->fp)));
		if (feof($this->fp)) {
			$this->debug('read to EOF');
		}
		$this->debug('read body of length ' . strlen($data));
		$this->incoming_payload .= $data;
		$this->debug('received a total of '.strlen($this->incoming_payload).' bytes of data from server');
		
		// close filepointer
		if(
			(isset($this->incoming_headers['connection']) && strtolower($this->incoming_headers['connection']) == 'close') || 
			(! $this->persistentConnection) || feof($this->fp)){
			fclose($this->fp);
			$this->fp = false;
			$this->debug('closed socket');
		}
		
		// connection was closed unexpectedly
		if($this->incoming_payload == ''){
			$this->setError('no response from server');
			return false;
		}

        $this->response_status_line = $header_array[0];
        $arr = explode(' ', $this->response_status_line, 3);
        $http_version = $arr[0];
        $http_status = intval($arr[1]);
        $http_reason = count($arr) > 2 ? $arr[2] : '';

 		// see if we need to resend the request with http digest authentication
 		if (isset($this->incoming_headers['location']) && ($http_status == 301 || $http_status == 302)) {
 			$this->debug("Got $http_status $http_reason with Location: " . $this->incoming_headers['location']);
 			$this->setURL($this->incoming_headers['location']);
			$this->tryagain = true;
			return false;
		}

 		// see if we need to resend the request with http digest authentication
 		if (isset($this->incoming_headers['www-authenticate']) && $http_status == 401) {
 			$this->debug("Got 401 $http_reason with WWW-Authenticate: " . $this->incoming_headers['www-authenticate']);
 			if (strstr($this->incoming_headers['www-authenticate'], "Digest ")) {
 				$this->debug('Server wants digest authentication');
 				// remove "Digest " from our elements
 				$digestString = str_replace('Digest ', '', $this->incoming_headers['www-authenticate']);
 				
 				// parse elements into array
 				$digestElements = explode(',', $digestString);
 				foreach ($digestElements as $val) {
 					$tempElement = explode('=', trim($val), 2);
 					$digestRequest[$tempElement[0]] = str_replace("\"", '', $tempElement[1]);
 				}
 			}
			$this->debug('HTTP authentication failed');
			$this->setError('HTTP authentication failed');
			return false;
 		}
		
		if (
			($http_status >= 300 && $http_status <= 307) ||
			($http_status >= 400 && $http_status <= 417) ||
			($http_status >= 501 && $http_status <= 505)
		   ) {
			$this->setError("Unsupported HTTP response status $http_status $http_reason (jwsclient->response has contents of the response)");
			return false;
		}

		// decode content-encoding
		if(isset($this->incoming_headers['content-encoding']) && $this->incoming_headers['content-encoding'] != ''){
			if(strtolower($this->incoming_headers['content-encoding']) == 'deflate' || strtolower($this->incoming_headers['content-encoding']) == 'gzip'){
    			// if decoding works, use it. else assume data wasn't gzencoded
    			if(function_exists('gzinflate')){
					//$timer->setMarker('starting decoding of gzip/deflated content');
					// IIS 5 requires gzinflate instead of gzuncompress (similar to IE 5 and gzdeflate v. gzcompress)
					// this means there are no Zlib headers, although there should be
					$this->debug('The gzinflate function exists');
					$datalen = strlen($data);
					if ($this->incoming_headers['content-encoding'] == 'deflate') {
						if ($degzdata = @gzinflate($data)) {
	    					$data = $degzdata;
	    					$this->debug('The payload has been inflated to ' . strlen($data) . ' bytes');
	    					if (strlen($data) < $datalen) {
	    						// test for the case that the payload has been compressed twice
		    					$this->debug('The inflated payload is smaller than the gzipped one; try again');
								if ($degzdata = @gzinflate($data)) {
			    					$data = $degzdata;
			    					$this->debug('The payload has been inflated again to ' . strlen($data) . ' bytes');
								}
	    					}
	    				} else {
	    					$this->debug('Error using gzinflate to inflate the payload');
	    					$this->setError('Error using gzinflate to inflate the payload');
	    				}
					} elseif ($this->incoming_headers['content-encoding'] == 'gzip') {
						if ($degzdata = @gzinflate(substr($data, 10))) {	// do our best
							$data = $degzdata;
	    					$this->debug('The payload has been un-gzipped to ' . strlen($data) . ' bytes');
	    					if (strlen($data) < $datalen) {
	    						// test for the case that the payload has been compressed twice
		    					$this->debug('The un-gzipped payload is smaller than the gzipped one; try again');
								if ($degzdata = @gzinflate(substr($data, 10))) {
			    					$data = $degzdata;
			    					$this->debug('The payload has been un-gzipped again to ' . strlen($data) . ' bytes');
								}
	    					}
	    				} else {
	    					$this->debug('Error using gzinflate to un-gzip the payload');
							$this->setError('Error using gzinflate to un-gzip the payload');
	    				}
					}
					//$timer->setMarker('finished decoding of gzip/deflated content');
					//print "<xmp>\nde-inflated:\n---------------\n$data\n-------------\n</xmp>";
					// set decoded payload
					$this->incoming_payload = $header_data.$lb.$lb.$data;
    			} else {
					$this->debug('The server sent compressed data. Your php install must have the Zlib extension compiled in to support this.');
					$this->setError('The server sent compressed data. Your php install must have the Zlib extension compiled in to support this.');
				}
			} else {
				$this->debug('Unsupported Content-Encoding ' . $this->incoming_headers['content-encoding']);
				$this->setError('Unsupported Content-Encoding ' . $this->incoming_headers['content-encoding']);
			}
		} else {
			$this->debug('No Content-Encoding header');
		}
		
		if(strlen($data) == 0){
			$this->debug('no data after headers!');
			$this->setError('no data present after HTTP headers');
			return false;
		}
		
		return $data;
	}

	/**
	 * sets the content-type for the jws message to be sent
	 *
	 * @param	string $type the content type, MIME style
	 * @param	mixed $charset character set used for encoding (or false)
	 * @access	public
	 */
	function setContentType($type) {
		$this->setHeader('Content-Type', $type);
	}

	/**
	 * specifies that an HTTP persistent connection should be used
	 *
	 * @return	boolean whether the request was honored by this method.
	 * @access	public
	 */
	function usePersistentConnection(){
		if (isset($this->outgoing_headers['Accept-Encoding'])) {
			return false;
		}
		$this->protocol_version = '1.1';
		$this->persistentConnection = true;
		$this->setHeader('Connection', 'Keep-Alive');
		return true;
	}

	/**
	 * parse an incoming Cookie into it's parts
	 *
	 * @param	string $cookie_str content of cookie
	 * @return	array with data of that cookie
	 * @access	private
	 */
	/*
	 * TODO: allow a Set-Cookie string to be parsed into multiple cookies
	 */
	function parseCookie($cookie_str) {
		$cookie_str = str_replace('; ', ';', $cookie_str) . ';';
		$data = preg_split('/;/', $cookie_str);
		$value_str = $data[0];

		$cookie_param = 'domain=';
		$start = strpos($cookie_str, $cookie_param);
		if ($start > 0) {
			$domain = substr($cookie_str, $start + strlen($cookie_param));
			$domain = substr($domain, 0, strpos($domain, ';'));
		} else {
			$domain = '';
		}

		$cookie_param = 'expires=';
		$start = strpos($cookie_str, $cookie_param);
		if ($start > 0) {
			$expires = substr($cookie_str, $start + strlen($cookie_param));
			$expires = substr($expires, 0, strpos($expires, ';'));
		} else {
			$expires = '';
		}

		$cookie_param = 'path=';
		$start = strpos($cookie_str, $cookie_param);
		if ( $start > 0 ) {
			$path = substr($cookie_str, $start + strlen($cookie_param));
			$path = substr($path, 0, strpos($path, ';'));
		} else {
			$path = '/';
		}
						
		$cookie_param = ';secure;';
		if (strpos($cookie_str, $cookie_param) !== FALSE) {
			$secure = true;
		} else {
			$secure = false;
		}

		$sep_pos = strpos($value_str, '=');

		if ($sep_pos) {
			$name = substr($value_str, 0, $sep_pos);
			$value = substr($value_str, $sep_pos + 1);
			$cookie= array(	'name' => $name,
			                'value' => $value,
							'domain' => $domain,
							'path' => $path,
							'expires' => $expires,
							'secure' => $secure
							);		
			return $cookie;
		}
		return false;
	}
  
	/**
	 * sort out cookies for the current request
	 *
	 * @param	array $cookies array with all cookies
	 * @param	boolean $secure is the send-content secure or not?
	 * @return	string for Cookie-HTTP-Header
	 * @access	private
	 */
	function getCookiesForRequest($cookies, $secure=false) {
		$cookie_str = '';
		if ((! is_null($cookies)) && (is_array($cookies))) {
			foreach ($cookies as $cookie) {
				if (! is_array($cookie)) {
					continue;
				}
	    		$this->debug("check cookie for validity: ".$cookie['name'].'='.$cookie['value']);
				if ((isset($cookie['expires'])) && (! empty($cookie['expires']))) {
					if (strtotime($cookie['expires']) <= time()) {
						$this->debug('cookie has expired');
						continue;
					}
				}
				if ((isset($cookie['domain'])) && (! empty($cookie['domain']))) {
					$domain = preg_quote($cookie['domain']);
					if (! preg_match("'.*$domain$'i", $this->host)) {
						$this->debug('cookie has different domain');
						continue;
					}
				}
				if ((isset($cookie['path'])) && (! empty($cookie['path']))) {
					$path = preg_quote($cookie['path']);
					if (! preg_match("'^$path.*'i", $this->path)) {
						$this->debug('cookie is for a different path');
						continue;
					}
				}
				if ((! $secure) && (isset($cookie['secure'])) && ($cookie['secure'])) {
					$this->debug('cookie is secure, transport is not');
					continue;
				}
				$cookie_str .= $cookie['name'] . '=' . $cookie['value'] . '; ';
	    		$this->debug('add cookie to Cookie-String: ' . $cookie['name'] . '=' . $cookie['value']);
			}
		}
		return $cookie_str;
  }
}


/**
*
* jws_server allows the user to create a jws server
* that is capable of receiving messages and returning responses
*
* @author   Dietrich Ayala <dietrich@ganx4.com>
* @author   Scott Nichol <snichol@users.sourceforge.net>
* @version  $Id: jws.php,v 1.123 2010/04/26 20:15:08 snichol Exp $
* @access   public
*/
class jws_server extends jws_base {
	/**
	 * HTTP headers of request
	 * @var array
	 * @access private
	 */
	var $headers = array();
	/**
	 * HTTP request
	 * @var string
	 * @access private
	 */
	var $request = '';
	/**
	 * jws headers from request (incomplete namespace resolution; special characters not escaped) (text)
	 * @var string
	 * @access public
	 */
	var $requestHeaders = '';
	/**
	 * jws Headers from request (parsed)
	 * @var mixed
	 * @access public
	 */
	var $requestHeader = NULL;
	/**
	 * jws body request portion (incomplete namespace resolution; special characters not escaped) (text)
	 * @var string
	 * @access public
	 */
	var $document = '';
	/**
	 * jws payload for request (text)
	 * @var string
	 * @access public
	 */
	var $requestjws = '';
	/**
	 * requested method namespace URI
	 * @var string
	 * @access private
	 */
	var $methodURI = '';
	/**
	 * name of method requested
	 * @var string
	 * @access private
	 */
	var $methodname = '';
	/**
	 * method parameters from request
	 * @var array
	 * @access private
	 */
	var $methodparams = array();


	/**
	 * HTTP headers of response
	 * @var array
	 * @access public
	 */
	var $outgoing_headers = array();
	/**
	 * HTTP response
	 * @var string
	 * @access private
	 */
	var $response = '';
	/**
	 * jws headers for response (text or array of jwsval or associative array)
	 * @var mixed
	 * @access public
	 */
	var $responseHeaders = '';
	/**
	 * jws payload for response (text)
	 * @var string
	 * @access private
	 */
	var $responsejws = '';
	/**
	 * method return value to place in response
	 * @var mixed
	 * @access private
	 */
	var $methodreturn = false;

	/**
	 * jws fault for response (or false)
	 * @var mixed
	 * @access private
	 */
	var $fault = false;
	/**
	 * text indication of result (for debugging)
	 * @var string
	 * @access private
	 */
	var $result = 'successful';

	/**
	 * assoc array of operations => opData; operations are added by the register()
	 * method or by parsing an external WSDL definition
	 * @var array
	 * @access private
	 */
	var $operations = array();
	/**
	 * whether to append debug to response as XML comment
	 * @var boolean
	 * @access public
	 */
	var $debug_flag = false;


	/**
	 * 哪些方法需要记录日志，默认均不记录
	 */
	var $write_log_func = array();
	
	/**
	* constructor
    * the optional parameter is a path to a WSDL file that you'd like to bind the server instance to.
	*
    * @param mixed $wsdl file path or URL (string), or wsdl instance (object)
	* @access   public
	*/
	function jws_server($write_log_func=array()){
		parent::jws_base();
		// turn on debugging?
		$this->write_log_func = $write_log_func;
		global $debug;
		global $HTTP_SERVER_VARS;
		if (isset($_SERVER)) {
			$this->debug("_SERVER is defined:");
			$this->appendDebug($this->varDump($_SERVER));
		} elseif (isset($HTTP_SERVER_VARS)) {
			$this->debug("HTTP_SERVER_VARS is defined:");
			$this->appendDebug($this->varDump($HTTP_SERVER_VARS));
		} else {
			$this->debug("Neither _SERVER nor HTTP_SERVER_VARS is defined.");
		}
		
		if (isset($debug)) {
		    
			$this->debug("In jws_server, set debug_flag=$debug based on global flag");
			$this->debug_flag = $debug;
		} elseif (isset($_SERVER['QUERY_STRING'])) {
			$qs = explode('&', $_SERVER['QUERY_STRING']);
			foreach ($qs as $v) {
				if (substr($v, 0, 6) == 'debug=') {
					$this->debug("In jws_server, set debug_flag=" . substr($v, 6) . " based on query string #1");
					$this->debug_flag = substr($v, 6);
				}
			}
		} elseif (isset($HTTP_SERVER_VARS['QUERY_STRING'])) {
			$qs = explode('&', $HTTP_SERVER_VARS['QUERY_STRING']);
			foreach ($qs as $v) {
				if (substr($v, 0, 6) == 'debug=') {
					$this->debug("In jws_server, set debug_flag=" . substr($v, 6) . " based on query string #2");
					$this->debug_flag = substr($v, 6);
				}
			}
		}
	}

	/**
	* processes request and returns response
	*
	* @param    string $data usually is the value of $HTTP_RAW_POST_DATA
	* @access   public
	*/
	function service(){
	    $data = $GLOBALS['HTTP_RAW_POST_DATA'];
		global $HTTP_SERVER_VARS;
		
		if (isset($_SERVER['REQUEST_METHOD'])) {  //$_SERVER['REQUEST_METHOD'] == 'POST'
			$rm = $_SERVER['REQUEST_METHOD'];
		} elseif (isset($HTTP_SERVER_VARS['REQUEST_METHOD'])) {
			$rm = $HTTP_SERVER_VARS['REQUEST_METHOD'];
		} else {
			$rm = '';
		}
		
		if (isset($_SERVER['QUERY_STRING'])) {
			$qs = $_SERVER['QUERY_STRING'];
		} elseif (isset($HTTP_SERVER_VARS['QUERY_STRING'])) {
			$qs = $HTTP_SERVER_VARS['QUERY_STRING'];
		} else {
			$qs = '';
		}
		$this->debug("In service, request method=$rm query string=$qs strlen(\$data)=" . strlen($data));

		
		if ($rm == 'POST') {
			$this->debug("In service, invoke the request");
			$this->parse_request($data);
			if (! $this->fault) {
				$this->invoke_method();
			}
			if (! $this->fault) {
				$this->serialize_return();
			}
			$this->send_response();
		} else {
			$this->debug("In service, no Web description");
			header("Content-Type: text/html; charset=ISO-8859-1\r\n");
			print "This service does not provide a Web description";
		}
	}

	/**
	* parses HTTP request headers.
	*
	* The following fields are set by this function (when successful)
	*
	* headers
	* request
	* xml_encoding
	* jwsAction
	*
	* @access   private
	*/
	function parse_http_headers() {
		global $HTTP_SERVER_VARS;

		$this->request = '';
		$this->jwsAction = '';
		if(function_exists('getallheaders')){
			$this->debug("In parse_http_headers, use getallheaders");
			$headers = getallheaders();
			foreach($headers as $k=>$v){
				$k = strtolower($k);
				$this->headers[$k] = $v;
				$this->request .= "$k: $v\r\n";
				$this->debug("$k: $v");
			}
		} elseif(isset($_SERVER) && is_array($_SERVER)){
			$this->debug("In parse_http_headers, use _SERVER");
			foreach ($_SERVER as $k => $v) {
				if (substr($k, 0, 5) == 'HTTP_') {
					$k = str_replace(' ', '-', strtolower(str_replace('_', ' ', substr($k, 5))));
				} else {
					$k = str_replace(' ', '-', strtolower(str_replace('_', ' ', $k)));
				}
				
				$this->headers[$k] = $v;
				$this->request .= "$k: $v\r\n";
				$this->debug("$k: $v");
			}
		} elseif (is_array($HTTP_SERVER_VARS)) {
			$this->debug("In parse_http_headers, use HTTP_SERVER_VARS");
			foreach ($HTTP_SERVER_VARS as $k => $v) {
				if (substr($k, 0, 5) == 'HTTP_') {
					$k = str_replace(' ', '-', strtolower(str_replace('_', ' ', substr($k, 5)))); 	                                         $k = strtolower(substr($k, 5));
				} else {
					$k = str_replace(' ', '-', strtolower(str_replace('_', ' ', $k))); 	                                         $k = strtolower($k);
				}
				$this->headers[$k] = $v;
				$this->request .= "$k: $v\r\n";
				$this->debug("$k: $v");
			}
		} else {
			$this->debug("In parse_http_headers, HTTP headers not accessible");
			$this->setError("HTTP headers not accessible");
		}
	}

	/**
	* parses a request
	*
	* The following fields are set by this function (when successful)
	*
	* headers
	* request
	* xml_encoding
	* jwsAction
	* request
	* requestjws
	* methodURI
	* methodname
	* methodparams
	* requestHeaders
	* document
	*
	* This sets the fault field on error
	*
	* @param    string $data XML string
	* @access   private
	*/
	function parse_request($data='') {
		$this->debug('entering parse_request()');
		$this->parse_http_headers();
		$this->debug('got character encoding: '.$this->xml_encoding);

		$this->request .= "\r\n".$data;
		$data = $this->parseRequest($this->headers, $data);
		$this->requestjws = $data;
		$this->debug('leaving parse_request');
	}

	/**
	* invokes a PHP function for the requested jws method
	*
	* The following fields are set by this function (when successful)
	*
	* methodreturn
	*
	* Note that the PHP function that is called may also set the following
	* fields to affect the response sent to the client
	*
	* responseHeaders
	* outgoing_headers
	*
	* This sets the fault field on error
	*
	* @access   private
	*/
	function invoke_method() {
		$this->debug('in invoke_method, methodname=' . $this->methodname . ' methodURI=' . $this->methodURI . ' jwsAction=' . $this->jwsAction);

		$orig_methodname = $this->methodname;
		// does method exist?
	    if (!function_exists($this->methodname)) {
			$this->debug("in invoke_method, function '$this->methodname' not found!");
			$this->result = 'fault: method not found';
			$this->fault('jws-ENV:Client',"method '$this->methodname'('$orig_methodname') not defined in service('$try_class' '$delim')");
			return;
		}

		// if there are parameters to pass
		$this->debug('in invoke_method, params:');
		$this->appendDebug($this->varDump($this->methodparams));
		$this->debug("in invoke_method, calling '$this->methodname'");
		if (!function_exists('call_user_func_array')) {
			if ($class == '') {
				$this->debug('in invoke_method, calling function using eval()');
				$funcCall = "\$this->methodreturn = $this->methodname(";
			} 
			if ($this->methodparams) {
				foreach ($this->methodparams as $param) {
					if (is_array($param) || is_object($param)) {
						$this->fault('jws-ENV:Client', 'Nujws does not handle complexType parameters correctly when using eval; call_user_func_array must be available');
						return;
					}
					$funcCall .= "\"$param\",";
				}
				$funcCall = substr($funcCall, 0, -1);
			}
			$funcCall .= ');';
			$this->debug('in invoke_method, function call: '.$funcCall);
			@eval($funcCall);
		} else {
			
			$this->debug('in invoke_method, calling function using call_user_func_array()');
			$call_arg = "$this->methodname";	// straight assignment changes $this->methodname to lower case after call_user_func_array()
			
			if (is_array($this->methodparams)) {
				$this->methodreturn = call_user_func_array($call_arg, array_values($this->methodparams));
			} else {
				$this->methodreturn = call_user_func_array($call_arg, array());
			}
		}
        $this->debug('in invoke_method, methodreturn:');
        $this->appendDebug($this->varDump($this->methodreturn));
		$this->debug("in invoke_method, called method $this->methodname, received data of type ".gettype($this->methodreturn));
	}

	/**
	* serializes the return value from a PHP function into a full jws Envelope
	*
	* The following fields are set by this function (when successful)
	*
	* responsejws
	*
	* This sets the fault field on error
	*
	* @access   private
	*/
	function serialize_return() {
// 	    $this->methodreturn = is_array($this->methodreturn)? $this->methodreturn: array($this->methodreturn);
        $this->responsejws = json_encode($this->methodreturn);
        return $this->responsejws;
	}

	/**
	* sends an HTTP response
	*
	* The following fields are set by this function (when successful)
	*
	* outgoing_headers
	* response
	*
	* @access   private
	*/
	function send_response() {
	    
		$this->debug('Enter send_response');
		if ($this->fault) {
			$payload = $this->fault->serialize();
			$this->outgoing_headers[] = "HTTP/1.0 500 Internal Server Error";
			$this->outgoing_headers[] = "Status: 500 Internal Server Error";
		} else {
			$payload = $this->responsejws;
		}
		
		$this->outgoing_headers[] = "Server: $this->title Server v$this->version";

		$this->outgoing_headers[] = "X-jws-Server: $this->title/$this->version";
		// Let the Web server decide about this
		//$this->outgoing_headers[] = "Connection: Close\r\n";
		$payload = $this->getHTTPBody($payload);
		$type = $this->getHTTPContentType();
		$this->outgoing_headers[] = "Content-Type: $type";
		
		//end code
		$this->outgoing_headers[] = "Content-Length: ".strlen($payload);
		reset($this->outgoing_headers);
		foreach($this->outgoing_headers as $hdr){
			header($hdr, false);
		}
		print $payload;
		$this->response = join("\r\n",$this->outgoing_headers)."\r\n\r\n".$payload;
		
		if(in_array($this->methodname, $this->write_log_func)){
			$this->writeLog("调用方法：".$this->methodname
				."\n接收数据：".json_encode($this->document)
				."\n返回结果:".$this->responsejws, 'server');
		}
	}


	/**
	* processes jws message received from client
	*
	* @param	array	$headers	The HTTP headers
	* @param	string	$data		unprocessed request data from client
	* @return	mixed	value of the message, decoded into a PHP type
	* @access   private
	*/
    function parseRequest($headers, $data) {
		$this->debug('Entering parseRequest() for data of length ' . strlen($data) . ' headers:');
		$this->appendDebug($this->varDump($headers));
    	if (!isset($headers['content-type'])) {
			$this->setError('Request not of type text/html (no content-type header)');
			return false;
    	}
		if (!strstr($headers['content-type'], 'text/html')) {
			$this->setError('Request not of type text/html');
			return false;
		}
		
		$parser = json_decode($data, true);
		$this->methodname = $parser['operation'];
		$this->debug('methodname: '.$this->methodname);
		$this->methodparams = $parser['params'];
		$this->document = $data;
	 }

	/**
	* gets the HTTP body for the current response.
	*
	* @param string $jwsmsg The jws payload
	* @return string The HTTP body, which includes the jws payload
	* @access private
	*/
	function getHTTPBody($jwsmsg) {
		return $jwsmsg;
	}
	
	/**
	* gets the HTTP content type for the current response.
	*
	* Note: getHTTPBody must be called before this.
	*
	* @return string the HTTP content type for the current response.
	* @access private
	*/
	function getHTTPContentType() {
		return 'text/html';
	}


	/**
	* Specify a fault to be returned to the client.
	* This also acts as a flag to the server that a fault has occured.
	*
	* @param	string $faultcode
	* @param	string $faultstring
	* @param	string $faultactor
	* @param	string $faultdetail
	* @access   public
	*/
	function fault($faultcode,$faultstring,$faultactor='',$faultdetail=''){
		if ($faultdetail == '' && $this->debug_flag) {
			$faultdetail = $this->getDebug();
		}
		$this->fault = new jws_fault($faultcode,$faultactor,$faultstring,$faultdetail);
		$this->fault->jws_defencoding = $this->jws_defencoding;
	}

}



/**
*
* [nu]jwsclient higher level class for easy usage.
*
* usage:
*
* // instantiate client with server info
* $jwsclient = new jws_client( string path [ ,mixed wsdl] );
*
* // call method, get results
* echo $jwsclient->call( string methodname [ ,array parameters] );
*
* // bye bye client
* unset($jwsclient);
*
* @author   Dietrich Ayala <dietrich@ganx4.com>
* @author   Scott Nichol <snichol@users.sourceforge.net>
* @version  $Id: jws.php,v 1.123 2010/04/26 20:15:08 snichol Exp $
* @access   public
*/
class jws_client extends jws_base  {

	var $requestHeaders = false;	// jws headers in request (text)
	var $responseHeaders = '';		// jws headers from response (incomplete namespace resolution) (text)
	var $responseHeader = NULL;		// jws Header from response (parsed)
	var $document = '';				// jws body response portion (incomplete namespace resolution) (text)
	var $endpoint;
    
   
	var $http_encoding = false;
	var $timeout = 0;				// HTTP connection timeout
	var $response_timeout = 30;		// HTTP response timeout
	var $persistentConnection = false;
	var $defaultRpcParams = false;	// This is no longer used
	var $request = '';				// HTTP request
	var $response = '';				// HTTP response
	var $responseData = '';			// jws payload of response
	var $cookies = array();			// Cookies from response or for request
	var $operations = array();		// WSDL operations, empty for WSDL initialization error

	/*
	 * fault related variables
	 */
	/**
	 * @var      fault
	 * @access   public
	 */
	var $fault;
	/**
	 * @var      faultcode
	 * @access   public
	 */
	var $faultcode;
	/**
	 * @var      faultstring
	 * @access   public
	 */
	var $faultstring;
	/**
	 * @var      faultdetail
	 * @access   public
	 */
	var $faultdetail;

	/**
	* constructor
	*
	* @param    mixed $endpoint jws server or WSDL URL (string), or wsdl instance (object)
	* @param    mixed $wsdl optional, set to 'wsdl' or true if using WSDL
	* @param    string $proxyhost optional
	* @param    string $proxyport optional
	* @param	string $proxyusername optional
	* @param	string $proxypassword optional
	* @param	integer $timeout set the connection timeout
	* @param	integer $response_timeout set the response timeout
	* @param	string $portName optional portName in WSDL document
	* @access   public
	*/
	function jws_client($endpoint, $timeout = 5, $response_timeout = 5){
		parent::jws_base();
		$this->endpoint = $endpoint;
		$this->timeout = $timeout;
		$this->response_timeout = $response_timeout;

		$this->debug("ctor timeout=$timeout response_timeout=$response_timeout");
		$this->appendDebug('endpoint=' . $this->varDump($endpoint));
		$this->debug("instantiate jws with endpoint at $endpoint");
	}

	function write_log($write_log=true){
		$this->write_log = $write_log;
	}
	/**
	* calls method, returns PHP native type
	*
	* @param    string $operation jws server URL or path
	* @param    mixed $params An array, associative or simple, of the parameters
	*			              for the method call, or a string that is the XML
	*			              for the call.  For rpc style, this call will
	*			              wrap the XML in a tag named after the method, as
	*			              well as the jws Envelope and Body.  For document
	*			              style, this will only wrap with the Envelope and Body.
	*			              IMPORTANT: when using an array with document style,
	*			              in which case there
	*                         is really one parameter, the root of the fragment
	*                         used in the call, which encloses what programmers
	*                         normally think of parameters.  A parameter array
	*                         *must* include the wrapper.
	* @access   public
	*/
	function call($operation,$params=array()){
		$this->operation = $operation;
		$this->fault = false;
		$this->setError('');
		$this->request = '';
		$this->response = '';
		$this->responseData = '';
		$this->faultstring = '';
		$this->faultcode = '';
		$this->opData = array();
		
		$this->debug("call: operation=$operation");
		$this->appendDebug('params=' . $this->varDump($params));
		
		$payload = array('operation' => $operation, 'params' => $params);
		// serialize envelope
		$sendMsg = json_encode($payload);
		$this->debug("endpoint=$this->endpoint");
		$this->debug('jws message length=' . strlen($sendMsg) . ' contents (max 1000 bytes)=' . substr($sendMsg, 0, 1000));
		// send
		$return = $this->send($this->getHTTPBody($sendMsg),$this->timeout,$this->response_timeout);
		if($errstr = $this->getError()){
			$this->debug('Error: '.$errstr);
			return false;
		} else {
			$this->return = $return;
			$this->debug('sent message successfully and got a(n) '.gettype($return));
           	$this->appendDebug('return=' . $this->varDump($return));
			
			// fault?
           	$return===null && $return = array('faultcode' => "empty", "faultstring" => "return data is empty");
			if(is_array($return) && isset($return['faultcode'])){
				$this->debug('got fault');
				$this->setError($return['faultcode'].': '.$return['faultstring']);
				$this->fault = true;
				foreach($return as $k => $v){
					$this->$k = $v;
					$this->debug("$k = $v<br>");
				}
				
			}
			if($this->write_log){
				$this->writeLog("请求地址：{$this->endpoint}\n调用方法：{$operation}\n发送数据：{$sendMsg}\n返回结果：".json_encode($return), 'client');
			}
			
			return $return;
		}
	}
	

    /**
    * send the jws message
    *
    * Note: if the operation has multiple return values
    * the return value of this method will be an array
    * of those values.
    *
	* @param    string $msg a jwsx4 jwsmsg object
	* @param    string $jwsaction jwsAction value
	* @param    integer $timeout set connection timeout in seconds
	* @param	integer $response_timeout set response timeout in seconds
	* @return	mixed native PHP types.
	* @access   private
	*/
	function send($msg, $timeout=0, $response_timeout=30) {
		$this->checkCookies();
        if(defined('DB_NAME') && DB_NAME == 'center'){ // 如果是中央服，并且请求的是被合服需要禁止
            $mysqli = new mysqli(MYSQLHOST, MYSQLUSER, MYSQLPASS, DB_NAME, MYSQLPORT);
            $mysqli->set_charset('utf-8');
            $res = $mysqli->query("select server_id, s_type from ".TABLE_PREFIX."server where service_url = '{$this->endpoint}'");
            $row = $res->fetch_assoc();
            if($row && $row['s_type'] == '3'){
                error_log(date('Y-m-d H:i:s')."\t".$this->endpoint."\t".$msg."\n", 3, dirname(__FILE__).'/../runtime/log/jws/merged_jws');
                $this->setError(SYNC_FORBID_ERROR);
                return false;
            }
        }
		// detect transport
		if(preg_match('/^http:/',$this->endpoint)){
			// http(s)

			$this->debug('transporting via HTTP');
			if($this->persistentConnection == true && is_object($this->persistentConnection)){
				$http =& $this->persistentConnection;
			} else {
				$http = new jws_transport_http($this->endpoint);
				if ($this->persistentConnection) {
					$http->usePersistentConnection();
				}
			}
			
			$http->setContentType($this->getHTTPContentType());
			
			if($this->http_encoding != ''){
				$http->setEncoding($this->http_encoding);
			}
			
			$this->debug('sending message, length='.strlen($msg));
			$this->responseData = $http->send($msg,$timeout,$response_timeout,$this->cookies);
			
			$this->request = $http->outgoing_payload;
			$this->response = $http->incoming_payload;
			$this->appendDebug($http->getDebug());
			$this->UpdateCookies($http->incoming_cookies);

			// save transport object if using persistent connections
			if ($this->persistentConnection) {
				$http->clearDebug();
				if (!is_object($this->persistentConnection)) {
					$this->persistentConnection = $http;
				}
			}
			
			if($err = $http->getError()){
			    
				$this->setError('HTTP Error: '.$err);
				return false;
			} elseif($this->getError()){
				return false;
			} else {
				$this->debug('got response, length='. strlen($this->responseData).' type='.$http->incoming_headers['content-type']);
				
				return $this->parseResponse($http->incoming_headers, $this->responseData);
			}
			
		}else{
		    $this->setError('no transport found, or selected transport is not yet supported!');
		    return false;
		}
	}

	/**
	* processes jws message returned from server
	*
	* @param	array	$headers	The HTTP headers
	* @param	string	$data		unprocessed response data from server
	* @return	mixed	value of the message, decoded into a PHP type
	* @access   private
	*/
    function parseResponse($headers, $data) {
		$this->debug('Entering parseResponse() for data of length ' . strlen($data) . ' headers:');
		$this->appendDebug($this->varDump($headers));
    	if (!isset($headers['content-type'])) {
			$this->setError('Response not of type text/html (no content-type header)');
			return false;
    	}
		if (!strstr($headers['content-type'], 'text/html')) {
			$this->setError('Response not of type text/html: ' . $headers['content-type']);
			return false;
		}
		$return = json_decode($data, true);
		// add document for doclit support
		$this->document = $data;
		// destroy the parser object
		// return decode message
		return $return;
		
	 }

	/**
	* set the jws headers
	*
	* @param	mixed $headers String of XML with jws header content, or array of jwsval objects for jws headers
	* @access   public
	*/
	function setHeaders($headers){
		$this->debug("setHeaders headers=");
		$this->appendDebug($this->varDump($headers));
		$this->requestHeaders = $headers;
	}

	/**
	* get the jws response headers (namespace resolution incomplete)
	*
	* @return	string
	* @access   public
	*/
	function getHeaders(){
		return $this->responseHeaders;
	}

	/**
	* get the jws response Header (parsed)
	*
	* @return	mixed
	* @access   public
	*/
	function getHeader(){
		return $this->responseHeader;
	}

	/**
	* use HTTP encoding
	*
	* @param    string $enc HTTP encoding
	* @access   public
	*/
	function setHTTPEncoding($enc='gzip, deflate'){
		$this->debug("setHTTPEncoding(\"$enc\")");
		$this->http_encoding = $enc;
	}
	
	/**
	* use HTTP persistent connections if possible
	*
	* @access   public
	*/
	function useHTTPPersistentConnection(){
		$this->debug("useHTTPPersistentConnection");
		$this->persistentConnection = true;
	}


	/**
	* gets the HTTP body for the current request.
	*
	* @param string $jwsmsg The jws payload
	* @return string The HTTP body, which includes the jws payload
	* @access private
	*/
	function getHTTPBody($sendMsg) {
		return $sendMsg;
	}
	
	/**
	* gets the HTTP content type for the current request.
	*
	* Note: getHTTPBody must be called before this.
	*
	* @return string the HTTP content type for the current request.
	* @access private
	*/
	function getHTTPContentType() {
		return 'text/html';
	}


	/**
	 * adds a new Cookie into $this->cookies array
	 *
	 * @param	string $name Cookie Name
	 * @param	string $value Cookie Value
	 * @return	boolean if cookie-set was successful returns true, else false
	 * @access	public
	 */
	function setCookie($name, $value) {
		if (strlen($name) == 0) {
			return false;
		}
		$this->cookies[] = array('name' => $name, 'value' => $value);
		return true;
	}

	/**
	 * gets all Cookies
	 *
	 * @return   array with all internal cookies
	 * @access   public
	 */
	function getCookies() {
		return $this->cookies;
	}

	/**
	 * checks all Cookies and delete those which are expired
	 *
	 * @return   boolean always return true
	 * @access   private
	 */
	function checkCookies() {
		if (sizeof($this->cookies) == 0) {
			return true;
		}
		$this->debug('checkCookie: check ' . sizeof($this->cookies) . ' cookies');
		$curr_cookies = $this->cookies;
		$this->cookies = array();
		foreach ($curr_cookies as $cookie) {
			if (! is_array($cookie)) {
				$this->debug('Remove cookie that is not an array');
				continue;
			}
			if ((isset($cookie['expires'])) && (! empty($cookie['expires']))) {
				if (strtotime($cookie['expires']) > time()) {
					$this->cookies[] = $cookie;
				} else {
					$this->debug('Remove expired cookie ' . $cookie['name']);
				}
			} else {
				$this->cookies[] = $cookie;
			}
		}
		$this->debug('checkCookie: '.sizeof($this->cookies).' cookies left in array');
		return true;
	}

	/**
	 * updates the current cookies with a new set
	 *
	 * @param	array $cookies new cookies with which to update current ones
	 * @return	boolean always return true
	 * @access	private
	 */
	function UpdateCookies($cookies) {
		if (sizeof($this->cookies) == 0) {
			// no existing cookies: take whatever is new
			if (sizeof($cookies) > 0) {
				$this->debug('Setting new cookie(s)');
				$this->cookies = $cookies;
			}
			return true;
		}
		if (sizeof($cookies) == 0) {
			// no new cookies: keep what we've got
			return true;
		}
		// merge
		foreach ($cookies as $newCookie) {
			if (!is_array($newCookie)) {
				continue;
			}
			if ((!isset($newCookie['name'])) || (!isset($newCookie['value']))) {
				continue;
			}
			$newName = $newCookie['name'];

			$found = false;
			for ($i = 0; $i < count($this->cookies); $i++) {
				$cookie = $this->cookies[$i];
				if (!is_array($cookie)) {
					continue;
				}
				if (!isset($cookie['name'])) {
					continue;
				}
				if ($newName != $cookie['name']) {
					continue;
				}
				$newDomain = isset($newCookie['domain']) ? $newCookie['domain'] : 'NODOMAIN';
				$domain = isset($cookie['domain']) ? $cookie['domain'] : 'NODOMAIN';
				if ($newDomain != $domain) {
					continue;
				}
				$newPath = isset($newCookie['path']) ? $newCookie['path'] : 'NOPATH';
				$path = isset($cookie['path']) ? $cookie['path'] : 'NOPATH';
				if ($newPath != $path) {
					continue;
				}
				$this->cookies[$i] = $newCookie;
				$found = true;
				$this->debug('Update cookie ' . $newName . '=' . $newCookie['value']);
				break;
			}
			if (! $found) {
				$this->debug('Add cookie ' . $newName . '=' . $newCookie['value']);
				$this->cookies[] = $newCookie;
			}
		}
		return true;
	}
}