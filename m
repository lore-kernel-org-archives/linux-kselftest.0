Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC93E6DFA;
	Mon, 24 Aug 2026 10:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787567597; cv=none; b=kyGNQnrLqKJnKRwC1AYg1B/yf7J68G/QsDE0zOPTIMQiKcfGzjl3Fl3SrP1XUFBhQI7CdMNtsLfKX9spdvI45NW8V8dRnPJNOdqNf2qjWJJVYZLQCY0R0zpORr5RBR39Jte2lpN3xMqmf8LTYJ8G5U94MSgnAeojjITqUi/u96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787567597; c=relaxed/simple;
	bh=eeZlz1K5E5SjfFMptNhNFsnUvxTL34d0HtdFkqU4MEs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mtoj7A4Xr7KAHu+pCy0cYD2XWluxJgDPMlWuGf7nzYLLEXl5/vw8bwfEWFzwMZn4ZcqQVqvKJ8eXK5dRuBR4CfbWPGyPDa2ahHaW4uiRYcFYz5GlxHWov0sqQi5/eSEIDKvMqP3FAaZjZl2jjiapbt/ntd83Cfk40GXhy4nMwHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA9P810z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA9P810z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF9C1F000E9;
	Mon, 24 Aug 2026 10:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787567595;
	bh=Bg71OX1b/jhiRpPtjWiE4T7Rr7gYxguTgtyPDfmDXSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dA9P810z7x1JH1ynoG6lOwf84Mb0bqTX9/ie1bX0VDXMx7xGoKjtIrkaaccrMHuyD
	 ydhlM37CTf1GCeYUe7zMDcylp6K0Gy9R1u8o+57GkLWmPyoBKt0TVK85sv9dGtFYba
	 R/KOoNGFpbBIfNv1w4WxhddVxVEWkLA5imbDhurLp+/Eo1cvqYazCZsoqW0hJLjN3y
	 QzEjnHu8wqz+zqJvf/zSgL0he6HfTRt3w7rka72w8zxFtPMNTWvhcQHOJFl3WkRH3d
	 iQbJEUGDEn2vA6TTU7cALEUIagm6gVR8ItP8ypktR4IHYWywINWbBW883fdEnxJjwM
	 mspMSgXwzV70w==
Message-ID: <24cdec9c-28b5-4e44-bb05-fef27ef09846@kernel.org>
Date: Mon, 24 Aug 2026 12:33:09 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: disable smart scan for ksm_tests
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
 shr@devkernel.io, ljs@kernel.org, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, shuah@kernel.org
References: <20260823184314.45044-1-zenghui.yu@linux.dev>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260823184314.45044-1-zenghui.yu@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/23/26 20:43, Zenghui Yu wrote:
> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> The "KSM NUMA merging" test allocates two identical pages on two NUMA nodes
> and verifies KSM will merge these two pages after 2 scans (see
> ksm_merge_pages()). But when smart scan is enabled, pages that have
> previously not been de-duplicated may get skipped for some scans. Verifying
> KSM behavior after only 2 scans may not be enough.
> 
>  $ ./ksm_tests -N -d
>  TAP version 13
>  1..1
>  pages_shared      : 0
>  pages_sharing     : 0
>  max_page_sharing  : 256
>  full_scans        : 211
>  pages_unshared    : 1
>  pages_volatile    : 2
>  stable_node_chains: 0
>  stable_node_dups  : 0
>  general_profit    : -128
>  ksm_rmap_items 2
>  ksm_zero_pages 0
>  ksm_merging_pages 0
>  ksm_process_profit -128
>  ksm_merge_any: no
>  ksm_mergeable: yes
>  not ok 1 KSM NUMA merging
>  # Totals: pass:0 fail:1 xfail:0 xpass:0 skip:0 error:0

How did you reproduce this? Is this an actual test result?


~/linux/tools/testing/selftests/mm$ cat /sys/kernel/mm/ksm/smart_scan
1
~/linux/tools/testing/selftests/mm$ sudo ./ksm_tests -N -d
TAP version 13
1..1
pages_shared      : 1
pages_sharing     : 1
max_page_sharing  : 256
full_scans        : 1283
pages_unshared    : 0
pages_volatile    : 0
stable_node_chains: 0
stable_node_dups  : 0
general_profit    : 3968
ksm_rmap_items 2
ksm_zero_pages 0
ksm_merging_pages 2
ksm_process_profit 8064
ksm_merge_any: no
ksm_mergeable: yes
ok 1 KSM NUMA merging
# Totals: pass:1 fail:0 xfail:0 xpass:0 skip:0 error:0


> 
> This specific test fails because KSM started scanning the second page
> whilst the first page had already been scanned for 16 times

How is that supposed to happen? The sequence we have is:

numa1_map_ptr = numa_alloc_onnode(page_size, first_node);
numa2_map_ptr = numa_alloc_onnode(page_size, second_node);
...
memset(numa1_map_ptr, '*', page_size);
memset(numa2_map_ptr, '*', page_size);
...
if (ksm_merge_pages(merge_type, numa1_map_ptr, page_size, start_time, timeout) ...

KSM smart scan operates on rmap entries. rmap entries are per MM.

-- 
Cheers,

David
