Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A03D3C3434;
	Wed,  9 Sep 2026 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939796; cv=none; b=nIXleBm6MvcLTkvFASpJGRVmGwR9R0GIes2tGWqU7u2ebfSMtbeDZ76+Di97USX7gWjFWZ1Ryp2sp6HL/GZfbicapL14x1B4HSop2yMTsE0teli7mGrzbXux0hw0he0BAgQjG1QVjOcOFgloe3RkSv2GTIn1v+oi021mxERJTkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939796; c=relaxed/simple;
	bh=nAfBvU9Klb4vjYwyzQO/c+o2We7jNJqsIYkmiZrQlxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eefdfvLXfe1MdgaiNqRnx8mQ1BaDKPckmWzKT9vkgLn+/4G34Ma98NqCNbWQFGiknzvagGdA6G1j2yf37sI6XejPZx7GgAUicf/NVZYGcb4VjCGeXh4LFWWPr32TscC3qU/b/glDb9QlflWbStwUBvfDtnPlJ1L8m00/3Wl9h70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=E3/HbEkL; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="E3/HbEkL"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788939781; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=GOgvdKpRTZOCys2xyo5CegR4febhPvynV69GyvBCGg8=;
	b=E3/HbEkLEw33kLGastZzh3UjT5Ga/D5GO1LDVrG5ZFSbYgdCjJcPnd9xAZdgM+wi2sEEhSuGnlygmDhCKHrzhztSE/9ergL7cakgBaeJLACxEEsvjPt+axJbtqbh6mcZf8AK8KIMlE+x/VRzp62sDKfT0W2+z2boI5tNnP+ySU8=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeJlun_1788939778;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeJlun_1788939778 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 15:42:59 +0800
Message-ID: <d78db281-ba00-42ea-9ecd-6d36f77cd4a5@linux.alibaba.com>
Date: Wed, 9 Sep 2026 15:42:57 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/19] selftests/mm: raise the khugepaged test-case cap
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
 <20260908125105.1510704-2-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-2-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> TEST() ends the run with "MAX_TEST_CASES is too small" when the table
> fills, and the table holds 64.  A full invocation already registers 63, so
> the next case added anywhere aborts the whole suite before a single test
> runs.
> 
> Raise the cap to 256.  The table is a static array of small structs, so the
> room costs nothing worth counting.
> 
> Assisted-by: LLM
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
