From: shuah@kernel.org (shuah)
Date: Thu, 25 Apr 2019 11:06:05 -0600
Subject: [PATCH v2 7/8] selftests: Remove KSFT_TAP_LEVEL
In-Reply-To: <CAGXu5j+F1iSu5GDG_FCykABXkH_gXcF=zjwwyev1vTDCXRLoVg@mail.gmail.com>
References: <20190424231237.14776-1-keescook@chromium.org>
 <20190424231237.14776-8-keescook@chromium.org>
 <1ca5ee52-ab07-9142-2e45-44df1e94276e@kernel.org>
 <CAGXu5j+F1iSu5GDG_FCykABXkH_gXcF=zjwwyev1vTDCXRLoVg@mail.gmail.com>
Message-ID: <1134c85b-ec66-33e6-f0a9-6c9f575bdad0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190425170605.hNesHdWV71h6gjJ002ub1EQj8QrmKmCfWWnP6UQ7eMY@z>

On 4/25/19 10:56 AM, Kees Cook wrote:
> On Thu, Apr 25, 2019@9:36 AM shuah <shuah@kernel.org> wrote:
>>
>> On 4/24/19 5:12 PM, Kees Cook wrote:
>>> Since sub-testing can now be detected by indentation level, this removes
>>> KSFT_TAP_LEVEL so that subtests report their TAP header for later parsing.
>>
>> Does this take into ksft_print_header() getenv logic to avoid printing
>> TAP headers from tests when they fork? e.g timers tests do that a lot.
> 
> I didn't change the ksft_print_header() code, in case you want it back
> in the future. But nothing sets that variable any more in my series:
> 

Right. I want to see the impact of not setting this. I added this for
two reasons, one is to prevent nesting which goes away with your
refactor. I know there is another reason which I can't recall.


> $ git grep KSFT_TAP_LEVEL
> tools/testing/selftests/kselftest.h:    if (!(getenv("KSFT_TAP_LEVEL")))
> 
> I don't see the timers tests using print_header() at all, actually...
> 
> $ cd tools/testing/kselftest/timers
> $ git grep print_header | wc -l
> 0
> 

I don't see it in there either. I must be thinking about another test.

btw I like the changes. I just want to make sure it gets some road
testing first. :)

thanks,
-- Shuah
