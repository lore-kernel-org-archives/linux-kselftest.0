Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F2D35B125
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864746; cv=none; b=Ogizsf/NwYhQAm/Y9Y+1B3tEOkP7G25JUsJXjLKRq40IJswdtlYL9fyyInZDSMlJPDCsC9L/4Ph03DR1dcFq8MX5gNnAVaJYrp53wu4QrCKUWRzt7C/fYq9tAVjYa/eX9S27mM0uKwPWihY+QWpuDzeUcskk0CtYLOaTy0f0+Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864746; c=relaxed/simple;
	bh=/+x3NIpg89NdgGwjYj/Ur6/xfp7eg+l3YHCpEql0vXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ob5T8xFzxDIhKNWpSScj+N2MxsksXozOycPfSilh4mhkU9zG3DQcIdNbYqtkFRNjbfLYeBrE0RxYX/XW6zhfDjuczUe4jnv1BeD/yYnxjReXESY9EbyfO24sMFjQmr6DBOTg1jcsb9b3FRi12RUYkIKLfckA3h7FaOjbWJRLxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cs/h6JLE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tBTD0iRj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cs/h6JLE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tBTD0iRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774864744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ol467QNmt0DQ6eYz8EW6+Q+7C35Qnp9U6TLS9yRvFHw=;
	b=cs/h6JLErjC5s5jMcdvMGguwKsYgcan1uH+E5rx6H04RSZts46LnmhRC88WxtCSvCv9aRP
	HeO/6+VWJ7fKvkd9Ve08Rx8bJ3rw2Jaa7Pxd6KeotcR/x2Atj07HTJ21d01yazdBewCvFx
	7GHbi1CDVfuwZpHVcnyaFIdfsP2JV9Q=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-L9ItyKB5Pcu1ihzBm1UF_g-1; Mon, 30 Mar 2026 05:59:03 -0400
X-MC-Unique: L9ItyKB5Pcu1ihzBm1UF_g-1
X-Mimecast-MFC-AGG-ID: L9ItyKB5Pcu1ihzBm1UF_g_1774864742
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so461357a91.1
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774864742; x=1775469542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ol467QNmt0DQ6eYz8EW6+Q+7C35Qnp9U6TLS9yRvFHw=;
        b=tBTD0iRjLJBnzdwJdPZyy/EIuJ05FaE3oXM2xMPEfAszmukwNEigUuWoFcoBOQ5tTc
         PSuM4qFKTb5BsM9gsWPk2CLq98NXJOWNFZqdyDSImk8GHnNQTWrVWdFQdDAjtSiiAzUd
         DWVInl1JLLcX3ceEcki+bJhTy4AKy3FytgtrzjgiEDLahGIQWTD4C6Ek/ww3D9y63S7t
         8iVd+O8CTAJISMOALXjdjrSAkcdTNpqo7KLdmKDIWZSQ+83nXx3k+ZGCdh0DoMCKIInM
         F04qJqW6YgV2aLiqCeazOjaudI+yqB8u1YBP3SjZ3A1VDiYDL9m6E6O22gFRSmDj0yjT
         F7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864742; x=1775469542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ol467QNmt0DQ6eYz8EW6+Q+7C35Qnp9U6TLS9yRvFHw=;
        b=Jau3oUx/GxdNEKr8HLZ+Ha88SUa2zX4BGn9zQz2mPMqcYCX782m8s7kUrfkE2Gwzvn
         XVKsV38O85aOoQ2uxyj4uDPbtwKRdV62+WKocbJ5QaVHqpol5/RKU3idTxWDGwirfKc4
         5PioWsGRnmZ+IGPGRDQjXObp9i+Kca5F2wzG+Gn/Pak3p1x0ASsiJzx7Rm0LLUfRIrTx
         XyBA9EHa8Ge0p+FIjmQA1aSmW3PBGJxw6Z2gbIoyCWeHHvv1TPJXUiUeobCFhgraVVhC
         ZPbgJgKX8IlTk+mpPOTFRDvr1g5rzQt5S6dF23KobeHfJ7TqWnHJmsqfbgYPKRTKThMh
         eqyg==
