Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63E1329C40;
	Wed, 28 Jan 2026 08:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769589413; cv=none; b=F8lrrRyOE8YzQiZNz/bIKqnvGWRAGSMR4jwrDCZjMTfyHynJSpPXu1hy4lAha8j36uqP2maZcfZnjKC/gNi7NfkppwZDSK5/6LqLRySJ25smdUKTn/VnCe2auOb+tUd/jitlFMshGgX3ffTQWsQKU/6HIC7yto1t6kRTbnIqlMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769589413; c=relaxed/simple;
	bh=F2kG8QJPO0QcMSLEYeJjV5P4w1LSAyn/vTXGmc/QjRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Dq00mSiMCsNVw1+S3LN0l7ASLJ1QqC5ZMKsJrLNxk3YfiGGwrVNZw3beVUvXD7067j63OzAuSXllQypvKaCaSWu0dGZ65+VREAWZbj23ksaimo4XNGGFxVnQxpw0mKiQFHsFPfYwtHuTZRuxhX9rv5SttTgFNUgPjaKThMyU3fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4uiGQ9F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4uiGQ9F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED02C19421;
	Wed, 28 Jan 2026 08:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769589413;
	bh=F2kG8QJPO0QcMSLEYeJjV5P4w1LSAyn/vTXGmc/QjRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k4uiGQ9F8Abo3iDZwCIiuEpG1tnPktQNJhMdpH52uQKbsDXnwnLdTUDSveRBbe/CX
	 DHNi/WgGZWAFGIDid3OHSFDwHwXCVdkrk3Upk87omqLRc3/n5tL3yVqzlzh2Ast+fJ
	 Nin709OPtueN/JVeFgIHXG6umN8/oTnm+ZOCGLIHy9tYwKM6bnGOAPOBggPr5msEvx
	 OAjeeIqA8kY71HhphxHt4+AjN4uYod6LCzzxh2gwYFYNXAhE94iIAEEqej9MxBzoAw
	 O6VNQtsXzbQuKJ+EBQfyfcVASYGF/TMlKsA+p1PMImNB+qqFRXFbLf5vDAapFGDOwJ
	 Ur9pfsmI4qpyA==
From: Thomas Gleixner <tglx@kernel.org>
To: Yuwen Chen <ywen.chen@foxmail.com>
Cc: akpm@linux-foundation.org, andrealmeid@igalia.com,
 bigeasy@linutronix.de, colin.i.king@gmail.com, dave@stgolabs.net,
 dvhart@infradead.org, edliaw@google.com, justinstitt@google.com,
 kernel-team@android.com, licayy@foxmail.com, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, luto@mit.edu, mingo@redhat.com,
 morbo@google.com, nathan@kernel.org, ndesaulniers@google.com,
 peterz@infradead.org, shuah@kernel.org, usama.anjum@collabora.com,
 wakel@google.com, ywen.chen@foxmail.com
Subject: Re: [PATCH v2] selftests/futex: fix the failed futex_requeue test
 issue
In-Reply-To: <tencent_347CD8D5F7FC23EFE58BBACBA98894DB6E05@qq.com>
References: <878qdic3i0.ffs@tglx>
 <tencent_347CD8D5F7FC23EFE58BBACBA98894DB6E05@qq.com>
Date: Wed, 28 Jan 2026 09:36:49 +0100
Message-ID: <87fr7q9lr2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 28 2026 at 11:29, Yuwen Chen wrote:
> On Tue, 27 Jan 2026 19:30:31 +0100, Thomas Gleixner wrote:
>> Extremely high?
>> 
>> The main thread waits for 10000us aka. 10 seconds to allow the waiter
>> thread to reach futex_wait().
>> 
>> If anything is extreme then it's the 10 seconds wait, not the
>> requirements. Please write factual changelogs and not fairy tales.
>
> 10,000 us is equal to 10 ms. On a specific ARM64 platform, it's quite
> common for this test case to fail when there is a 10-millisecond waiting
> time.

Sorry. Somehow my tired brain converted micro seconds to milliseconds.

But looking at it with brain awake again. Your change does not address
the underlying problem at all. It just papers over it to the extent that
it can't be observed anymore. Assume the following situation:

   CPU0                       		CPU1
   pthread_create()
   ...                                  run new thread
                                        --> preemption
   for (i = 0; i < 100; i++) {
       if (waiting_on_futex)
          break;
       usleep(100);
   }

   -> fail
       
As this still sleeps only 10ms in total this just works by chance for
you, but there is no guarantee that it actually works under a wide range
of scenarios. So this needs to increase the total wait time to let's say
1 second, which is fine as the wait check will terminate the loop once
the other thread reached the wait condition.

>> That's a known issue for all futex selftests when the test system is
>> under extreme load. That's why there is a gratious 10 seconds timeout,
>> which is annoyingly long already.
>> 
>> Also why is this special for the requeue_single test case?
>> 
>> It's exactly the same issue for all futex selftests including the multi
>> waiter one in the very same file, no?
>
> Yes, this is a common phenomenon. However, for the sake of convenient
> illustration, only the case of requeue_single is listed here.

Sure, but why are you then implementing it per case instead of making it
a general usable facility and fix up _all_ problematic cases which rely
on the sleep in one go?

>> Why do you need an atomic store here?
>> 
>> pthread_barrier_wait() is a full memory barrier already, no?
>
> Yes, there's no need to use atomic here. However, in the kernel, WRITE_ONCE
> and READ_ONCE are more likely to be used. Since it's particularly difficult
> to use them here, atomic is adopted.

You don't need READ/WRITE_ONCE() at all as there is no concurrency. The
waiter thread writes before invoking pthread_barrier_wait() so the
control thread _cannot_ read concurrently. Ergo there is no need for any
of this voodoo.

>> What's wrong with reading /proc/$PID/wchan ?
>> 
>> It's equally unreliable as /proc/$PID/stat because both can return the
>> desired state _before_ the thread reaches the inner workings of the test
>> related sys_futex(... WAIT).
>
> Is it possible for the waiterfn to enter the sleep state between the
> pthread_barrier_wait function and the futex_wait function?

No, but it can reach sleep state _before_ even reaching the thread
function. pthread_barrier_wait() itself can result in a futex_wait() too
if the control thread did not reach pthread_barrier_wait() before, but
that's harmless because then the control thread will wake the waiter
thread _before_ checking the state of the waiter.

> If so, would checking the call stack be a solution?

To make it even more complex and convoluted?

Thanks,

        tglx
