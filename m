From: shuah@kernel.org (shuah)
Date: Fri, 25 Jan 2019 12:11:54 -0700
Subject: [PATCH] selftests/seccomp: Enhance per-arch ptrace syscall skip
 tests
In-Reply-To: <CAGXu5jLUixGHcU3fZe2e8H53QbvEuSNmHyjMZXnrjP26dSWMoA@mail.gmail.com>
References: <20190125183359.GA8524@beast>
 <b4d7a57b-349b-d095-2f5e-3beef86cd2c0@canonical.com>
 <CAGXu5jLUixGHcU3fZe2e8H53QbvEuSNmHyjMZXnrjP26dSWMoA@mail.gmail.com>
Message-ID: <bf579b2d-9515-ea5b-d2a5-4f148964eca2@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190125191154.XoXVssClOKidajRv7XvUZq601TQB79JkHIVVOGqKC-c@z>

On 1/25/19 11:46 AM, Kees Cook wrote:
> On Sat, Jan 26, 2019@7:42 AM Colin Ian King <colin.king@canonical.com> wrote:
>>
>> On 25/01/2019 18:33, Kees Cook wrote:
>>> Passing EPERM during syscall skipping was confusing since the test wasn't
>>> actually exercising the errno evaluation -- it was just passing a literal
>>> "1" (EPERM). Instead, expand the tests to check both direct value returns
>>> (positive, 45000 in this case), and errno values (negative, -ESRCH in this
>>> case) to check both fake success and fake failure during syscall skipping.
>>>
>>> Reported-by: Colin Ian King <colin.king at canonical.com>
>>> Fixes: a33b2d0359a0 ("selftests/seccomp: Add tests for basic ptrace actions")
>>> Cc: stable at vger.kernel.org
>>> Signed-off-by: Kees Cook <keescook at chromium.org>
>>> ---
>>> Colin, does this end up working on s390? Based on your bug report, I
>>> suspect the positive value tests will fail, but the errno tests will
>>> pass. If that's true, I think something is wrong in the s390 handling.
>>> (And it may just be that the ptrace code to rewrite syscalls on s390
>>> in the test is wrong...) But splitting these tests up should tell us more.
>>> ---
>>>   tools/testing/selftests/seccomp/seccomp_bpf.c | 72 +++++++++++++++----
>>>   1 file changed, 57 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
>>> index 496a9a8c773a..7e632b465ab4 100644
>>> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
>>> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
>>> @@ -1608,7 +1608,16 @@ TEST_F(TRACE_poke, getpid_runs_normally)
>>>   #ifdef SYSCALL_NUM_RET_SHARE_REG
>>>   # define EXPECT_SYSCALL_RETURN(val, action)  EXPECT_EQ(-1, action)
>>>   #else
>>> -# define EXPECT_SYSCALL_RETURN(val, action)  EXPECT_EQ(val, action)
>>> +# define EXPECT_SYSCALL_RETURN(val, action)          \
>>> +     do {                                            \
>>> +             errno = 0;                              \
>>> +             if (val < 0) {                          \
>>> +                     EXPECT_EQ(-1, action);          \
>>> +                     EXPECT_EQ(-(val), errno);       \
>>> +             } else {                                \
>>> +                     EXPECT_EQ(val, action);         \
>>> +             }                                       \
>>> +     } while (0)
>>>   #endif
>>>
>>>   /* Use PTRACE_GETREGS and PTRACE_SETREGS when available. This is useful for
>>> @@ -1647,7 +1656,7 @@ int get_syscall(struct __test_metadata *_metadata, pid_t tracee)
>>>
>>>   /* Architecture-specific syscall changing routine. */
>>>   void change_syscall(struct __test_metadata *_metadata,
>>> -                 pid_t tracee, int syscall)
>>> +                 pid_t tracee, int syscall, int result)
>>>   {
>>>        int ret;
>>>        ARCH_REGS regs;
>>> @@ -1706,7 +1715,7 @@ void change_syscall(struct __test_metadata *_metadata,
>>>   #ifdef SYSCALL_NUM_RET_SHARE_REG
>>>                TH_LOG("Can't modify syscall return on this architecture");
>>>   #else
>>> -             regs.SYSCALL_RET = EPERM;
>>> +             regs.SYSCALL_RET = result;
>>>   #endif
>>>
>>>   #ifdef HAVE_GETREGS
>>> @@ -1734,14 +1743,19 @@ void tracer_syscall(struct __test_metadata *_metadata, pid_t tracee,
>>>        case 0x1002:
>>>                /* change getpid to getppid. */
>>>                EXPECT_EQ(__NR_getpid, get_syscall(_metadata, tracee));
>>> -             change_syscall(_metadata, tracee, __NR_getppid);
>>> +             change_syscall(_metadata, tracee, __NR_getppid, 0);
>>>                break;
>>>        case 0x1003:
>>> -             /* skip gettid. */
>>> +             /* skip gettid with valid return code. */
>>>                EXPECT_EQ(__NR_gettid, get_syscall(_metadata, tracee));
>>> -             change_syscall(_metadata, tracee, -1);
>>> +             change_syscall(_metadata, tracee, -1, 45000);
>>>                break;
>>>        case 0x1004:
>>> +             /* skip openat with error. */
>>> +             EXPECT_EQ(__NR_openat, get_syscall(_metadata, tracee));
>>> +             change_syscall(_metadata, tracee, -1, -ESRCH);
>>> +             break;
>>> +     case 0x1005:
>>>                /* do nothing (allow getppid) */
>>>                EXPECT_EQ(__NR_getppid, get_syscall(_metadata, tracee));
>>>                break;
>>> @@ -1774,9 +1788,11 @@ void tracer_ptrace(struct __test_metadata *_metadata, pid_t tracee,
>>>        nr = get_syscall(_metadata, tracee);
>>>
>>>        if (nr == __NR_getpid)
>>> -             change_syscall(_metadata, tracee, __NR_getppid);
>>> +             change_syscall(_metadata, tracee, __NR_getppid, 0);
>>> +     if (nr == __NR_gettid)
>>> +             change_syscall(_metadata, tracee, -1, 45000);
>>>        if (nr == __NR_openat)
>>> -             change_syscall(_metadata, tracee, -1);
>>> +             change_syscall(_metadata, tracee, -1, -ESRCH);
>>>   }
>>>
>>>   FIXTURE_DATA(TRACE_syscall) {
>>> @@ -1793,8 +1809,10 @@ FIXTURE_SETUP(TRACE_syscall)
>>>                BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_TRACE | 0x1002),
>>>                BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_gettid, 0, 1),
>>>                BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_TRACE | 0x1003),
>>> -             BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_getppid, 0, 1),
>>> +             BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_openat, 0, 1),
>>>                BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_TRACE | 0x1004),
>>> +             BPF_JUMP(BPF_JMP|BPF_JEQ|BPF_K, __NR_getppid, 0, 1),
>>> +             BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_TRACE | 0x1005),
>>>                BPF_STMT(BPF_RET|BPF_K, SECCOMP_RET_ALLOW),
>>>        };
>>>
>>> @@ -1842,15 +1860,26 @@ TEST_F(TRACE_syscall, ptrace_syscall_redirected)
>>>        EXPECT_NE(self->mypid, syscall(__NR_getpid));
>>>   }
>>>
>>> -TEST_F(TRACE_syscall, ptrace_syscall_dropped)
>>> +TEST_F(TRACE_syscall, ptrace_syscall_errno)
>>> +{
>>> +     /* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
>>> +     teardown_trace_fixture(_metadata, self->tracer);
>>> +     self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
>>> +                                        true);
>>> +
>>> +     /* Tracer should skip the open syscall, resulting in ESRCH. */
>>> +     EXPECT_SYSCALL_RETURN(-ESRCH, syscall(__NR_openat));
>>> +}
>>> +
>>> +TEST_F(TRACE_syscall, ptrace_syscall_faked)
>>>   {
>>>        /* Swap SECCOMP_RET_TRACE tracer for PTRACE_SYSCALL tracer. */
>>>        teardown_trace_fixture(_metadata, self->tracer);
>>>        self->tracer = setup_trace_fixture(_metadata, tracer_ptrace, NULL,
>>>                                           true);
>>>
>>> -     /* Tracer should skip the open syscall, resulting in EPERM. */
>>> -     EXPECT_SYSCALL_RETURN(EPERM, syscall(__NR_openat));
>>> +     /* Tracer should skip the gettid syscall, resulting fake pid. */
>>> +     EXPECT_SYSCALL_RETURN(45000, syscall(__NR_gettid));
>>>   }
>>>
>>>   TEST_F(TRACE_syscall, syscall_allowed)
>>> @@ -1883,7 +1912,21 @@ TEST_F(TRACE_syscall, syscall_redirected)
>>>        EXPECT_NE(self->mypid, syscall(__NR_getpid));
>>>   }
>>>
>>> -TEST_F(TRACE_syscall, syscall_dropped)
>>> +TEST_F(TRACE_syscall, syscall_errno)
>>> +{
>>> +     long ret;
>>> +
>>> +     ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
>>> +     ASSERT_EQ(0, ret);
>>> +
>>> +     ret = prctl(PR_SET_SECCOMP, SECCOMP_MODE_FILTER, &self->prog, 0, 0);
>>> +     ASSERT_EQ(0, ret);
>>> +
>>> +     /* openat has been skipped and an errno return. */
>>> +     EXPECT_SYSCALL_RETURN(-ESRCH, syscall(__NR_openat));
>>> +}
>>> +
>>> +TEST_F(TRACE_syscall, syscall_faked)
>>>   {
>>>        long ret;
>>>
>>> @@ -1894,8 +1937,7 @@ TEST_F(TRACE_syscall, syscall_dropped)
>>>        ASSERT_EQ(0, ret);
>>>
>>>        /* gettid has been skipped and an altered return value stored. */
>>> -     EXPECT_SYSCALL_RETURN(EPERM, syscall(__NR_gettid));
>>> -     EXPECT_NE(self->mytid, syscall(__NR_gettid));
>>> +     EXPECT_SYSCALL_RETURN(45000, syscall(__NR_gettid));
>>>   }
>>>
>>>   TEST_F(TRACE_syscall, skip_after_RET_TRACE)
>>>
>> Works perfectly. Thanks Kees.
>>
>> Tested-by: Colin Ian King <colin.king at canonical.com>
> 
> Oh excellent! Thanks. :) Shuah can you queue this up?
> 

Yup will do - I am planning to apply bunch of fixes this afternoon.
Hoping to get them into rc5

thanks,
-- Shuah
