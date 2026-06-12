Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532F6369996
	for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 10:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258953; cv=none; b=oRXEjZdRun1y7I6QToCiD56JfYgjlp6zN4d1Icp8DssYGom+z3wuh2YN/HNs5yFi/Yg6qjIXjK9naAo4vuJrR2CGIFEwnIYZ8VCeurkG0LpVAJUv+SD3cE8r3Vl9tdyRWorEWyc+pI2iXm2rZ5GxcHni3p5V5t6VJQtNjeNUk3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258953; c=relaxed/simple;
	bh=9agdxz8c+FiTSQwOjdlKjytyRZBo/WDObQMT0qzIcYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TvPZsMgQFW9TVEKaMXDdRPvmBlKPEC9IF2c12mBr4Ds060J6FQlPtHNCkrEQlwRO7sRtrYp4gqYPGCbXq293FULa+T1O2qUdaf+WOWO3KHvCUjxRRN1kCNbgbnUo4roUWW6PeX+o8kOq55hSK+7SVYFrH7Gh6A/apCPqDttsKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXOYlKSR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b2rb6HfE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXOYlKSR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b2rb6HfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781258950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rLtZCrTqCWSUxUR2OciFR75Mxr1mj0TTxaB5GR/zvj4=;
	b=NXOYlKSRc8s7GoxCLzqfX8kME8/ZrVceOvCjeJh3tPSISdDg3vBYNSyDBnciV5rsih/D3S
	z5HzZZW9LZaBO2e4eDWzJYpBIv0+kfO2cZz77JnlFJbIROmR8bhMAVO315FqsKqzrCWBho
	X/RvOLMGRtJMghpKiurFc/jeftYD9Zw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-xJcXj5PAP8y79XFfwnNmyQ-1; Fri, 12 Jun 2026 06:09:09 -0400
X-MC-Unique: xJcXj5PAP8y79XFfwnNmyQ-1
X-Mimecast-MFC-AGG-ID: xJcXj5PAP8y79XFfwnNmyQ_1781258948
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490b4d3d3e6so5479585e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 12 Jun 2026 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781258948; x=1781863748; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rLtZCrTqCWSUxUR2OciFR75Mxr1mj0TTxaB5GR/zvj4=;
        b=b2rb6HfEKUb2pFsrzcw7LqfOwWGac0EBHgfF4d9nMBoY31JqTKiYJCyqoK3BFlTLT6
         yJZ3v2COf0ocgn14CSpGpewtToc+9Hr73GakggSu6o2IQX6dnC5SFA5VtBm6ZfaoXFxn
         2gTN15cS/h3kgq9z1D2gFsVCTIb85fT6nrZY7CGfJrL8CATLhE/XsXbSYzGACgJ9B/m2
         qSwXTcLTp8viIW3mp+cwmS5Px27EMfP++lp3Xob4D9kY8JE8M2pkhPb8VrHz3xxyCm/T
         y1GqddO5d4OqVlJDMxc/y7gFr7FWO/AeE9aYozhJ4zyR/5Jpf6pBq9hG2aT2/4DKiF0/
         JaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781258948; x=1781863748;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rLtZCrTqCWSUxUR2OciFR75Mxr1mj0TTxaB5GR/zvj4=;
        b=gxCUChA4Hx99hcNB0KfBGro0sumgWRw1+WOkNPcCMQXG2RtP6a9p/m7OCGcc48Ns1R
         0UeptEqiiQe9+SdQK20pBNmRinAUCBZZ5/MyMsWw51BjEPXsqFsYP/1569Bkn37kFYrf
         KFF0sXXryUGO53h9F5ejId3oyHC2hUaZoA24muwZXUiE7e5Cyeh/GMOgeauAPkANiPD7
         pgxrGc6EVpWDnNQlRSCRo293s/Scht/XnMRbc6s6Q4ebCqHH5j2VCUr4/m8YyoGY4lYo
         47bAZM4GEEjJpe8ikhIbE43V7wpy2CbJILsyu81NFFTfOsJb9AwHKdE/wtSBFOPKs/Wb
         Rp0g==
