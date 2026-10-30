Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793382029;
	b=xPmRu9stWBjh+7LyWSUEROD5UQCsVxQF5T7dZNPl3gBGlt4bW8yDxHMOpc5FlMEKQBjc
	 HmKll7rGnYKEDXY4ux/5AMU8tENl8Okmcm4j0NpbtBO6U53oFAy69dZR6WtbsfsOUtmBO
	 k3Kp243/F/sjUfGSykMyvS5PjGidkctjFrMj4/HvIEC6gBVmT8zgUoxUN52e0XdiFHWHG
	 Hy79YBjRngQMaYwiRhYR6HEnLVhPeJwD0ngb+7SXagQRsWw+Kd9p+XBogDzb15pEd345r
	 3Y7KgW3QSn1cFnq+aVu+fJUu01HGQavkimOnCyrjdKoKkQkAKj41Bsgi3tnGC9MJLgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793382029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
	b=ofEyVvs53kI3NJ55Eql+ArJh7iufsGUn+lQC11hRTKZ1/Bs8tYgWeHiN0SC8G3hGUqtn
	 cC8aEtbODRbMMiffRHWyp9gEsdmdAPVKRLUMwWtBhY4FYnfYQrykpJRE9TnW0yCDvyqAW
	 3K+E8VBucsJFFq1trUp57qziN/ywezH0bou1/FFJ8UDIY9GyswPlsrS9u7LMCKpqLusbe
	 Ft9KBZec0FZSF9aQ8XmCuKbM71EZ3DgUFe2DaercfZgCiLz6JMgndSnnAmgZDZ0nTqi4t
	 OBi4kkUTRgXaSZdBTVfrm6R3m3oSTldwOBfY3nLkMc746wOcsObmIHXPM2jjX1KOu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFGIcN54;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21AD606A31D
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E21AD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hFGIcN54
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9f6a16afcso2035ad.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793382028; x=1793986828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
        b=hFGIcN54HxCRWLwn+m1Xl4QEQDE5/cl5x+KQSXQJyEMT7wiQkby7aqDXSx488THYoh
         f5kvplnhqeV9H0k5RQGHt7kvJo1UxJbeygdqm1NlxybFI+IKbH5B7sosuiPbjK5SSmUx
         wfmzHB3MKh0KJszVevX1LoLIVaWH1EN5bVX41aH4OURNcHbwHQxwGDqCkdH3LymLeTv5
         wfhlyhEtPWyaNF3C5seBSdczetIWvRQsxsEp97tep86ff1DRBcxuV80CfWJKgoaMWYjs
         TksrH2ngp09wtcLUCyFJnya0jRB+MDR/3mR4e3RHUskJbg9rjzdXrJ5mEBF4fwPsGYs2
         gUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793382028; x=1793986828;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHjT9rUZ9mZdmwhmeKnY8H1ENZyPrLJ45wFlFoMuMrE=;
        b=k/+zO6vuOnMYg/Q5fxpdgSoEtkWqxKKfeMtlmemSjJhTiKEYrbmxr4YzldxCWOvtZq
         gvmkLoHhkx5+UuKbgUhkGbVabfclcwHIuDvrvHuO88f9BDVG5YY92+L4cCXbZxgmwyz5
         tqfUSM4d60VS31q3ap5+uYdLcVp5yWBn7nwprwXiD7B2aS+lQEew+owcLP01qOmb2Zm6
         q95GHNN9lpUJ3OkpJj1oR4T/IG19m+BG7t4R6iCpFDI8GKUQrZ7n15v/sXzP9f42+NXr
         ZBIr5ZloCRSZC6befus6wzKDBzufdfbRdBsjKkZMuVFeIYT7xJV7Rl7bCNmkOIzdLEJL
         h8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxObzRWx0iHTvtkKwFnqkvBYSe3Jw1vHLvVc5sINFCp+xx5b6ycLpiuP9EHEKnwH+pSnv+6zZ3d7sOzRB2NlH8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/Zz86YjC8hCAMP79ynlvXNrlUBW0q1dq4yIYmKf1dsNZAXnY1
	73zworGHkuVyimUjUKVB2XU3fcboyyhtKgyX0rcnRVjWl02JagY6zRsqraUXHk5YeA==
