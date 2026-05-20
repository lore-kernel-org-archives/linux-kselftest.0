Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F163EC2D1
	for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 14:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779287494; cv=pass; b=GdTkHCnA1Go8mRfReP3QfDj9jFtNPeLsGkcDwn6IHBZ0aP6l2XVp00w3lfqjOMMgi/elEXHHX3Rz1kEaMjOYm0S9GTsV9SUOd6UFh4H9UsnQRffmwZNZjP8hBJVCZlFgETsLonGnVInefvYTUKGPrkdlIqKgE5kRiIQJQtO7CBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779287494; c=relaxed/simple;
	bh=X/hV5ljxWA12U5TVhXUBeSsDz7VPis8ajbh1wO1J3cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qWjeNa9qTgtc/u42MpjRDQ/GPxxPONtu4fAkvBC7XhtDjqvpvsta1jMnyjUnL7ZqO3l9HaOFJ8CywbCQrx2AJkYbfoIx3tUSR9kypFVI9il5QhCKqmdu7GTb1vhDiEIYISRiq57kKt4gAL5Ujec+JtAoJAoiOTHXwh1xPFE5YGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DZBGWHze; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DZBGWHze"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-50d6b393d60so9641cf.0
        for <linux-kselftest@vger.kernel.org>; Wed, 20 May 2026 07:31:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779287492; cv=none;
        d=google.com; s=arc-20240605;
        b=hVFl4S9uTnr/asoGJDOFzyR+c6qfOXKd9gcPFX+dDjHI9+Cv7oXg8I2g58X+zCnCPL
         y+/BzcSvWnCrQ9sidhsHlzS2HTDVMfrJshKFqi8sk6/wb2phBFfacEDXOwgwb3wgV87F
         BxB+0Khl1+A6QmV+cqqXBuyJiAj5wgOsG67LLIjQupJsj/AHzm4hrbGesooMNDFyvio4
         x68QDnTnR+/uuxoKQ5tSpKnuLEwgbcWQwM2KiqA81FPuFaUFq43kAkVrSY0HaXlqHSyg
         MgkdFN8ZCC8KtAgTkbazsWQHhbI4vJVp0aTjKbIOEO3tBydaC4iD6uV+CeXTtlcxS3OB
         X4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        fh=k596HgOSYsBAtny37VNVGiMmXR6JTQE0mSuKZwTTL7s=;
        b=Nxg3b7aI9OgvVKmhV4MeWvMf5xY+c43tjuVy6Jy1l9XHWBplm9BlKIp5e3FXoRziC6
         JAU9v0vJwVwklY/Zm2Dh66TckV9Brm6hDFKNAvH77cYrN9xdLRckONAG0E47ZUxSrys3
         15qjtyj/mNqRWeU2fAbJ1sl6RFv/rtE0rj7W3pbTSo3vdBo5cN3rW1x/fbuVZVR0G8IC
         qlfCj/VOrBkBL78nxcm7thZpRVX8PQbNJzFNGfExTUGPx+TIN7N5jPkKCTbW3yyKLXjl
         Gq1xIDVowxjXG6V6SGmCeW3Q6hY5Fs3tQ9i9sYzxIWbfpbr4Qjm79ES5K/YQZYoeL2Tf
         KM2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779287492; x=1779892292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        b=DZBGWHzegKC97UHFZ3+t/tHB1FYQc/mvtem+xj+xKBFU/CxHRQ2H2bbxUsxsAQ1jVk
         41gkAXiUWSDAUVNdj3LugPRQzyBmuEIDRX5atqewM7Y4F+Svvh34es898m9fs3N5j80i
         EBvL4la9LJaDwTHY/EHaeQ9Yp+MsNeDA86PlcalVWc8NNa3I4viQM5Xu6X5hkG+O8ZwU
         RWD4DA6rZwN6u8FHVrV24WfObVSG90Ze5oK0YgC4o6tYttjQgTZ5tgi/5WcGXietxTLQ
         nBbKAqAfcZ1YF/vm0UDTj1bqmOFDGNiiUFnkv4MbTH08VBe+uXugUVRI0gC4kqF80Vhl
         9jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779287492; x=1779892292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N5NasgJypbMdlNYb/j7e6t6w9YfyUO25pmJjvirfi4=;
        b=h01pgxg5oUvq3UE5Z1226AEDTcwZg3QbmDRIrA7/wbhAjagmMUmNnIGsjN7VEnXyMp
         kPREGGllpz6WIekGJPG7A2Z1oRDBtNR73Tvf6cfIKdBOglXpVXtzI+EpHDI+EXi2vxY9
         TY6MApL+eY7ttDgCwq5A/4Pzj9Iw4JrFfhBV/aMcsMfvH/wfirOtdGak9PF0eIlacd1F
         0UD2l0npJIrQPLZr8RQVIInFJ0QKXVAou8agIs3M7h6xuIBUichRBaP53qgGFxlf6bCA
         GQa75tuFYfHZzNYBk/y5n+FJk+j4ZdYn1dN+23iBmxZDIlU1OU2Xy1WAowJZcFOwBwSK
         NBfA==
