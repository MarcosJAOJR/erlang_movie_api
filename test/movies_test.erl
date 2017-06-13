-module (movies_test).
-compile (export_all).

% etest macros
-include_lib ("etest/include/etest.hrl").
% etest_http macros
-include_lib ("etest_http/include/etest_http.hrl").

before_suite() ->
    application:start(movieapi).

aftersuit() ->
    application:stop(movieapi).

test_movies_comedy() ->
    Response = ?perform_get("http://localhost:3000/movies/comedy"),
    ?assert_status(200, Response),
    ?assert_body_contains("Hello", Response),
    ?assert_body("Hello World!", Response).
