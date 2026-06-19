Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41A1370AC5
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781863842; cv=pass; b=iOaBPb5CWgn0niXD8pIgj0t/Wtes19GyT/VXRRdCf7j3dTIDYSjn2slygxb4iG1enCMR5MQmB8vriWlCJXlK/A5ylt+3HY+/IawviRcsHhKA1uw1AB7BPE3fgoWphuJa63KiOWw5sE8eazf5iVOZu8/5HygXMbXBSPYTtIzMTiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781863842; c=relaxed/simple;
	bh=BV+WJdPUZX7SWJL6VMcYgh6IoDynAjqVpnJR9RDV5JY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dLBLCRMKn7DVXWVBERPyGfuVfrCoGIjSEtZSgaEga7sTAlQet66ZsDqndYkqxH9m6KcUjqkTplzUtBbUendTyCwDSgdlHJawSVNsV3hXumROaSpi7c4eAoez+6ASlxHVtDhE+QueAqRG3V6jISUBj2Knl4H7rzZ0ei1W6OvQ2a4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wRylDAur; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wRylDAur"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5177d1ff061so138531cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 03:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781863838; cv=none;
        d=google.com; s=arc-20260327;
        b=NqVYzCk4MDB3xCZvdLB4LSgRMMM8JySKe0HiLvtJfSdfpqEhTQTikNlBmcR5nbF+Bs
         Rq4nKnn1ZZz/mPhVLGzzZoG+OoRrRviAHq/Ts05bJC4+egMohTi3sW/wn8kelldsEfDP
         9E6xu/WuGvKKN9BGVlCNy7/ynG8q7wQ4X9JAsIJy+DeAdvNvzyUXpW4D61NFlVkOf/Un
         hAYQtQtMzTtFWQrX3JRAbcSJaxgTQQic3sDW53FRrvKhut96cSVtnMwhfRxrK9DqyUA4
         SBxRcsoWvf3ceGq8YyEJtKxqoEX6S88DvDTbWtD2Lp6ZuKXsp/1RkKMLHsNAVgjRPkFj
         JXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        fh=FetgN1U66CGpyNwhO/j8aTFYrXccHrwIdMouBo5RtPA=;
        b=slUkYkRQEPPqKNIVOgxVa/MqEdzyxeJ5xEvFFUPTt89JdYhHLrrUmYmedmW2tudJI8
         MJeWJIeir+WraHfgMwM5419+pB04GteNkzgm+Q4/+Lfcr1xLyiiOKJUoowJ4wGUFSN1H
         8fVkl1MpX7Y95HnX502Jm8IhbRrsSVG2hTL5KVQc7GcjoBdcQucA87kUbt37HWzwbFCN
         9dcXrb30ue+bpGIT/vcKfuhQOzPV9bA0JdZooDNmtJ+tmLchky1lmjGL3LnpyFF3kixs
         anhsFd6o/QuHz5y0NcRnMxoLy+cWh8jd1lIx+1aL08BL9sNvp4N6rTDuozG4WHsmgNLE
         fuzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781863838; x=1782468638; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=wRylDAur3F7Z4m64R5MYoCOVFjm9HnYTxfqBffHxRCg3Clh0abeRnjnAYrtK+d+4Hw
         nwrChDXTmIpU42pvkzmf8KW4Ka/z1RBN8GhzqkN4+WJNlYPyhgGdoDLA2VB1bpKwSn/1
         vVhVp/5gqUVbWGHtzJSbqXh5J4PePTiZKjRHeNasWnkSZqP4N94sUXdqlmIMB4ScdwU+
         72sx6qD8qbKmWxKOW+TJPOrTo9rGDwuWv48MT+zKHYfMG8AGXXy0JZB3lUPanfYO4YbX
         26nX7pn5VEZhLQRAT3YzCu9sOaMk6kFYrWyPHNjT4/06BQndanoTPoeuCBfwCnN249Qg
         HgOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781863838; x=1782468638;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RTbB12VLXQ7u+hWMaqy6RpdQwZfV/8Fq+ivaXV4AweU=;
        b=TtMDG8+FzxhfBT/6bSQymM8RycvXhrvh9IRpGF073Exuj6zZNyTt7tZ+UE8dN+lK4z
         pI08BzRdl2jNfphuvSGF/RM+8OJPybj7Nj+atTKSivrhRHkKE3qRMXGoL1NZZsOX7jUW
         x+/IvsE0MOSzvjjH32wg40U+KeYY2bSfP0ZUdOyuH49du4aYJMPh53Npxuw89mQjwmYT
         ifxVNATzpcgq+vQFkWWlnLe8h0wnaiG18qGRbTsiVZ5zp4L1qVwn1+gug+iwob5+/oul
         HwUteJatDQ9Y9tqgM0QIOh038jvNlm5nzgPGZSxo87v+jl0PXbK6Mmq/HMPUroNNNw4W
         qpxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ejas0Q3KOlR+y5RPqdcRUTnLBi7J3DxTplWJWbRvT4gKJoXleG9KbifVr5vurI5mAzHCJTA2dUi9IT2nNztg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPljxANo7mjH4hjibzH5Z4v3gZ1xNJLzte+5B85XFn68ZoUc2w
	edvdTsseX7pLa1xN6wpnUKP5En6+L+Awe0F51ccxHcxQDDlJ6yJgJx4cpVuM9pqOqakFOcHMhSL
	+6DEATrrtP3gSWfPS2t1NgCb2Wr7qwWXq+ZOxjwWh