X-Forwarded-Encrypted: i=1; AFNElJ98Sw4b4FQBtlMPq0DVjStaG40uGhNAD9tFTRzMDwlTtPhlFzZbvGG34zJXpBtW/v8HctGGQGVThm4MNZ6A8OI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHA0/frsEsIrnArYLlGOWAAo6Pqc/uRUeEjRfymXY2vLoJsq6
	hEGCMtLEbsIotTJSwC1ERNUGN3gN+BCYDQ2+m6jB8KbnKYCSfJ6m/6/07wwPyRJlIFdmG+k3C5A
	MgC3/ijpjvQI4uoahZHVE6LUQhirlYCPnnBztiDsB
X-Gm-Gg: Acq92OEfIZG4gql92LgDd4LkHmy0kDkj0i/Cyq1JEkl5EughxlJxevhXVujV7kk/LUg
	qjgLhV6N6XoK5i/1qGX1pdLPbKgZ50Nqs5U8xkyzsFVrli4JSRNoq+xxkbfN2MgMss2B9QmyR53
	1HfByWc6WKSZQaDeYljlKd2nLrfWJ9zgfU+oJeYV+AVoYCWnt3ZS/DTtgLwJkcTbk52bVXWlgsI
	CGUHJEhS5PXRd9Vw2U/M7pdJasH7IHla0ZYYNIXffqmXWv3gFSwwBWkmEDaw6xFmwuNbfBSo7/1
	i4LWwO9ZHDp+z82W5Zk=
X-Received: by 2002:a05:622a:989:b0:50e:6360:96e with SMTP id
 d75a77b69052e-516791fe73cmr46959761cf.0.1779287488674; Wed, 20 May 2026
 07:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-gmem-inplace-conversion-v6-0-91ab5a8b19a4@google.com> <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com>
In-Reply-To: <20260507-gmem-inplace-conversion-v6-12-91ab5a8b19a4@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 20 May 2026 15:30:51 +0100
X-Gm-Features: AVHnY4Lo4l5leoGwp4MOUhUOXd-ZR6_GPypj6bN4fnpU5Ptxtsw2Fzt5rIYMAIk
Message-ID: <CA+EHjTwOfJ=nCRoX3m5uDt=CcF_zrqGsZVBBmo4MscmPqrBxOA@mail.gmail.com>
Subject: Re: [PATCH v6 12/43] KVM: guest_memfd: Call arch invalidate hooks on conversion
To: ackerleytng@google.com
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jthoughton@google.com, 
	michael.roth@amd.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	qperret@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	shivankg@amd.com, steven.price@arm.com, willy@infradead.org, 
	wyihan@google.com, yan.y.zhao@intel.com, forkloop@google.com, 
	pratyush@kernel.org, suzuki.poulose@arm.com, aneesh.kumar@kernel.org, 
	liam@infradead.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <bhe@redhat.com>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Youngjun Park <youngjun.park@lge.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Kiryl Shutsemau <kas@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 21:22, Ackerley Tng via B4 Relay
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
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>

Minor nit below, but lgtm.

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  virt/kvm/guest_memfd.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 9d82642a025e9..baf4b88dead1f 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -603,6 +603,42 @@ static bool kvm_gmem_is_safe_for_conversion(struct inode *inode, pgoff_t start,
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
> @@ -643,7 +679,12 @@ static int __kvm_gmem_set_attributes(struct inode *inode, pgoff_t start,
>          */
>
>         kvm_gmem_invalidate_begin(inode, start, end);
> +
> +       if (!to_private)
> +               kvm_gmem_invalidate(inode, start, end);
> +
>         mas_store_prealloc(&mas, xa_mk_value(attrs));
> +

Why the unrelated extra space?

>         kvm_gmem_invalidate_end(inode, start, end);
>  out:
>         filemap_invalidate_unlock(mapping);
>
> --
> 2.54.0.563.g4f69b47b94-goog
>
>
