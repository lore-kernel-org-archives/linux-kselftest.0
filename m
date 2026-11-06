Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958346;
	b=KxDEKw+bmoYzT9z4kz63UhXq9LySGaTbq/h+tpi++VV/FUY1cuTLwZlnU+StJbSemd7v
	 1LTHhsz3qZi/4Znc8hmZ0kCqafwy2K+AbBx135agdwJRpJwsZByM5PIg9T94C4fb+H0SK
	 qmMtkOZw5B0XDCmzVA/0mrQIRySUIHbqioV17krt0rkAp6/DEFE0RrlsH7yOrjTcwJdUp
	 nXR0xPbqyYuUdTmHI+TOPBrr1w5E0DbcfecobbPWmWHRnfHKPAKNwi8/OP6V/XLy3yeoy
	 V06UT1cfDdS2v3kJiPY/elprfRVQVq++OSCldOi9VH8vV6If4JJeH8cEaJhzxZS0E6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958346;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=AfPzSFcW+pZH2QIPZRbefoHN3/d9BoE116jyqEDVh6Y=;
	b=iV94kCk02zGJNsI6ZVDBBQlzRZUq3TsB/NwVotlkbieaZOUAcvKwQva1AJBFCE4n8WPa
	 CcP5aiYDr0Xnk7psW9GwM/iQWAwWDAoG/aybUiJ4GCIEZwE6HLI6RVl/77FWG0PMtSzeD
	 zWme1PkA5yHQ/6aNaCtlN17pr5r/D5fMkTinSnUImXDNmAM7WuaZ8sruIZY4ovgNybOcN
	 7v5prj4MJpbgHZAD13cAWUpJoIKCavCMbSc8eCYDAHROq3D28Xls0PsD+84SNxmjqZ+uZ
	 nWhsBO8u3KUQCyQhFvLgHq2RqJf0ARNJxp12R/Mqcob77rK9U3p3b1byQ9SUqmKgEhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=prb5BBLD;
	arc=none smtp.remote-ip=95.215.58.164