X-Gm-Gg: AfdE7clMoLZp2jViLqftyGbR/bu/2ScVaLvdQemSlWs4Ibt4S+U2d5m6kBbhlnp+GMO
	KYSUAZsriSa9uCCOM1EYUNCmSoWHdtVVdSL9TrL2AgGnCtNwM2Oj6cinH+SML7Jd9akvalqZilA
	7YKsUcyxtgn9rVFlPGwNAPhZg/voTTo7TLeYD4hvMZmIPHtui/1sLFw2FbQVwGva/fRWG2+TrC0
	clbsOsiZGs/7V1osrzcehGJP06sQQ80WMT5OwV70Qpi00f77qs0cXkCI+stylbiXBxxmrhgLA==
X-Received: by 2002:a05:622a:353:b0:517:99ea:ab79 with SMTP id
 d75a77b69052e-519e8e7516bmr5933751cf.25.1781863836675; Fri, 19 Jun 2026
 03:10:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-15-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 11:09:59 +0100
X-Gm-Features: AVVi8Ce16E31U-w4-XubBsflwMOtK_nv4nwaxzfJhxldigbujwW2ZBTzRORImb0
Message-ID: <CA+EHjTx+3U++dnhGEkwh2SO82xMugAvvJ9ee1O__sxZCKL_X5A@mail.gmail.com>
Subject: Re: [PATCH v8 15/46] KVM: guest_memfd: Call arch invalidate hooks on conversion
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
	Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 01:31, Ackerley Tng via B4 Relay
<devnull+ackerleytng.google.com@kernel.org> wrote:
>
> From: Ackerley Tng <ackerleytng@google.com>
>
> When memory in guest_memfd is converted from private to shared, the
> platform-specific state associated with the guest-private pages must be
> invalidated or cleaned up.
>
> Iterate over the folios in the affected range and call the
> kvm_arch_gmem_invalidate() hook for each PFN range. This allows
> architectures to perform necessary teardown, such as updating hardware
> metadata or encryption states, before the pages are transitioned to the
> shared state.
>
> Invoke this helper after indicating to KVM's mmu code that an invalidation
> is in progress to stop in-flight page faults from succeeding.
>
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Coming back to this after working through the arm64/pKVM side. My
Reviewed-by here is from the previous round and the patch hasn't
changed, but I missed an implication for arm64.

kvm_arch_gmem_invalidate() is now called from two paths with the same
(start, end) signature: folio teardown (kvm_gmem_free_folio) and
private->shared conversion (here). For SNP/TDX that's fine, conversion is
destructive anyway. For pKVM the two need opposite content semantics:
conversion must preserve the page in place (same physical page, the point
of in-place conversion without encryption), while teardown must scrub it
before returning it to the host.

The hook gets only a pfn range with no indication of which caller it's
serving, so arm64 can't give the two paths the behaviour they need. It
would help to signal intent on the conversion path: a reason/flag, a
separate hook, or not routing non-destructive conversion through the
teardown hook.

arm64 isn't here yet, so this isn't urgent, but the hook is gaining a
second caller now, and it's cheaper to leave room for the distinction
than to change a generic contract other arches depend on later.

Cheers,
/fuad


> ---
>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 433f79047b9d1..3c94442bc8131 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -607,6 +607,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
>         return safe;
>  }
>
> +#ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end)
> +{
> +       struct folio_batch fbatch;
> +       pgoff_t next = start;
> +       int i;
> +
> +       folio_batch_init(&fbatch);
> +       while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
> +               for (i = 0; i < folio_batch_count(&fbatch); ++i) {
> +                       struct folio *folio = fbatch.folios[i];
> +                       pgoff_t start_index, end_index;
> +                       kvm_pfn_t start_pfn, end_pfn;
> +
> +                       start_index = max(start, folio->index);
> +                       end_index = min(end, folio_next_index(folio));
> +                       /*
> +                        * end_index is either in folio or points to
> +                        * the first page of the next folio. Hence,
> +                        * all pages in range [start_index, end_index)
> +                        * are contiguous.
> +                        */
> +                       start_pfn = folio_file_pfn(folio, start_index);
> +                       end_pfn = start_pfn + end_index - start_index;
> +
> +                       kvm_arch_gmem_invalidate(start_pfn, end_pfn);
> +               }
> +
> +               folio_batch_release(&fbatch);
> +               cond_resched();
> +       }
> +}
> +#else
> +static void kvm_gmem_invalidate(struct inode *inode, pgoff_t start, pgoff_t end) {}
> +#endif
> +
>  static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>                                      size_t nr_pages, uint64_t attrs,
>                                      pgoff_t *err_index)
> @@ -647,7 +683,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>          */
>
>         kvm_gmem_invalidate_start(inode, start, end);
> +
> +       if (!to_private)
> +               kvm_gmem_invalidate(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +
>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
