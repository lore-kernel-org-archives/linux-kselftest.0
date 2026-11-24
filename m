Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795555040;
	b=JwsrO7u3NNXQ2HeqQJi756rJCnJnTsxf0AonF2IOc/81Wl2DTxZYMQ8cPwq+K13rNMlY
	 1layV0FYXdmb3/o5zzStHBfH5cB54kV3JGsrBXdl7PNHUnJg0AGliMZpvrdmMzddwXhlm
	 nSjVHIZUUxAKDrwRDdAVRdGUi74yT6c5UfKupwoMhfukKT/hODKJwEUjO7GO9Ob5PwED5
	 WLRvdjW5SQU6TsvZzAqCyGj4v5EWCfIjQ3FlI+bHvL4Pne4jqZBL8FiN6VLsTBhOiB8/z
	 uZTYzX0E5z67H4Q4VXJYrvuHn1/+NiB64zESoovGoWs/C+2AjSrcy53eIwS4tjZTY9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
	b=yuIDUaLJ1zKqn+CP5t5gqW+UTQnsXvEAKZ/sZ8ZsabNkNAX88kVGvpuZAkDnZmkEEDqB
	 IV5b+vrt7tmo301P+YMqb2935aCD0Qj4fLiRqNKr3KpzZKkYOuTnJ/z9UqBpVpyeSMH3K
	 G2c2BS2AWH3YNpd1zB6V+eHKlRgKy6U1k65m5a70D3kjSRl5iUze18NmUzIGA6HZ7WCI6
	 TgIuxxgDs3XeaR3o9sU2CBQmJTwH6T4ho4b1nf0ksrJw6pVx0Sb4S3xXH4kclblLxmEuJ
	 shuaqwIoPbhl8IREoWS3k1R7q2Wv6lohaa2ztCKPrdXCw5G59V0F0THJO2EAjGpZk5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="MkSXuN/x";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90959606A33F
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 21:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90959606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MkSXuN/x
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018493d57so204555e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 13:17:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795555035; cv=none;
        d=google.com; s=arc-20260327;
        b=NpSWrwrHugx+kWsfkkTRjnqN0Jhkj5YcdLKPIvMR2VgHerGBBdzsxJpGTuEYKcmdvx
         9DXIJrv71h6lduzN6CbGl3gIR90ValGGs9kR+aial0O4+p4+EX7vxAfSAO4ZDCiawvPo
         V66no7MDJ6vjHKYni7OdVF/sH0WyYn0mFhfb2h2yslEvrQ4n2arfhj7A8/0wJ9uK3XiS
         2QcxJnjWVPlkZgnJ+VVDEsGFgzSkz6RIiC293liIxLLPvRqR33xHNN8/0q51zM78ZeH/
         fOLEcHfxSbHI48Lb0Ec5fYmTc+WVMMZ3m6+dRr4CrcPtEGMF9nO4nLZUG0McH2AHV/Zf
         pwcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        fh=VYcgFrbabYZpJBQbV3LhJvzLB7g6p9Vz0TloybZZNnM=;
        b=EYsL9HGsWpdQ47klBJc4mD5F7MPvtd9kIBBC7+HADPX6cW732gcvzghpJ9agyWjZ7A
         EygxBADBw4/54NaWl9pW5LbgA3rBn9Zeh0aCGGt3CjXCHc9i0+xga6V9PPH8sPBFbQ9a
         ThfSBO4/pVHN/GAum1J+Wcm6dHfgb7YwAFiKG017HWnT23AmPteYaRN3BON33ECDxS3o
         zGBUODhprt0qWvZgox20dVyCz5qOrO7EASTI7TFtwXaUCiG+JJCz+Jag9zqFbq1KbMKN
         11Le9WqVW5G4+srr7d83kfZF8IwDtD5Rpz0kR8nHnvm6QcdFBb1a3eJXAR/iU4VJLVNj
         mvPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795555035; x=1796159835; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=MkSXuN/xdTgpLprAaYeg0DUZVlUmwLE3QyG/Oo8oVmOu0/SNd2kvpbkOWXVN5tgQh/
         TonNMVSbIqyueZeYUWRvcXD3n8lMbaOPzHucCw66VnV/LH2wUH4aW7EcdmciDE/Y5OGF
         7Lxm76B7Blpx0f45YadbB9p2dBDewxo4/7zBOn8EzOmrf9MLEOlMXJbG5HO0oRQCq7YT
         28QZU5IjCmmthE6LYlSlZ47gSKWC48k7RdJeZWUgSM+3j68zeX3q3x81pyxQGYt9pyxE
         vi7Ya8wNILGVLHZ5pNxnANCRtCpbTuA/1AwQOeAUUbo1iZm/h5ijkrltUGAxvs2mLWRr
         IfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555035; x=1796159835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7CWradJPGVaYwp8zWE8ibM5vKB/LP8o1hdDmpVawtw=;
        b=fKStYkpI5bvODCa6T52K/Heygc5TWsV3W2ev/BR+R8EURMNXEDvf0jnLPpTUSAw2iV
         5vmMiW2QpTi2qdkJr2yHZ+xG3XmrbTLAuf4P6+rFD87ktWJjXNdH8b+WgSs3NED0p3h1
         jwxcfVJdURNMrpPA8uHxIQzufH2FFOT+gYpRIg3zz064h3MgHR3tGDky52f5PzzA6E17
         C2xWEMZ4g39ni3CyRKTFt3CkJ+F2ofxpzzHM4au/VlJEwj46dv4YyoD5hTNn7bPD9yzB
         5UZ+s113DHFLo77IQ+TXPKyi86Ljtzw01fy3/bBqgDAvHEmB1E3vbCuBmb5yLmIiOBO6
         /bXw==
