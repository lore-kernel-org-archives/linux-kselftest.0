Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2581E32D6
	for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 13:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702173; cv=pass; b=itS7NhBorKkHcDZHV7dv1ZI/Ee7LzkTm+/OfUSaDiZB82sKbHk9JftbBVuHoDaKWFs9rWaMO61NN/lyZuzPKywEq7pAZrkzFLefO60ZyFYXPk/Mb71RXnEbPYnf1I5eON7/tVa9/TH2oHaZyIhPkD8Mp5P+qu9LLQAjJS8SwnJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702173; c=relaxed/simple;
	bh=gmAuTwxlMWJ7OGYz8VtUGLfVc7D1t2W3tIu9G/RHjhM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a10YHetL0JKeFXhaQRNM+0GZiCtohEfx9IQJGX/RA3H0rTT+wPODx6sLr7G0zuN1Rnu5I5a9ycLGU99ePdNRSKNOyxC1yvDjEqiRCVKYNGVcTBH1HxGaRkyhSl+GtqjmfTInDiBQMvjdaZi9Zz86vjxzp1JT7Vos/P57nrikzyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t3lllMXi; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t3lllMXi"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13807d2f898so6126762c88.0
        for <linux-kselftest@vger.kernel.org>; Wed, 17 Jun 2026 06:16:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781702171; cv=none;
        d=google.com; s=arc-20240605;
        b=gxIVDelr3a/u5Fgtymnjlnw6sFtruj9y06ykt8MA/7UHQy2wH5zRaepeWV4Pto5SCU
         CqUVZ8oT8VivwTiZkrujGQWA4/CrBJAAgdpC4gTdPX6mwFUTF49NwyNug4xmQ9pCY7P7
         BxcKEEEOWFxuMLGSOy9Tzi7BjyXJX7QJALuFxYirFJUG1QA2PqqaBWD7IECq478GS2p/
         s8vHIxJZxlF89ycxNbYUhcO4bijIJg2gyVeHJyHIjLazqbjmO/1xbf2+V199fheOnkaB
         uDfqOjCygRekcehMXOuEtjft+RcYaJZNqKcqo6Rjf3Yzf+lQk2TEIMzRmSrCgJKv73e9
         J7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=fub6QquxlM+JuEtju5tAKgjI7OpBkhLjLUvWM+isojE=;
        fh=v/OKbSEvZlzZTNaBP6a42wbY4yLncwg3lHRaYTXOEOg=;
        b=N0uCjXYyHbzXhzeOu6Zw59ZPGINdxLzwRYHnpc3rVG057NFle5r4ut8yz7+bMjTnem
         G+bUW1sxPvD6qoCi+U49Bq6rbI3Ltf9RrSqqBSxu/CoPMpP4vAGvA+HOgtcVq2P0zpdU
         av3VzxbQmWYQgcDsNuy1iq8iOPiirt+AgVAQvYU1nSngzR89d+6rI4LahyBpvaqhqZag
         E2Nf7MiKdONevov54ZUKJo1TSWF7E5kFRSrgmmll1gLM81qLbvOQ9LOOLXc8QiTxoLa2
         a94IlRzjhNRcefmcd8DOZVChppjGhhNY0IudOe0ZcyiJBgezl1qgdPAcJrYfApOmhrWE
         qULQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781702171; x=1782306971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fub6QquxlM+JuEtju5tAKgjI7OpBkhLjLUvWM+isojE=;
        b=t3lllMXixpPsBSOBBpg25tZ4CJbsjqRmEBUJbzISeFi5nR1m1COsk81aoAe+unsStx
         Ialy9hkyhIyH/1uUYdRI1AWR3GwjaFnPRpMwguPZSlVAWvIPa7lsA314nvc0raPX9t/j
         yBkuysrg0g0SDOscuWrme1a7bFLu8PdjDOrIdYStKDk7eCbBy4A0k2eV6a8RyvfOrHEs
         FUZLwWSBDOZ7deOr5ga9kRSbKVDyP+F2AAPSTY/YsqmWSlJElUYqNoX19/eaM/iyTZ9C
         Xmt1w6eQN7OMoObhYl3G4RP1OoaHVBjDuI+n3hzCRu6m++TOa1iW+wfNOaoGNvZJRbzn
         Cv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702171; x=1782306971;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fub6QquxlM+JuEtju5tAKgjI7OpBkhLjLUvWM+isojE=;
        b=g+/MFb9r0Fq7dc8Kc3upiXgAfQEzyy3BTFlMGBzohncI7wGN0dhFDnAK/YVC4IYjpP
         T1qg3O0Fry2uESAhTmltEGviV+EBmFcu2UgInXWTOGn2B3nurQQxcKmixYD2Ui29iOmG
         E2ElUumtZEomvJRi+0pZZ9VmLWC9OOn8yJD1yrDw4qX5eQlh6wC81jUP4pFrxgoNKmMJ
         C6D5MuzJEeXZ5Y0HA4OcNL/hxj7rTiNv4lzdRI5iojAvpQf6T7HICD4FQXbm0cRrlK3f
         mhAoNH724NCGw5faksmxgojNK3Iq3MXHqMNfh3IBThTRFF/8fgyBq/vM8F47tVugehPv
         2Opg==
