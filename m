Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CFE387585;
	Wed,  9 Sep 2026 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945390; cv=none; b=RRO8SvCTwshiW7srduQxdaEUq52c/MTLkXcQla42fbhMevGDhdOskzwGMW+XzR/fagO3HQwATJzn8a5pP3EolxBeRXWE9PjqG6cLZ/uKDTooYM9xBfvG3kZ5bLBi3xA8gpdBybA/nnqtxs36iLOaE3ViyfV8lLoFMG0BejEfeOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945390; c=relaxed/simple;
	bh=fhT3TODNS+gSXnCVvmwHLwhJz3Yr8OQlFRZY3cUnuKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMHV+XjVxtgL0A3mdw293nBIzFKhfQdzsbs8d3kgYF6lRdB0F5jZaZjDU9qHYUT0LnSpraRv2fPwQu2HdFzJ12oTiTCrGkcy73wix1JX6fDmcRnBlEs1JNBKKLncTHe+5R5FimFEdeEGtoOurQ2Gy3CSiNI/nqVgyC+rgFGr1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=AMGoxohp; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="AMGoxohp"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788945384; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=P9a6AchFeClJ0X2mXxJBaf6V4wwK/h2PfVSfYzesQn4=;
	b=AMGoxohpN5vfLX5TeZM60//Qt3mQDPAC/HqG/eSDDaQqN7IA8pyiom4hihPdnVspiA/+PuKKxw3QESHcIHIZPJUa5U4uBD3mmRcpc8Vv9cGsMFlI42lXwKyQfmNCLrTstsJrFsEz4rg+rO18e0D+jdIwnhj5f6O8y5Ara3x4FDA=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAePNMm_1788945380;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAePNMm_1788945380 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 17:16:22 +0800
Message-ID: <9fd65a16-51d6-4c21-91f0-f278479316c5@linux.alibaba.com>
Date: Wed, 9 Sep 2026 17:16:20 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/19] selftests/mm: move is_backed_by_folio() into
 vm_util
To: Kiryl Shutsemau <kirill@shutemov.name>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, rppt@kernel.org
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, usama.anjum@arm.com, usama.arif@linux.dev,
 nico.pache@linux.dev, ziy@nvidia.com, baohua@kernel.org, dev.jain@arm.com,
 hughd@google.com, lance.yang@linux.dev, liam@infradead.org, mhocko@suse.com,
 ryan.roberts@arm.com, shuah@kernel.org, surenb@google.com,
 vbabka@kernel.org, agordeev@linux.ibm.com, jgg@ziepe.ca, leon@kernel.org,
 kernel-team@meta.com, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <20260908125105.1510704-1-kirill@shutemov.name>
 <20260908125105.1510704-8-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-8-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> Checking that an address range is backed by a folio of a given order is
> useful to any test that builds or collapses large folios.  mTHP collapse
> coverage in the khugepaged selftest needs exactly that.
> 
> split_huge_page_test.c already has the building block:
> is_backed_by_folio() reads the compound head and tail flags from
> /proc/kpageflags to classify the folio behind a page.
> 
> Move it into vm_util so other tests can use it.  No functional change.
> 
> Assisted-by: LLM
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
