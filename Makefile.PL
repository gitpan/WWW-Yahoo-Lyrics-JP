use inc::Module::Install;
name 'WWW-Yahoo-Lyrics-JP';
all_from 'lib/WWW/Yahoo/Lyrics/JP.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
