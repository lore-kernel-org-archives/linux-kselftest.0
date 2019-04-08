From: keescook at chromium.org (Kees Cook)
Date: Mon, 8 Apr 2019 09:46:21 -0700
Subject: TAP 13 output format
Message-ID: <CAGXu5jLzyjtkF4Z1Rm7rsp85EiEmTqyLFcgXYPWEgxGVuprG9w@mail.gmail.com>

Hi,

I'm working on writing a LKDTM selftest, and I noticed that the output
format for the existing selftest tests don't seem to actually conform
to the TAP 13 specification[1]. Namely, there is a ton of output
between the "ok" and "not ok" lines, in various places for various
reasons. IIUC, the spec says these lines should follow the "ok" lines
and be (at least) indented to be parsed as YAML.

How does the existing CI do the selftest output parsing? Is there some
other spec I should have read for the correct interpretation here?
(TAP 13 says this part isn't exactly agreed on yet.)

e.g., I see this right now:

# cd tools/testing/selftests
# make --silent -C lib run_tests
TAP version 13
selftests: lib: printf.sh
========================================
printf: module test_printf is not found [SKIP]
not ok 1..1 selftests: lib: printf.sh [SKIP]
selftests: lib: bitmap.sh
========================================
bitmap: module test_bitmap is not found [SKIP]
not ok 1..2 selftests: lib: bitmap.sh [SKIP]
selftests: lib: prime_numbers.sh
========================================
prime_numbers: module prime_numbers is not found [SKIP]
not ok 1..3 selftests: lib: prime_numbers.sh [SKIP]

There is no "plan" line, lots of lines between test lines, and the
test numbering is non-spec. I would have expected the following
output:

TAP version 13
1..3 lib
not ok 1 lib: printf.sh # SKIP module test_printf is not found
not ok 2 lib: bitmap.sh # SKIP module test_bitmap is not found
not ok 3 lib: prime_numbers.sh # SKIP module prime_numbers is not found

And for output, here's another:

# make --silent -C ipc run_tests
TAP version 13
selftests: ipc: msgque
========================================
Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
1..0
ok 1..1 selftests: ipc: msgque [PASS]

The test-specific output should be after the "ok" line:

TAP version 13
1..1 ipc
ok 1 ipc: msgque
 ---
 output: |+
  Pass 0 Fail 0 Xfail 0 Xpass 0 Skip 0 Error 0
 ...

The test runner knows how many tests are going to be run, so the
"plan" line can be correct. The ok/not-ok lines can be fixed to avoid
the prefixed "1..", and the output during the tests can be captured
and indented for valid YAML (above uses "output" to capture the text
output with a literal block quote style of "|+"[2]).

It seems like the current output cannot be parsed by things like
Test::Harness. The spec is pretty specific about "Any output that is
not a version, a plan, a test line, a YAML block, a diagnostic or a
bail out is incorrect."

Has this been discussed before? I spent a little time looking but
couldn't find an earlier thread...

Thanks!

-Kees

[1] https://testanything.org/tap-version-13-specification.html
[2] https://yaml-multiline.info

-- 
Kees Cook