Received: from mta1.migadu.com (out-164.mta1.migadu.com [95.215.58.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E481606A326
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 09:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E481606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=prb5BBLD
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yMrWApyqMY/NnNDcpTl9xLlqLBpfLw5OYLGgqZXQ1tU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793958342; v=1; x=1794563142;
 b=prb5BBLDzBRhDL1dFgS1P9R5uf5nZMEpJiPJBpQZdVdr7tYQdfZaQl7dXQdIPuujdVBUI9SH
 0IPy8H/s6R/2hutUvkJ1qSlk75e+LGkBRWULDzv5CSZ0l8O+yUvxkayJhn5SsAWoa2ugbJnBdDq
 F20apksvpJr/Z+iR8g3FCjPU=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 2f2b68f79f65d7c9;
	Fri, 06 Nov 2026 09:45:25 +0000
X-Mizu-Trace-ID: 2f2b68f79f65d7c9
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 17:45:15 +0800
From: "Xu Xin (vivo)" <xu.xin@linux.dev>
To: Qiliang Yuan <odys.yuan@gmail.com>, david@kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Stefan Roesch <shr@devkernel.io>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mm/ksm: align smart scan skips with the scan
 number
Message-ID: <au2hqxeIz0l/DusZ@dgvxl46587.localhost.localdomain>
References: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com>
 <20261105-bug-mm-ksm-smart-scan-align-skips-v2-1-8a9780b6844e@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105-bug-mm-ksm-smart-scan-align-skips-v2-1-8a9780b6844e@gmail.com>

On Thu, Nov 05, 2026 at 04:36:14AM -0500, Qiliang Yuan wrote:
> Smart scan skips pages that KSM has failed to de-duplicate for a while.
> Once a page is three scans old, its rmap_item counts down its own number
> of scans to skip, 1, 2, 4 and then 8 as it ages, so an old page is looked
> at every ninth scan.
> 
> The unstable tree is rebuilt on every scan, so two identical pages that
> are not in the stable tree yet can only be merged in a scan that looks
> at both. Each countdown runs from when its own page became mergeable, so
> two pages that became mergeable at different times end up on different
> phases and, once both are old, may never be looked at in the same scan
> again. They then stay unmerged for as long as they live. Making a page
> mergeable, waiting for 0 to 20 full scans before doing the same with an
> identical page, 20 times for each wait, and checking the pair after
> another 64 full scans shows this, on two boots per kernel:
> 
>                                 before            after
>   pairs merged (of 420)         329 / 317         420 / 420
>   64M of unique pages skipped   89.0% / 89.1%     87.5% / 87.5%
>   ksmd CPU time per scan        6.25 / 6.25 ms    6.88 / 7.03 ms
> 
> Pick the skipped scans by the global scan number instead, with periods
> of 2, 4 and 8 scans. The periods being powers of two, every old page is
> looked at on each scan that is a multiple of 8, whatever its age, so any
> two pages meet at least every eighth scan. The longest period goes from
> nine scans to eight, which costs 10-12% more ksmd time on memory that
> never merges.
> 
> Fixes: 5e924ff54d08 ("mm/ksm: add "smart" page scanning mode")
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
> ---
>  mm/ksm.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)

Brilliant design.
By using the global ksm_scan.seqnr as a unified time base, this patch eliminates
the out-of-sync problem of the original per-page skip counters.

It guarantees that any two pages will be processed in the same scan at least once
every 8 scans — the least common multiple of all scan periods — which completely
resolves the permanent de-duplication failure.

Admittedly, this comes at the cost of shrinking the longest scan interval from 9
to 8 scans, raising the scan frequency for aged pages by roughly 12.5%. But I
believe this is a very reasonable trade-off for correctness. So

Reviewed-by: Xu Xin (vivo) <xu.xin@linux.dev>


Besides, can we add a extra description about new smart_scan algorithm that we
missed in Documentation/mm/ksm.rst?

> 
> diff --git a/mm/ksm.c b/mm/ksm.c
> index dbfb8f98b1892..a97d7563c2124 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -196,7 +196,6 @@ struct ksm_stable_node {
>   * @head: pointer to stable_node heading this list in the stable tree
>   * @hlist: link into hlist of rmap_items hanging off that stable_node
>   * @age: number of scan iterations since creation (unstable node)
> - * @remaining_skips: how many scans to skip (unstable node)
>   * @linear_page_index: the original page's index before merged by KSM (stable node)
>   */
>  struct ksm_rmap_item {
> @@ -213,7 +212,6 @@ struct ksm_rmap_item {
>  		struct {
>  			unsigned int oldchecksum;
>  			rmap_age_t age;
> -			rmap_age_t remaining_skips;
>  		};			/* when unstable */
>  		unsigned long linear_page_index;    /* for reverse mapping, when stable */
>  	};
> @@ -2446,16 +2444,14 @@ static struct ksm_rmap_item *get_next_rmap_item(struct ksm_mm_slot *mm_slot,
>  }
>  
>  /*
> - * Calculate skip age for the ksm page age. The age determines how often
> - * de-duplicating has already been tried unsuccessfully. If the age is
> - * smaller, the scanning of this page is skipped for less scans.
> + * Calculate how often a page of the given ksm page age is scanned. The age
> + * determines how often de-duplicating has already been tried
> + * unsuccessfully. The older the page, the fewer scans look at it.
>   *
>   * @age: rmap_item age of page
>   */
> -static unsigned int skip_age(rmap_age_t age)
> +static unsigned int scan_period(rmap_age_t age)
>  {
> -	if (age <= 3)
> -		return 1;
>  	if (age <= 5)
>  		return 2;
>  	if (age <= 8)
> @@ -2505,17 +2501,17 @@ static bool should_skip_rmap_item(struct folio *folio,
>  		return false;
>  
>  	/*
> -	 * Are we still allowed to skip? If not, then don't skip it
> -	 * and determine how much more often we are allowed to skip next.
> +	 * The unstable tree is rebuilt on every scan, so two identical pages
> +	 * can only be merged if both are looked at in the same scan. Pick the
> +	 * scans by the global scan number rather than per page: the periods
> +	 * are powers of two, so pages of any age meet on every scan that is a
> +	 * multiple of the longest one.
>  	 */
> -	if (!rmap_item->remaining_skips) {
> -		rmap_item->remaining_skips = skip_age(age);
> +	if (!(ksm_scan.seqnr & (scan_period(age) - 1)))
>  		return false;
> -	}
>  
>  	/* Skip this page */
>  	ksm_pages_skipped++;
> -	rmap_item->remaining_skips--;
>  	remove_rmap_item_from_tree(rmap_item);
>  	return true;
>  }
> 
> -- 
> 2.43.0
> 
