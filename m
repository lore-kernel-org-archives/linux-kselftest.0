Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36228453A28
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 13:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786541803; cv=pass; b=NmziZDy2dL3dp4VQInnC0L2fbWZw1gz71yIts7+PXYLhIhGgnmnBLlJo89ncXbjjOfpjM+akKeF87V73/DBAD3VmLy/PXu4PUUBnRPdpjPG1deqTzdK5nYXnI4WG9ph8h9b1sm8QXV31tWVXuI3E5d8+LNrsiPiYDa0c0Vob9ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786541803; c=relaxed/simple;
	bh=KaA5tLZHEghQu61RuODWZrlhn1D0edYuT22vJ4+vjrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsHS6vn6A0HURRi3aYy6rX26LF4jspQO2q3mW6iRMG2Cap0RYAF4FTx8ieIUkJTZtdj8UL/lmVHvrcRufFFssUwhGJTxcXUqJTtF34mju2x0bovkr9ZMYyQl206RMa/BUFhCI443+675E+cFb5hermdJOi21jJJR0A77IHQQ2ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JT9wDa4z; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JT9wDa4z"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c10e86e52so229551cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 06:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786541795; cv=none;
        d=google.com; s=arc-20260327;
        b=g1j4WJ46N/1u+cx3ZBd+XaTh3YeV0qqr5MAuorS/NqM6WTv/wfn6LF4G8YbZMlszd8
         52vPRCKOJ3By5n70hsW6eUlqcONvovw/FpO71RTNwpRSPIXyYed6J9mWscAMhKuRScZt
         sT6HPo2G4AHqxce797mIv2T4jV1GL1SgigAy2TprY2/hzY7maVFDWX695ikKwqRMJ978
         +VAX9bn7KQUH7l27JBpn/AxiYq6VZivg3wVXdnWtTg4McRd7Zg70+N+bMmGzbFfLZ/JQ
         Zv2NGCBSupCRmKqc+xyKVEEeLiRl0WzvHT7Y9mQu83h9uKOG1nDgIFXSjg2XJyO6StfF
         mSrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        fh=jCrjoV1sTiR95mHTotBlLtb0k8pap73kh17RAClSst8=;
        b=hsWyzwatajxDpJ16PLxg8kUk8D4Nqr6seU28ST4WCUwxjmGVdgnas9/Qn5KbA9AbAA
         dkreHv7QWpDCV3cdoq6ur+GntNh9n6MuI929xkl17SesgGsZLnkvmgoIS+nzpwKtFFLf
         N4D/qJOSe732GOwI2TdyxztSbIUFF15cagewApZAt0BplWqZ75Ooxb8iOoumFC6zedTx
         RRMGqZzrMVfdAvnRHO+M/e5OABaHK+CInyTWCDZ5SNaGnZs67z7Q+XzmwpmtC+PUne/e
         hcf4Klo9nMsG9w4P8EHjWm3pAknQVufDzmZ/yctCP3DjftQd+BrDX2XxBYvhuAZuAdRY
         ncfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786541795; x=1787146595; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        b=JT9wDa4zE6nQFgYOmue5yaURYrLbhmLZXjDnJbab24AAPl+fH/GCri6xm+EmsbIF6R
         qlR1LCgcTC3WtT1Ygu5GgHcswgbNp6Dt+6YN6US3CzzzgrB5y/isNUZL+jVqrkkh/xjw
         tyZnC/sDGY4gA8nuyuNY4t+xwg9sZRrdkD45gZd7Z/zCR6oA/+o6jl3egZtFn/Br2BFo
         9J2TUJZOfAycT5BaF1rG3wkUlbDRjsmwYAkq7z2ocM6WSzOB3HtwF2PtdBKEU22xai9s
         vUeNYhDZmnAWaGCn2Hd7Ic9AI7G/Ppx6f08EmxAW3QhigMvW+8s7L0UzPfsw/dig9/7/
         vy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786541795; x=1787146595;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O8ig8WOZx7XhZvybLzPJyMWD7j4qDk1RSS9jPUIQvDQ=;
        b=mgRPGwqJYuqeq+cpwI2Df0w4eC/LzMtmyTn8ickROrtc7yHp2L5rBlNFv4om2ZVJ/G
         Dgh36sYzG9oh08myZDSKg95f5rUfVRjPvpY5eYxJG/GHwT4h10S2xGxv8r3c2Lem1Nu0
         frtlNPz28nJYYWQKSOrR+aKI9PBPgVt7sqduQ7OjgjmCkthdUN5TWZKQZoZhDAQPfHbb
         FArbzGV5x7HcTm8tdznVv7imCbnQTcBh9spMXpyMi6qOGFNrpw/sHO1n7mdllKC5OEDL
         m9Xfvsxhrx3j9d3Ku/u1HlV59DOIZqS+g2nEtyRV6axgxSpOBXebCWQTjYRSciYRv+wU
         ewjw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9CwVX41lLO5RE9HenYG97mMa6G4NFB86HORCbx1u9bK8DIyHOBXoUhCCeoB4XzxtlSVki901Hgz31LcUqxSg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsy1v13lAiw+08e7KQx+cGhjBwAcG5ZQR1tRVG/auyfkwpxfoj
	WObbJEe/+zQnbOgrGHFA9MpAEhJ+dkibqqtaDQHqR2Z25CsRMhF1q7471bodSczNxwb9YkhBZNF
	NDjfxd+MRSvig6L4CVhX38boC0OptDHUmiZKdnAaQ
