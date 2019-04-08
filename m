From: keescook at chromium.org (Kees Cook)
Date: Mon, 8 Apr 2019 10:20:07 -0700
Subject: TAP 13 output format
In-Reply-To: <2aa1eeb7-f12d-a5fc-e929-c30846c1fbee@kernel.org>
References: <CAGXu5jLzyjtkF4Z1Rm7rsp85EiEmTqyLFcgXYPWEgxGVuprG9w@mail.gmail.com>
 <2aa1eeb7-f12d-a5fc-e929-c30846c1fbee@kernel.org>
Message-ID: <CAGXu5jJnvf8R9Htx2oCoAvMM7QYSCn5TkSUwU1F4MznC6O5oEw@mail.gmail.com>

On Mon, Apr 8, 2019 at 10:08 AM shuah <shuah at kernel.org> wrote:
> Can you point me to the TAP parser you are using? I would like to
> run a few tests and see if we can make it fully TAP13 compliant.

Mainly this was just with my eyes, but I was hoping to use "tappy" for
summaries and it is quite unhappy with the current state of things:

$ (cd tools/testing/selftests/ && make --silent -C lib run_tests) | tappy
FFFF
======================================================================
FAIL: <file=stream>
..1 selftests: lib: printf.sh [SKIP]
----------------------------------------------------------------------

======================================================================
FAIL: <file=stream>
..2 selftests: lib: bitmap.sh [SKIP]
----------------------------------------------------------------------

======================================================================
FAIL: <file=stream>
..3 selftests: lib: prime_numbers.sh [SKIP]
----------------------------------------------------------------------

======================================================================
FAIL: <file=stream>
Missing a plan.
----------------------------------------------------------------------

----------------------------------------------------------------------
Ran 4 tests in 0.000s

FAILED (failures=4)

-- 
Kees Cook
