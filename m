Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC3455623;
	Wed,  9 Sep 2026 08:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942122; cv=none; b=VAsiJenC0uSX1htc5gv8DFZzU2PnGR9fPuXrGrsVJMLT3hTmUB+820tw3iWKBsYaJXxtGDlrWoUANDMmZYKK9nioywAAUxlm0NMWFcPkB3rcyBy/x9MVEjG4NjxcL53AbfQATrgZoVB4WQ2rK5EwYoa6YqiFxZEF593a9nkKMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942122; c=relaxed/simple;
	bh=aV6mJa2QLkNRpbKrvt7xmHjh7KFO0I7vxqVXUSJmj6g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ot2IOCn9otzBqEvcY2m2gcnT1IKge1vO0JUAyFHnMs4LGZ73ynebyTd/dUHk7a784pWmhgCmyIB8wQvRJsu8uunzXe5h5ePDqtaz7p0Fse0zQV0OoqjFqY7i856V5qkwer9FX91iQ/sVAqxgjmzIo9yRUogo3bsToDDY4fTzeB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=si23y+BC; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="si23y+BC"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788942118; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=rdvGaYGhPQtbODP5jHxh4QECoIrAIjuXWV8VMXv4teE=;
	b=si23y+BCEvxtM5cc0pADmsRxp78OR7a8MxUv/rkhNBlfNkjTOqDoKTJ8jQ+IEZPg6HISVVj6gxQ+re3M692CFlKJDYtdxy7cKxtXEYhO4S39lDB6mrMeUNPkRXh4YB/wzUp11idPBdDRf4TsFFGDybviMZko1ElIvVa+1+C+QtY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XAeKi9D_1788942115;
Received: from 30.74.144.119(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAeKi9D_1788942115 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 09 Sep 2026 16:21:56 +0800
Message-ID: <95ada031-0fe3-4191-b09e-56b324247456@linux.alibaba.com>
Date: Wed, 9 Sep 2026 16:21:54 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/19] selftests/mm: skip khugepaged page cache cases
 without a PMD folio
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
 <20260908125105.1510704-5-kirill@shutemov.name>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260908125105.1510704-5-kirill@shutemov.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/8/26 8:50 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> The page cache caps folio order at MAX_PAGECACHE_ORDER, which is below the
> PMD order on arm64 with 64K pages, where a PMD is 512M.  A PMD-sized page
> cache folio is impossible there, so the kernel refuses these collapses:
> MADV_COLLAPSE answers -EINVAL and khugepaged passes over the range.  Four
> shmem cases ask for a PMD-sized folio anyway, fail, and the run bails out
> in the middle.
> 
> Skip the shmem and file mem types where the cap is below the PMD order.
> 
> The cap is not shmem-specific: it applies to every file folio.  Add
> thp_file_supported_orders() to read the orders the page cache allows.
> 
> Anonymous collapse is unaffected: its orders are not capped this way.
> 
> Assisted-by: LLM
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Tested-by: Muhammad Usama Anjum <usama.anjum@arm.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
