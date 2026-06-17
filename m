Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2363F1AB8
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702341; cv=pass; b=HEcw+q+Dqtl71PenKXfHzj/JiCE/j0Pq6XdUwPgOqCQu+Nuu1kVEFd5WQobYrpS/esfPmYJ18REZ60dmwEvo96yjglrroAIK+bXPDn94NnWJbtvrKJuGYnfsk4IsO9Pat2xjbLTWLeYRaXkj0xOuuesDmPaQiwVnFMyvWJaQxko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702341; c=relaxed/simple;
	bh=e7bU8MJb5s+ub36roUmBLbpiDK10cOGBN2EWwm2KP4E=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j9t+LeaMiA2pfbz6I9MCuudg/AhhjZGaP2Lrt9n1zApPcu4ozwLo7caDn1Q4p+FWt9N3yp5njYVrfcPUBeKJIQ434grViK5sSZ6OWRIm980Tbbpgck/pfJrsmGKcs+bhluSLoP4bfFizdoWdiBkqhW5fadXkZQqpKYxksIiJH34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CYxJEKLl; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CYxJEKLl"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1363fe80fe8so8205949c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781702339; cv=none;
        d=google.com; s=arc-20240605;
        b=DECoio61RiDtIdWFD37ZZlVaJeLImHsenfRQM6LiBuohNE1Ah7j/NzMM43lole3uZZ
         aSCj0umqYzlDe8KErF5T4zuL+LK+YEVtM30kpBMXDQ5+6cQTTUFjL2azwxnZJLdjw6JC
         JK30nHi7v19/1bL6yZ8XSkhRPIJHWLRiTwKCespV5EfR0qGQrYkso84fTNgUDB52mXFZ
         anIOZ77GL/OmCl/0nYHqTRaorQe60tQyJc3ReDSYFh5y2lRh8D+mSFeT6goIGqk9Vyyi
         Znmerp0D8EM3F2A+4llCNf7ghTmzHwgPcd1NfMywHHGTBg6nsvmQTeWDh8Qy2xu+kk5+
         MCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=TXAYl00t3pBUlh7QAs2TCcfP6P29I/Yz3jzTX2aYa7Y=;
        fh=qrsH0GxjQy9Aifkr+a75Waa/icCvAeSzGo9opgWK2so=;
        b=HXmvVwRsdE73Z+kdej6SI/CjD6LaFOw3HIspBjiV3x1mE8U3gKzl2t0qLiYpjr6rMr
         rK93eftYjVDNsk4nS5FfkcRvwMjaDpnMKCqrb73bYzJ7NSFVSqbZNtPz837ImoIh6tRS
         ONN9ibNZWIYmSOdOeaZ9c1QY0wpHOziYMsQv99ppnIulpce65LZNtbFyQXpu/TddrDfK
         qdN6ycNqQH8zssWQ7b3DJZN/3AwvqbH6H5SDYL+xRq/WWFFjnBLdnz82kLq5jEWeruVM
         TUXBRbCRuITMhBhIX/rHLCTGv1ISC4m3sFKD96SAtt/DoJPIhadOYRmoPJ24nJO51wBy
         5sCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781702339; x=1782307139; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TXAYl00t3pBUlh7QAs2TCcfP6P29I/Yz3jzTX2aYa7Y=;
        b=CYxJEKLlaHA7qaL362OFwfsiLymTqSAKK9bclU6AEHeTJUxU1bLzZA6g2XB6LF2IPV
         jFzbK7ikFrJ9BFW0iPve+8385Pt/xl+BOI8UXDkDNN6VdEoasWbkvU516YIV0qdxuvk7
         PpHLP59QoksY9tGuURpcfrPmECv5BfQnUVAP+kix2m5frMSV2xmyN88E4h0gRlbzhNte
         sWazsFGeqZT8a0e2CYGNX8SzPFDKj1qXxM9aGfdpeCQCA8XzhpSNbOP5sI4h5I6HF7nf
         pIB+fDjr6DWP67i+XbZSbu7varKGTcVq5Abwh+5hr0JruO42uV9/Gva4vuOhR3XV0xKy
         iqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702339; x=1782307139;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TXAYl00t3pBUlh7QAs2TCcfP6P29I/Yz3jzTX2aYa7Y=;
        b=szAxYy4QQrviSKzOGeaexlhafIn5S8mzNqQW/6vuDbNuFvodRwR3R5KuQ8ra4kUjYM
         7msZnq61mtPf5VL406X56HO5PD7GhAdGcs4oWOzPl9CPyjXz0ai5me9SC7dy3GVmSxaj
         R9XtTIda7leJNff2n7pqKCFj6zRMd48vuuYJ6bVzDraqQPLTYvh9NxjPmgINz/GvKgvZ
         jRMOSrqTn0r21UJPh4Qb1IwAl6RXwrMncj0kTfj/Z2WC4hdh0FQT/aUsML7fcgNc8v8h
         tl6PMdPsicOv90M74AAIsqXn/yBQc98pmUqVfvsJy8WhTz4y6CWQ3SL1CxunWEb2kAvb
         6KYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Jav35P1XF33LF8oqU/1rY2irBiDHsuWAFJ7XaSfsOrnWTmf/xz4fodNooZNDeJSwpPvhI6TXNoWW0w/tdJe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHg5iNMQZQ9zN0Z+taf82+ljikaDURVFl8CkxQOm/nqCdtF0MA
	hQd8Ej7MgzFGz6+12yRm34qL3lmDNo+o+njM72omvFmmAY+m0Y9b709W7tSS+Ha+cdP7NpEe9/f
	xeZb44O4/QF8w+qEvUfouQx9jGN7qm0bKOMvGguKQ
