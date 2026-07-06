Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F32D0C63;
	Mon,  6 Jul 2026 05:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316072; cv=none; b=Nu6MDN8GOkKG1b2Lh0kXSQugIAe7oUfqs5s4rui8Q/uYh1ILzx3jgp6n1ZXRbhUU4YNqlnk+45Cnze4o/T0WnSrRKlaF8ONUNqbGCa6fpYYwBKa5l6Cl+jDFk4Tlprx1M0rJqt37BopDctmobULDsj9hjfgn5z1xTQRNgWHy+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316072; c=relaxed/simple;
	bh=L52tOMES2i4bkc8oAdte4+hRkhIR32T7VERErOPCbSU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llWgsxqFIxMOXRXq8vbqC8YxBBlFZpCKGPIy0gGyCkMY48BijEO1BlgxRWRI+CA65Qg+7lVKrLFkIuMrJ/cu1M8ZGyJpmKsJnrp9vSI+MENhNnWiZ1gj8e0wyF7Hi8W7bIjI+w7n/XFB2Of9OxbrKTjOfWO/Gs3DQGLjmZC1Dw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=K5GjbhQl; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="K5GjbhQl"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783316061; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=qdnZs6wmufu/GNstj6svg/wE3sRhle03YaqLdM//82I=;
	b=K5GjbhQl5d9oibDdJg81u8XIwhsS/XzMPxEow05gcIqoR+x+bEh96n0qBJuKJDeefbm14H2ZffIoBYe+dI10z0inTAgLhPimpUgDIqedtPsiSSqZJMhoYZBAZoxYysYAt4sstbhNrYYC0jLAgbpD4lmWLjVn2ELkE5dibCCJSJU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0X6PaoiX_1783316059;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X6PaoiX_1783316059 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 06 Jul 2026 13:34:20 +0800
Date: Mon, 6 Jul 2026 13:34:19 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, andrealmeid@igalia.com,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/futex_requeue: Increase futex timeout to cover
 slow hardware
Message-ID: <aks-W2gGw5Cprq2p@U-2FWC9VHC-2323.local>
References: <20260703032113.535-1-feng.tang@linux.alibaba.com>
 <87tsqdjj8d.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tsqdjj8d.ffs@fw13>

On Sun, Jul 05, 2026 at 10:04:50PM +0200, Thomas Gleixner wrote:
> On Fri, Jul 03 2026 at 11:21, Feng Tang wrote:
> > When running  mixed stress tests (stess-ng, kernel selftests etc.)
> > on a slow machine, futex 'requeue_multiple' case failed randomly,
> > with message:
> > "
> >     waiter failed errno 110
> >     not ok 2 futex_requeue many returned: 0 Success
> >     not ok 3 futex_requeue many returned: 0 Success
> >     # Planned tests != run tests (2 != 3)
> >     # Totals: pass:1 fail:2 xfail:0 xpass:0 skip:0 error:0
> > "
> >
> > The process of 'requeue_multiple' case will:
> > * create 10 pthreads with futex (timeout 30 ms)
> > * wait 10 ms
> > * start 'futex_cmp_requeue' case
> >
> > So there is an assumption that the 10 threads can be created in 20 ms,
> > which is safe enough for normal platforms, while for slow platforms
> > with stress workload, the creation could take more than 20 ms, and
> > some futex will timeout and cause the case to fail.
> >
> > Increasing the timeout to 100 ms to cover slow platforms, which doesn't
> > hurt normal platforms much.
> 
> That's just lame and it hurts because it makes testing slower. If you'd
> had taken the time to search LKML for discusssions about this issue then
> you'd have noticed that there is work in progress to solve that
> properly.
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=locking/futex&id=157a9b22ff769e1a657aec6210df3ea896600eec

Thanks for the link!

Good to see it merged. Just tried the latest tip tree, and 'futex_requeue'
did pass on our slow platform. (the timeout is now 2 seconds, which should
cover it well).

I know 157a9b22ff76 ("selftests/futex: Use thread synchronization helpers instead of usleep() ")
was merged, but FWIW: 

	Tested-by: Feng Tang <feng.tang@linux.alibaba.com>

Thanks,
Feng
