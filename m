Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793450442;
	b=yNQumhTyzi++UZ1482NtqF04gN/5WozlrEtb+LwwC7nyUq0aZ/3dTqwCieWY1pH4sOH1
	 YdFCJPMLJLRrpnAa7ETh/hNeXpqdFwPMusauxTfQpffGhW+FPh1FeofJ1HpvhQW59g8Gh
	 /gr6wXpKttjxzkFOfNO3Rz/0CKq2ighIH4bBE3itekJE4CqKWSzie/eBLNxFIjUBq/Emy
	 ov53BvFH+ryMQ1CMZZnvgLAvjSbq2CcE7D1GFeuyAfSMHKRj5Kq+MeuEc9XO6RM1nNr5T
	 HnLJDgJgTEb4cdjSMGe3ozTQ6psRY/AyFsKdWfU8yc9IHfiF7MI5xHB9d/AcEoRdnmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793450442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
	b=ZsTXOwtansrP1Ls//iI5DMoneQH6lfNDUE8Z5wy3jiX0CvcFHcy55ktD3VHrIkYjoGmQ
	 u6m2RpJ2sXKNQGZ9CyO/WDEJSuOpOlz36e6tkJULYO0ZxTnvudkJKGPzZo4T2vTd5XjY+
	 fYEPWxASfo/5wDeThCVrfGwoyQHXlbfygiuT9aZ9IeNayxHKGBhtR41FtXYMhzZN2PLJO
	 5t2wH+azKpugrwWsm7TU22pcLCKLKj7/FtsL4v+EeRBlk0ouns58xc8vdFsdgJXC7CwuU
	 ZmjeT9Cr+YKs9zmBCcntXddpXbZaoKMAACS5GeVmBoKbW2VZ67+vaKVWTdCXAxd6YeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy8WbEhN;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B107606A31C
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 12:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B107606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qy8WbEhN
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48dee593f18so1302545f8f.3
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Oct 2026 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793450441; x=1794055241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
        b=qy8WbEhNvxLv28vR/bD8Dmmw3fyZBPw4FeqtBM+B5UsizZTUzx99aZZM3rs9fe3wRv
         CTZvEO/yoOWb851TAoLT5y1t/fM3PEOkEhj7XSDMljPsoYR0GhFQvSoDAvAL848fzLQp
         bXVAVuNWGnESh09nncjfS3UAOqUnOMM+BYpAGuILeFmTfDugnPI7tdNKbTqyR+xJdEoO
         qozVY55bD7jSu1YAUzrqGxzH3IPVygjs60wre44jjyjwJg4qql1xoMCfI3ByE73s/83W
         F1Oy0idXYhtOytdKxVKdQqAdnF3H8/uDPNULdTTvlD8cF94qwQjxtrDErjQqSBJu5qQg
         ZAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793450441; x=1794055241;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cxqf9Bqorso0fGl5m6PKE59KMlkjDZ4/kjDJmjbnK7Y=;
        b=YI/W/tX+A85jCDk0yCIK5ODDqADePWfEkcqCgvFLqDtkXvQEiCG9x4GOYFquwZBppm
         OYYUGkb0wo649vsaz4aztqhyNbAO6mHKlZ24str3FMzfR7p/nr9bb84WPS+Cr38aOtWi
         p0iymrcwN30aOBSMs4EVihlIM4diDy5m3Yvg1OLcKlQLIrsDf7taPLZ1CXB4NsU7gCEA
         k2oxwt5BAt9jdhWa4E7OlBxMrKXiIcqOr1N6A37H/5Nfs9egbMaXRzTZz8uRbUvlgngg
         6ruEU0N9ot1zunhOaY7NJwVkrRcn9h/TUiI6MrjugTmAARTddcTpEL3Bcg/WUxQYbMDy
         YX6g==
X-Forwarded-Encrypted: i=1; AKwUvBzcbOKpCox3oANBs8KAXCLaRIcA/3j+DC9CEOBnhLx3t5ex//xqmcxuCEyZ4JwZT8eZv3duYM6/lHVC/jACkH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2Oua7fYMkGxwcv2H4gfJhSpscymyIBr8VIVtdqNc4iUEytd3M
	rmj7VpE8RJ8vzYQSR6ch3941d7Gnp8t/Uq9LiGnxcFLbARGmEshSY0QD
