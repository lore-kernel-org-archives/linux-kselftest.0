From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 10 Apr 2018 12:57:03 -0600
Subject: [PATCH] selftests/filesystems: Don't run dnotify_test by default
In-Reply-To: <20180410094553.GB3438@gmail.com>
References: <20180410062053.8816-1-mpe@ellerman.id.au>
 <20180410094553.GB3438@gmail.com>
Message-ID: <3fb54ca8-bd31-4937-75f9-415a72eafaf2@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180410185703.GLfzGuHcSpyAYolclSKhbhZPHIZGO8awACzuo40oAbk@z>

On 04/10/2018 03:45 AM, Christian Brauner wrote:
> On Tue, Apr 10, 2018@04:20:53PM +1000, Michael Ellerman wrote:
>> In commit ce290a19609d ("selftests: add devpts selftests"), the
>> filesystems directory was added to the top-level selftests Makefile.
>>
>> That had the effect of causing the existing dnotify_test in the
>> filesystems directory to now be run as part of the default selftests
>> test-run. Unfortunately dnotify_test is actually an infinite loop.
>>
>> Fix it by moving dnotify_test to TEST_GEN_PROGS_EXTENDED, which says
>> that it's a generated file (ie. built) but should not be run as part
>> of the default test suite run (it's an "extendend" test).

Typo - I can fix it when I apply it.

>>
>> While we're here cleanup a few other things, devpts_pts should be in
>> TEST_GEN_PROGS to indicate that it's built, and with the above two
>> changes we no longer need a custom all or clean rule.
>>
>> Fixes: ce290a19609d ("selftests: add devpts selftests")
>> Signed-off-by: Michael Ellerman <mpe at ellerman.id.au>
> 
> I'm not sure if I should've made it to be built given that it wasn't
> before but it probably doesn't hurt. It's either that or remove it I
> guess.

This way the test gets built and gets included in the installed tests.
This way somebody can run it by itself.
> 
> Acked-by: Christian brauner <christian.brauner at ubuntu.com>

Thanks Michael. I will get this into 4.17-rc2 or rc3.

-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
