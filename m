From: keescook at chromium.org (Kees Cook)
Date: Thu, 25 Apr 2019 10:11:20 -0700
Subject: [PATCH v2 0/8] selftests: Move test output to diagnostic lines
In-Reply-To: <CAGXu5jJChvx-_E8RMTi3ioUZGuQGViy6gcAMpmvYZzms=zc6dQ@mail.gmail.com>
References: <20190424231237.14776-1-keescook@chromium.org>
 <a3ca267e-8e1e-65da-77c8-c7010a39354b@kernel.org>
 <CAGXu5jJChvx-_E8RMTi3ioUZGuQGViy6gcAMpmvYZzms=zc6dQ@mail.gmail.com>
Message-ID: <CAGXu5jLoOJydOOxmmiYYL2k_0K-MOD6j=gV8_4BUNhTTyWNsVQ@mail.gmail.com>

On Thu, Apr 25, 2019 at 10:05 AM Kees Cook <keescook at chromium.org> wrote:
> WARNING: Misplaced SPDX-License-Identifier tag - use line 1 instead
> #37: FILE: tools/testing/selftests/kselftest/runner.sh:2:
>  # SPDX-License-Identifier: GPL-2.0
>
> This is a shell script. It can't be on line 1:
>
> $ head -n3 tools/testing/selftests/kselftest/runner.sh
> #!/bin/sh
> # SPDX-License-Identifier: GPL-2.0
> #
>
> That looks like a bug in checkpatch not resetting the expected line or
> something.

It doesn't like patch 3 and doesn't notice that diff offset starts at line 2:

diff --git a/tools/testing/selftests/kselftest/runner.sh
b/tools/testing/selftests/kselftest/runner.sh
index e1117d703887..f12b0a631273 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -2,17 +2,20 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Runs a set of tests in a given subdirectory.
+export KSFT_TAP_LEVEL=1

Joe, looks like the problem is here:

                if ($realline == $checklicenseline) {
realline == 2, checklicenseline == 1
so this is skipped, including the "#!/" check to move checklicenseline to 2.
then:
                if ($realline != $checklicenseline &&
                    $rawline =~ /\bSPDX-License-Identifier:/ &&
realline == 2, checklicenseline == 1
throws warning.

Seems like checklicenseline should be unconditionally set to 2 for
".sh" files? I don't see a way to fix this for just missing the #!/
line from a context diff, though...

-- 
Kees Cook
