From: frowand.list@gmail.com (Frank Rowand)
Date: Thu, 2 May 2019 14:18:53 -0700
Subject: [PATCH v2 04/17] kunit: test: add kunit_stream a std::stream like
 logger
In-Reply-To: <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-5-brendanhiggins@google.com>
 <20190502110008.GC12416@kroah.com>
 <CAFd5g47ssM7RQZxQsUJ86UigcF-Uz+Kwv2yvKN_gZK-TtW89bA@mail.gmail.com>
Message-ID: <6fcf1218-a026-fd7b-236f-ea95f6312e1d@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190502211853.1PW7s8TyFACWBAx-un3clF8UEuYUEzqpuSYNe23rzfY@z>

On 5/2/19 1:25 PM, Brendan Higgins wrote:
> On Thu, May 2, 2019@4:00 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>>
>> On Wed, May 01, 2019@04:01:13PM -0700, Brendan Higgins wrote:
>>> A lot of the expectation and assertion infrastructure prints out fairly
>>> complicated test failure messages, so add a C++ style log library for
>>> for logging test results.
>>
>> Ideally we would always use a standard logging format, like the
>> kselftest tests all are aiming to do.  That way the output can be easily
>> parsed by tools to see if the tests succeed/fail easily.
>>
>> Any chance of having this logging framework enforcing that format as
>> well?
> 
> I agree with your comment on the later patch that we should handle
> this at the wrapper script layer (KUnit tool).

This discussion is a little confusing, because it is spread across two
patches.

I do not agree that this should be handled in the wrapper script, as
noted in my reply to patch 12, so not repeating it here.

-Frank
