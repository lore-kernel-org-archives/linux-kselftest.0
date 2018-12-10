From: shuah at kernel.org (shuah)
Date: Mon, 10 Dec 2018 10:57:35 -0700
Subject: [PATCH] selftests: do not macro-expand failed assertion
 expressions
In-Reply-To: <CAGXu5jKLHbfgZLGqxwG8LRs=0hy+iJGYQd61Ad5LghrkDWV=4w@mail.gmail.com>
References: <20181209230047.GA1738@altlinux.org>
 <CAGXu5jKLHbfgZLGqxwG8LRs=0hy+iJGYQd61Ad5LghrkDWV=4w@mail.gmail.com>
Message-ID: <4907f73f-2a07-d6d2-fcb8-280f3066851a@kernel.org>

On 12/10/18 10:30 AM, Kees Cook wrote:
> On Sun, Dec 9, 2018 at 3:00 PM Dmitry V. Levin <ldv at altlinux.org> wrote:
>>
>> I've stumbled over the current macro-expand behaviour of the test
>> harness:
>>
>> $ gcc -Wall -xc - <<'__EOF__'
>> TEST(macro) {
>>          int status = 0;
>>          ASSERT_TRUE(WIFSIGNALED(status));
>> }
>> TEST_HARNESS_MAIN
>> __EOF__
>> $ ./a.out
>> [==========] Running 1 tests from 1 test cases.
>> [ RUN      ] global.macro
>> <stdin>:4:global.macro:Expected 0 (0) != (((signed char) (((status) & 0x7f) + 1) >> 1) > 0) (0)
>> global.macro: Test terminated by assertion
>> [     FAIL ] global.macro
>> [==========] 0 / 1 tests passed.
>> [  FAILED  ]
>>
>> With this change the output of the same test looks much more
>> comprehensible:
>>
>> [==========] Running 1 tests from 1 test cases.
>> [ RUN      ] global.macro
>> <stdin>:4:global.macro:Expected 0 (0) != WIFSIGNALED(status) (0)
>> global.macro: Test terminated by assertion
>> [     FAIL ] global.macro
>> [==========] 0 / 1 tests passed.
>> [  FAILED  ]
>>
>> The issue is very similar to the bug fixed in glibc assert(3)
>> three years ago:
>> https://sourceware.org/bugzilla/show_bug.cgi?id=18604
>>
>> Cc: Shuah Khan <shuah at kernel.org>
>> Cc: Kees Cook <keescook at chromium.org>
>> Cc: Andy Lutomirski <luto at amacapital.net>
>> Cc: Will Drewry <wad at chromium.org>
>> Cc: linux-kselftest at vger.kernel.org
>> Signed-off-by: Dmitry V. Levin <ldv at altlinux.org>
> 
> Yeah, good idea.
> 
> Acked-by: Kees Cook <keescook at chromium.org>
> 

Thanks. Applied to linux-kselftest next.

-- Shuah
