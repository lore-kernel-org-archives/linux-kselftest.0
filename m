From: daniel.diaz@linaro.org (=?UTF-8?Q?Daniel_D=C3=ADaz_Rodr=C3=ADguez?=)
Date: Wed, 14 Feb 2018 08:49:18 -0600
Subject: [PATCH] selftests/futex: Fix line continuation in Makefile
In-Reply-To: <20180214020352.GB5786@fury>
References: <1518024271-12467-1-git-send-email-daniel.diaz@linaro.org>
 <dbf5a78f-4178-2210-9a6c-bf71de7b939d@osg.samsung.com>
 <20180214013347.GA5786@fury>
 <6d498007-de71-2071-646c-05eeb81b2b08@osg.samsung.com>
 <20180214020352.GB5786@fury>
Message-ID:
 <CAEUSe781sJsz=4rMBa+np7x=snO7r-ByV_AiaTtmcfUZk06j=g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180214144918.nI9mtzJPjBJ2NCPUyzNwygn_mLrDwrpFsmw1HVUHGRA@z>

Hello!


On 13 February 2018@20:03, Darren Hart <dvhart@infradead.org> wrote:
> On Tue, Feb 13, 2018@06:45:54PM -0700, Shuah Khan wrote:
[...]
>> My understanding is that this problem is seen with make versions prior to 4.x.
>> This specific problem is seen with make version 3.81
>> I will let Daniel Díaz share details on his environment.
>
> OK, thanks Shuah. I think this would be important to capture in the commit
> message.

That's correct -- fails with GNU Make 3.80, 3.81; works with GNU Make
3.82 and the 4.x series. Shuah, if you'd like me to resubmit let me
know.

Thanks and greetings!

Daniel Díaz
daniel.diaz at linaro.org
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
