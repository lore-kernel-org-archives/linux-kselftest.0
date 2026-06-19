Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EC635F197
	for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781857551; cv=pass; b=cyFqUj9c1mU5CdX8/C1TOK/VYUOZSnHNefla2IcXGofVSrZ3S46zH1h3vDOMNyWDgCrNZS5yTcL46ELGslNXiVloXmbaVcp+r6rTLd5w2d2V7uXDiDRt5+90866DSrd7k03bTXIJVDpj3uXepWSiiABBZV+rthjTpwzs6aN25og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781857551; c=relaxed/simple;
	bh=aURqg38Q2gAlcr/J29NBP9ZvAVEI/c5mS9i6CA7HUZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H8/rcoowqStxCAetuW6YuycRk7P0Ihz+3moeU09O7q363krF2AaUGGpp5UJNRE1fl/jSFXI6RygdwhWoo4T1zjXNXsTB90wzlB3TxJezZbR3DYa0Zoo+hbRHQJB5sypDJ6s/i+tq0/+qFVikhVyGADIsOleqRqGjEa0vnCzAegg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aHDKUn0o; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aHDKUn0o"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-519ed52bcc6so102201cf.0
        for <linux-kselftest@vger.kernel.org>; Fri, 19 Jun 2026 01:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781857547; cv=none;
        d=google.com; s=arc-20260327;
        b=CK5c8yykzbgARWX7E+lOmjuJ+RPvjNAvVlbajJ+qDk1GUuQjM/MguV+t6L+4J+3gdW
         HTMzHukAB9iwYbOMttQcBlC+i9y9fdn38JcVVkSPYucMUL9R7mZx7XSP7XUExjUUf8Tk
         ZriiwXWRiHHMr4gPW51CukcK1E1jxWNNjMKtTaYMHCuYJQuqEGG51v5PG6VYAjKsitPJ
         3+/FP2wRyULcVhOqC6E9ZhmAvUkzautJ66uTFIvgZuolIKxagryWF5IR0awXyfNipJWW
         1NqNUYJTsX45CXxKPA/i28ch/aV9/3nQOn2jzert5sJv9Hz0uIDh+IiQYxAe1LUBV+Ih
         tYvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        fh=BgrdAWQAzPldiyiodLqivDF4lG3XuJy+SNCGs7h770Q=;
        b=LJIkKOl+mL16NZNyeEnrW12ThjGeCVPUCNdaaALODlBpchym7Awl2V/idTASjg1fJ9
         rg2tfxLdujXd6AD4FfJ6pa43HvS747EcK6yqT/u8pVgaPARgdthvuKOR3NitZV9mzBnf
         sllhVakNQqqv6tlntI2yBjX7/xh7OdzA91sSQCygRcBDIiE22kHFNffSTObtELchQiie
         yxzGfAJFxtaHSSfwoGXWj4mvuDv82K8ENXEAmWQzbMel09xfuprLghBhgvB6nybaeNyV
         Mk6tj1sElthI8Q5YtmwrAHWDIXHMIjW7V0XctSLUnPEqwNGCts1OASz0FtI7L09oZ4H/
         jlzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781857547; x=1782462347; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=aHDKUn0oEsPciDKO1kSZo0NLWv4KKT0Z+YlhPbhSqvJu1CxsZRYy9ugfoIFsNp1LIj
         yrqIOlaXmWAih8ZPF3Fg2dnH2D4Dtn/nXcsi/q71iCrrrHkvi1J1raYKaOIoihfDsiKg
         gLiBxgRimBSYWR3a8g1al7a28aj49lDKZLogGTIGRlvhZ8Dre03eKAH8ZH327BjN4fTG
         Aj11FXph/mPXRURYpRM3zxOArhd7x04zXayFCxi6G7IMg4iIU9v5suZdTmwYsCZ4w3um
         uIiRw2U4lGX+GHWb9jsEdGpP+VJndkZFN6H/tdl/VOV/tC+SgVwiAnAc2DsBfORpktPa
         zsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781857547; x=1782462347;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3cFYWLK/FtmAY6SmJ1SGh+iq0DuUVi9vERhh19AGAVg=;
        b=kWG5tUtUemLAKDIEpzcx6FV6X0ic4gPyMUnVGjXX2tRjxPbLc4i3kf7Fl6Px0jV+aS
         47sDUy3Wv6lp94kGsbDNHllbNYJG2hWUHerENTR243AUB3jq5J83xkDVVX+ftRNt1M7B
         ENJHO7dg6hGPxlAkX+tvKnLC6BGjNkLSck0IkA8wmX8dl2AlCLCBWlXNC8S77MDJO9kH
         t03JKKF9vYodrFabQmQ8sg6lZaHRC84h26YzAj/h8y8DoNlq23fYgCxcb/0xMvWDjZHE
         /E3f6t1z+NGV+9W9k6JlSki5KvNQq3kHtT7wtdKhHk/apsdyPb+YsP1IlTQ6h2zfQX/m
         xDig==
