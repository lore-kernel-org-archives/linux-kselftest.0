From: tj@kernel.org (Tejun Heo)
Date: Fri, 11 May 2018 09:29:20 -0700
Subject: [PATCH v2] selftests/cgroup: memory controller self-tests
In-Reply-To: <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>
References: <20180510163701.28936-1-guro@fb.com>
 <20180510183224.GP2368884@devbig577.frc2.facebook.com>
 <a652ce44-07f9-d229-70d4-4376bfbafa40@kernel.org>
 <20180511143228.GU2368884@devbig577.frc2.facebook.com>
 <ae4dc3f9-baa6-b492-7c43-0359734440b3@kernel.org>
Message-ID: <20180511162920.GV2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180511162920.H1IjjpdHnVpbrJ1dhe52Q4K9ID0AnRt6YVF3E-EiDMU@z>

Hello, Shuah.

On Fri, May 11, 2018@08:55:28AM -0600, Shuah Khan wrote:
> I think we don't need to create a special branch and all. The following
> should work:
> 
> linux-next already has the skip work. What we can do is:
> 
> Do the cleanup and test it against linux-next. In linux-next SKIP isn't PASS. If test is
> compiled on linux-next, you will see that SKIP is SKIP. If it is compiled on the mainline,
> it will be reported PASS, which will be a temporary state.

Hah, why not just create a branch and make sure what we see in the
topic branch is what we'll push?  That's how these things are done
usually.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
