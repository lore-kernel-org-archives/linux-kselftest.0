Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7921D5CFB
	for <linux-kselftest@vger.kernel.org>; Mon,  9 Mar 2026 07:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773043061; cv=pass; b=uzJ9yuM0qFXvE4YQIOLlgAY4ekd9wsw2WK8cThXh9HBsJobNtqnhjk7iFlYcPsd2ZhvUj07lcAAFPTSciQdc2h1Qd9sUB8qouXYiklik6vk3tXvydOXg9MR5/tN+UCT9hKlKgQlnIITIxOt9X7Cmpip2i4JMFnWhfZIivA8FonM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773043061; c=relaxed/simple;
	bh=Bc5YCzZwaugc6qlY/fyP8r1uGR0PYI0Vhk0jy+TRtSM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txayP9gFIU7oqMcFH9fTwyYP1/KNJh8pPao0qWvYcLmO9mjfn8m+FZ2jorUi8VYiJ/v6QdL/44WEr9QoDp802rW1A8gg7Fl/zC8qwPv85aXIsb9dk3lj3JI0VF/tpwPS74Zj5u/mYEjPMxliBLkLshEHxAXkCF1KtKDzZvTQFrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wQQ8sP7O; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wQQ8sP7O"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56af4aad3e5so1406817e0c.3
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 00:57:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773043059; cv=none;
        d=google.com; s=arc-20240605;
        b=eKswPWxhrxtB1j33VIaJwGdjSVQqYcqsCCqkS3A0NDl4ukYKfRjsBfrm/ms5qW5zL8
         t7+Bfdrl0bQjhXXyM5JYpbAuCXjCCPi5pGYoOzYDZEsTvkymOr3K15jbP7Q8G7R3TuFZ
         sxGf1CuLJnP1SEU/J73IL0GohR5PCCkuJTaNPJ8rSeuw1CXYBCAp0+dH3sPgM7YXIH5/
         XXT20IcVEKdCMGxhypF42ibfRgG4TsmU1OAP6z6MCNIjWpLfOBdvpRlpSmDadZs7CHgM
         T7hiREf0Z7pKVxOoOj2Bn+FHm2rC8egjj3JnWnLk0+ecos4b8MTTChIg9PAoOllJVbmk
         YVfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        fh=PgXY2QhSoFCeNSVlHkI5hzHSCjlIhXQHhvuhs0SId8Y=;
        b=YtqNZ/VIedKpS/Isex3Tvr1uqGY/Dq34fwzSBJ52ofX12QNUyztGPyFXz1gMB3dnbF
         6CNmRJBUnYD86jcjXewjB0imAfxGWTDfcHN4lCzM3X+ZhkjumoyMjLHh1bQb6bFGpa27
         1Xu3GVk5R+FaH2QVw/nWl9+aHFG8sjwPJfH46r/g4cKtAdCmrdPIbnU+MyXnc30ML7Qa
         uy+kTuTW5yBE3NpJ9Nbgqo1+Jwg6I5/g1ZHmlPghmfvZfMrao1W4OI+kGrHqFBoGxPhI
         pS/YQvue6vwDG6LvivCvfjzBmEVfRwzSr3M0+3bJt0uMTDU3ujgW/WTMyZB0rp0bAeiF
         4f4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773043059; x=1773647859; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        b=wQQ8sP7OObRVcKgeGGv/EzwD3xLC5blExAfs9xMlsv9wXPz4gTY8BOntw4SjgTmNDN
         cRZQEL20ABBq7ZxLfp9oZTpp23v1pxAp5y732TxQdk8skhbNcTSzbNOB4VxkQOe+vEYT
         3QbGCZyRVGPxET4P2rhcv0Macc6trG4PottoMRTws7a2Us9OQGVoromoHQk5zZoeu5Fd
         1fiUjb4SDwZ+3wETlO2DfqSVB7fHEoT81J8viPUXHb4+2I6ZAcCuXh9+VtRsnrEhEaLR
         C2JzEkxC/jWSujXPW+/1iwtYKxKzbwiHRi8nf1xTmCbUR1n21O2CRV0XJqxff7GQpKT9
         HNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773043059; x=1773647859;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G9secbmrLeczpRPZ42gZHzPMJ4soIG7S5n6DXzNQl4Q=;
        b=O8kRTnPqTNstOdnZ0W+XCRHqllSNWbIgXp3rrzlZ09mu2dE98yq2t7Kg3RYsqbBFgY
         ZgFV7ZxB9OeYwYBHngA9a9snUTYMRFFJA8Hq5SLXUM20t1HV+FJWOgum9YPf5R55SI0q
         YyWwa3HIsX1SBngf4k9zZ9J/Ebf9U7IhFwCsFp3vePsaVLyBX33OUEA2R3ec3o7pVDUe
         zmLcxm2p7vFNZLvxQQ3TDzhZtF+keeh5ndPeBTtsZ3F98wPCSXWbnGczYVBDPNSJuVit
         FrUSYiMONilzdgxesXwQQK3cy++tkQNW4IxCeJfTDe4+9Bqa/WOon604KferNpgsgzcg
         GKLw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ijBVvlGGMCfosN2LmcMv35QVZ/0gr5H0yod62jBoiWA5nHKfceytEtdiDORGv71JIS0XzTk3EYCLnp5FESM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz06MkZjxp80ncKLTtBqyLuUh+ZX3Pj6EUqifIGPt3YSDQVQPx
	OSfldpN5Dd3qsE9FP9bhGlS4ZcrMkLVZcXpflGSOuSp7J78tM0zTuIle5naD5QUjqQfGtxE90fq
	m0E7XCsRlqQY2ejkqzWf5gsA4bq9z7lN2bSqkbugA
