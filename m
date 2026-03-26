Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C708D82899;
	Thu, 26 Mar 2026 23:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566379; cv=none; b=TF+MXEzhfVelOyZDG4R4z/heluI3NZOf0dilGBnuRVYZfnIDfFa2ikb5pJ/6W9SvTVLPRqidoEkA4TvlbyZ6AZL026DgdeKe8BYnmBN9OZhTnnvUoy3L3U3yIkd5gR2XV6QuFyw0F3pI1/7ntn7pvgWzijxnmTfRuYUAiz18ppY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566379; c=relaxed/simple;
	bh=TiOzKubtC0x7gm/4SO+ovQWMDQuf7zUlSRKrpYigxp8=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aWK6iSUIH7VtWuHl/NLbHlPvlUCGWvc756jkHlZaa3/Omgt9uXT8x3i/bdEdRgujLntD/6mUVymYXmogU63iWWxeGFa+BXKB1gxVWfctr/5UVxX6S33TWO+JNwalBLIGQjYZm1FDUkxjcMn13KI71hD0LW5LvSt2lEiFp+gC4s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=xbJcYva3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="xbJcYva3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9027C116C6;
	Thu, 26 Mar 2026 23:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1774566379;
	bh=TiOzKubtC0x7gm/4SO+ovQWMDQuf7zUlSRKrpYigxp8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xbJcYva3zKWn/jvCOQ8ntfYtZxyKmF1BDjzvRzCuOLUQxJk1HJWv/qnN1gduM4kcE
	 5pThj/pGnC/4rUxXub9eEXfIvnlyN2QA2czGMqfDsDg5/Att3Msob4Fz1riEQ+wxBS
	 vbcPZVtGunBxBoZe06YsmD7oDKvRCVNsKYz55x+8=
Date: Thu, 26 Mar 2026 16:06:18 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Li Wang <liwang@redhat.com>
Cc: yosry@kernel.org, nphamcs@gmail.com, hannes@cmpxchg.org,
 mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, tj@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, longman@redhat.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v5 0/8] selftests/cgroup: improve zswap tests robustness
 and support large page sizes
Message-Id: <20260326160618.18a20227b606bc95f3c3cfa6@linux-foundation.org>
In-Reply-To: <acTSQFxTs4-t7P5t@redhat.com>
References: <20260326032658.96819-1-liwang@redhat.com>
	<acTSQFxTs4-t7P5t@redhat.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Mar 2026 14:29:20 +0800 Li Wang <liwang@redhat.com> wrote:

> > Test all passed on:
> >   x86_64(4k), aarch64(4K, 64K), ppc64le(64K).
> 
> Hi Andrew, All,
> 
> I see that Sashiko still points out minor issues in this patchset,
> That seems very tiny in selftest programming.
> 
> I can correct all that in a new version if you'd like a perfect patchset.
> 
> Sashiko comments:
>   https://sashiko.dev/#/patchset/20260326032658.96819-1-liwang%40redhat.com

Ah, OK, you already looked.

If you say they're too minor then I'm OK with that.  If there are any
you feel you'd like to address then go for it.  That's my opinion,
others might differ!

I suggest you leave things as-is for a while (a week?), give the memcg
maintainers time to take a look (please).

Thanks.
