Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF333AB274;
	Mon, 27 Apr 2026 14:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301168; cv=none; b=m0QzAccsrlhSAQEciASSoD09rq7CoaUoCTd3Rg18Pj3z7gIEksfXXj0JyHQOS7KNd+f75UEFarEE2IlN7l8ydcQ0uyFhht1RabFz6eLTCJRjVjJu2wM6rocgcms46iTDIILegN0x+NHX1Yd5RbVpAjbz58V/b3Qtl+vLOFyxbig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301168; c=relaxed/simple;
	bh=9bOQyceFqVVaiIYzsp+CzkVSPcb894AUd8r8NRaXx3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4BX6mHeqzWUoqqhAJnEgfpX/sDIb4QFJCf/9UIUnAPlLTh1pHkwJtGp2N5witAWJ4Vcr1m9P+bsmyM3fQ1nMGJP29ktrY5aW1OWoDmmAKvYVFt6kDoUs5NIF7q1kK9JjRXJsFeY/1AJdePT8XAJUlnsgq8tvBJv6vZrhzEvPy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=W5Wp1neS; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="W5Wp1neS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8SUkHRDbaC9aZSa+oEHyg1Tzg2ppQcm4MIPmCZq/6ek=; b=W5Wp1neSmz5WcLXieabX6NdOIa
	/vIMKR3XDwBY7vq7gRwuR4TKoy35qj/UUZ0zgGzJ+TQH87QwodOzx3msj8XbBY3YL8TI/vTQlsEcm
	q/yJ1o902d12aYqnr4+kEkLg+zkuyZNKMDrW8KOwBOxPoohzsRjkRBVW6wD3Gn1uOlESQf7hqBbMW
	JT7RJjxrMTKBekEc6MfeLPKnmfWHsJP9jJcc/EMyMVHBprz2sOxG3FgaFFDnNgab8aX9k2AKpXW2m
	kww5UFBHZ4GW7aj7c/oJMwfgwxnfvEa++1Dt5uatbhtsx/DrNtScv024D7pkGoeL16hdhnYczFseu
	iVigaT1Q==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wHNDS-005YR3-2h;
	Mon, 27 Apr 2026 14:45:43 +0000
Date: Mon, 27 Apr 2026 07:45:37 -0700
From: Breno Leitao <leitao@debian.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: linmiaohe@huawei.com, nao.horiguchi@gmail.com, 
	akpm@linux-foundation.org, corbet@lwn.net, skhan@linuxfoundation.org, david@kernel.org, 
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 1/4] mm/memory-failure: report MF_MSG_KERNEL for
 reserved pages
Message-ID: <ae92WpsjxQ71BE9Q@gmail.com>
References: <20260424-ecc_panic-v5-1-a35f4b50425c@debian.org>
 <20260427123330.92847-1-lance.yang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427123330.92847-1-lance.yang@linux.dev>
X-Debian-User: leitao

On Mon, Apr 27, 2026 at 08:33:30PM +0800, Lance Yang wrote:
> 
> On Fri, Apr 24, 2026 at 05:23:59AM -0700, Breno Leitao wrote:
> >When get_hwpoison_page() returns a negative value, distinguish
> >reserved pages from other failure cases by reporting MF_MSG_KERNEL
> >instead of MF_MSG_GET_HWPOISON. Reserved pages belong to the kernel
> >and should be classified accordingly for proper handling.
> >
> >Acked-by: Miaohe Lin <linmiaohe@huawei.com>
> >Signed-off-by: Breno Leitao <leitao@debian.org>
> >---
> > mm/memory-failure.c | 11 ++++++++++-
> > 1 file changed, 10 insertions(+), 1 deletion(-)
> >
> >diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> >index ee42d43613097..7b67e43dafbd1 100644
> >--- a/mm/memory-failure.c
> >+++ b/mm/memory-failure.c
> >@@ -2432,7 +2432,16 @@ int memory_failure(unsigned long pfn, int flags)
> > 		}
> > 		goto unlock_mutex;
> > 	} else if (res < 0) {
> >-		res = action_result(pfn, MF_MSG_GET_HWPOISON, MF_IGNORED);
> >+		/*
> >+		 * PageReserved is stable here: reserved pages have
> >+		 * PG_reserved set at boot or by drivers and are never
> >+		 * freed through the page allocator.
> >+		 */
> 
> Not necessarily. PG_reserved is not a permanent lifetime property for
> every page that has carried it.
> 
> page-flags.h says early reserved pages may later have PG_reserved
> cleared and then be given to the page allocator :)
> 
> At least some drivers also clear PG_reserved when releasing pages they
> marked reserved.
> 
> Would it be clearer to say that pages with PG_reserved set are not
> currently managed by the page allocator, rather than saying reserved
> pages are never freed through the page allocator?

Would a comment like the following look better?

  /*
   * Pages with PG_reserved set are not currently managed by the
   * page allocator (memblock-reserved memory, driver reservations,
   * etc.), so classify them as kernel-owned for reporting.
   */
  if (PageReserved(p))
      res = action_result(pfn, MF_MSG_KERNEL, MF_IGNORED);

Thanks for the review,
--breno