X-Forwarded-Encrypted: i=1; AL+hErFwFXm2pvA6xndc822ocBuA4W7llV7WiAHlCpCADCbPB5Ty2RgRYOQ3NdUxuY083fxz/UK7WitOVnOEBKQlxKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+khsUoy/EERicNfIDdGgJB0j9BtSJ/VqHa0So01Ri7xzp4qSCW
	oNcfYPnLbN9D8Tm3xeMUCp08eYEKyqIuCBuDYnermCCoeNQ/rCxhIi9Xgssp4MCU/dLGdsGctyp
	fXSvhhiEXkEOldFOuL8NOBo2DGeAdcMnRDMk0EJ9X
X-Gm-Gg: AZFdTZdXw2cpV4kaoJ1fW62Oxqs+ms0YfDxNkiaeKd0GGB55DDuVRs7Bt4qpAlyN9mQ
	I3l9BcJMbiG37e7uZ1y3cVmleymE7c434dZmbqZmbqOjbUK7HJDW+sQ9bK4+8P++MXo+/06xizd
	E4H9rRloU1qTgq/+qeW4vnKyOfKOOOvDFDrfVSH4lld8GbuWuy4Ty+2ZadILkjeQ2XH9jI0LVgH
	UYtoL1Sp8j6qadWtfUWFgE9T5eTQrEF+Noq+/KWgkKbjhLVje6JBH8J1xe438vyu0Fu5V+2toZr
	/mYp6MN4uUu5DiLlotwNKHRwgyefHsWSPXt32NhUtxCkLcL/smWBKJpoGN+1GpF6qePpzOZtEyo
	q5qKt0G68pnNUmYGoALGFY+d20hbpt42tL2JxLiuYmH+7qrxaaRIrd8Ux08sSG3pbrmXoePl88f
	JsViOZGGMLljbkrqqP70vt2h+ObiNhpAC/lWztBmgUMvA=
X-Received: by 2002:a05:600c:41c7:b0:4bb:7ae0:3158 with SMTP id
 5b1f17b1804b1-4bb91683f09mr1702525e9.8.1795555034613; Tue, 24 Nov 2026
 13:17:14 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-feat-udmabuf-huge-pfnmap-v2-0-3254f801fc36@linux.dev> <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
