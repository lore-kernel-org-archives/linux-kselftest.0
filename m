Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B24453A28
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 13:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541874; cv=pass; b=YZSViV42n0xPLKPstOA+jXP86pwl9xwhDAY66ZYqz5Gf6o+wlefihSm6UoE/0VbYbGxy/eKEUjQYcj6OaL0mTGWWbCVEM5x+KXnVWxzzjfCCYoVb4+4vluTF2WzCRMjo11wb11m7f6zhwLer43DI1nLbtESFpVO/AGOzpUrUCHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541874; c=relaxed/simple;
	bh=ogjpgBBuRJDVsJoOgismEb1l1STFPRdqrmOGMgUrh1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C9NWWMkvBrg7VG2SauGbnaCchZpry27tAy10T2CZNVX06mQlCrFjxfS2eMr3MT8EFIEMZDyy7gB3qo09sVOy1IJ04b37z0Le5GY2M25Fr1+3HSexw+oHP1hcIKrYGV+Hty4CGb832Ktn+YGBGaMNcg4A66M/uoFZIWttYUlINCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V8VOpEqz; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V8VOpEqz"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c15a5b265so229871cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 06:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541865; cv=none;
        d=google.com; s=arc-20260327;
        b=msh5w2LhACJjNncK0Kn3Tmde/ye86+xu2KCARV5tvibWnVLH8a3Gj+/3NGCmbKk/kn
         xoivobm1DOzOn+bX73uDg0D6f3h/HpaNQF/mtAXj772nIXiNSx50XxdZokrT+drdMC9g
         lYV8/THi+i6UecI+z9xbrBO2bJPsLTV78Z1ZOP7gn/uNms/ikFnbd5JLhTiF/foaibei
         00AUFLGHKgl6JePenIQ3giT1wO75ftb2xmvQf9WAB/G7MwfvvFu+cpFF9QGE9jh+c2F5
         iTqB/scZuVneyQCjzkiYpcypajOdr5woHYEl2K8+HmfNd4zTaMmQrXbT7aPW83dpnXIS
         OSTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        fh=W4H/Om7DJu6+vkgZmv6qb7/Ta1MflyoNRwmjqvCX9Bg=;
        b=SyOWCCobnU/UCdQ1bT6t/eslttwjn5d3pMQTCWwRfwrhWNdgxUIsHxhpETMD0138Gr
         6uKZS3HK3iQPloNyH05SpjPEBnBl08JnUswXZv3JMb/+Fujyjf7grfMIPqubRFhcplER
         SH80zsBY2upYpYoUyHLY6IUBSq4HpUzyd6ut5AvBqENDuQ8RMNTz6NweEvc3UjEDJ7mZ
         kNXbHQ0etaraYMvtZLxFqn7tTiTB+IodbmKh2gNPtobCeuakSNXYFFAqhpQm6K62vZli
         8l57F156MKv3bLdI3ocmmjr6toJJ6CmuQnyi0tmNjPpRFEazVLvZAXQrcVzg9g8wBe4R
         v7sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541865; x=1787146665; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        b=V8VOpEqz3osEnlzMrKdYwW/3jAtfaObPRoI1vUytjSzWtECYEFWQKBFAijoPGrxXJd
         ZZkdgrYeGrcJEDW6VvycXq6FvMVh48kDNSaCJiQLh7unhvG0PzW9GkiAeY5oA5K1yf3s
         azCh6vjGEyS2qcdzvzkWtYvF59uHSjWYSRFavJegrGrCEsM2g+rim/UGYbx8G2hFyzsc
         6JHKZgccoQAE7epjcNg0EA/rMTjL6WYBNhZ14Drt+FohEuyKlNMT/3w6ERWaZM7aQ0FY
         8QS3TAl88GGQYSFv2dX1xMGWtHy449OPlidlaNif7thiR8bspio9IWtHPMly8Ncc5fHX
         DWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541865; x=1787146665;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S2/eW8js8WPIEzN4muuCXfZ23ENIccFKrP1Pa44pPgE=;
        b=HYBC802kIAo8h2vOGhFavmDSToiDFHaLDKjzQeGQXFGCGn2NrLSgFhCxQSGiW4qXM3
         hTsUEptR0LO9zhd8asg9vdSrKa4XfotmNI1wuOTheMDnkY2J8g4az+usUS8frteLQT4e
         b0LAi16kadgf1hqlFvAWLiSYOLhdP2kXrOeW5GP40zy7h8zMQwqus7ZLI56gVB3oZ+T6
         psiaH48FH7xH8SXEvyfaxbF8uWhLL7ThMJ6361KUfAksLeckyDNVCqITuSuYV4+/sJlt
         r2WaQvt+sYKc6udfHEJDeiRYua31HOJpbqOiqSh8HiDwpo8d9Ho7ZfNWAROtUdCeyq7w
         kDcQ==
