Received: from mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BF1415F32
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572556; cv=none; b=HpdHYM5s1fn4JWZQlnAmcMvA26D3HEbfiJBsX1zw0FOEq5+rcX2HD3H+IVN164Tmjkb/qSCQyF+JE5ZHppPf+PAqmeYLFEC66/QomcncDSkEHDpq/+sRQbFb3r6giIQa83SFG8DWcV1qDg3zRDjoYgP2+UYema4C8OAoOI6yLsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572556; c=relaxed/simple;
	bh=9sA4HqESCZemC8Qy80NybOgOQNBjAON37oeRT7uodbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hsgSU7vMKPjMhr3vW6OpTtb33BvnZVgQoPtK3yi9lhQ92fs1ah9xyWuxbHsm8euOSSjka2P9pQ/2oD4InFV86/xCk49Y7M6yntLqVZ6bW+U515krYy168iMBelixkNCGYAwfWWm9paAT4UVBWawQqBumv5wQOeVNUtvgDYJunHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SA96H2QF; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SA96H2QF"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9sA4HqESCZemC8Qy80NybOgOQNBjAON37oeRT7uodbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787572551; v=1; x=1788177351;
 b=SA96H2QFlsi3Vnsxcj9H9z75s68IInql4r+HAGfkhu2f/naqg0/qOrWrJ7LOz9c5aEotXXEW
 0zv1YJ6Urp3b8MBkMbmmxFoRYdFGkBV2EdKY2Z8mPqPQQnsh6TtAapccH61NJ3AiZR2KsKCr5Lf
 IjV28fnDKmQkyWnBpMUt8lvE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: from [7.250.142.105] (139.159.170.87)
	by smtp.migadu.com with ESMTPS id 90b5f181d21c03a6;
	Mon, 24 Aug 2026 11:55:41 +0000
X-Mizu-Trace-ID: 90b5f181d21c03a6
X-Migadu-Flow: FLOW_OUT
Message-ID: <5da6d1ef-28c7-4aed-abd4-a0d74da7998c@linux.dev>
Date: Mon, 24 Aug 2026 19:55:33 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: disable smart scan for ksm_tests
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org,
 xu.xin16@zte.com.cn, chengming.zhou@linux.dev, shr@devkernel.io,
 ljs@kernel.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, shuah@kernel.org
References: <20260823184314.45044-1-zenghui.yu@linux.dev>
 <24cdec9c-28b5-4e44-bb05-fef27ef09846@kernel.org>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <24cdec9c-28b5-4e44-bb05-fef27ef09846@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi David,

On 8/24/26 6:33 PM, David Hildenbrand (Arm) wrote:
> On 8/23/26 20:43, Zenghui Yu wrote:
> > From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> >
> > The "KSM NUMA merging" test allocates two identical pages on two NUMA nodes
> > and verifies KSM will merge these two pages after 2 scans (see
> > ksm_merge_pages()). But when smart scan is enabled, pages that have
> > previously not been de-duplicated may get skipped for some scans. Verifying
> > KSM behavior after only 2 scans may not be enough.
> >
> >  $ ./ksm_tests -N -d
> >  TAP version 13
> >  1..1
> >  pages_shared      : 0
> >  pages_sharing     : 0
> >  max_page_sharing  : 256
> >  full_scans        : 211
> >  pages_unshared    : 1
> >  pages_volatile    : 2
> >  stable_node_chains: 0
> >  stable_node_dups  : 0
> >  general_profit    : -128
> >  ksm_rmap_items 2
> >  ksm_zero_pages 0
> >  ksm_merging_pages 0
> >  ksm_process_profit -128
> >  ksm_merge_any: no
> >  ksm_mergeable: yes
> >  not ok 1 KSM NUMA merging
> >  # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0
> 
> How did you reproduce this? Is this an actual test result?

I reproduced this in a guest, using arm64's virtconfig. I don't think there
is any particular configuration. This is an actual test result but this is
not 100% reproducible.