In-Reply-To: <20261123-feat-udmabuf-huge-pfnmap-v2-2-3254f801fc36@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 24 Nov 2026 13:17:02 -0800
X-Gm-Features: Aa3M54oDsXG-xXA0liYSlMAI56IBmdX9Wf6SVnF95VXy1mB4cBPNV8817l0bAvI
Message-ID: <CABdmKX2156cpvWHEg7hVNGqqhgg-+v1Vj4G_bAK01kk6huq=4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] udmabuf: map huge page backed ranges with PMDs
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Philipp Stanner <phasta@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philip Yang <Philip.Yang@amd.com>, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Natalie Vock <nat@pixelcluster.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 6:45=E2=80=AFPM Qiliang Yuan <qiliang.yuan@linux.de=
v> wrote:
>
> QEMU and crosvm hand guest memory to the host renderer and display as
> udmabufs for virtio-gpu blob resources. The guest memory is a memfd that
> is often backed by 2 MiB huge pages, and the host process mmap()s the
> dma-buf to access it with the CPU.
>
> udmabuf maps every page with its own PTE: the first fault inserts a PFN
> for each 4 KiB page of the whole VMA. Mapping and touching 4 GiB this way
> takes over 200 ms and a million PTEs, although the memory behind it is
> 2048 huge pages.
>
> Add a ->huge_fault() handler that maps a PMD-sized range with one PMD
> when it is backed by an aligned run of contiguous PFNs, and falls back to
> PTEs otherwise. Have the pre-mapping on the first fault skip the ranges
> the handler will map, so that their PTEs don't take the place of the
> PMDs. Once THP is disabled for the VMA, the ranges already mapped with a
> PMD keep it, so pre-map only the PMD-sized range of the fault then.
>
> Mapping a udmabuf over a memfd filled with data and reading a byte of
> each 4 KiB page through the mapping, base and patched kernels alternating
> over 3 rounds of 5 runs (7 for shmem 4K), median of the per-round medians
> and range in parentheses:
>
>   backing    size        before (ms)         after (ms)   change
>   hugetlb    256M   13.3 (13.3-13.7)      1.7 (1.7-1.8)     -87%
>   hugetlb      1G   53.6 (53.0-53.7)      6.5 (4.2-6.6)     -88%
>   hugetlb      4G      211 (211-212)   23.6 (17.6-25.2)     -89%
>   hugetlb      8G      423 (422-424)   45.8 (45.8-47.2)     -89%
>   shmem THP    1G   52.8 (52.5-53.1)      6.3 (5.8-6.8)     -88%
>   shmem THP    4G      210 (207-214)   20.7 (19.5-21.1)     -90%
>   shmem 4K     1G   52.0 (51.6-52.7)   51.8 (51.5-52.9)       0%
>   shmem 4K     4G      209 (209-211)      208 (208-209)       0%
>
> Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>

This commit message should explicitly say this patch depends on
Lorenzo's series in addition to mentioning it in the cover letter (for
merging / backporting). The mm/core hashes may change, so just by the
series title or patch subjects for now.