X-Forwarded-Encrypted: i=1; AJvYcCUBzkBucCRjGKR2IchxfZBV5Q3PVbhVACN/zNgmjHVRfMPauir8ymmzTUAmEk/GwozBeWiq1JaV978IFqZ1K/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8H0VdOc7RWVPXQqv4WslXhvy854zP+MatN8zbd+cHS4zYZQ4k
	yi18ukvtG0g6VqlwZZ3aeqtqGGI1M7fGRa5GN98i55TSaFOIYtup0p7ooaNMY6bAWvfUZyYgiG6
	2tXDss0qLyKGHwtnMKb7jFVbFPtrsrs1R6aPo+kjmsUXs6DIN8oeGw87+x+MNVFMiWaAGLA==
X-Gm-Gg: ATEYQzz7nGq3hLDqxSjmfIatsdOjbT1KKCNdFH/P2TdJG7OOUv/Url1N73UKokfWGoZ
	OKxB/KTrIXKlNNMwxFcsVV2IPhX6qIRw9TR1JZgKzVFZ5LHz82xsKg9sboCs1NytP7IUJEryGL4
	bcD5meN4wW9rRwlMxDy3virjIBugVtjrIvdEgar8Ny+GMVofomIno+h3CYRZc2WbErRbNNGkv1p
	Z8Fmh0yI6ZqPvMtg+jjsYqiyoNHbI5XEOVkSbED+IbzRHEylfTAxIIV3I+2bCuJ0tCRpytSkvUh
	ktvPnYI/sbM+GAsMmTW0XZdQXs7hwMXQXnbOPlROzdzpv1ZVrs+cQVvHRIblzTgh2onltuiG02f
	AsYpFDTY+lfS+Jaclmw==
X-Received: by 2002:a17:90a:2ca4:b0:35c:30a8:33a with SMTP id 98e67ed59e1d1-35c30a80a1amr6873859a91.12.1774864740094;
        Mon, 30 Mar 2026 02:59:00 -0700 (PDT)
X-Received: by 2002:a17:90a:2ca4:b0:35c:30a8:33a with SMTP id 98e67ed59e1d1-35c30a80a1amr6873768a91.12.1774864736640;
        Mon, 30 Mar 2026 02:58:56 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d908216ddsm3613964a91.5.2026.03.30.02.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:58:56 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:58:53 +0800
From: Li Wang <liwang@redhat.com>
To: akpm@linux-foundation.org, rppt@kernel.org, david@kernel.org,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	surenb@google.com, mhocko@suse.com, shuah@kernel.org
Cc: aubaker@redhat.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v3] selftests/mm: skip hugetlb_dio tests when DIO
 alignment is incompatible
Message-ID: <acpJXRokicaD5XC1@redhat.com>
References: <20260330053915.75442-1-liwang@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330053915.75442-1-liwang@redhat.com>


Reply to Sashiko:

> +	if (start_off % dio_align != 0 || writesize % dio_align != 0) {
> +		ksft_test_result_skip("DIO alignment (%u) incompatible with "
> +				"buf offset %u and writesize %zu\n",
> +				dio_align, start_off, writesize);
> +		return;
> +	}

> Does start_off represent the memory buffer alignment rather than the file
> offset alignment?

> If it represents the memory buffer offset within the page-aligned hugepage,
> should it be validated against stx_dio_mem_align instead of
> stx_dio_offset_align?

Hmm, I don't believe this unless you give me strong evidence here!

After looking though Filesystems for handling the direct IO process, I just
found that Btrfs does the buffer-address alignment check but it uses the
dio_offset_align rather than dio_mem_align.

And, the check_direct_IO() does not actually distinguish between the two
alignments in its fast-path check. It applies dio_offset_align uniformly
to pos, length, and buffer address.

Also, I tried the reproducer on Btrfs, ext2/3/4, xfs, vfat, ntfs, all get
passed with this patch. So I'd keep the patch not check for dio_mem_align.

-- 
Regards,
Li Wang