X-Forwarded-Encrypted: i=1; AHgh+RqC3OSl1f2TWdgV+xgUFI2H6gR4YCxMemwr1NgJiVAA8QG1hVZAfBTdTH+Fvcz6WYIlLZn8jd+y73lRIfATMEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxctkMTE/mcQnNLi5pvtnhiiwg3seKolkTNRd8pYQMyNGOv+3mR
	fBhcYlmgoXW/hjNHdrx+w7S+/1/3wXMDF8x8AMUXfda2yMAHTcgG7JfKhzs4FHEV5c+H84+qF+h
	d1iUzRzHlP4pPI1ICpWIjg9nkimq90GfxLQ1SUEne
X-Gm-Gg: AR+sD11DXxmKQ/h7PD0jXKFRMGAoMxbkgfpz8zP739AuNzcu4YKg7s8rD3BJkoMT09b
	tAbTePQMno1Wv+yMAXhOWQFxLu4QDVxmHmFxdpcVPLJ631ASanxlfIdWHzefI5SOLWR7CT4mfGo
	LlphBViuTqR8va1zJiw/qlJkvzAyA6ykY2TPVT53UHZFmd1m10fKcVIQeX6q6H/xNNI83GVpIVL
	9kg6grgbjMGGVczLpSG3AuNFoBSDGs/WaEpA3s4zRv7yrTfijsWncS89TgnpWr3MZIf4AKzmswl
	cOEIFll/hyiIpiCTTX2mXdkTPj8pLEaOreaFEVpGHbrMCg==
X-Received: by 2002:ac8:5716:0:b0:51c:ca9:3d17 with SMTP id
 d75a77b69052e-52d61f7a0e7mr18935971cf.12.1786541863881; Wed, 12 Aug 2026
 06:37:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-14-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-14-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:37:06 +0200