X-Gm-Gg: AR+sD13JSXwBH0hubbzpsaveKflRrzFrJ5WCJjir3R0n4g/ZV1Vl9YvoVI3tc+kxU90
	VikF+r6hoSClrf3zvqSTrqOP4JMMhR8OB4x7v8esdTDYK/PNoCFrLnSgg7hIavtzY9xxo7zA1rw
	ntMnp48kjqxJ/+uuIrZLWAn1UHet4LC4DE48/7RSZy0K2XmXP5Fazm/kHfVeNEBGtgqWkKJEGW7
	ke/91QYl9h0uqXgF0YM3qRtU+KO796eDxOOlH5hcNlBmOK6LM5iReB/6eC9C30lNrJtQMFHNLp8
	TQ3ZRU7SRgxpP1Ac6wqJsO8q7JU/xMtlAtiAZC5nBvGITg==
X-Received: by 2002:a05:622a:e198:10b0:50f:af60:3496 with SMTP id
 d75a77b69052e-52d65464646mr13738681cf.1.1786541794243; Wed, 12 Aug 2026
 06:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807-gmem-inplace-conversion-v10-0-2fc18ee6d3ba@google.com> <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
In-Reply-To: <20260807-gmem-inplace-conversion-v10-9-2fc18ee6d3ba@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Aug 2026 15:35:57 +0200
X-Gm-Features: AUfX_mzWYjCDwiui5b6BAKCYfBkQOYXMoJhicR-4oNYgSy_SG6-tlHfLwASmQvc
Message-ID: <CA+EHjTxPznVrL8t2T1AX0Qs6Ph8z-Z3e_z0ZLt3sgAOf37VFRw@mail.gmail.com>
Subject: Re: [PATCH v10 09/41] KVM: guest_memfd: Filter both shared and
 private when invalidating
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
> From: Ackerley Tng <ackerleytng@google.com>
>
> Before conversion, a guest_memfd could be either all shared, or all
> private, configured at creation time using the INIT_SHARED flag. Hence,
> when zapping pages from stage 2 page tables, guest_memfd can filter which
> to zap based on the initial shared/private state.
>
> With conversion, guest_memfd tracks shared/private state on a per-page
> level, so a range can contain both private and shared pages. Zap both
> private and shared pages for simplicity.
>
> An alternative would be to iterate guest_memfd attributes and only zap both
> if shared and private pages exist within the range. Setting both the shared
> and private filters lets the zapping logic do that iteration instead.
>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

> ---
>  virt/kvm/guest_memfd.c | 24 ++++++++----------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 75979c885e030..b1537226e5adf 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -136,14 +136,6 @@ static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
>         return folio;
>  }
>
> -static enum kvm_gfn_range_filter kvm_gmem_get_invalidate_filter(struct inode *inode)
> -{
> -       if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
> -               return KVM_FILTER_SHARED;
> -
> -       return KVM_FILTER_PRIVATE;
> -}
> -
>  static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
>                                         pgoff_t end,
>                                         enum kvm_gfn_range_filter attr_filter)
> @@ -186,15 +178,13 @@ static void __kvm_gmem_invalidate_start(struct gmem_file *f, pgoff_t start,
>  }
>
>  static void kvm_gmem_invalidate_start(struct inode *inode, pgoff_t start,
> -                                     pgoff_t end)
> +                                     pgoff_t end,
> +                                     enum kvm_gfn_range_filter filter)
>  {
> -       enum kvm_gfn_range_filter attr_filter;
>         struct gmem_file *f;
>
> -       attr_filter = kvm_gmem_get_invalidate_filter(inode);
> -
>         kvm_gmem_for_each_file(f, inode)
> -               __kvm_gmem_invalidate_start(f, start, end, attr_filter);
> +               __kvm_gmem_invalidate_start(f, start, end, filter);
>  }
>
>  static void __kvm_gmem_invalidate_end(struct gmem_file *f, pgoff_t start,
> @@ -229,7 +219,8 @@ static long kvm_gmem_punch_hole(struct inode *inode, loff_t offset, loff_t len)
>          */
>         filemap_invalidate_lock(inode->i_mapping);
>
> -       kvm_gmem_invalidate_start(inode, start, end);
> +       kvm_gmem_invalidate_start(inode, start, end,
> +                                 KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>
>         truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
>
> @@ -344,7 +335,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
>          * memory, as its lifetime is associated with the inode, not the file.
>          */
>         __kvm_gmem_invalidate_start(f, 0, -1ul,
> -                                   kvm_gmem_get_invalidate_filter(inode));
> +                                   KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>         __kvm_gmem_invalidate_end(f, 0, -1ul);
>
>         list_del(&f->entry);
> @@ -525,7 +516,8 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
>         start = folio->index;
>         end = start + folio_nr_pages(folio);
>
> -       kvm_gmem_invalidate_start(mapping->host, start, end);
> +       kvm_gmem_invalidate_start(mapping->host, start, end,
> +                                 KVM_FILTER_SHARED | KVM_FILTER_PRIVATE);
>
>         /*
>          * Do not truncate the range, what action is taken in response to the
>
> --
> 2.55.0.654.g21b8a5bc05-goog
>
>
