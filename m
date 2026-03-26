Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1932B981;
	Thu, 26 Mar 2026 23:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566093; cv=none; b=WbsrlCVq7R4zfW73IRJTqiTTWJScfFDvHydWCBNoDLBOKwS5HvrSNAq4tlT7Io5hvaj1ygB1sz4038aqEmjb6gPT26U7T3UzISndIKKXqGMcUJ2Le58aMSa0/Brd2fGgFhe4QtunsESaEhWkr7uWJ3CnCTjGUfTSlnaGMBkRZnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566093; c=relaxed/simple;
	bh=cDTsrbhXw5vlpWEEc4LUAv5/LmEmN3f96wzlQ2E2W8I=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=nm9FwBtY7glHJ7YVgU4i+IoufKAURoundBh8oCnB+d7dkTOAXDDKraeZLwG8w2kerruEt4odDN7uRBQBePfLq1vVWAfutMxgflvrqWWw7DeYwZ5cHDdn8HzMC9wlSrIdS3KHg1fs8lcArNViYJHOH761WiMdf9DD+QtvYG8/Pjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UYb54Kxx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UYb54Kxx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38630C19424;
	Thu, 26 Mar 2026 23:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774566092;
	bh=cDTsrbhXw5vlpWEEc4LUAv5/LmEmN3f96wzlQ2E2W8I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=UYb54Kxx65LLq0qlCcbXJfPX2Ur0P4LcbnlozgE0qzkgcE1vgcXIHYzjmSdiFd72C
	 b537IQfQ/372i9zPL2tZI3RdE05VqCLNNhSFjzK1VEUE9GnVk9PabkvstDOyRee/8R
	 Tj1gSL8mE+nLLcG3D0whAWOsGKQxGSlBJWP9AU/0=
Date: Thu, 26 Mar 2026 16:01:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: yosry@kernel.org, nphamcs@gmail.com, hannes@cmpxchg.org,
 mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, tj@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, longman@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-Id: <20260326160131.9f3df79db328ba2095511161@linux-foundation.org>
In-Reply-To: <20260326032658.96819-1-liwang@redhat.com>
References: <20260326032658.96819-1-liwang@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 11:26:50 +0800 Li Wang <liwang@redhat.com> wrote:

> This patchset aims to fix various spurious failures and improve the overall
> robustness of the cgroup zswap selftests.
> 
> The primary motivation is to make the tests compatible with architectures
> that use non-4K page sizes (such as 64K on ppc64le and arm64). Currently,
> the tests rely heavily on hardcoded 4K page sizes and fixed memory limits.
> On 64K page size systems, these hardcoded values lead to sub-page granularity
> accesses, incorrect page count calculations, and insufficient memory pressure
> to trigger zswap writeback, ultimately causing the tests to fail.
> 
> Additionally, this series addresses OOM kills occurring in test_swapin_nozswap
> by dynamically scaling memory limits, and prevents spurious test failures
> when zswap is built into the kernel but globally disabled.

Thanks.  AI review flagged a few potential issues.

	https://sashiko.dev/#/patchset/20260326032658.96819-1-liwang%40redhat.com

Please take a look - I'm interested in learning how may of these you
feel are worth addressing.  

The sysconf retval one is real, pretty minor.

I'd be inclined to ignore the unchecked-malloc-return one.  It's
userspace, it's selftests.  If a malloc() fails then gee, fix your
machine and run it again.


Plese understand that I'm serious trying to slow things down now
(https://lkml.kernel.org/r/20260323202941.08ddf2b0411501cae801ab4c@linux-foundation.org).
Maybe we can weasel out of that for selftests but I'd rather not. 
That means post-7.1-r1 for this patchset, so please plan to resend at
that time.

If memcg maintainers decide that this material should target the
upcoming merge window then OK, 
