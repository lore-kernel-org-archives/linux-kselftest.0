Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388104;
	b=AUvJGzaU0V2BYxROXVDcBhr58oIxssaBAsXrES59SMMZExW+hIMoi+kUTWUVUxZYlRxk
	 W4DLTwkGSFvNtsstZhl/klBw5Xm3Inb5FZO7S2PExUMMoNd+PdkWzdzES20ujw7nAjvxe
	 F+N67aitQIwl4QyZ+YT6UYxyCePfR5O+4Io/untuc+2OxkwRcFWQRVhzCPgj9FcVWFhxt
	 0/auYspOzRjXcRNAil1B+J9wbNCMT5pf275eCV5UKn3PJ98pBrOkbBj5x06+CzPlm3ysl
	 Q/9ah2gINCYwjam8mSnZ+VYbLE7D2WClCZxGBW8EJyFWcEsmEHBM/arInS+zOmsvkMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388104;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=beCq0yEdS9NGRvXAH25NWBlijnEtfYCeuB+kkXj75ZA=;
	b=KapckyqgJ6EiQxQK2tc0vaZdmx60bNVF38bw5x+wNtU7PX9I7814euiG3U3M+C0i8aHx
	 dUjIH+KUxRXL+u3kPYSSXeYYQlo/Jabk37PgRQohBwY8m06AMcTGTbSRHCxIpC0swPWe5
	 AxbqvpLK5ADngcCN6iVGlZAtyZuRXvstA/UyhIToUtsQ1Ci3nH62Ee0c2MFGXga1QU2Ir
	 nyDGuaNFnCNqqxQ/TdoLgUCbusoN9/tcwbEfKYEy1OsWSWftu0/W1h0Os2UVHPB64BcHe
	 dOsjJ2wHOAYlIK/Sg097M3uRUnVjb/j7EN4zjdqrlRSYwkswTm8lYbH5E4Hh7hphcDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxHOTt66;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D43606A33F;
	Wed, 11 Nov 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BxHOTt66
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9711F00A05;
	Wed, 11 Nov 2026 09:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794388104;
	bh=beCq0yEdS9NGRvXAH25NWBlijnEtfYCeuB+kkXj75ZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=BxHOTt66uVPC3Wb/2B4DVOu6adBNeprM9i1Vl1vG0o5PiFeJDmWYYaxDhEY19Wxy+
	 KY0/ARXkcgwR4OS+05SQGwgZg6n/7sN7/rRZmMihhYQ1vde1ajzknDX1E+hXHEO5hE
	 RLm6yHt7lB5jAj2b3AI5iiKYWVeKyIWpzccl5gnBeekq6qW5w63uTgMxe2z8IrRoN/
	 K98Tdyfx0qNhtpeebAOfy9GtApphmHtsQAydLSlOhhM+fmk+KnwkIaJigPbfdPR4Dd
	 hjIM79US+3KYZMmH2oIOx788A1EOFYf1pLb2yaMlgfhRZpDPxGpgEhHdfwSwEdr7c6
	 soz1f/4i/4JMw==
Message-ID: <5445434f-078f-47d8-9851-dcc3712d18f1@kernel.org>
Date: Wed, 11 Nov 2026 10:08:15 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ksm: skip rmap_item allocation for non-zero pages
 under only_merge_zero_pages
To: "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev, corbet@lwn.net,
 link@vivo.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org,
 odys.yuan@gmail.com, rppt@kernel.org, surenb@google.com,
 tujinjiang@huawei.com, vbabka@kernel.org, xiao.wang@vivo.com
References: <20261110074312.219847-1-xu.xin@linux.dev>
 <20261110074451.220524-1-xu.xin@linux.dev>
 <20261110074451.220524-2-xu.xin@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20261110074451.220524-2-xu.xin@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/26 08:44, Xu Xin (vivo) wrote:
> When only_merge_zero_pages is enabled, ksmd only ever merges empty
> (zeroed) anonymous pages with the kernel zero page. A page that carries
> data can never be merged, yet the current code still allocates an
> rmap_item for it in scan_get_next_rmap_item() before cmp_and_merge_page()
> decides to skip it.
> 
> On workloads with a large amount of non-mergeable anonymous memory this
> is a real cost: every scanned non-zero page pays for an rmap_item
> allocation, and the rmap_items accumulate in the per-mm pending list.
> For example, a MySQL instance with hundreds of gigabytes of anonymous
> memory (mostly buffer pool pages that cannot be merged) ends up with
> ksmd creating rmap_item metadata for each candidate page; the metadata
> overhead can wipe out any gain from the zero-page merging and even turn
> the net benefit negative.
> 
> Add should_skip_non_zero_page(), called in scan_get_next_rmap_item() before
> get_next_rmap_item(), which, when only_merge_zero_pages is enabled,
> checks whether the candidate page is all zeros. A non-zero page is
> skipped entirely: no rmap_item is allocated for it, and any stale
> pending rmap_items below it are freed (as get_next_rmap_item() would).
> The page is reported back to ksm_do_scan() as ERR_PTR(-EAGAIN), which
> counts it as scanned and continues, so the pages_to_scan budget is
> preserved.
> 
> The all-zero check (pages_identical() against the kernel zero page) reads
> the whole page. For a non-zero page this is a net win: the extra page read
> is cheaper than the rmap_item allocation and the stable/unstable tree
> operations it would otherwise trigger.
> 
> A page that is zero now but is written before cmp_and_merge_page() runs
> is still handled correctly, because the checksum-based decision in
> cmp_and_merge_page() (added by the previous patch) is the authoritative
> one.

I think we should get rid of any rmap items when merging the shared zeropage
only. That might require more changes to the ksm code, but it really doesn't
make any sense to have rmap items.

Maybe we just want a separate KSM infrastrcture that only focuses on
deduplciating shared zeropages in KSM: get a page, see if it is zero-filled. If
so, try deduplciating with the shared zeropage. Done.

Mangling this into the existing infrastructure might look easier but it just
adds things like additional zero-page comparisons and (as Lorenzo points out)
makes the code harder to understand + maintain.

-- 
Cheers,

David
