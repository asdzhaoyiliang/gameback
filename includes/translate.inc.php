<?php

//判断需要使用的语言
if(isset($_GET['language'])){
    $current_language = $_SESSION['language'] = $_GET['language'];
}elseif(isset($_SESSION['language']) && !empty($_SESSION['language'])){
    $current_language = $_SESSION['language'];
}elseif(defined(LANGUAGE)){
    $current_language = $_SESSION['language'] = LANGUAGE;
}

if(empty($current_language) || @!in_array($current_language, array_keys($language_arr))){
    $current_language = $_SESSION['language'] = DEFAULT_LANGUAGE;
}

//翻译方法
function t($string, $args = array(), $langcode = NULL) {
    $string = trim($string);
    if(empty($string)) return '';
    global $current_language;

    $langcode = isset($langcode) ? $langcode : $current_language;
    $string = locale($string, $langcode);

    if (empty($args)) {
        return $string;
    }else {
        foreach ($args as $key => $value) {
            $key[0] == '@' &&  $args[$key] = check_plain($value);
        }
        return strtr($string, $args);
    }
}

function locale($string = NULL, $langcode = NULL, $reset = FALSE) {
    global $current_language;
    $langcode = isset($langcode) ? $langcode : $current_language;
    if($langcode == DEFAULT_LANGUAGE){
        return $string;
    }

    static $locale_t, $T;
    if(!isset($T)){
        $T = new TranslateAction();
    }

    if ($reset) {
        $locale_t = NULL;
    }

    if (!isset($string)) {
        return $locale_t;
    }


    if (!isset($locale_t[$langcode])) {
        $locale_t[$langcode] = array();
        $cache = $T->getCache($langcode);
        if ($cache) {
            $locale_t[$langcode] = $cache;
        }else {
            $locale_t[$langcode] = $T->updateCache($langcode);
        }
    }

    if (!isset($locale_t[$langcode][$string])) {
        $translation = $T->getTranslate($langcode, _addslashes($string));
        if ($translation) {
            $locale_t[$langcode][$string] = $translation['translate']? $translation['translate']: true;
            $T->updateCache($langcode);
        }else {
            $path = $_SERVER['REQUEST_URI'];

            $T->sourceAdd(_addslashes($string), $path);
            // We don't have the source string, cache this as untranslated.
            $locale_t[$langcode][$string] = true;
        }
    }

    return $locale_t[$langcode][$string] === true? $string : $locale_t[$langcode][$string];
}

