Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956132EB0F;
	Tue, 15 Sep 2026 00:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789432624; cv=none; b=mftLzhnh8bXHYXWY4sE5rcipt9uL4IRD6ssHobuvscOvZN+KxIFptW0NtxYnkB+s9GfedCvBIwspOaJYCyXw4HshgUAfyP1IgW2iwqb19xZOAuVG8K7OgLSdgRSYKO1k9NURIwHP8Qmwe6eONv3GyVUf7bBOarlgVMc27U0089Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789432624; c=relaxed/simple;
	bh=2maZavkpwndHxEh2iNOhtSZcmxqJatpWvi3gX5dw0m4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=B+XOkVf3kaBGCTekRR9EsLubBnkO9Sr3rnmTJrMQsQH3EBH2mIyFo7wtgqXF/7L2AoEqUcfyR4z/+7D1g0AwpDLr4zDHWLRkwT2LVCzQ8e4WEzFVCgGhTXivmU98nk9vyQfpQkXdduDOxdVj2MLRaM86eveTreH5LpI+WJfCbp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=0kjRP8tz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="0kjRP8tz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F441F000FF;
	Tue, 15 Sep 2026 00:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1789432622;
	bh=ohmby5G3e6ifkVjc4vuFLhgRo5DzLqDybCdY33dqOpo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=0kjRP8tzG+b8wa8QbL2/el4odhJfqEWqwcgV4vIBPsytvQFtemQj8Hsm69ZkIfRTN
	 fOh72hTkudcbh+3jYO8BaN3ibRfctUxdqnWFGY7Z52aUSh+jyv3i9xevJ9+2k3JTNa
	 VLWY5RlraRxYNUxXnalqXXZudSBgnSBtNwkCl26U=
Date: Mon, 14 Sep 2026 17:37:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Kyle Meyer <kyle.meyer@hpe.com>
Cc: corbet@lwn.net, david@redhat.com, linmiaohe@huawei.com,
 shuah@kernel.org, tony.luck@intel.com, jane.chu@oracle.com,
 jiaqiyan@google.com, Liam.Howlett@oracle.com, bp@alien8.de,
 hannes@cmpxchg.org, jack@suse.cz, joel.granados@kernel.org,
 laoar.shao@gmail.com, lorenzo.stoakes@oracle.com, mclapinski@google.com,
 mhocko@suse.com, nao.horiguchi@gmail.com, osalvador@suse.de,
 rafael.j.wysocki@intel.com, rppt@kernel.org, russ.anderson@hpe.com,
 shawn.fan@intel.com, surenb@google.com, vbabka@suse.cz,
 linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH v3] mm/memory-failure: Support disabling soft offline
 for HugeTLB pages
Message-Id: <20260914173700.346dc533f1f21ef170b7722f@linux-foundation.org>
In-Reply-To: <aqiIEkrc6aDBOqRg@hpe.com>
References: <aqiIEkrc6aDBOqRg@hpe.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 18:49:38 -0500 Kyle Meyer <kyle.meyer@hpe.com> wrote:

> Soft offlining a HugeTLB page dissolves it, permanently reducing the
> HugeTLB page pool. This can be problematic for workloads that depend on
> a fixed number of HugeTLB pages.
> 
> Currently, soft offline must be disabled to prevent HugeTLB pages from
> being soft offlined.
> 
> This patch allows soft offline to be disabled for HugeTLB pages while
> remaining enabled for non-HugeTLB pages.
> 
> Commit 56374430c5dfc ("mm/memory-failure: userspace controls
> soft-offlining pages") introduced the following sysctl interface to
> control soft offline:
> 
> /proc/sys/vm/enable_soft_offline
> 
> The interface does not distinguish between page types:
> 
>     0 - Soft offline is disabled
>     1 - Soft offline is enabled
> 
> Convert enable_soft_offline to a bitmask and support disabling soft
> offline for HugeTLB pages:
> 
> Bits:
> 
>     0 - Enable soft offline
>     1 - Disable soft offline for HugeTLB pages
> 
> Supported values:
> 
>     0 - Soft offline is disabled
>     1 - Soft offline is enabled
>     3 - Soft offline is enabled (disabled for HugeTLB pages)
> 
> Existing behavior is preserved.
> 
> Update documentation and HugeTLB soft offline selftests.

I'm hitting some rejects against
https://lore.kernel.org/20260825085756.63030-4-husong@kylinos.cn. 
Please update this against mm.git's mm-unstalbe branch or linux-next.

I'd updated v2's changelog with this:


Tony said:

: Recap of original problem is that some BIOS keep track of error
: threshold per-rank and use this GHES mechanism to report threshold
: exceeded on the rank.
: 
: Systems that stay up a long time can accumulate enough soft errors to
: trigger this threshold.  But the action of taking a page offline isn't
: going to help.  For a 4K page this is merely annoying.  For 1G page it
: can mess things up badly.
: 
: My original patch for this just skipped the GHES->offline process for
: huge pages.  But I wasn't aware of the sysctl control.  That provides a
: better solution.

Which is cumbersome but I think there's useful info here so please
incorporate in some way.

> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Kyle Meyer <kyle.meyer@hpe.com>

v2 had

Reported-by: Shawn Fan <shawn.fan@intel.com>

which got lost.
