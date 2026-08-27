Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801743537E5;
	Thu, 27 Aug 2026 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787811979; cv=none; b=VVOCYyEmhvZkXHBurSJS3x1bTAQTeCNwdF722AFb++0fqWeVBtYJ8tKKdHZEuRYhSZ6SUYg9EcBKXNwvAfKJK2OAqoEzISIz3DNOX538+P6FYHYJ7DwMHlFMVXeThK/LH7Kb7XG+s4nmk4UG7GXvUGZTdSDhWAW0qjQmbycOwTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787811979; c=relaxed/simple;
	bh=NV7nYIqQNIGPaE6m4yKiAqKbRKJYjlWdTHgt+xq0df0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X2Of+POxKtrS5eY3rPEqQ3erTenSpU8o29uIjuMi9myoEzruorzEAj0fitQEpYcm15fk3wpwz3xqaFhnYdpk5dh++1/SRU6RvU+OUIO0+eBitg6WLqA5H7ElRVS0bxej6lzUwZuFrk2/7VYN1QizHFwDKPCj5k4yr2AoLNC3vks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=W5/ygaN2; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="W5/ygaN2"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787811969; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=paUlhZn9t+ILv8kEAUHY2bGSoJtzMH3jxankaf15DKA=;
	b=W5/ygaN2Cs00I1D95eeNXSZsnn+GIVttC8jQmNNcv3ovFsxZpYw6SvgUVZj0TNenIjyHnf+rPLPbHpCjYGXuXApow70zbUWel7sDSJr6HYOSCRYBY5jEX8woVPRRBIG3GC2FT+xJ+Whl5k1Y0H4o6D0xDuom/8enpvhb4IvKXR0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R401e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=19;SR=0;TI=SMTPD_---0X9ijePx_1787811967;
Received: from 30.74.144.120(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X9ijePx_1787811967 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 27 Aug 2026 14:26:08 +0800
Message-ID: <1cb2ee22-5d41-4992-a44b-6fd27e524b6a@linux.alibaba.com>
Date: Thu, 27 Aug 2026 14:26:07 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: khugepaged: remove str_dup() usage
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Shuah Khan <shuah@kernel.org>
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260825-remove_str_dup-v1-1-0ba2121a820c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/25/26 7:20 PM, David Hildenbrand (Arm) wrote:
> We don't check str_dup() return value and never free it. While both
> things are irrelevant in practice, let's just clean it up by working on
> argv[0] directly and avoiding the str_dup().
> 
> Nobody after us needs these parts of the argv[0] string anyway.
> 
> This patch is inspired by previous work from Anshuman Tewari [1].
> 
> Link: https://lore.kernel.org/r/20260821114416.12255-1-anshumantewari123@gmail.com [1]
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
