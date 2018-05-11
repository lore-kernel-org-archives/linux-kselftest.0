From: shuah at kernel.org (Shuah Khan)
Date: Fri, 11 May 2018 08:55:28 -0600
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <20180511143228.GU2368884@devbig577.frc2.facebook.com>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
 <20180511143228.GU2368884@devbig577.frc2.facebook.com>
Message-ID: <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>

On 05/11/2018 08:32 AM, Tejun Heo wrote:
> Hello, Shuah.
> 
> On Thu, May 10, 2018 at 01:29:07PM -0600, Shuah Khan wrote:
>> Don't pull them yet. If Roman can redo the patches on linux-kselftest next,
>> he can pick up the SKIP changes.
> 
> So, what we can do is either fix that up during / after the merge
> window or creating a separate branch which pulls from both cgroup and
> kselftest.  Please let me know which way you wanna go and if the
> latter which branch I should pull (it gotta be a stable branch).
> 
> Thanks.
> 

I think we don't need to create a special branch and all. The following
should work:

linux-next already has the skip work. What we can do is:

Do the cleanup and test it against linux-next. In linux-next SKIP isn't PASS. If test is
compiled on linux-next, you will see that SKIP is SKIP. If it is compiled on the mainline,
it will be reported PASS, which will be a temporary state.

cgroup test will end up in linux-next anyway with crgoups tree before the merge window.
We can verify it then and make sure it is working correctly.

So I would recommend a version 3 that includes the cleanup to get rid if the TEST_* local
defines.

thanks,
-- Shuah


--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
