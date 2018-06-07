From: anders.roxell at linaro.org (Anders Roxell)
Date: Thu, 7 Jun 2018 23:43:45 +0200
Subject: [PATCH] selftests: bpf: fix urandom_read build issue
In-Reply-To: <CAH3MdRXMHRtK9FJ4UP8Gy-bahCS2oipOY7yLTEqu-x6uOMKLvw@mail.gmail.com>
References: <20180607105712.553-1-anders.roxell@linaro.org>
 <CAH3MdRWo0kUYngyAwXP1sOT_XqbxyfTvDd6sNz+qd7LL1T8LUA@mail.gmail.com>
 <CADYN=9J3wY1f6q4NvH1mHJXnu6GnErOqz75CfzfG1q5-WzcyCg@mail.gmail.com>
 <CAH3MdRXMHRtK9FJ4UP8Gy-bahCS2oipOY7yLTEqu-x6uOMKLvw@mail.gmail.com>
Message-ID: <CADYN=9Ly5UU34CxZFnWfQhNrS8V3gG7=Bdfn9n0h5XphZ8EiVQ@mail.gmail.com>

On 7 June 2018 at 23:17, Y Song <ys114321 at gmail.com> wrote:
> On Thu, Jun 7, 2018 at 12:07 PM, Anders Roxell <anders.roxell at linaro.org> wrote:
>> On 7 June 2018 at 19:52, Y Song <ys114321 at gmail.com> wrote:
>>> On Thu, Jun 7, 2018 at 3:57 AM, Anders Roxell <anders.roxell at linaro.org> wrote:
>>>> gcc complains that urandom_read gets built twice.
>>>>
>>>> gcc -o tools/testing/selftests/bpf/urandom_read
>>>> -static urandom_read.c -Wl,--build-id
>>>> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf
>>>> -I../../../../include/generated  -I../../../include    urandom_read.c
>>>> urandom_read -lcap -lelf -lrt -lpthread -o
>>>> tools/testing/selftests/bpf/urandom_read
>>>> gcc: fatal error: input file
>>>> ‘tools/testing/selftests/bpf/urandom_read’ is the
>>>> same as output file
>>>> compilation terminated.
>>>> ../lib.mk:110: recipe for target
>>>> 'tools/testing/selftests/bpf/urandom_read' failed
>>>
>>> What is the build/make command to reproduce the above failure?
>>
>> make -C tools/testing/selftests
>
> Thanks. The patch will break
>    make -C tools/testing/selftests/bpf
>
> [yhs at localhost bpf-next]$ make -C tools/testing/selftests/bpf
> make: Entering directory '/home/yhs/work/bpf-next/tools/testing/selftests/bpf'
> gcc -o /urandom_read -static urandom_read.c -Wl,--build-id
> /usr/bin/ld: cannot open output file /urandom_read: Permission denied
> collect2: error: ld returned 1 exit status
> make: *** [Makefile:20: /urandom_read] Error 1
> make: Leaving directory '/home/yhs/work/bpf-next/tools/testing/selftests/bpf'
> [yhs at localhost bpf-next]$

urgh, I'm sorry, missed that.

>
> Could you still make the above command work?

$(TEST_CUSTOM_PROGS): $(OUTPUT)/%: %.c
        $(CC) -o $(TEST_CUSTOM_PROGS) -static $< -Wl,--build-id

That worked both with:
make -C tools/testing/selftests
and
make -C tools/testing/selftests/bpf

for me.

what do you think?

>
>>
>> Cheers,
>> Anders
>>
>>>
>>>> To fix this issue remove the urandom_read target and so target
>>>> TEST_CUSTOM_PROGS gets used.
>>>>
>>>> Fixes: 81f77fd0deeb ("bpf: add selftest for stackmap with BPF_F_STACK_BUILD_ID")
>>>> Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
>>>> ---
>>>>  tools/testing/selftests/bpf/Makefile | 6 ++----
>>>>  1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
>>>> index 607ed8729c06..67285591ffd7 100644
>>>> --- a/tools/testing/selftests/bpf/Makefile
>>>> +++ b/tools/testing/selftests/bpf/Makefile
>>>> @@ -16,10 +16,8 @@ LDLIBS += -lcap -lelf -lrt -lpthread
>>>>  TEST_CUSTOM_PROGS = $(OUTPUT)/urandom_read
>>>>  all: $(TEST_CUSTOM_PROGS)
>>>>
>>>> -$(TEST_CUSTOM_PROGS): urandom_read
>>>> -
>>>> -urandom_read: urandom_read.c
>>>> -       $(CC) -o $(TEST_CUSTOM_PROGS) -static $< -Wl,--build-id
>>>> +$(TEST_CUSTOM_PROGS): $(OUTPUT)/%: %.c
>>>> +       $(CC) -o $@ -static $< -Wl,--build-id
>>>>
>>>>  # Order correspond to 'make run_tests' order
>>>>  TEST_GEN_PROGS = test_verifier test_tag test_maps test_lru_map test_lpm_map test_progs \
>>>> --
>>>> 2.17.1
>>>>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