X-Forwarded-Encrypted: i=1; AFNElJ+HohShSzt9b7oDPng3VueCj3/xM8zAc6GgYvndvDqlN2AR0+zujBZ4bpz+/nQ9Cn97BtjzLUxHgv/2tK1QpiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnVNCtRJWe25Dzo6wbDqsiy9ai79oiYr4+/0yRM8lGL3uNGea
	DpoBB5rYPdnKfRAe/dwhfpC1uOzUecI7acvDkCeXS0umb07xOANqXGpwijVtiPfS7yw3Ip+z+oH
	+HNtFm/leNQ9oOS5+ekd5Ba8WM0GnkqVloK14l6gO
X-Gm-Gg: AfdE7cn2/IaO1O6S/LTUfpQhAASjAdgx+hMHXDarR334liLn/CPMjbPp1L7gexLCPEG
	vrofN7xrJhh90oGqQyvNSzqxI1tmc4N01D1I89tw/lvPXJ2+zotXKRDQcvL1YEPg8qO+xjGjUfJ
	/ZHtahlDpFj1JZDg+xCwEkna66ZE8JPFcQTMye7BJeXWqeDOKA1nnqweK/DMwT9rm+YrnWHA1b9
	mVxLdsPSYMJi2i388YDPq3S4CpBoC4XBTmqZGw0qTXPhDCIae2EBbhRZAXFfGllg13VgfPuIA==
X-Received: by 2002:a05:622a:1b88:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-519e891c801mr4739831cf.7.1781857546581; Fri, 19 Jun 2026
 01:25:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618-gmem-inplace-conversion-v8-0-9d2959357853@google.com> <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
In-Reply-To: <20260618-gmem-inplace-conversion-v8-9-9d2959357853@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 09:25:09 +0100
X-Gm-Features: AVVi8CeyI3PAg86WrGg3AslQ1YuW7acL6Ym-NulDiNjx1M0Fc6iTcS7y2ypGj0E
Message-ID: <CA+EHjTzh+iThoVnLOGbRDgacKFcvbBxx9m_72bhfafE4J7a7jw@mail.gmail.com>
Subject: Re: [PATCH v8 09/46] KVM: guest_memfd: Introduce function to check
 GFN private/shared status
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
> Introduce function for KVM to check the private/shared status of guest
> memory at a given GFN.
>
> This will be used in a later patch.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  include/linux/kvm_host.h |  2 ++
>  virt/kvm/guest_memfd.c   | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3915da2a61778..27687fb9d5201 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -2575,6 +2575,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
>  #endif /* CONFIG_KVM_VM_MEMORY_ATTRIBUTES */
>
>  #ifdef CONFIG_KVM_GUEST_MEMFD
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn);
> +
>  int kvm_gmem_get_pfn(struct kvm *kvm, struct kvm_memory_slot *slot,
>                      gfn_t gfn, kvm_pfn_t *pfn, struct page **page,
>                      int *max_order);
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 8101f64e0366f..bca912db5be6e 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -510,6 +510,37 @@ static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
>         return 0;
>  }
>
> +bool kvm_gmem_is_private(struct kvm *kvm, gfn_t gfn)
> +{
> +       struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
> +       struct inode *inode;
> +
> +       /*
> +        * If this gfn has no associated memslot, there's no chance of the gfn
> +        * being backed by private memory, since guest_memfd must be used for
> +        * private memory, and guest_memfd must be associated with some memslot.
> +        */
> +       if (!slot)
> +               return 0;
> +
> +       CLASS(gmem_get_file, file)(slot);
> +       if (!file)
> +               return 0;
> +
> +       inode = file_inode(file);
> +
> +       /*
> +        * Rely on the maple tree's internal RCU lock to ensure a
> +        * stable result. This result can become stale as soon as the
> +        * lock is dropped, so the caller _must_ still protect
> +        * consumption of private vs. shared by checking
> +        * mmu_invalidate_retry_gfn() under mmu_lock to serialize
> +        * against ongoing attribute updates.
> +        */
> +       return kvm_gmem_is_private_mem(inode, kvm_gmem_get_index(slot, gfn));
> +}
> +EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_gmem_is_private);
> +
>  static struct file_operations kvm_gmem_fops = {
>         .mmap           = kvm_gmem_mmap,
>         .open           = generic_file_open,
>
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>
>
