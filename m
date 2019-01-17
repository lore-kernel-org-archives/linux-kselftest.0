From: keescook at chromium.org (Kees Cook)
Date: Thu, 17 Jan 2019 08:11:41 -0800
Subject: Linux 5.0-rc2 seccomp_bpf user_notification_basic test hangs
In-Reply-To: <20190117004416.GA17449@cisco>
References: <7cd7d5bc-1d69-57f5-4a98-81b036f81682@kernel.org>
 <CAGXu5jLGqXstRCmM1_fxUxn4djs1YLUun2Fc8ExcaN4-CKyELQ@mail.gmail.com>
 <20190117004416.GA17449@cisco>
Message-ID: <CAGXu5jJKrCo7Sf0-nq2KxZ6+LZZ-cPTw8FY41QFWXZ9o_Mpz_w@mail.gmail.com>

On Wed, Jan 16, 2019 at 4:44 PM Tycho Andersen <tycho at tycho.ws> wrote:
>
> On Wed, Jan 16, 2019 at 04:30:26PM -0800, Kees Cook wrote:
> > On Wed, Jan 16, 2019 at 4:01 PM shuah <shuah at kernel.org> wrote:
> > >
> > > Hi Kees and James,
> > >
> > > seccomp_bpf test hangs right after the following test passes
> > > with EBUSY. Please see log at the end.
> > >
> > > /* Installing a second listener in the chain should EBUSY */
> > >          EXPECT_EQ(user_trap_syscall(__NR_getpid,
> > >                                      SECCOMP_FILTER_FLAG_NEW_LISTENER),
> > >                    -1);
> > >          EXPECT_EQ(errno, EBUSY);
> > >
> > >
> > > The user_notification_basic test starts running I assume and then
> > > the hang.
> > >
> > > The only commit I see that could be suspect is the following as
> > > it talks about adding SECCOMP_RET_USER_NOTIF
> > >
> > > commit d9a7fa67b4bfe6ce93ee9aab23ae2e7ca0763e84
> > > Merge: f218a29c25ad 55b8cbe470d1
> > > Author: Linus Torvalds <torvalds at linux-foundation.org>
> > > Date:   Wed Jan 2 09:48:13 2019 -0800
> > >
> > >      Merge branch 'next-seccomp' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security
> > >
> > >      Pull seccomp updates from James Morris:
> > >
> > >       - Add SECCOMP_RET_USER_NOTIF
> > >
> > >       - seccomp fixes for sparse warnings and s390 build (Tycho)
> > >
> > >      * 'next-seccomp' of
> > > git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security:
> > >        seccomp, s390: fix build for syscall type change
> > >        seccomp: fix poor type promotion
> > >        samples: add an example of seccomp user trap
> > >        seccomp: add a return code to trap to userspace
> > >        seccomp: switch system call argument type to void *
> > >        seccomp: hoist struct seccomp_data recalculation higher
> > >
> > >
> > > Any ideas on how to proceed? Here is the log. The following
> > > reproduces the problem.
> > >
> > > make -C tools/testing/selftests/seccomp/ run_tests
> > >
> > >
> > > seccomp_bpf.c:2947:global.get_metadata:Expected 0 (0) ==
> > > seccomp(SECCOMP_SET_MODE_FILTER, SECCOMP_FILTER_FLAG_LOG, &prog)
> > > (18446744073709551615)
> > > seccomp_bpf.c:2959:global.get_metadata:Expected 1 (1) == read(pipefd[0],
> > > &buf, 1) (0)
> > > global.get_metadata: Test terminated by assertion
> > > [     FAIL ] global.get_metadata
> > > [ RUN      ] global.user_notification_basic
> > > seccomp_bpf.c:3036:global.user_notification_basic:Expected 0 (0) ==
> > > WEXITSTATUS(status) (1)
> > > seccomp_bpf.c:3039:global.user_notification_basic:Expected
> > > seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
> > > seccomp_bpf.c:3040:global.user_notification_basic:Expected
> > > seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
> > > seccomp_bpf.c:3041:global.user_notification_basic:Expected
> > > seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
> > > seccomp_bpf.c:3042:global.user_notification_basic:Expected
> > > seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog) (18446744073709551615) == 0 (0)
> > > seccomp_bpf.c:3047:global.user_notification_basic:Expected listener
> > > (18446744073709551615) >= 0 (0)
> > > seccomp_bpf.c:3053:global.user_notification_basic:Expected errno (13) ==
> > > EBUSY (16)
> >
> > Looks like the test is unfriendly when running the current selftest on
> > an old kernel version. A quick look seems like it's missing some
> > ASSERT_* cases where EXPECT_* is used. I'll send a patch.
>
> ASSERT will kill the test case though right? I thought we were
> supposed to use EXPECT when we wanted it to keep going. In particular,
> it looks like in the get_metadata test, we should be using expect
> instead of assert in some places, so we can get to the write() that
> does the synchronization. Something like,
>
> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
> index 067cb4607d6c..4d2508af2483 100644
> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
> @@ -2943,11 +2943,11 @@ TEST(get_metadata)
>                 };
>
>                 /* one with log, one without */
> -               ASSERT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER,
> +               EXPECT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER,
>                                      SECCOMP_FILTER_FLAG_LOG, &prog));
> -               ASSERT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog));
> +               EXPECT_EQ(0, seccomp(SECCOMP_SET_MODE_FILTER, 0, &prog));
>
> -               ASSERT_EQ(0, close(pipefd[0]));
> +               EXPECT_EQ(0, close(pipefd[0]));
>                 ASSERT_EQ(1, write(pipefd[1], "1", 1));
>                 ASSERT_EQ(0, close(pipefd[1]));

Yeah, if it breaks badly on a failure, let's do it.

> But also, is running new tests on an old kernel expected to work? I
> didn't know that :).

It should at least not hang. :)

-- 
Kees Cook
