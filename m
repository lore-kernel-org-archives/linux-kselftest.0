Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F612DCF55;
	Wed,  8 Apr 2026 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775682172; cv=none; b=ewZidDwRBB8omH+Ktvhqqnj1dMLSeKsFDeE+FgVlwUjA3dTuYUT84J8LY0LxLMMrwyjkhsl9R6U4F1Di6PckCVy3F1lAqLFHuNj3akUbV4+r4yTyjj3F1v4p7Ef2wk+J9o3yDakzzB0OFmC1M+/6UYnxOltMEvmYLnVlwBBb8Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775682172; c=relaxed/simple;
	bh=psYo50zJHSL5yH9z50ceo7cT2eNtm2mYQFhEmsP0pgA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=O/b+YDN5pYLb5yfsLpx275dLAFOpKXBEhvCSfWaKwDCCBuc9POMJrIEbQhv1LtbBSM3S0PsoWrwZrNPTlHVHUyyLlLHlRGJVvlEhBAFGHhbWLUiFRMYKcn2QVmGe+WjsocW+N6nbLxuDwciiuGigXUO0A/JXbATbSeZ6UDX9Oq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q4siIfZi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q4siIfZi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9852C19421;
	Wed,  8 Apr 2026 21:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1775682172;
	bh=psYo50zJHSL5yH9z50ceo7cT2eNtm2mYQFhEmsP0pgA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Q4siIfZi15u7OMB0K85RsJ4IaTyccT4bNEwUt1oswHTJurxvR+tZApmiPxM/qlj1W
	 /gVjwNZfgZHoWlQ20sUq+t4Qu4y6/EyL9yMtFy6gvrNLabvAuK6yGBzHXfmup4XCHN
	 t6jT7CNk1R3j06zwZ+LpFKhIhy9OCd5uf2a28pLA=
Date: Wed, 8 Apr 2026 14:02:51 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: anthony.yznaga@oracle.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, david@kernel.org, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, jannh@google.com, pfalcato@suse.de,
 Jason@zx2c4.com, shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests/mm: verify droppable mappings cannot
 be locked
Message-Id: <20260408140251.6158aa7a56f71128471f327e@linux-foundation.org>
In-Reply-To: <83b56ffb-6e2e-4c9b-b0cf-9f04b61ebe7f@oracle.com>
References: <20260402235933.10588-1-anthony.yznaga@oracle.com>
	<20260402235933.10588-3-anthony.yznaga@oracle.com>
	<20260403123120.82cb5becb19e1b572d474394@linux-foundation.org>
	<83b56ffb-6e2e-4c9b-b0cf-9f04b61ebe7f@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 8 Apr 2026 13:35:42 -0700 anthony.yznaga@oracle.com wrote:

> 
> On 4/3/26 12:31 PM, Andrew Morton wrote:
> > On Thu,  2 Apr 2026 16:59:33 -0700 Anthony Yznaga <anthony.yznaga@oracle.com> wrote:
> >
> >> For configs that support MAP_DROPPABLE verify that a mapping created
> >> with MAP_DROPPABLE cannot be locked via mlock(), and that it will not
> >> be locked if it's created after mlockall(MCL_FUTURE).
> > There are a few queries from the AI reviewbot;
> > 	https://sashiko.dev/#/patchset/20260402235933.10588-1-anthony.yznaga@oracle.com
> 
> Interesting. Of the two issues, one is certainly legit. I need to add an 
> munlockall() on early return from test_mlockall_future_droppable().

Cool.

> For the other, the question posed was whether the tests should handle 
> possibly being run on an older kernel that doesn't implement 
> MAP_DROPPABLE. It seems to me to that a selftest should not be expected 
> to work (or even necessarily compile) on kernels older than when the 
> selftest was introduced, but I don't want to assume.

I don't know that there's any policy on that.  My attitude is that
selftests are not intended to be forward- or backward-compatible. 
That's why we ship them with the kernel source!

If we get a selftests fixup then I do like to backport that into
earlier kernels if appropriate, to keep those in good shape.  And that
has the effect of reducing people's motivation to run a later kernel's
selftests on their current kernel.

