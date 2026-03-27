Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BF13E3DAB;
	Fri, 27 Mar 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774609111; cv=none; b=p1yxfpVZRZp0NPZQAqXKbkJBYY/EF5+I+D4YhVVdzJLQKBkSAtM07SH0/t9hvqyk6ZGqdBu+NFcGHs/SN0rSzyDw88u/a4zVy16dEa/Zy4G6RjvarJlVlPoJlqGRcv5qYYUD2dbH+WF3VW70dK9u0ww+lKJZqmZ3RZcvjbIxhUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774609111; c=relaxed/simple;
	bh=s8xXfl1mX3u33WiFFWFbrh4M9MzMd9HN8QFhbwAkBKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OehdAocM5Wj7U+h+ySIFS12JBbA2TKVMq38BvYpmW04r0foIidOoPkrNM1tAE/p5aUxCbOpx/PNpCb1/JHHg8lggYrHSISj3DRgIdAfGcW0Zfxf/Zt0UTl59r21FNu8qBM3zN1L0CQ0SUe3NFu8dfUp9Jn5D1LZwdpDHvUT0KO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=piymFor6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="piymFor6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C027AC19423;
	Fri, 27 Mar 2026 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774609110;
	bh=s8xXfl1mX3u33WiFFWFbrh4M9MzMd9HN8QFhbwAkBKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=piymFor6hHlsvu9d0DWBf3VCgej6vCBt81opao/rdhdloTXa9bDwIuOUodkNDt+dc
	 i32ykfa+tFgp9CY+M/HWEF6ylntguVHVLSzUoT1r2ca4SYmrOege5IQaWIdfrJW2d7
	 upJXV8yLy0oX71v5FJrqmOMCB6+yx4YSbNk7jKGT8O6Xs7QTMjC6seOMWAozj7rIWR
	 OTAv/kLr5E2p1d6+HEEr6d5oxF70VAW9GjiPSVaP6rjoWo/sToPv+HIuL4Wo3CNBO2
	 5zJOzaqXk3+gvUcy3oPuUsg2PQ2OUukv2zLXyjL2Y0BDnWl9ffKFH7K5iZSRsHnthQ
	 9hNhdyhUNzzfA==
Date: Fri, 27 Mar 2026 10:58:25 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: akpm@linux-foundation.org
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Audra Mitchell <audra@redhat.com>, linux-kselftest@vger.kernel.org, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: Fix soft-dirty kselftest supported check
Message-ID: <237317fd-d2e6-4e9c-840d-fc60b7d8883f@lucifer.local>
References: <20260218184210.206466-1-audra@redhat.com>
 <c1b6f8eb-602b-4306-ad60-7a181fd94a45@kernel.org>
 <abludfGu4upPcyRI@fedora>
 <f635585f-7488-4bfe-8566-1c19f493c6a3@kernel.org>
 <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <815b2fc9-cee7-4bfa-8036-4b93d1b47b4e@lucifer.local>

On Fri, Mar 27, 2026 at 10:52:24AM +0000, Lorenzo Stoakes (Oracle) wrote:
> Audra - to be clear this is discussion about mm process not your patch
> specifically.
>
> OK again I'm starting to think we just shouldn't support fix-patches at all any
> more.
>
> This is an example  of a change being done in a fix-patch that's _really_
> causing issues.
>
> Because this has now caused mayhem in mm-unstable and the 'kinda stable-ish'
> branch now won't compile any self tests.
>
> The fix in [0] on Chris Down's test series was for too many args to this
> function (the patch changing this should have been rebased on mm-unstable and
> changed Chris's caller there).
>
> But now since this patch above ^ got yanked, that 'fix' has stayed in place and
> now no mm self tests compile.
>
> And now we see [1], hilariously.
>
> [0]:https://lore.kernel.org/linux-mm/20260320195751.5b08b3e32ca835c3451d7bcd@linux-foundation.org/
> [1]:https://lore.kernel.org/linux-mm/202603271115.uE9vpppi-lkp@intel.com/
>
> This kind of massive levels of confusion and 'I am just trying to run some self
> tests on what-should-be-for-next' is just not helpful...
>
> I think we need a for-next branch that actually consists of stuff we genuinely
> mean to take (i.e. review has settled) instead of 'literally everything because
> we move stuff from mm-new unconditionally'.
>
> Anyway we should revert the fix in [0] because it's broken now.
>
> Cheers, Lorenzo

BTW, even _at_ the fix-patch commit hash (28edd9c5a25c) the test builds fail.

So I wonder if it might be good to at least do build checks of the kernel and
also tests (tools/testing/selftests/mm and tools/testing/vma) before applying a
patch?

As that would have caught this right away. Breaking the build should be
considered a no-no.

Cheers, Lorenzo