> ---
>  drivers/dma-buf/udmabuf.c | 85 +++++++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 81 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 018937435356e..9f53d33fbdd9a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -44,12 +44,63 @@ struct udmabuf {
>         struct miscdevice *device;
>  };
>
> +/*
> + * Return whether the PMD-sized range of @vma at @addr is backed by one =
aligned
> + * run of contiguous PFNs, which can then be mapped with a single PMD.
> + */
> +static bool udmabuf_pmd_mappable(struct vm_area_struct *vma, unsigned lo=
ng addr,
> +                                unsigned long *pfn)
> +{
> +       struct udmabuf *ubuf =3D vma->vm_private_data;
> +       const pgoff_t nr =3D PMD_SIZE >> PAGE_SHIFT;
> +       unsigned long first;
> +       pgoff_t pgoff, i;
> +
> +       if (!IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP))
> +               return false;
> +
> +       if (!IS_ALIGNED(addr, PMD_SIZE) || addr < vma->vm_start ||
> +           vma->vm_end - addr < PMD_SIZE)
> +               return false;
> +
> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +       if (pgoff >=3D ubuf->pagecount || ubuf->pagecount - pgoff < nr)
> +               return false;
> +
> +       first =3D page_to_pfn(ubuf->pages[pgoff]);
> +       if (!IS_ALIGNED(first, nr))
> +               return false;
> +
> +       for (i =3D 1; i < nr; i++) {
> +               if (page_to_pfn(ubuf->pages[pgoff + i]) !=3D first + i)
> +                       return false;
> +       }
> +
> +       *pfn =3D first;
> +       return true;
> +}
> +
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +static vm_fault_t udmabuf_vm_huge_fault(struct vm_fault *vmf,
> +                                       unsigned int order)
> +{
> +       unsigned long pfn;
> +
> +       if (order !=3D PMD_ORDER ||
> +           !udmabuf_pmd_mappable(vmf->vma, vmf->address & PMD_MASK, &pfn=
))
> +               return VM_FAULT_FALLBACK;
> +
> +       return vmf_insert_pfn_pmd(vmf, pfn, vmf->flags & FAULT_FLAG_WRITE=
);
> +}
> +#endif
> +
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>  {
>         struct vm_area_struct *vma =3D vmf->vma;
>         struct udmabuf *ubuf =3D vma->vm_private_data;
>         pgoff_t pgoff =3D vmf->pgoff;
> -       unsigned long addr, pfn;
> +       unsigned long addr, end, pfn;
> +       bool pmd_ok;
>         vm_fault_t ret;
>
>         if (pgoff >=3D ubuf->pagecount)
> @@ -61,14 +112,37 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *=
vmf)
>         if (ret & VM_FAULT_ERROR)
>                 return ret;
>
> -       /* pre fault */
> -       pgoff =3D vma->vm_pgoff;
> +       /*
> +        * Pre-fault the rest of the VMA, except for the ranges that
> +        * udmabuf_vm_huge_fault() maps with a PMD once they are accessed=
.
> +        */
> +       pmd_ok =3D thp_vma_allowable_order(vma, vma->vm_flags, TVA_PAGEFA=
ULT,
> +                                        PMD_ORDER);
>         addr =3D vma->vm_start;
> +       end =3D vma->vm_end;
>
> -       for (; addr < vma->vm_end; pgoff++, addr +=3D PAGE_SIZE) {
> +       /*
> +        * Ranges mapped with a PMD before THP was disabled for the VMA k=
eep
> +        * their PMD, so pre-fault only the PMD-sized range of the fault.
> +        */
> +       if (IS_ENABLED(CONFIG_ARCH_SUPPORTS_PMD_PFNMAP) && !pmd_ok) {
> +               addr =3D max(addr, vmf->address & PMD_MASK);
> +               end =3D min(end, (vmf->address & PMD_MASK) + PMD_SIZE);
> +       }

This fixes the v1 problem, but it means that a task with THP disabled
takes a fault per PMD size instead of the whole VMA. Including buffers
that are entirely backed by 4k pages. That partially undoes the
f0bbcc258e81 ("udmabuf: pre-fault when first page fault") behavior.
That's probably fine (would be good to see results for shmem 4K under
PR_SET_THP_DISABLE), but I think the commit message should mention
this also applies to 4k buffers.

Also probably worth mentioning / commenting that
/sys/kernel/mm/transparent_hugepage/enabled =3D never (we use that)
doesn't get you here because the THP tuneables are bypassed for
VM_PFNMAP VMAs with huge_fault().

If we stick with this behavior when THP is disabled, can we just do it
unconditionally (using pmd_addr_end(vmf->address, vma->vm_end))? That
would eliminate pmd_ok, the thp_vma_allowable_order() call, the skip
branch below, and keep udmabuf_vm_fault() within the faulting PMD's
page table and avoid repeated full-VMA scans (e.g. post
MADV_DONTNEED), which seems like it might be worth the extra faults.
Worth checking the shmem 4k numbers to see if the extra per-PMD faults
are negligible though.

> +       pgoff =3D vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> +
> +       for (; addr < end; pgoff++, addr +=3D PAGE_SIZE) {
>                 if (addr =3D=3D vmf->address)
>                         continue;
>
> +               if (pmd_ok && IS_ALIGNED(addr, PMD_SIZE) &&
> +                   (vmf->address & PMD_MASK) !=3D addr &&
> +                   udmabuf_pmd_mappable(vma, addr, &pfn)) {
> +                       pgoff +=3D (PMD_SIZE >> PAGE_SHIFT) - 1;
> +                       addr +=3D PMD_SIZE - PAGE_SIZE;
> +                       continue;
> +               }
> +
>                 if (WARN_ON(pgoff >=3D ubuf->pagecount))
>                         break;
>
> @@ -89,6 +163,9 @@ static vm_fault_t udmabuf_vm_fault(struct vm_fault *vm=
f)
>
>  static const struct vm_operations_struct udmabuf_vm_ops =3D {
>         .fault =3D udmabuf_vm_fault,
> +#ifdef CONFIG_ARCH_SUPPORTS_HUGE_PFNMAP
> +       .huge_fault =3D udmabuf_vm_huge_fault,
> +#endif
>  };
>
>  static int mmap_udmabuf(struct dma_buf *buf, struct vm_area_struct *vma)
>
> --
> 2.43.0
>
