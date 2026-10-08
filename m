Received: from mta0.migadu.com (out-90.mta0.migadu.com [91.218.175.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CCA4848AA
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460383; cv=none; b=Dj/3M7rlabjYfbRqxpnGx7+FSsr9fdGcVAZzVNo1xC4r5y2I2Osf24GoQB5pJRrtcDk+7PC267TVrZx/OlNBOyPkTc+9lM64E8jR1c45gIaW3TUmHTUHLySKbkGZkS3nrTDU7tQs63RJ3wNa3D5k6rfrcSyPGh6cIiQDldp5X40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460383; c=relaxed/simple;
	bh=gMqeE0xl8Ovcpe/2DG1ldO6wSB1ZHK72dsybg+woYM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wc52frhDjxYZZH3KzZwNGY5nNuZXu46Jan6v8Wr7CUZto5Y7TnDC9B1Z1yxNAkOOZ760qrqjgKrQYYL37xRahDIhz5a5cb6/hZKWRTq4DGZwaMC0Xk5qNRMTz29pW266E/0d0h8N0EhrUa1UeNNj+Hu/yltIIOTC55NHeFjeTkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BJARY13E; arc=none smtp.client-ip=91.218.175.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BJARY13E"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=gMqeE0xl8Ovcpe/2DG1ldO6wSB1ZHK72dsybg+woYM4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791460378; v=1; x=1792065178;
 b=BJARY13EfZ+44NzQM8/bThg6o3Yawg62s6SUN5emC13vLplYQGhqm4bGhQVfVWTI3IJ08GXi
 gq+yVsXbQokwC2T2hZBjDpytmkFzl+9oTE7iBXWF/P3a0Sxb0gGX974CSs3I+h/xSqSsUOF39wx
 LE9f9L/GgnCgz0ItzNtCrHpA=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 51f5bb7d1a53d99c;
	Thu, 08 Oct 2026 11:52:58 +0000
X-Mizu-Trace-ID: 51f5bb7d1a53d99c
X-Migadu-Flow: FLOW_OUT
Message-ID: <5862cddb-a78f-419f-a5a1-15e16a422bf5@linux.dev>
Date: Thu, 8 Oct 2026 19:52:18 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/19] selftests/mm: skip collapse_compound_extreme()
 where the PMD is too large
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Muhammad Usama Anjum <usama.anjum@arm.com>, Usama Arif
 <usama.arif@linux.dev>, "Nico Pache (Red Hat)" <nico.pache@linux.dev>,
 Zi Yan <ziy@nvidia.com>, Barry Song <baohua@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>,
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>,
 Michal Hocko <mhocko@suse.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, kernel-team@meta.com
References: <20260919002451.496763-1-kirill@shutemov.name>
 <20260919002451.496763-3-kirill@shutemov.name>
Content-Language: en-US
From: Zenghui Yu <zenghui.yu@linux.dev>
In-Reply-To: <20260919002451.496763-3-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Kiryl,

On 9/19/26 8:24 AM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_compound_extreme() builds a PTE table full of distinct PTE-mapped
> compound pages by cycling hpage_pmd_nr fault-time THPs through mremap.  It
> therefore needs hpage_pmd_nr PMD-order allocations in a row.  That is fine
> at a 2M PMD (4K base pages) or a 32M one (16K).  A 512M PMD -- arm64 with
> 64K base pages -- makes each of those an order-13 allocation, which the
> allocator cannot reliably hand out even once, let alone 8192 times.
> 
> The failure is not a quiet one: the case calls ksft_exit_fail_msg(), so the
> whole binary stops and every case after it is lost.
> 
> Skip the case where the PMD is larger than 32M.  The MADV_COLLAPSE cases
> still cover PMD-order collapse on those configurations, and 4K and 16K
> PMDs are unaffected.

collapse_compound_extreme() failed on an arm64 virtual machines with 16k
pages.  The VM has 8GB of memory.  Not sure if this is the same issue that
this patch attempts to address.

[root@localhost mm]# ./khugepaged

[ snipped ]

# 
# Run test: collapse_full_of_compound (madvise:anon)
# Allocate huge page... OK
# Split huge page leaving single PTE page table full of compound pages... OK
# Collapse PTE table full of compound pages... OK
ok 76 collapse_full_of_compound
# 
# Run test: collapse_compound_extreme (khugepaged:anon)
# Construct PTE page table full of different PTE-mapped compound pages
Bail out! Failed to allocate huge page
# 1 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
# Planned tests != run tests (91 != 76)
# Totals: pass:75 fail:0 xfail:0 xpass:0 skip:1 error:0

Thanks,
Zenghui
