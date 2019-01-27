From: linux at roeck-us.net (Guenter Roeck)
Date: Sun, 27 Jan 2019 15:53:34 -0800
Subject: [PATCH] selftests/seccomp: Actually sleep for 1/10th second
In-Reply-To: <CAKwvOdkvV+1qVUTz7G+nfftdzUfTGL+RnQ_8rA_RAhRrpvRLBA@mail.gmail.com>
References: <20190127094357.GA9436@beast>
 <CAKwvOdnUzTXSBPayebsy8pJGjJjPS3oi3qE8nRPtAhtv_PJ4xw@mail.gmail.com>
 <CAGXu5jKDdutht_+hVhKan6cNZ+bS7e0gom5yXmcMgKE9KuZwYg@mail.gmail.com>
 <CAKwvOdkvV+1qVUTz7G+nfftdzUfTGL+RnQ_8rA_RAhRrpvRLBA@mail.gmail.com>
Message-ID: <e571e536-3c27-fb47-32d0-c9e72417f888@roeck-us.net>

On 1/27/19 11:36 AM, Nick Desaulniers wrote:
> On Sun, Jan 27, 2019 at 11:13 AM Kees Cook <keescook at chromium.org> wrote:
>>
>> On Sun, Jan 27, 2019 at 11:25 PM Nick Desaulniers
>> <ndesaulniers at google.com> wrote:
>>>
>>> On Sun, Jan 27, 2019 at 1:44 AM Kees Cook <keescook at chromium.org> wrote:
>>>>
>>>> Clang noticed that some none-zero sleep()s were actually using zero
>>>> anyway. This switches to nanosleep() to gain sub-second granularity.
>>>>
>>>> seccomp_bpf.c:2625:9: warning: implicit conversion from 'double' to
>>>>        'unsigned int' changes value from 0.1 to 0 [-Wliteral-conversion]
>>>>                  sleep(0.1);
>>>>                  ~~~~~ ^~~
>>>>
>>>> Signed-off-by: Kees Cook <keescook at chromium.org>
>>>> ---
>>>>   tools/testing/selftests/seccomp/seccomp_bpf.c | 5 +++--
>>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
>>>> index 067cb4607d6c..a9f278c13f13 100644
>>>> --- a/tools/testing/selftests/seccomp/seccomp_bpf.c
>>>> +++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
>>>> @@ -2569,6 +2569,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
>>>>   {
>>>>          long ret, sib;
>>>>          void *status;
>>>> +       struct timespec delay = { .tv_nsec = 100000000 };
>>>
>>> "Omitted fields are implicitly initialized the same as for objects
>>> that have static storage duration."
>>> https://gcc.gnu.org/onlinedocs/gcc/Designated-Inits.html
>>> https://godbolt.org/z/cuGqxM
>>> (So this wont sleep an arbitrary amount of seconds, phew)
>>
>> Yup. :) Even an empty initializer works ... = { };
>> (Except that padding bytes aren't always included in the zeroing...)
>>
>>>
>>>>
>>>>          ASSERT_EQ(0, prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)) {
>>>>                  TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
>>>> @@ -2622,7 +2623,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
>>>>          EXPECT_EQ(SIBLING_EXIT_UNKILLED, (long)status);
>>>>          /* Poll for actual task death. pthread_join doesn't guarantee it. */
>>>>          while (!kill(self->sibling[sib].system_tid, 0))
>>>> -               sleep(0.1);
>>>> +               nanosleep(&delay, NULL);
>>>>          /* Switch to the remaining sibling */
>>>>          sib = !sib;
>>>>
>>>> @@ -2647,7 +2648,7 @@ TEST_F(TSYNC, two_siblings_not_under_filter)
>>>>          EXPECT_EQ(0, (long)status);
>>>>          /* Poll for actual task death. pthread_join doesn't guarantee it. */
>>>>          while (!kill(self->sibling[sib].system_tid, 0))
>>>> -               sleep(0.1);
>>>> +               nanosleep(&delay, NULL);
>>>
>>> Interesting bug.  If the sleeps weren't doing anything, are they even
>>> needed? Does adding the tests cause them to continue to pass, or start
>>> to fail?  If they weren't doing anything, and the tests were passing,
>>> maybe it's just better to remove them?
>>
>> It was just spinning.
> 
> So this test has been broken? If so, do you know for how long? Or
> who's monitoring them?  Either way, thanks for noticing and fixing.
> 
> +Guenter; did you notice if this test was failing? Are your boot tests
> running kselftests?
> 

No, I don't run kselftests at this time.

Guenter

>> This restores the intention of not being so
>> aggressive in the wait loop. While the sleep could be removed, that
>> wasn't the intention.
> 
> Oh, yeah I guess the comment above it about pthread_join is relevant.
> I just get highly highly suspicious whenever I see sleeps added to any
> code.
> Reviewed-by: Nick Desaulniers <ndesaulniers at google.com>
> 
