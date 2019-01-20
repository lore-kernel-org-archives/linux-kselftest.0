From: keescook at chromium.org (Kees Cook)
Date: Sat, 19 Jan 2019 16:43:24 -0800
Subject: [PATCH v1 0/6] seccomp test fixes
In-Reply-To: <20190119001217.12660-1-tycho@tycho.ws>
References: <20190119001217.12660-1-tycho@tycho.ws>
Message-ID: <CAGXu5jKtQZ5oKethjopCW75eDtj6fEdCANRqah+wUh2pYfdGiQ@mail.gmail.com>

On Fri, Jan 18, 2019 at 4:12 PM Tycho Andersen <tycho at tycho.ws> wrote:
>
> Hi all,
>
> Here are the fixes I previously mentioned I would send. I previously
> assumed that the tests were mostly run as root, but it turns out
> everything else besides the stuff I wrote in the seccomp tests either
> sets NNP and doesn't require real root, so it all actually works. This
> set of fixes should make most of the other tests work unprivileged,
> while XFAIL-ing the one that requires real root.

Awesome. This all looks good to me. :)

Acked-by: Kees Cook <keescook at chromium.org>

Shuah, can you take this series?

-Kees

>
> Cheers,
>
> Tycho
>
> Tycho Andersen (6):
>   selftests: don't kill child immediately in get_metadata() test
>   selftests: fix typo in seccomp_bpf.c
>   selftest: include stdio.h in kselftest.h
>   selftests: skip seccomp get_metadata test if not real root
>   selftests: set NO_NEW_PRIVS bit in seccomp user tests
>   selftests: unshare userns in seccomp pidns testcases
>
>  tools/testing/selftests/kselftest.h           |  1 +
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 42 ++++++++++++++++---
>  2 files changed, 38 insertions(+), 5 deletions(-)
>
> --
> 2.19.1
>


-- 
Kees Cook
