From: keescook at chromium.org (Kees Cook)
Date: Mon, 8 Apr 2019 12:46:42 -0700
Subject: [RFC][PATCH] selftests/lib.mk: Move test output to diagnostic
 lines
In-Reply-To: <20190408190243.GA33074@beast>
References: <20190408190243.GA33074@beast>
Message-ID: <CAGXu5jLjbSxaL7_F2d+K9mMpvnhC_vBvR7DmOvVE=3QV3Y+5VQ@mail.gmail.com>

On Mon, Apr 8, 2019 at 12:02 PM Kees Cook <keescook at chromium.org> wrote:
> Also, while "sed -u" is used to add the "# " line prefixes, this
> still doesn't work for all output. For example, the "timer" lists
> print out text, then do the work, then print a result and a newline.
> This isn't visible any more. And some tests still show nothing until
> they finish. I haven't found a way to force the prefixing while keeping
> the output entirely unbuffered. :(

Oh, I think I've solved this. :)

$ cat prefix.pl
#!/usr/bin/perl
use strict;

binmode STDIN;
binmode STDOUT;

STDOUT->autoflush(1);

my $needed = 1;
while (1) {
        my $char;
        my $bytes = sysread(STDIN, $char, 1);
        exit 0 if ($bytes == 0);
        if ($needed) {
                print "# ";
                $needed = 0;
        }
        print $char;
        $needed = 1 if ($char eq "\n");
}

> +                       (./$$BASENAME_TEST > /tmp/$$BASENAME_TEST 2>&1 &&\
> +                               echo "ok $$test_num $$TEST_HDR_MSG") || \

-                       (((((./$$BASENAME_TEST 2>&1; echo $$? >&3) |    \
-                               sed -ue 's/^/# /' >&4) 3>&1) |          \
+                       (((((stdbuf -i0 -o0 -e0 ./$$BASENAME_TEST
2>&1; echo $$? >&3) | \
+                               ../prefix.pl >&4) 3>&1) |               \

This also, I think, solve the "recursive TAP output" issue too, since
sub-tests will be entirely contained in the #-indented output and
could be parsed out of the diagnostics by just doing a 2-character
left-strip.

Thoughts?

-- 
Kees Cook