X-Gm-Gg: AYBFou0JXcCmrYMY62UgX9/2smCNs8l4z1aNmTUzrY8Y9WHXciBVYEHlhaUPCAwURq3
	TCbAT9YqKgomH2QDJqa68ON5NWyRImXiU57HCeT68O9lNQ8OJG0FSx9y2WuzrGVqc+HBIzG276Q
	xA8Gr5nOmYPT5+NWsWzhFYzrwrW8Ar+TW9akxOWOnbISpEfHWmoafCzYi0uqYlP/uCGbMGtexgM
	7senRpjIjWhCx+tE6f3FtY8MaJ0EM4G0ToxgBEafP7KZbXCi7opz/KB/fSvMKnzDC4dOVjJTlUL
	xwiR7yjtmwDcH6DpFiDH9RoD351n2/04ULwGsl5PYdkuOD0zw668+hs9bm2N/y6ZnyZQQ6ZCgQd
	naU4rZrZqRojr8cotW22sSPW8bXX8seYiwncoiBeVGXBS6Jsw8YmXdusPR/dNK9c004au1zWi2K
	lJKjy+WXS266rlmquNM0XEzPPThs6ZZPv0fG8WMrn8oeYu1byCANljiVe58inNVZ6FkshGqfJ3n
	IT3GlekYmaE1+xPNgjZi5rVzXC4PCBt+faf1S5WlrcBQAGkGbgVwdiBmREDzJkmBxlckekc8Ytj
	kuvkhmZOw1wBNp1AgftOjhQC/HYLLDM2416beYXDTcIcHA==
X-Received: by 2002:a05:6000:2c0f:b0:48b:68:594a with SMTP id ffacd0b85a97d-48e6e2e7798mr11167496f8f.12.1793450440315;
        Sat, 31 Oct 2026 05:40:40 -0700 (PDT)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm9294444f8f.26.2026.10.31.05.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 05:40:38 -0700 (PDT)
Message-ID: <57717da3-d309-47c5-8c1d-d4686e8fd8a2@gmail.com>
Date: Sat, 31 Oct 2026 13:40:37 +0100
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
Subject: Re: [PATCH 1/2] mm/userfaultfd: recheck WP registration in the
 hugetlb UFFDIO_COPY retry
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Peter Xu <peterx@redhat.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, stable@vger.kernel.org
References: <20261029221129.89068-1-azpijr@gmail.com>
 <20261029221129.89068-2-azpijr@gmail.com> <auWz5tAzi0p6NMou@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <auWz5tAzi0p6NMou@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/26 10:24 AM, Mike Rapoport wrote:
> Hi Jose,
> 
> On Thu, Oct 29, 2026 at 11:11:01PM +0100, Jose A. Perez de Azpillaga wrote:
>> mfill_atomic_hugetlb() drops its locks to copy the source page with page
>> faults enabled and then looks the VMA up again. The retry doesn't check
>> that the VMA is still registered for WP, so if the range is re-registered
>> without WP in that window, a UFFDIO_COPY_MODE_WP copy installs a uffd-wp
>> PTE in a VMA without VM_UFFD_WP. That is one of the leftover uffd bits
>> hugetlb_fault() has to tolerate.
> 
> The "leftover" sentence will be confusing for future readers

sure, will drop it.

>  
>> The non-hugetlb retry goes through mfill_get_vma() again and fails with
>> -EINVAL. Do the same check in the hugetlb retry.
> 
> No need to reference non-hugetlb path, just describe the added check.

okay, will do in v2.

>  
>> Fixes: 6041c6917903 ("mm/hugetlb: take care of UFFDIO_COPY_MODE_WP")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> 
> With those fixed:
> 
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

thanks for the review :)

> 
>> ---
>>  mm/userfaultfd.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
>> index 3b71712edab4..a70ecfc8a998 100644
>> --- a/mm/userfaultfd.c
>> +++ b/mm/userfaultfd.c
>> @@ -810,6 +810,10 @@ static __always_inline ssize_t mfill_atomic_hugetlb(
>>  		if (vma_hpagesize != vma_kernel_pagesize(dst_vma))
>>  			goto out_unlock_vma;
>>  
>> +		/* The range may have been re-registered without WP meanwhile. */
>> +		if ((flags & MFILL_ATOMIC_WP) && !(dst_vma->vm_flags & VM_UFFD_WP))
>> +			goto out_unlock_vma;
>> +
>>  		/*
>>  		 * If memory mappings are changing because of non-cooperative
>>  		 * operation (e.g. mremap) running in parallel, bail out and
>> -- 
>> 2.55.0
>>
> 


-- 
cheers,
jose a. p-a
