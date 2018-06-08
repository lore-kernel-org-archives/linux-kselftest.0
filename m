From: ys114321@gmail.com (Y Song)
Date: Thu, 7 Jun 2018 22:08:35 -0700
Subject: [PATCH] selftests: bpf: fix urandom_read build issue
In-Reply-To: <CADYN=9Ly5UU34CxZFnWfQhNrS8V3gG7=Bdfn9n0h5XphZ8EiVQ@mail.gmail.com>
References: <20180607105712.553-1-anders.roxell@linaro.org>
 <CAH3MdRWo0kUYngyAwXP1sOT_XqbxyfTvDd6sNz+qd7LL1T8LUA@mail.gmail.com>
 <CADYN=9J3wY1f6q4NvH1mHJXnu6GnErOqz75CfzfG1q5-WzcyCg@mail.gmail.com>
 <CAH3MdRXMHRtK9FJ4UP8Gy-bahCS2oipOY7yLTEqu-x6uOMKLvw@mail.gmail.com>
 <CADYN=9Ly5UU34CxZFnWfQhNrS8V3gG7=Bdfn9n0h5XphZ8EiVQ@mail.gmail.com>
Message-ID:
 <CAH3MdRWaVKrYbR14wjn6YjurcHvOFe-=t6g0Me=9=g+GRXqeeg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180608050835.PszgSVlV0zPB8GFUPCY0i6Ukm5O-RuB9Ei24GEIl494@z>

On Thu, Jun 7, 2018@2:43 PM, Anders Roxell <anders.roxell@linaro.org> wrote:
> On 7 June 2018@23:17, Y Song <ys114321@gmail.com> wrote:
>> On Thu, Jun 7, 2018@12:07 PM, Anders Roxell <anders.roxell@linaro.org> wrote:
>>> On 7 June 2018@19:52, Y Song <ys114321@gmail.com> wrote:
>>>> On Thu, Jun 7, 2018@3:57 AM, Anders Roxell <anders.roxell@linaro.org> wrote:
>>>>> gcc complains that urandom_read gets built twice.
>>>>>
>>>>> gcc -o tools/testing/selftests/bpf/urandom_read
>>>>> -static urandom_read.c -Wl,--build-id
>>>>> gcc -Wall -O2 -I../../../include/uapi -I../../../lib -I../../../lib/bpf
>>>>> -I../../../../include/generated  -I../../../include    urandom_read.c
>>>>> urandom_read -lcap -lelf -lrt -lpthread -o
>>>>> tools/testing/selftests/bpf/urandom_read
>>>>> gcc: fatal error: input file
>>>>> ‘tools/testing/selftests/bpf/urandom_read’ is the
>>>>> same as output file
>>>>> compilation terminated.
>>>>> ../lib.mk:110: recipe for target
>>>>> 'tools/testing/selftests/bpf/urandom_read' failed
>>>>
>>>> What is the build/make command to reproduce the above failure?
>>>
>>> make -C tools/testing/selftests
>>
>> Thanks. The patch will break
>>    make -C tools/testing/selftests/bpf
>>
>> [yhs at localhost bpf-next]$ make -C tools/testing/selftests/bpf
>> make: Entering directory '/home/yhs/work/bpf-next/tools/testing/selftests/bpf'
>> gcc -o /urandom_read -static urandom_read.c -Wl,--build-id
>> /usr/bin/ld: cannot open output file /urandom_read: Permission denied
>> collect2: error: ld returned 1 exit status
>> make: *** [Makefile:20: /urandom_read] Error 1
>> make: Leaving directory '/home/yhs/work/bpf-next/tools/testing/selftests/bpf'
>> [yhs at localhost bpf-next]$
>
> urgh, I'm sorry, missed that.
>
>>
>> Could you still make the above command work?
>
> $(TEST_CUSTOM_PROGS): $(OUTPUT)/%: %.c
>         $(CC) -o $(TEST_CUSTOM_PROGS) -static $< -Wl,--build-id
>
> That worked both with:
> make -C tools/testing/selftests
> and
> make -C tools/testing/selftests/bpf
>
> for me.
>
> what do you think?

This indeed works. You can submit a revised patch and add my Ack.
Acked-by: Yonghong Song <yhs at fb.com>
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
