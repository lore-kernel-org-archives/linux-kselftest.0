From: dvhart at infradead.org (Darren Hart)
Date: Tue, 13 Feb 2018 18:03:52 -0800
Subject: [PATCH] selftests/futex: Fix line continuation in Makefile
In-Reply-To: <6d498007-de71-2071-646c-05eeb81b2b08@osg.samsung.com>
References: <1518024271-12467-1-git-send-email-daniel.diaz@linaro.org>
 <dbf5a78f-4178-2210-9a6c-bf71de7b939d@osg.samsung.com>
 <20180214013347.GA5786@fury>
 <6d498007-de71-2071-646c-05eeb81b2b08@osg.samsung.com>
Message-ID: <20180214020352.GB5786@fury>

On Tue, Feb 13, 2018 at 06:45:54PM -0700, Shuah Khan wrote:
> On 02/13/2018 06:33 PM, Darren Hart wrote:
> > On Tue, Feb 13, 2018 at 02:26:46PM -0700, Shuah Khan wrote:
> >> On 02/07/2018 10:24 AM, Daniel Díaz wrote:
> >>> The Makefile lacks a couple of line continuation backslashes
> >>> in an `if' clause, which produces an error while make'ing:
> >>>
> >>>   $ make
> >>>   make[1]: Entering directory `/[...]/linux/tools/testing/selftests/futex'
> >>>   /bin/sh: -c: line 5: syntax error: unexpected end of file
> >>>   make[1]: *** [all] Error 1
> >>>   make[1]: Leaving directory `/[...]/linux/tools/testing/selftests/futex'
> >>>   make: *** [all] Error 2
> >>>
> > 
> > What is the failure scenario here? Is this shell specific? What does /bin/sh
> > point to for you?
> 
> My understanding is that this problem is seen with make versions prior to 4.x.
> This specific problem is seen with make version 3.81
> 
> I will let Daniel Díaz share details on his environment.

OK, thanks Shuah. I think this would be important to capture in the commit
message.

-- 
Darren Hart
VMware Open Source Technology Center
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