> ~/linux/tools/testing/selftests/mm$ cat /sys/kernel/mm/ksm/smart_scan
> 1
> ~/linux/tools/testing/selftests/mm$ sudo ./ksm_tests -N -d
> TAP version 13
> 1..1
> pages_shared      : 1
> pages_sharing     : 1
> max_page_sharing  : 256
> full_scans        : 1283
> pages_unshared    : 0
> pages_volatile    : 0
> stable_node_chains: 0
> stable_node_dups  : 0
> general_profit    : 3968
> ksm_rmap_items 2
> ksm_zero_pages 0
> ksm_merging_pages 2
> ksm_process_profit 8064
> ksm_merge_any: no
> ksm_mergeable: yes
> ok 1 KSM NUMA merging
> # Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> 
> >
> > This specific test fails because KSM started scanning the second page
> > whilst the first page had already been scanned for 16 times
> 
> How is that supposed to happen? The sequence we have is:
> 
> numa1_map_ptr = numa_alloc_onnode(page_size, first_node);
> numa2_map_ptr = numa_alloc_onnode(page_size, second_node);
> ...
> memset(numa1_map_ptr, '*', page_size);
> memset(numa2_map_ptr, '*', page_size);
> ...
> if (ksm_merge_pages(merge_type, numa1_map_ptr, page_size, start_time, timeout) ...
> 
> KSM smart scan operates on rmap entries. rmap entries are per MM.

This is what I had for debugging:

diff --git a/mm/ksm.c b/mm/ksm.c
index 49d48d1e0998..aec2a292cba5 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2495,6 +2495,8 @@ static bool should_skip_rmap_item(struct folio *folio,
 	if (age != U8_MAX)
 		rmap_item->age++;

+	pr_info("addr=%lx age=%u r_skips=%u\n", rmap_item->address, age, rmap_item->remaining_skips);
+
 	/*
 	 * Smaller ages are not skipped, they need to get a chance to go
 	 * through the different phases of the KSM merging.
@@ -2820,8 +2822,10 @@ static void ksm_do_scan(unsigned int scan_npages)
 	while (scan_npages-- && likely(!freezing(current))) {
 		cond_resched();
 		rmap_item = scan_get_next_rmap_item(&page);
-		if (!rmap_item)
+		if (!rmap_item) {
+			pr_info("\n");
 			return;
+		}
 		cmp_and_merge_page(page, rmap_item);
 		put_page(page);
 		ksm_pages_scanned++;

$ dmesg
[  309.111144] addr=7fff959d4000 age=0 r_skips=0

[  309.111215] addr=7fff959d4000 age=1 r_skips=0

[  309.111223] addr=7fff959d4101 age=2 r_skips=0

[  309.111230] addr=7fff959d4102 age=3 r_skips=0

[  309.111237] addr=7fff959d4103 age=4 r_skips=1

[  309.111241] addr=7fff959d4000 age=5 r_skips=0

[  309.111248] addr=7fff959d4105 age=6 r_skips=2

[  309.111251] addr=7fff959d4000 age=7 r_skips=1

[  309.111255] addr=7fff959d4000 age=8 r_skips=0

[  309.111262] addr=7fff959d4108 age=9 r_skips=4

[  309.111265] addr=7fff959d4000 age=10 r_skips=3

[  309.111269] addr=7fff959d4000 age=11 r_skips=2

[  309.111272] addr=7fff959d4000 age=12 r_skips=1

[  309.111297] addr=7fff959ac000 age=0 r_skips=0
[  309.111303] addr=7fff959d4000 age=13 r_skips=0	-> page 0's age is 13 greater that page 1's

[  309.111311] addr=7fff959ac000 age=1 r_skips=0
[  309.111316] addr=7fff959d410d age=14 r_skips=8

[  309.111320] addr=7fff959ac10e age=2 r_skips=0
[  309.111325] addr=7fff959d4000 age=15 r_skips=7

[  309.111329] addr=7fff959ac10f age=3 r_skips=0
[  309.111334] addr=7fff959d4000 age=16 r_skips=6

[  309.111338] addr=7fff959ac110 age=4 r_skips=1
[  309.111339] addr=7fff959d4000 age=17 r_skips=5

[  309.111343] addr=7fff959ac000 age=5 r_skips=0
[  309.111348] addr=7fff959d4000 age=18 r_skips=4

[  309.111352] addr=7fff959ac112 age=6 r_skips=2
[  309.111353] addr=7fff959d4000 age=19 r_skips=3

[  309.111357] addr=7fff959ac000 age=7 r_skips=1
[  309.111358] addr=7fff959d4000 age=20 r_skips=2

[  309.111362] addr=7fff959ac000 age=8 r_skips=0
[  309.111367] addr=7fff959d4000 age=21 r_skips=1

[  309.111372] addr=7fff959ac115 age=9 r_skips=4
[  309.111373] addr=7fff959d4000 age=22 r_skips=0	-> remaining_skips can not be 0 at the same time for both pages

Not sure if I had misunderstood something.

Thanks,
Zenghui