X-Forwarded-Encrypted: i=1; AFNElJ+1hBl9rpPsYUQo4uq4PkxHjzkhEEbuFYeBvasu5seZkR4sk71GTOYC1zdQWPlRsFPzDKyRr8B8LOTPpmnMFjE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw32X1IEoL9aR9diwT2j+QThMS93laxgqy1laXBhY4NagwlX3gT
	9PfVnTv8LEoZAFWvg+JXCKBQHCLNOjwfnp0laFm7BYpeLJ/notuyqt74Br9QuO66ujhlzY34ilT
	2vIEvZZ9w6/qXYT0RA3Cn8I8lBgJehLlak4uHi4qg
X-Gm-Gg: Acq92OFZhNOoHG6x3XuIIpKYi+Kb+F7tIXCwafBI1B4nNN8oFnl2bYWEoO7fRmYOc+y
	3GqfG/GidcL3HXkGmmyslSoSxwN2qDeysGyhXyTQxoThCDt8sv8p82NNDoqE4NQFJaq11zkcwfO
	AW57lIkdLz8Ok8JfeMsPTOdZ8DlNJqp+1KDjYRj4A3hireRe1e6TmUMhh8F3XRK57NeoqK2UqyJ
	Bh0UABv97oEx0qmMM3QaQWLA5cmzyTuHVINvkAMb9Ao48oDB4PRHZvmgwZiFuONDO7Lav+zPRII
	xAvRELapX18jbehwHCM0DC0AkLK4Vmaufme/rEI=
X-Received: by 2002:a05:7022:6988:b0:137:f875:c1e8 with SMTP id
 a92af1059eb24-1398f69ee3cmr1393217c88.19.1781702170186; Wed, 17 Jun 2026
 06:16:10 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:16:08 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 17 Jun 2026 06:16:08 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260602-memory-failure-mf-delayed-fix-v4-2-a5bc7db5a9b2@google.com>
References: <20260602-memory-failure-mf-delayed-fix-v4-0-a5bc7db5a9b2@google.com>
 <20260602-memory-failure-mf-delayed-fix-v4-2-a5bc7db5a9b2@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 17 Jun 2026 06:16:08 -0700
X-Gm-Features: AVVi8CeIxcUL2I1aQ_28O_B-smEVzCOJCXmIuSPuXbp3acKL7-ICRYmnGlJB62Q
Message-ID: <CAEvNRgHXJirznmAM3zf2LHJgDWpLOAWY1v90ZcX9_ytRzuAZ1A@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] mm: memory_failure: Allow truncate_error_folio to
 return MF_DELAYED
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

> The .error_remove_folio a_ops is used by different filesystems to handle
> folio truncation upon discovery of a memory failure in the memory
> associated with the given folio.
>
> Currently, MF_DELAYED is treated as an error, causing "Failed to punch
> page" to be written to the console. MF_DELAYED is then relayed to the
> caller of truncate_error_folio() as MF_FAILED. This further causes
> memory_failure() to return -EBUSY, which then always causes a SIGBUS.
>
> This is also implies that regardless of whether the thread's memory
> corruption kill policy is PR_MCE_KILL_EARLY or PR_MCE_KILL_LATE, a
> memory failure with MF_DELAYED will always cause a SIGBUS.
>
> Update truncate_error_folio() to return MF_DELAYED to the caller if the
> .error_remove_folio() callback reports MF_DELAYED.
>
> Signed-off-by: Lisa Wang <wyihan@google.com>
> ---
>  mm/memory-failure.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 2e53b3024391..3aff0c981fcd 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -941,10 +941,12 @@ static int truncate_error_folio(struct folio *folio, unsigned long pfn,
>  	if (mapping->a_ops->error_remove_folio) {
>  		int err = mapping->a_ops->error_remove_folio(mapping, folio);
>
> -		if (err != 0)
> +		if (err == MF_DELAYED)
> +			ret = err;

Perhaps better to set ret = MF_DELAYED directly so that it saves the
reader one step of connecting err == MF_DELAYED with ret = err, but not
a big issue.

Reviewed-by: Ackerley Tng <ackerleytng@google.com>

> +		else if (err != 0)
>  			pr_info("%#lx: Failed to punch page: %d\n", pfn, err);
>  		else if (!filemap_release_folio(folio, GFP_NOIO))
> -			pr_info("%#lx: failed to release buffers\n", pfn);
> +			pr_info("%#lx: Failed to release buffers\n", pfn);
>  		else
>  			ret = MF_RECOVERED;
>  	} else {
>
> --
> 2.54.0.1013.g208068f2d8-goog
