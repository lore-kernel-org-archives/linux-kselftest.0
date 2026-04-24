Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4ED3A6B73
	for <linux-kselftest@vger.kernel.org>; Fri, 24 Apr 2026 11:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777029303; cv=none; b=tnrisaj82ps4/hmmQ1uiCoeKgtXpT+t2Mw/xO1NQXd1DCAI6HMYNn/O4yKoDSuV93UVKVsZg5zpsMVlDZopdeEwWdWrwhL1Ou7VJ6oL8zQYU0R5xd1oOiIF+UkCrVu17bFDS8vKWUQATzJug39W0zFYYMwLAOFGkaRfRBGL1YTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777029303; c=relaxed/simple;
	bh=OFut7LZ25ijJm3DlyJ6ibNueK54bfaRrIDkTxZ+829s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jMb+NcO2mlSENAr99VEyVOVPS/SB9AmvmYFN2xSkrAKGcjt0rQUaYLp1iEHM9b0UZQ0jbPs3G7sXkBg5EuNXPDu5OuYX4/ALXs0qgX9Ij9CB20UTKAyFsFp8I1q7x6jsGRpGpS01akxMRh0RSBkTdGnN6ItVs1ydULXWoP//Vrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uujKu3cf; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uujKu3cf"
Date: Fri, 24 Apr 2026 19:14:39 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777029289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8nxhobJIEqRPMXJNaKk3lQ6NoKAj8IkBVR0FHTowZBw=;
	b=uujKu3cfZCrIAwlGqAVxSFfErknaSpXGBuDAe2HoHz7u9UEM1kaw9otuktgVxsOvP4LsIX
	DI6NDkjEvIcjxbFiv7WfScKJ0cklj79gzgNOzoaYIeqH93JAqkbzYZwjntCPMkfel30YRj
	SjZhjVufLMOW9iTxjG647Li6GA3+AB4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Li Wang <li.wang@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tj@kernel.org, longman@redhat.com, roman.gushchin@linux.dev,
	hannes@cmpxchg.org, yosry@kernel.org, jiayuan.chen@linux.dev,
	nphamcs@gmail.com, chengming.zhou@linux.dev, mkoutny@suse.com,
	shuah@kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-ID: <aetQn9H_0Hi-4jht@linux.dev>
References: <20260424040059.12940-1-li.wang@linux.dev>
 <20260424030605.6d0053c0df14bba325114e1b@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260424030605.6d0053c0df14bba325114e1b@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Fri, Apr 24, 2026 at 03:06:05AM -0700, Andrew Morton wrote:
> On Fri, 24 Apr 2026 12:00:51 +0800 Li Wang <li.wang@linux.dev> wrote:
> 
> > This patchset aims to fix various spurious failures and improve the overall
> > robustness of the cgroup zswap selftests.
> 
> Great, thanks, I'll queue this in mm.git's mm-new branch.  Next week
> I'll move it into mm-unstable, where it will receive liunx-next
> exposure.
> 
> > The primary motivation is to make the tests compatible with architectures
> > that use non-4K page sizes (such as 64K on ppc64le and arm64). Currently,
> > the tests rely heavily on hardcoded 4K page sizes and fixed memory limits.
> 
> Well that's an oops.
> 
> > On 64K page size systems, these hardcoded values lead to sub-page granularity
> > accesses, incorrect page count calculations, and insufficient memory pressure
> > to trigger zswap writeback, ultimately causing the tests to fail.
> 
> I assume you've been testing on arm64 or ppc?

Yes, before sending, I teseted the patchset on:

    x86_64(4k), aarch64(4K, 64K), ppc64le(64K)

-- 
Regards,
Li Wang