X-Forwarded-Encrypted: i=1; AFNElJ8NmaNHK8w48E+nZtPMD1Gi4JluHoZ8CDBhRK278jIlv8xEUUhSxx0t4twaWxWIxaO4QuYNiqNdqE/d8IQikDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4T8fXYU7uS79WNHSMh43Z7bfFH5sTbV2yr+aoBUw50xaUBze
	sx1g56vSB3Ao0pHQpcgcR0ANkA5ekS9o7VffRIUAmgmc3p7m+BcmVdH+/IV3rSz8h5KpOh15ABi
	XdKbgPEmDw1tt3saEjgtKCXFe/pMOq8ZgffOTTuBE26upHqQ/aKR2yrWfa5UQdUSo/ZEpsg==
X-Gm-Gg: Acq92OEcwATC7Q5hPnQaxRLE5Po4liDIx5NsIGOq1iH/Ri5tqBKi7wIPcUzuVnf/CM3
	7zZc1npJF6vtt4wJpWEh5ZBiHSCJ6jKRMF2p01qQLLk+w3U3HgXKFEJuAaw/ca9fYeZh7yX3IWE
	VTq7l31XXA75ypRPdMw/OHEjbD6dvkEworHJS7SKuCialyQrSjAruWeiU6amAxZE36KG1IUOh2O
	kfWDLYrnlsSiPRG2vGRYFm99qHjQuYTWFX0RoXAba2cngobeD1cSpXi6BxKTZIIBTAY+MBw+kwA
	hYg0svoUEZ1e7HXwPyZVKu5mI4i7uQyxN7jCtvgO7tg1siTXHpIm9gaYN7h068nJOHaCDyUtvFB
	zhzjqI6HMwQoov87CaMWOKwwwMwc2Z44C/mWLb9h01KpPyNLpjqMNCUHeQId+gYQc
X-Received: by 2002:a05:600c:3548:b0:490:e196:e8e3 with SMTP id 5b1f17b1804b1-490ec501a29mr27479225e9.18.1781258947922;
        Fri, 12 Jun 2026 03:09:07 -0700 (PDT)
X-Received: by 2002:a05:600c:3548:b0:490:e196:e8e3 with SMTP id 5b1f17b1804b1-490ec501a29mr27478485e9.18.1781258947457;
        Fri, 12 Jun 2026 03:09:07 -0700 (PDT)
Received: from [172.31.99.182] (91.red-83-48-118.staticip.rima-tde.net. [83.48.118.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2d0fb23sm135494125e9.15.2026.06.12.03.09.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 03:09:06 -0700 (PDT)
Message-ID: <10091ced-d472-4bfe-9cb9-8e7def23c213@redhat.com>
Date: Fri, 12 Jun 2026 04:10:20 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/11] mm: khugepaged: add max_ptes_none check in
 collapse_file()
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 david@kernel.org, ljs@kernel.org, hughd@google.com
Cc: willy@infradead.org, ziy@nvidia.com, liam@infradead.org,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1781083630.git.baolin.wang@linux.alibaba.com>
 <2ae023e4c9f5270482c99f244af5d3a40fc49165.1781083630.git.baolin.wang@linux.alibaba.com>
From: Nico Pache <npache@redhat.com>
Content-Language: en-US
In-Reply-To: <2ae023e4c9f5270482c99f244af5d3a40fc49165.1781083630.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/10/26 4:29 AM, Baolin Wang wrote:
> Similar to the anonymous folios collapse, we should also check the
> 'max_ptes_none' when trying to collapse shmem/file folios, which is
> also intended as preparation for shmem mTHP collapse in the
> following patches.
> 
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Makes sense! There is the worry that we might have to move this into one of the
helper functions I plan on introducing for collapse_file(). This function is
very long and messy and needs some refactoring... Working on that.

Reviewed-by: Nico Pache <npache@redhat.com>

> ---
>  mm/khugepaged.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b12187709f6d..631459172e19 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2234,6 +2234,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
>  static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  		struct file *file, pgoff_t start, struct collapse_control *cc)
>  {
> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
>  	struct address_space *mapping = file->f_mapping;
>  	struct page *dst;
>  	struct folio *folio, *tmp, *new_folio;
> @@ -2299,7 +2300,13 @@ static enum scan_result collapse_file(struct mm_struct *mm, unsigned long addr,
>  						goto xa_locked;
>  					}
>  				}
> -				nr_none++;
> +
> +				if (++nr_none > max_ptes_none) {
> +					result = SCAN_EXCEED_NONE_PTE;
> +					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> +					goto xa_locked;
> +				}
> +
>  				index++;
>  				continue;
>  			}

