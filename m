Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 651CB312834;
	Thu,  2 Jul 2026 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978595; cv=none; b=jdC1y8vxso1Z1sel7ETdOvWOh98L07q04kTRN6W7EE7zcTMMJa4R5Z+csiZTu0pSUD2yi3cvU1LPLWRQotiuAcTSqEtlQcnrMQsTXeo6s0LGITRHTdAs1wkIqZmI3BF95DiSHrritazA8/76U8xnQMjywgx9H1I8/Y5VrWowLzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978595; c=relaxed/simple;
	bh=NT7LLn41tlTGVdPwc42ds4tnjl9072JYd8fzOZ90sig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jX1O9XovItpkTTq4ykKaBevnkJDJkK1XIVmvyCQVrM5BZM/xaKt1LcXigyA0nZp91buo35x5UaU+S6VUQunbiNWe9LvGke6ZBhMDFjJCYXhzjNFGlnyKHq4ypqjhXOMuqinhr1szTONylNoRUa59STF1bSVOU2/jQyWns9qJu4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mo/RAUP1; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mo/RAUP1"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07E1F288E;
	Thu,  2 Jul 2026 00:49:47 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B10DD3F85F;
	Thu,  2 Jul 2026 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782978591; bh=NT7LLn41tlTGVdPwc42ds4tnjl9072JYd8fzOZ90sig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mo/RAUP1imRpB/y/Ovzr9l/nTCOQW5L5/CkzlGDdoFZ0CNWhqpC7v8CYQYGV4YXvK
	 Vas1zuL920uFiohZTCXoRHVW7NXb67ElPZpnU7YDO6Q87yC91yiOZu0y+gZDomnTmY
	 c6aSpUE9GmUxu7Ldm1gtuZWC6D3B4NzXiFF8bMV8=
Date: Thu, 2 Jul 2026 08:49:42 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 1/2] mm/kmemleak: report leaks only after N consecutive
 unreferenced scans
Message-ID: <akYYFpyU5Fc-ubUw@arm.com>
References: <20260626-kmemleak_twice-v1-0-ab28f7cc0971@debian.org>
 <20260626-kmemleak_twice-v1-1-ab28f7cc0971@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-kmemleak_twice-v1-1-ab28f7cc0971@debian.org>

On Fri, Jun 26, 2026 at 08:52:02AM -0700, Breno Leitao wrote:
> kmemleak reports an object the first scan it is found unreferenced. Its
> mark phase runs without stopping the rest of the kernel and without a
> write barrier, so a live object whose only reference is briefly invisible
> during a concurrent RCU update -- e.g. a VMA moved between maple tree
> nodes, or a page-cache xa_node -- can be seen as unreferenced for that one
> scan. Because an object is flagged as reported only once, such a transient
> race turns into a permanent false positive.
> 
> Track how many consecutive scans each object has been seen unreferenced
> and only report it once that reaches min_unref_scans, a new module
> parameter. It defaults to 1, leaving the behaviour unchanged; setting it
> higher (e.g. 2) still reports a genuine leak, one scan later, while an
> object referenced again before the threshold restarts its run and is never
> reported.
> 
> min_unref_scans can be set at boot with kmemleak.min_unref_scans=<n> or at
> run-time via /sys/module/kmemleak/parameters/min_unref_scans.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>

It looks like a good addition to me. All objects require a second pass
initially to get their checksum updated but that's not sufficient when
they are moved between nodes without having their content changed (list
in a linked list).

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index 7c7ba17ce7af0..5b14ccb36f95b 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -151,6 +151,8 @@ struct kmemleak_object {
>  	int min_count;
>  	/* the total number of pointers found pointing to this object */
>  	int count;
> +	/* consecutive scans the object has been seen unreferenced */
> +	unsigned int unref_scans;
>  	/* checksum for detecting modified objects */
>  	u32 checksum;
>  	depot_stack_handle_t trace_handle;
> @@ -232,6 +234,9 @@ static unsigned long max_percpu_addr;
>  static struct task_struct *scan_thread;
>  /* used to avoid reporting of recently allocated objects */
>  static unsigned long jiffies_min_age;
> +/* consecutive scans an object must stay unreferenced before reporting */
> +static unsigned int min_unref_scans = 1;
> +module_param(min_unref_scans, uint, 0644);

0644 is fine. Not sure why kmemleak_verbose was 0600.

-- 
Catalin
