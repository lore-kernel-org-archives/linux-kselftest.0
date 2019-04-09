From: keescook@chromium.org (Kees Cook)
Date: Tue, 9 Apr 2019 09:06:26 -0700
Subject: [PATCH] selftests/lib.mk: Move test output to diagnostic lines
In-Reply-To: <ac089bd1-0abb-da5b-a418-b81ea9957a28@kernel.org>
References: <20190408203012.GA566@beast>
 <ac089bd1-0abb-da5b-a418-b81ea9957a28@kernel.org>
Message-ID:
 <CAGXu5j+_b-w+e_4rn1D5zH=KF_O=ktz-xV3hEFd1cqSmcWpWhQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190409160626.JaPD6g5RnxeZ9Q8J0DtB2ZMJruDS4pwzc5ewpVxBY8I@z>

On Mon, Apr 8, 2019@2:32 PM shuah <shuah@kernel.org> wrote:
> Couple of things to consider:
> - will this work on embedded test system with limited applications shell
>    support?

I was assuming the availability of "stdbuf" which is part of
coreutils, and "perl" which is already required for at least one other
test (sysctl). What do you have in mind for the "maximum supported
environment" (and where's best to document this)? Also, I see python
is used by several tests. Should python be considered instead of perl?

> - It does add dependecy on perl for running tests - not a problem since
>    kernel build system uses it, however it might not be the case when
>    tests get run on system without perl.

I could likely rewrite the "prefix.pl" in C, and the test could use a
built binary instead? Or in python (as noted above). Where are tests
being run right now with such a limited environment?

> - there is the emit_tests support that creates a shell script that runs.
>    The results format should stay the is same when tests get run using
>    run_tests vs. tests are built and installed. Take a look at emit_tests
>    and EMIT_TESTS in Makefile and lib.mk

Ah yeah. I will adjust EMIT_TESTS too.

Thanks!

-- 
Kees Cook
