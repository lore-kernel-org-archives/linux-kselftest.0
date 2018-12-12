From: keescook@chromium.org (Kees Cook)
Date: Tue, 11 Dec 2018 16:43:31 -0800
Subject: [PATCH] selftests/seccomp: Remove SIGSTOP si_pid check
In-Reply-To: <20181206235038.GA18273@beast>
References: <20181206235038.GA18273@beast>
Message-ID:
 <CAGXu5jJ-OZho9Ft7imNuayNjr0Rnz3p4sKg-yZp2_d4go=G9fA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181212004331.xGO4Y7Imd4nm2S7M9PoO1R2b8bvzo409z-tM6TlZNWI@z>

On Thu, Dec 6, 2018@3:50 PM Kees Cook <keescook@chromium.org> wrote:
>
> Commit f149b3155744 ("signal: Never allocate siginfo for SIGKILL or SIGSTOP")
> means that the seccomp selftest cannot check si_pid under SIGSTOP anymore.
> Since it's believed[1] there are no other userspace things depending on the
> old behavior, this removes the behavioral check in the selftest, since it's
> more a "extra" sanity check (which turns out, maybe, not to have been
> useful to test).
>
> [1] https://lkml.kernel.org/r/CAGXu5jJaZAOzP1qFz66tYrtbuywqb+UN2SOA1VLHpCCOiYvYeg at mail.gmail.com
>
> Reported-by: Tycho Andersen <tycho at tycho.ws>
> Suggested-by: Eric W. Biederman <ebiederm at xmission.com>
> Signed-off-by: Kees Cook <keescook at chromium.org>
> ---
> Shuah, can you make sure that Linus gets this before v4.20 is released? Thanks!

Ping. Shuah, can you get this to Linus (or should I send it directly?)

Thanks!

-Kees


> ---
>  tools/testing/selftests/seccomp/seccomp_bpf.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index e1473234968d..c9a2abf8be1b 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -2731,9 +2731,14 @@ TEST(syscall_restart)
>         ASSERT_EQ(child_pid, waitpid(child_pid, &status, 0));
>         ASSERT_EQ(true, WIFSTOPPED(status));
>         ASSERT_EQ(SIGSTOP, WSTOPSIG(status));
> -       /* Verify signal delivery came from parent now. */
>         ASSERT_EQ(0, ptrace(PTRACE_GETSIGINFO, child_pid, NULL, &info));
> -       EXPECT_EQ(getpid(), info.si_pid);
> +       /*
> +        * There is no siginfo on SIGSTOP any more, so we can't verify
> +        * signal delivery came from parent now (getpid() == info.si_pid).
> +        * https://lkml.kernel.org/r/CAGXu5jJaZAOzP1qFz66tYrtbuywqb+UN2SOA1VLHpCCOiYvYeg at mail.gmail.com
> +        * At least verify the SIGSTOP via PTRACE_GETSIGINFO.
> +        */
> +       EXPECT_EQ(SIGSTOP, info.si_signo);
>
>         /* Restart nanosleep with SIGCONT, which triggers restart_syscall. */
>         ASSERT_EQ(0, kill(child_pid, SIGCONT));
> --
> 2.17.1
>
>
> --
> Kees Cook



-- 
Kees Cook
