Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0263AE6F5;
	Wed, 23 Sep 2026 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134466; cv=none; b=XuXZchmxJLdxBpEqkP19G8xhKbOnIYswSVNiyNjHKn5y96SWbPYH8TJTj46r3RtnuvogzQT/N7sMdFwcYuNtQRzEbiTJOjuyrO86JpXtamSzwqWUeFk/rOkcOVY3I+kr3WNzu6WNfumzWkPmaDTUC1l1BP+6XY6EdUZFjIl5F+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134466; c=relaxed/simple;
	bh=Fw+fBtEQuGsd/9zFF0gceluYoPhLK+tuM4gfE2dqMew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HNAGXmhz4oItSmEq64PvAiOPFx18jJUKMwNwNuIRGHIMCgdClbYXmOwfQEK+WMJxLR7b49wEpgz0zR6S7m4sK9Stf6a0Z/v3AcxU6D7M/MU53uY0ACNcNZ5v/Zs7UCqsmWxi2J+ZC/6WS6GkgAEwj46x2Nw2oMLufnsuPXOP7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hGj3Y43v; arc=none smtp.client-ip=115.124.30.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hGj3Y43v"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790134452; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=GhjGwmzaNfLYRhZvbNLwLfIrdRdgncHpniFjcnEOIBk=;
	b=hGj3Y43vQQu1WuVS6UUybplW4ZTFjso5vSlQAUbU4GsEQin68gG6G5lz4BprkM/sI6tsaM96r4IfpYrX9rNlquInKenYLwvncD5QtRT7TYQfD4B0endMnp2a2nq61YnZf+jU0RKeVxL0Bn79Do+DDFCCKNZ6dqrrmU8umBh9sUg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBVe.Yc_1790134450;
Received: from 30.74.144.107(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBVe.Yc_1790134450 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 23 Sep 2026 11:34:10 +0800
Message-ID: <50603720-a8af-45dc-9219-3d942a8682c3@linux.alibaba.com>
Date: Wed, 23 Sep 2026 11:34:09 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] kselftest: mm: return fail when child test result
 is fail in khugepaged
To: Yeoreum Yun <yeoreum.yun@arm.com>, Zi Yan <ziy@nvidia.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>
References: <20260921-fix_khugepagd_fail-v2-0-3c2877beef61@arm.com>
 <20260921-fix_khugepagd_fail-v2-1-3c2877beef61@arm.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260921-fix_khugepagd_fail-v2-1-3c2877beef61@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/21/26 6:35 PM, Yeoreum Yun wrote:
> Although the child process in collapse_fork*() or collapse_max_ptes_shared()
> reports `KSFT_FAIL`, the result is ignored because the test only checks
> whether the parent’s page was collapsed into a huge page.
> 
> As a result, the test is considered successful whenever the parent’s page
> is a huge page, even if the child test fails, as shown below:
> 
>    #
>    # Run test: collapse_max_ptes_shared (khugepaged:anon)
>    # Allocate huge page... OK
>    # Share huge page over fork()... OK
>    # Trigger CoW on page 1023 of 2048... OK
>    # Maybe collapse with max_ptes_shared exceeded.... OK
>    # Trigger CoW on page 1024 of 2048... Fail
>    Bail out! Unexpected huge page
>    # Planned tests != run tests (26 != 23)
>    # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0  // child failed.
>    # Check if parent still has huge page... OK              // parent hpage success
>    ok 24 collapse_max_ptes_shared                           // considered as success
>    ...
>    # Totals: pass:26 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> To address this, propagate the child’s failure and skip the subsequent
> check in the parent.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---

Make sense to me.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
