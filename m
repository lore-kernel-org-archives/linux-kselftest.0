Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACAA13635E;
	Thu, 11 Jun 2026 00:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781137894; cv=none; b=mlXLtDrm1ZEKsR04Q2E8AyucMBS3J1BZ2I/JLcppY48RqNXhFjMkJXP0FfM+eNC4SctXSxm28ErtZ+cvzLx3rYgKNxowmE20k7DVXLe2rVicfz3wHEWgwyEskpjQXXqrPUdbt6nWxT6GL1q/6NxRSiLXf4TB3v+VCr1/nhP+wgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781137894; c=relaxed/simple;
	bh=No6X/c3WhcdPr0kk3lg6YIQ+pULlNCyiajZez1w0NEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlgRUBtEX9mmqL2ADDbOkjRd4gPLePyErc+z0LYlD084RWicIHioFG9x5RmTxlsGIVVxk/yBFfHCL7EGk8RbL3Xip5cN803yJLnJbsosD9rMY0lkuYVZOYNiql2h0ottGLLVScFrDPveD3ZNJwtS58/c+VWuwgDkbd34FGKixhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=H9UG4kZE; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="H9UG4kZE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1781137889; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ywJrNS3ktC+YWc1uDS3O/pb8kB6tZ108acphkKPJlRc=;
	b=H9UG4kZE+RPX3OTs8hE6YYNztd40gJ2PjYmCvQhykbzv5Fqv/oGEKHdaKn2Td5JxrjvxPJSBjMHy7XDST9du8pp/gl/XGrjtznqg4T4b9QxP9AkohEQ9ihsscGkLjffEnZEuxiQZqmZTXe3ZPSvz1UJvxySPml+669TvgBFXFBI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0X4bpvFL_1781137886;
Received: from 30.120.38.205(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0X4bpvFL_1781137886 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 11 Jun 2026 08:31:27 +0800
Message-ID: <b191a1dd-ae98-4066-8d0a-d0992761db0d@linux.alibaba.com>
Date: Thu, 11 Jun 2026 08:31:25 +0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 04/11] mm: khugepaged: add shmem mTHP collapse
 support
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 hughd@google.com, willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <3895c09794739bbfae99d9e021ffacf8a51fb8e2.1781083630.git.baolin.wang@linux.alibaba.com>
 <20260610121331.83926-1-lance.yang@linux.dev>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20260610121331.83926-1-lance.yang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/26 8:13 PM, Lance Yang wrote:
> 
> On Wed, Jun 10, 2026 at 06:29:12PM +0800, Baolin Wang wrote:
> [...]
>> @@ -2808,7 +2875,7 @@ static enum scan_result collapse_single_pmd(unsigned long addr,
>> 	mmap_read_unlock(mm);
>> 	*lock_dropped = true;
>> retry:
>> -	result = collapse_scan_file(mm, addr, file, pgoff, cc);
>> +	result = collapse_scan_file(mm, vma, addr, file, pgoff, cc);
> 
> Looks unsafe to pass "vma" down here, since we have already dropped
> mmap_read_unlock(mm) ...
> 
> A racing munmap() could leave it stale before collapse_scan_file() use
> it, no?

Good catch. Sashiko also complained about this issue. Will fix.