X-Gm-Gg: AYBFou144DnWX/ygRHRF0b6RYYSmWzbQ3nbu4fOwqTVi8YSFfhgE8fhb3NAGpOeAd/m
	rYqywENZ22Naa4YhES5PB1mb1GhfxnxezyW/7LhMrhe+xuL1GIuUEjqXDicxOF+kzmNXEbg9Rg7
	eUBNznlwHoyCijBtkg0hX8W9faryVGtaZgqzNdGo2A+uz7eafpeg79VsXtmbGTxYAagwnVvGso5
	Ope3URG2jvbbAcY17Feff2+YcSnyiH7Lvd52wwuyuBpSE8KQmJ6BGA3BN5TzvNabzseEsKtAltm
	vkM44ARx3m4WCvGfXTLHtzV9SkfUK+1Xq7kOl1SxBlJ/UHieVyFVgypXs3ciqov7wOM5Gea0wWs
	pqM6GGxijlFLe5+G85mXlDL6w02q+3YjACtfyDjJk6PMAYODI8Un3Crway1nloQx6PZs4Bo2i9u
	xm3zD/4nLPPakLUk2yaS70jTLfrgYvAR0nvlOSMpEqX10yO7qLmSP1fsXkplxmrZrG3dioDfWff
	9ErTqxnIgwpNb3gDlOmCsLHVy5PukJ+zgFOIiPp+QYNabaGJLudC17VexSLdnyRzNc31F5ahV+o
	XT6bICCfCIF52eAAhQYmhpzlYdX/xkWYv1UyQrsS3tgUJ7tyRK/wtsH0nmT/PBH2YbwN3+B/bIE
	Lw3HPR2N1qPu+Tbjyr0ngXw==
X-Received: by 2002:a17:902:dad1:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2eb1b6c6ae5mr11320655ad.2.1793382027347;
        Fri, 30 Oct 2026 10:40:27 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada9aadecsm286624b3a.48.2026.10.30.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:40:26 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:40:22 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mm/memfd: add F_SEAL_PUNCH_HOLE
Message-ID: <auTR9SnDLsLVmnJ7@google.com>
References: <20261026220546.3114241-1-skhawaja@google.com>
 <d4891333-43ea-4d74-9fb9-6ad8dac1a446@kernel.org>
 <20261030121113.GB3889730@ziepe.ca>
 <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2c7aa5c1-3af3-4654-b244-1257d05c9d45@kernel.org>

On Fri, Oct 30, 2026 at 03:39:40PM +0100, David Hildenbrand (Arm) wrote:
>On 10/30/26 13:11, Jason Gunthorpe wrote:
>> On Fri, Oct 30, 2026 at 11:20:30AM +0100, David Hildenbrand (Arm) wrote:
>>> On 10/26/26 23:05, Samiullah Khawaja wrote:
>>>> This series introduces F_SEAL_PUNCH_HOLE, a new memfd seal that prevents
>>>> holes from being punched into a shmem or hugetlbfs memfd while leaving
>>>> the file fully writable.
>>>>
>>>> Background
>>>> ==========
>>>>
>>>> Drivers such as udmabuf and iommufd (via IOMMU_IOAS_MAP_FILE) use
>>>> memfd_pin_folios() to pin the folios backing a memfd and hand them to a
>>>> device for DMA. Pinning keeps those folios allocated, but it does not
>>>> keep them in the file. If userspace later calls
>>>> fallocate(FALLOC_FL_PUNCH_HOLE) or madvise(MADV_REMOVE) on the range,
>>>> the folios are dropped from the page cache while the device continues
>>>> to use them. The pin holder is never notified, and from that point on
>>>> the device and the file silently diverge.
>>>
>>> We have the exact same situation when userspace maps anonymous folios into vfio
>>> and then desides to MADV_DONTNEED the pages. Or any other memory backend that is
>>> used for such purposes.
>>>
>>> User space must not zap/punch things that might be pinned elsewhere.
>>>
>>> That's not specific to memfd, udmabuf, iommufd or anything else.
>>>
>>> I don't see a reason to make userspace (that should not shoot itself into the
>>> foot) a kernel feature it must activate itself to not shoot itself into the foot.

Agreed, for normal use this is userspace's problem. The seal was meant
for the kernel to cheaply verify at preserve time that nothing was
punched.

>>
>> The issue is live update doesn't preserve those background punched
>> folios and now we have created an UAF attack on the kernel across
>> kexec if you don't do something about it.
>>
>> There was some notion here that with the right sealing flags we could
>> tell if everything was 'live update compatible' and then know that
>> these attacks are impossible.
>Just remember that there was any hole punch and refuse to live update this instance.
>
>We could likely implement "we saw hole punch on a pinned folio" as well, but I
>don't think that's required initially.

If I understand correctly, you mean recording on the memfd that a hole
punch happened, and refusing the live update if it did? That would work
and is much cheaper than what we do today, where iommufd walks all the
mapped pages at preserve time. For truncate, the existing F_SEAL_SHRINK
is enough or I can record that also on the memfd. I will send patches
for this.

>
>No need for more shaky seals.
>
>-- 
>Cheers,
>
>David

Thanks for the feedback,
Sami