X-Gm-Gg: ATEYQzwCua/Z41F4XSyRTblE7oWqUf1fx+ZYwhf8RlNHcWVp+6lc6mA18WloDB9vxKL
	cii5WGm1eTwFqftiEWgVSVa8L2UCwM0K339B8vOT+iaCFm+kMx6SsFlOGamUtqpy9KRTezCt/6x
	1vznD11KIqMPP+slRuHEw7FsjFTda7LObPQJaZUfqKHucTdcVcTr836NoqFy0J7kzWQRMQnWJLX
	slGHKEHjSjUrZisBxx+otkdjWD8wkh69GFMda6hP5UNrjHi5B8PiZoZ+HrjVC475kGRAOu9EcEn
	/ZsUUVnT1i1XAwkGnEVvpwKwBq+jwnsVwP8Y1kJ0KnqVPvMK1L8VpSGi0ZydpNNbypwyTQ==
X-Received: by 2002:a05:6102:d8c:b0:5ff:d192:ff2c with SMTP id
 ada2fe7eead31-5ffe6213645mr3556252137.34.1773043058690; Mon, 09 Mar 2026
 00:57:38 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 00:57:38 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 9 Mar 2026 00:57:38 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <2s33j7wg6ehizvdoz5fggc6kfa5byrs4yg2hk4fvwvfjp7nigo@se7fhyaknqqm>
References: <20260225-gmem-st-blocks-v2-0-87d7098119a9@google.com>
 <20260225-gmem-st-blocks-v2-3-87d7098119a9@google.com> <2s33j7wg6ehizvdoz5fggc6kfa5byrs4yg2hk4fvwvfjp7nigo@se7fhyaknqqm>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 9 Mar 2026 00:57:38 -0700
X-Gm-Features: AaiRm539ncfsVFw5AP9VoOkialmaGifm5bQJ7k_NAlY4DMAWUCQTSVmir1fUcmo
Message-ID: <CAEvNRgEH5X79zwFr8t4EayDccED8i5__-oFyBZ4nb_RkX8826A@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/6] fs: Add .unaccount_folio callback
To: Jan Kara <jack@suse.cz>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, seanjc@google.com, 
	rientjes@google.com, rick.p.edgecombe@intel.com, yan.y.zhao@intel.com, 
	fvdl@google.com, jthoughton@google.com, vannapurve@google.com, 
	shivankg@amd.com, michael.roth@amd.com, pratyush@kernel.org, 
	pasha.tatashin@soleen.com, kalyazin@amazon.com, tabba@google.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Jan Kara <jack@suse.cz> writes:

> On Wed 25-02-26 07:20:38, Ackerley Tng wrote:
>> Add .unaccount_folio callback to allow filesystems to do accounting-related
>> updates to the inode or struct address_space mapping, when the folio is
>> about to be removed from the filemap/page_cache.
>>
>> .free_folio cannot be used since .free_folio cannot assume that struct
>> address_space mapping still exists.
>
> I agree .free_folio isn't the right place.
>
>> From the name, .invalidate_folio and .release_folio seem suitable, but
>> those are meant only to handle freeing of a folio's private
>> data. .release_folio is also not called in the truncation path.
>
> But this I don't quite understand. .invalidate_folio is called when
> the file is truncated (or when the whole inode is being evicted from
> memory). Filesystem can do whatever it wishes there, not just free folio
> private data. Are you pointing at folio_needs_release() check? But you can
> mark your mappings with mapping_release_always() - it's there exactly for
> such usecases... Am I missing something?
>

Looking at it again, mapping_release_always() gates both
.release_folio() in filemap_release_folio() and .invalidate_folio() in
truncate_cleanup_folio() and truncate_inode_partial_folio().

Let me try that out in the next revision. Thanks for pointing this out!

> 								Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