X-Gm-Features: AUfX_mzUD6PeEtmKkDfteoyWkYyMiizOHZtVOuf49kBLBevxhRMZd8gNAqxz5ac
Message-ID: <CA+EHjTy83rq0m5=QyPKmxPfFkc+kHzzuY4mV9nThdguW41Ws6A@mail.gmail.com>
Subject: Re: [PATCH v10 14/41] mm/gup: factor out LRU cache draining for folio
 into lru_cache_drain_for_folio()
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	jmattson@google.com, jthoughton@google.com, michael.roth@amd.com, 
	oupton@kernel.org, pankaj.gupta@amd.com, qperret@google.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, shivankg@amd.com, 
	steven.price@arm.com, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, forkloop@google.com, pratyush@kernel.org, 
	suzuki.poulose@arm.com, aneesh.kumar@kernel.org, liam@infradead.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Baoquan He <baoquan.he@linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, tarunsahu@google.com, 
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Aug 2026 at 23:52, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: "David Hildenbrand (Arm)" <david@kernel.org>
>
> KVM with guest_memfd wants to remove any folio references due to LRU
> caches, as it really must only allow to convert folios from shared to
> private when there are no unexpected folio references (e.g., from GUP
> references).
>
> So, to drive the refcount down, it needs a way to flush the LRU caches.
> Let's factor out what we have in lru_cache_drain_for_folio(). Document
> it, and also mention that concurrent folio (un)mapping might, in theory,
> miss detecting LRU cache references. Keep obtaining the expected refcount
> twice to minimize the possibility. For the current and future user that
> should work, and we don't really have a better alternative: we could
> detect if the mapcount changed, but it would still be racy and add more
> complexity with questionable benefit.
>
> Maybe there is a chance to avoid the draining entirely in the future,
> by avoiding extra references from the LRU cache: Hugh thinks there might
> be a way. But for the time being, this handling is unfortunately
> required.
>
> Make folio_may_be_lru_cached() accept a const pointer so
> lru_cache_drain_for_folio() can accept a const pointer as well.
>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  include/linux/swap.h | 11 ++++++++++-
>  mm/gup.c             | 15 ++-------------
>  mm/swap.c            | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 14 deletions(-)
>
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 8f0f68e245baa..e625d64c9e13d 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -317,7 +317,7 @@ void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
>  void mark_page_accessed(struct page *);
>  void folio_mark_accessed(struct folio *);
>
> -static inline bool folio_may_be_lru_cached(struct folio *folio)
> +static inline bool folio_may_be_lru_cached(const struct folio *folio)
>  {
>         /*
>          * Holding PMD-sized folios in per-CPU LRU cache unbalances accounting.
> @@ -344,6 +344,15 @@ extern void lru_add_drain(void);
>  extern void lru_add_drain_cpu(int cpu);
>  extern void lru_add_drain_cpu_zone(struct zone *zone);
>  extern void lru_add_drain_all(void);
> +
> +enum lru_cache_drained {
> +       LRU_CACHE_NOT_DRAINED,
> +       LRU_CACHE_DRAINED,
> +       LRU_CACHE_DRAINED_ALL,
> +};
> +void lru_cache_drain_for_folio(const struct folio *folio,
> +               unsigned int extra_refs, enum lru_cache_drained *drained);
> +
>  void folio_deactivate(struct folio *folio);
>  void folio_mark_lazyfree(struct folio *folio);
>  extern void swap_setup(void);
> diff --git a/mm/gup.c b/mm/gup.c
> index bde05664fe9a9..1bd8915517196 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2266,9 +2266,9 @@ static unsigned long collect_longterm_unpinnable_folios(
>                 struct list_head *movable_folio_list,
>                 struct pages_or_folios *pofs)
>  {
> +       enum lru_cache_drained drained = LRU_CACHE_NOT_DRAINED;
>         unsigned long collected = 0;
>         struct folio *folio;
> -       int drained = 0;
>         long i = 0;
>
>         for (folio = pofs_get_folio(pofs, i); folio;
> @@ -2293,18 +2293,7 @@ static unsigned long collect_longterm_unpinnable_folios(
>                  * but also to remove any other folio references from LRU
>                  * caches.
>                  */
> -               if (drained == 0 && folio_may_be_lru_cached(folio) &&
> -                               folio_ref_count(folio) !=
> -                               folio_expected_ref_count(folio) + pin_refs) {
> -                       lru_add_drain();
> -                       drained = 1;
> -               }
> -               if (drained == 1 && folio_may_be_lru_cached(folio) &&
> -                               folio_ref_count(folio) !=
> -                               folio_expected_ref_count(folio) + pin_refs) {
> -                       lru_add_drain_all();
> -                       drained = 2;
> -               }
> +               lru_cache_drain_for_folio(folio, pin_refs, &drained);
>
>                 if (!folio_isolate_lru(folio))
>                         continue;
> diff --git a/mm/swap.c b/mm/swap.c
> index 588f50d8f1a8c..8e965c8ce9aa9 100644
> --- a/mm/swap.c
> +++ b/mm/swap.c
> @@ -950,6 +950,52 @@ void lru_add_drain_all(void)
>  }
>  #endif /* CONFIG_SMP */
>
> +/**
> + * lru_cache_drain_for_folio() - drain LRU caches if the caches might hold
> + *                              folio references
> + * @folio: The folio.
> + * @extra_refs: Extra folio references held by the caller.
> + * @drained: Drain status for batch folio processing.
> + *
> + * Drain LRU caches if the caches might hold folio references. Start
> + * with a local LRU cache drain, to then drain LRU caches on all CPUs if
> + * local draining was insufficient.
> + *
> + * This function detects LRU cache references by comparing the folio refcount
> + * with the sum of the expected folio refcount + extra references held by the
> + * caller. Note that we cannot rely on PG_lru to reliably detect all LRU
> + * cache references, and there are rare scenarios (concurrent folio (un)mapping)
> + * where this function might miss detecting LRU cache references.
> + *
> + * If @drained is not NULL, the function will avoid re-draining LRU caches
> + * when processing multiple folios in a row. In that case, the variable
> + * @drained points at must be initialized to LRU_CACHE_NOT_DRAINED before
> + * the first invocation by the caller.
> + */
> +void lru_cache_drain_for_folio(const struct folio *folio,
> +               unsigned int extra_refs, enum lru_cache_drained *drained)
> +{
> +       if (!folio_may_be_lru_cached(folio))
> +               return;
> +
> +       if (!drained || *drained == LRU_CACHE_NOT_DRAINED) {
> +               if (folio_ref_count(folio) ==
> +                   folio_expected_ref_count(folio) + extra_refs)
> +                       return;
> +               lru_add_drain();
> +               if (drained)
> +                       *drained = LRU_CACHE_DRAINED;
> +       }
> +       if (!drained || *drained == LRU_CACHE_DRAINED) {
> +               if (folio_ref_count(folio) ==
> +                   folio_expected_ref_count(folio) + extra_refs)
> +                       return;
> +               lru_add_drain_all();
> +               if (drained)
> +                       *drained = LRU_CACHE_DRAINED_ALL;
> +       }
> +}
> +
>  atomic_t lru_disable_count = ATOMIC_INIT(0);
>
>  /*
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
