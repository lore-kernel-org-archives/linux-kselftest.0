Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEC73CFF6B;
	Mon,  3 Aug 2026 11:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785755092; cv=none; b=CDGBQX23SZqefTqZP1DlbYex8jBWeqfGEfXZGUeVYbcXYP7KLXajNXNEUJsDe9OoepG6lpNT0KTMwkm5iuas1oariZv1JjPntxbO93BeiNrMljsy/r7X53Jk78rjmGJg0P5KFgMZkMVOzUAmInrravEPMqWhcL1BAQC1jZTJNec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785755092; c=relaxed/simple;
	bh=Ojwgi5B7R5Lsu9A4RcMq9LFEFKmVL4apTrW214/bLZU=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PbFUCCETawWC6b6aWNv5uTK2lDmYavaNHV27iv+mPrfc8HtXkHcSH4WB7QQjzQAiTyIU0yC33DLUYFC1CqyGdn3qB7rZPOvbyE3/x51DjN5Uv9pD5bfrDprF6vwPKsk1Edq3mTgdKKTz04Ms+ui5LOegcKIWyT0eIMnMSV69LZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zsv0eghr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zsv0eghr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB001F000E9;
	Mon,  3 Aug 2026 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785755087;
	bh=q/XUfGIvoA4j3etSQKLf6FYY8dIX/sJnsTjdfUFKFOI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Zsv0eghrYdg4APgwwpdlq9jq9kFOK7+sTCaGK59gLR7Qit/5M2o1jOSlHm5BI/6gI
	 PA6HI6tIwbph8Q3kVCjcL5nlUbn4VWseplhZ4H2RY8XRS5blQpDM5d9A+TUi1vzYmQ
	 8WZHI1zEnRTe0lWxPHlzCn4Td/HeDKQgOaimym80UBnKxrm+d1KJRXkH9ELr0+7u9j
	 8zSujSmHLpXtDo8M1Ml2tcGLEmuG78etm1mOLGJgWH5kxJ+YnHAYumzmujTBcG1XeC
	 zmURBlLhlYye5VcUjBuYgOerm+ECcqSZIoGjDRbqzXZkiqvQW0oulDeCRVyGYHKBpd
	 MGI3hZ/omJR1g==
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 02/16] selftests/mm: add folio-order check for VA
 ranges
From: Mike Rapoport <rppt@kernel.org>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, Barry Song <baohua@kernel.org>, 
 Dev Jain <dev.jain@arm.com>, Hugh Dickins <hughd@google.com>, 
 Lance Yang <lance.yang@linux.dev>, "Liam R. Howlett" <liam@infradead.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Ryan Roberts <ryan.roberts@arm.com>, Shuah Khan <shuah@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Usama Arif <usama.arif@linux.dev>, 
 Vlastimil Babka <vbabka@kernel.org>, Zi Yan <ziy@nvidia.com>, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, "Kiryl Shutsemau (Meta)" <kas@kernel.org>
In-Reply-To: <20260802195254.1937477-3-kirill@shutemov.name>
References: <20260802195254.1937477-1-kirill@shutemov.name>
 <20260802195254.1937477-3-kirill@shutemov.name>
Date: Mon, 03 Aug 2026 14:04:23 +0300
Message-Id: <178575506323.1561566.1421184402954172042.b4-review@b4>
X-Mailer: b4 0.16-dev

> is_backed_by_folio() answers "what order folio backs this page", but
> mTHP collapse tests need the range-level question: is every
> order-aligned window of this VA range backed by one folio of exactly

Nit:                          ^ address (even without Virtual) reads
better to me here and in the subject.

> that order, mapped head-to-tail?
> 
> Add is_range_backed_by_folio_orders(): per window, require a present
> and naturally aligned head PFN, a contiguous PFN run across the
> window, and is_backed_by_folio() agreeing on the order. A window
> assembled from pieces of different folios, or mapping a folio outside
> its natural position, fails the check.

I'd need claude to understand this one ;-P

> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>
> diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
> index 343a15e25a9f..793342095420 100644
> --- a/tools/testing/selftests/mm/vm_util.c
> +++ b/tools/testing/selftests/mm/vm_util.c
> @@ -365,6 +365,52 @@ bool is_backed_by_folio(char *vaddr, int order, int pagemap_fd,
>  	return false;
>  }
>  
> +/*
> + * Check whether the range [start, start + len) is backed by folios of
> + * exactly @order, mapped at their natural alignment.
> + *
> + * is_backed_by_folio() classifies the folio backing one page; here we
> + * additionally require that each order-aligned window of the range maps

I don't think the description should be incremental on top of
is_backed_by_folio() 

> + * one such folio head-to-tail: the VA range must be naturally aligned,

Please spell out VA or just use "address". selftests are userspace,
"virtual" is kinda implied.

-- 
Sincerely yours,
Mike.