X-Gm-Gg: Acq92OEgiCJJJV0MO3QsTH/aoiA4S22vsB1SXVUwuYUaTfXISzGjgXjL3lg+o/XBtZq
	+hfZMzmh7f0Ss7501qjaPGfkXsae3qjV6gugEyI6jPSr1zATcq7kGCKzjaXs+QDGoL74+olvKJk
	FzFFSEicYF/NERkGQ9iqMuospaVlKh6/kWPgcvvco+PMlUgug6BxETpaueUc9pA3xULYUIzdX5J
	jSXHvNuVPMjdbLqSMl9GoGMEScTS7hEHzPzMDgV7FoJXHe9nQcdbgoT1IUOfowJewOmtb97c5Ac
	tCEuLMqbiwX8u6YLivFCbqOsYgdpcs99l5jGE68=
X-Received: by 2002:a05:7022:f8c:b0:138:916:5179 with SMTP id
 a92af1059eb24-1398f676bd6mr1477937c88.14.1781702337644; Wed, 17 Jun 2026
 06:18:57 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:18:56 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:18:56 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260602-memory-failure-mf-delayed-fix-v4-4-a5bc7db5a9b2@google.com>
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
 <20260602-memory-failure-mf-delayed-fix-v4-4-a5bc7db5a9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 17 Jun 2026 06:18:56 -0700
X-Gm-Features: AVVi8CeEQPoqGj6Tm5lqS6hWOuYsOw4ghr_S2X43a6pbnMXpEzjcnbUm6R99GZE
Message-ID: <CAEvNRgE-karT5BYOCePr2mM2hu2AgQ39qhVN6hk=NK+XWcvAJA@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] mm: memory_failure: Generalize extra_pins handling
 to all MF_DELAYED cases
To: Lisa Wang <wyihan@google.com>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: rientjes@google.com, seanjc@google.com, vannapurve@google.com, 
	michael.roth@amd.com, jiaqiyan@google.com, tabba@google.com, 
	dave.hansen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Lisa Wang <wyihan@google.com> writes:

>
> [...snip...]
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 3aff0c981fcd..dcc56bedcb28 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -1052,18 +1052,14 @@ static int me_pagecache_clean(struct page_state *ps, struct page *p)
>  		goto out;
>  	}
>
> -	/*
> -	 * The shmem page is kept in page cache instead of truncating
> -	 * so is expected to have an extra refcount after error-handling.
> -	 */
> -	extra_pins = shmem_mapping(mapping);
> -
>  	/*
>  	 * Truncation is a bit tricky. Enable it per file system for now.
>  	 *
>  	 * Open: to take i_rwsem or not for this? Right now we don't.
>  	 */
>  	ret = truncate_error_folio(folio, page_to_pfn(p), mapping);
> +
> +	extra_pins = ret == MF_DELAYED;
>  	if (has_extra_refcount(ps, p, extra_pins))
>  		ret = MF_FAILED;
>

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
