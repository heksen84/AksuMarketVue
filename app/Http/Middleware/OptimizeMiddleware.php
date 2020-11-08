<?php

/*
 *
 * (c) Farshad Ghanbari <eng.ghanbari2025@gmail.com>
 *
 */

namespace App\Http\Middleware;

use Closure;

class OptimizeMiddleware
{
    /**
     * Handle an incoming request.
     * (c) Farshad Ghanbari <eng.ghanbari2025@gmail.com>
     * @param  \Illuminate\Http\Request $request
     * @param  \Closure $next
     * @return mixed
     */
    public function handle($request, Closure $next) {

        $response = $next($request);

        $buffer = $response->getContent();
        if (strpos($buffer, '<pre>') !== false) {
            $replace = array(
                "/\r/" => '',
//                "/>\n</" => '><',
//                "/>\s+\n</" => '><',
//                "/>\n\s+</" => '><',
            );
        } else {
            $replace = array(
//                "/\n([\S])/" => '$1',
//                "/\r/" => '',
//                "/\n/" => '',
                "/\t/" => '',
                "/ +/" => ' ',
            );
        }

        $buffer = preg_replace(array_keys($replace), array_values($replace), $buffer);
        $response->setContent($buffer);

        ini_set('zlib.output_compression', 'On');
        return $response;

  //      return $next($request);
    }
}