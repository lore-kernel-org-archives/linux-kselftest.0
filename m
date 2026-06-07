Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E52D6E64
	for <linux-kselftest@vger.kernel.org>; Sun,  7 Jun 2026 05:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780811351; cv=pass; b=KxVPxnO261jcMPCAwJMBDj1wYdUj35nRwEiEiUSr3ItoC7tQPA9+VukKA4dE2pKiwSseAZg/KER136TQjYfSHq70NfNlP6ge08AKbiwKFpt5pNUq1L6YclbkwTeyxMn7XQMaR5NY00BZmHK20Xd1mzlxSQkLbcH5+In3R0DOfMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780811351; c=relaxed/simple;
	bh=pHey/UkT9e6hjTUzyGtU0Bm6YFLJCQVuTA/OjxaEuDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XwdXyLq9iIRu/aJD5kTCbRT/SsLtEpBbCuY1wmSzT/mFqXuXKvNvbHFiQ+79sTbLXf7AfH9adXG8HQKVtf/3pw0mhXT+/BQmxpAH4QVdSNZu5SQL71fvt9iVGvUSwpO2/Yqgr9BsfN0tRe4DAh2ZUgyXzUk+nqTok2YkfRVVJsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=TMUMl2yU; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="TMUMl2yU"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so3562128e87.0
        for <linux-kselftest@vger.kernel.org>; Sat, 06 Jun 2026 22:49:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780811347; cv=none;
        d=google.com; s=arc-20240605;
        b=NlVx0r8+sLEo238Wk/gscn6DGKD0qV0nXEml2drGMdDZmtf94PUm+rcuYY3WaHNubB
         a8JR/nyDOcHFv7s6vkCgCVzl5RC55ee1dF/1fiy+s6BkqEANX90GFj0pMdg2Mp4cROYg
         +eXKwKI/McWhmt3tgs19wOsHfUCY9BJtAWZX+1mXo6zwWsUcPF2LrwPofWJumYvBrJo9
         xIh9s8mSI2WdF/QGqpCauhq+ATgeUvwbP59wGlJ9V8YaaLld5wWqqpPQeIQ8LCU80MTx
         FTsCl//+HY8y1Hu+t0u00UxoH0gS/FktnMFdtyEYTfpwsyFKHd27BFnNj9BmbSysj95l
         oS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        fh=eSTagy6cKS0oNN/+ztkFlDF/h3pTs9OP5WS8CVS+6wM=;
        b=AU/+XyYcKgnobpYmUAkbCqnOnjg4VY4QKVZTbyAgpHyEQGB3bvJmnKqA0sfWC2iZ0b
         FKmQqQ4OOFmiM7JF3/Ky7h2L7vQVAXX1yutrbQglnkkE4qe1V8BAFdnOtCHoLm91SreH
         g4uYTUSM+INsAmixxcowU7UkWxFGLWzOvL5Yrm1BggHH7Eix4hMFgymq2vGTzVdDDg9J
         Zz07lF21IkEl0IaWtLpninOB/R8NalUG2jTDYgQTn5OD83FvqDnT9Ud83oRLUpPdz79I
         C4HLdZwdlYcAafXXmAar59kafbKLZnGFcX0I6mBgZZJ1VtITGLw78j5eDvqrn2QC4BXd
         jDTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1780811347; x=1781416147; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        b=TMUMl2yUYPZIgMLNiRjxkiUVnH7G2pv7RkGju4QvuvKs336hKxnldpOt9w8I/9LdkM
         6bjYgon5Zgk/CP2xvg0uLs5uvy64nkHQnljH0ZcplAfirpZfryKdUQDnXfEVJVSXaYm5
         gnDV26SO/ASytyT42jtblxbplfXm7+39QR7DlqC++PobFbomXodBPpNaHbDX0jNJrAuo
         vNPrHXsyHcbtEjF1lYmTciBgbvpopsu4BvKSTEo/k+CXlzpxvpxBbgffp21eNWGqZVUS
         EJ/riSxJk6IFCY5XYRXehLR9pnniNjf11O6sZSVEf42yJluTrsQ0RwhIHYc0dC+8pj+N
         F7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780811347; x=1781416147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NDGuX9OEdV0WxJZIy7dMh7D8y98iOZJkmyFqpGy0K+s=;
        b=HFOLk1lZjKqQti0zmtR251PahY+cUOatnq8wl7Q7zhnb1Q80W8VsnzPwYUEY0e0i/F
         HuDKoAf7mDkqq/oRgvEtLk8Z5QdR67MQuRQypXq5sbMgvHRC6LAhwGVKLCNQXyXioZb2
         Y4lzqVZ5K+Vjnw8KDQDbWyEsPvKpQWsekO1cFK2ddLaNEMwgvqUregWjMXSmmFVuRJp/
         HEEgqysL2Mczp7h0VzRv3T/APiov4VlvbC8wOAIlc3g0BpS0pogzQ313qZNW2xTBBoO0
         pa33gAfK9DVmQLMfRNa6/p/7O7ORGnE3v19OLT6HjRpizAeC4UprSUpqqG83Xrx0QB/e
         l0QQ==
X-Forwarded-Encrypted: i=1; AFNElJ9smaEMa6QL8IsGxFl1PcCpqb5p81WFlRCzTqX7WOaa1Xdp3nKKyfp3V18I6Qba6dyJTE4g+z9l4ohH6PJHkGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXThdHVYRHn8jBQzNKZK7nDfmpcSB+qj9L+P6GigVPlOYXIUCR
	XYqc6sX0mEpBF4TRrEz5swooidz7KXSPlilwbIg7M4Jq4IqLh3zweSJEdVpeZ1JqAtUVabFtY9Y
	Vi0OdmOdgHiTO4Fr4C8Fd+RdxTIkCK0S/tN8neE7GsA==
X-Gm-Gg: Acq92OGqxmWCYDbun4pbvldb1O4iOBrMamPtZMc4U/K6i/clLG4ZmUHiGVxalXofYQt
	Nx5WtncwIMBmp7I5K47/L4v5JJZ+N7biQ6LcJw8Z/FuiYrc0YysoGi0ofKTPEWTCn1k2WDMzXGq
	ZdbEzK8jYudxcoMer7/9Rxw6jbFUy213p3YtPCqb04YdtI0l0SZpHmM0QHkSX5DA2GpUojFLsz1
	gxkkJNN8P57DymbV7s6MvFifJ5aH4RFt22zSJeEzZZ1C9X10l1EJ+emIBPdUKHeutMXDyMRZgH1
	B97vaT51xpcAwcO+znF5p04Is1ZnEAbLbARITvRCI7/udF+gCXAr
X-Received: by 2002:a05:6512:3f07:b0:5aa:6b19:b357 with SMTP id
 2adb3069b0e04-5aa87b8a247mr3429733e87.3.1780811346628; Sat, 06 Jun 2026
 22:49:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604142602.3582602-1-tjytimi@163.com> <20260604142602.3582602-2-tjytimi@163.com>
In-Reply-To: <20260604142602.3582602-2-tjytimi@163.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 7 Jun 2026 11:18:55 +0530
X-Gm-Features: AVVi8CfHf4TZOApnOTYpsrfb2YZXExiqoE3V-jWe65JblzsSS9KztXhZX9w1KXI
Message-ID: <CAK9=C2XGRgz+3c2Rf8bj8tPtAiCpHXrsm2sNC1b7qHt-5p6PZQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: riscv: Check hugetlb block mappings against
 memslot bounds
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Shuah Khan <shuah@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 7:58=E2=80=AFPM Jinyu Tang <tjytimi@163.com> wrote:
>
> RISC-V KVM has used the hugetlb VMA size directly as the G-stage
> mapping size since stage-2 page table support was added. That is safe
> only if the block covered by the fault is fully contained in the
> memslot and the userspace address has the same offset as the GPA
> within that block.
>
> The THP path already checks those constraints before installing a PMD
> block mapping. The hugetlb path did not, so an unaligned memslot could
> make KVM install a PMD or PUD sized G-stage block that covers memory
> outside the slot or maps the wrong host pages.
>
> Pass the target mapping size into fault_supports_gstage_huge_mapping().
> The same helper can be used for both THP PMD mappings and hugetlb
> PMD/PUD mappings.
>
> Select hugetlb mapping sizes through the same memslot-boundary check,
> falling back from PUD to PMD to PAGE_SIZE. When a smaller hugetlb
> mapping size is selected, fault the GFN aligned to that selected size
> instead of the original VMA size.
>
> Also keep hugetlb mappings out of transparent_hugepage_adjust(). Once
> the hugetlb path has chosen PAGE_SIZE, promoting it again through the
> THP helper would miss the hugetlb fallback decision.
>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programmin=
g")
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

> ---
> v1 -> v2:
>   - Squash the helper parameterization into this hugetlb fix.
>   - Use the ALIGN()/ALIGN_DOWN() form suggested by Nutty Liu and Anup
>     for the memslot boundary check.
>
>  arch/riscv/kvm/mmu.c | 54 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 2d3def024..0adf017a2 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -286,7 +286,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn=
_range *range)
>  }
>
>  static bool fault_supports_gstage_huge_mapping(struct kvm_memory_slot *m=
emslot,
> -                                              unsigned long hva)
> +                                              unsigned long hva,
> +                                              unsigned long map_size)
>  {
>         hva_t uaddr_start, uaddr_end;
>         gpa_t gpa_start;
> @@ -300,8 +301,8 @@ static bool fault_supports_gstage_huge_mapping(struct=
 kvm_memory_slot *memslot,
>
>         /*
>          * Pages belonging to memslots that don't have the same alignment
> -        * within a PMD for userspace and GPA cannot be mapped with g-sta=
ge
> -        * PMD entries, because we'll end up mapping the wrong pages.
> +        * within a huge page for userspace and GPA cannot be mapped with
> +        * g-stage block entries, because we'll end up mapping the wrong =
pages.
>          *
>          * Consider a layout like the following:
>          *
> @@ -321,7 +322,7 @@ static bool fault_supports_gstage_huge_mapping(struct=
 kvm_memory_slot *memslot,
>          *   e -> g
>          *   f -> h
>          */
> -       if ((gpa_start & (PMD_SIZE - 1)) !=3D (uaddr_start & (PMD_SIZE - =
1)))
> +       if ((gpa_start & (map_size - 1)) !=3D (uaddr_start & (map_size - =
1)))
>                 return false;
>
>         /*
> @@ -336,7 +337,8 @@ static bool fault_supports_gstage_huge_mapping(struct=
 kvm_memory_slot *memslot,
>          * userspace_addr or the base_gfn, as both are equally aligned (p=
er
>          * the check above) and equally sized.
>          */
> -       return (hva >=3D ALIGN(uaddr_start, PMD_SIZE)) && (hva < ALIGN_DO=
WN(uaddr_end, PMD_SIZE));
> +       return (hva >=3D ALIGN(uaddr_start, map_size)) &&
> +              (hva < ALIGN_DOWN(uaddr_end, map_size));
>  }
>
>  static int get_hva_mapping_size(struct kvm *kvm,
> @@ -404,7 +406,7 @@ static unsigned long transparent_hugepage_adjust(stru=
ct kvm *kvm,
>          * sure that the HVA and GPA are sufficiently aligned and that th=
e
>          * block map is contained within the memslot.
>          */
> -       if (fault_supports_gstage_huge_mapping(memslot, hva)) {
> +       if (fault_supports_gstage_huge_mapping(memslot, hva, PMD_SIZE)) {
>                 int sz;
>
>                 sz =3D get_hva_mapping_size(kvm, hva);
> @@ -421,12 +423,33 @@ static unsigned long transparent_hugepage_adjust(st=
ruct kvm *kvm,
>         return PAGE_SIZE;
>  }
>
> +static unsigned long hugetlb_mapping_size(struct kvm_memory_slot *memslo=
t,
> +                                         unsigned long hva,
> +                                         unsigned long map_size)
> +{
> +       switch (map_size) {
> +       case PUD_SIZE:

As pointed out by sashiko-bot, we need a "#ifndef CONFIG_32BIT" over here.
I have taken care at the time of merging this patch.

> +               if (fault_supports_gstage_huge_mapping(memslot, hva, PUD_=
SIZE))
> +                       return PUD_SIZE;
> +               fallthrough;
> +       case PMD_SIZE:
> +               if (fault_supports_gstage_huge_mapping(memslot, hva, PMD_=
SIZE))
> +                       return PMD_SIZE;
> +               fallthrough;
> +       case PAGE_SIZE:
> +               return PAGE_SIZE;
> +       default:
> +               return map_size;
> +       }
> +}
> +
>  int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *mem=
slot,
>                       gpa_t gpa, unsigned long hva, bool is_write,
>                       struct kvm_gstage_mapping *out_map)
>  {
>         int ret;
>         kvm_pfn_t hfn;
> +       bool is_hugetlb;
>         bool writable;
>         short vma_pageshift;
>         gfn_t gfn =3D gpa >> PAGE_SHIFT;
> @@ -460,16 +483,23 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct=
 kvm_memory_slot *memslot,
>                 return -EFAULT;
>         }
>
> -       if (is_vm_hugetlb_page(vma))
> +       is_hugetlb =3D is_vm_hugetlb_page(vma);
> +       if (is_hugetlb)
>                 vma_pageshift =3D huge_page_shift(hstate_vma(vma));
>         else
>                 vma_pageshift =3D PAGE_SHIFT;
>         vma_pagesize =3D 1ULL << vma_pageshift;
>         if (logging || (vma->vm_flags & VM_PFNMAP))
>                 vma_pagesize =3D PAGE_SIZE;
> +       else if (is_hugetlb)
> +               vma_pagesize =3D hugetlb_mapping_size(memslot, hva, vma_p=
agesize);
>
> +       /*
> +        * For hugetlb mappings, vma_pagesize might have been reduced fro=
m the
> +        * VMA size to a smaller safe mapping size.
> +        */
>         if (vma_pagesize =3D=3D PMD_SIZE || vma_pagesize =3D=3D PUD_SIZE)
> -               gfn =3D (gpa & huge_page_mask(hstate_vma(vma))) >> PAGE_S=
HIFT;
> +               gfn =3D ALIGN_DOWN(gpa, vma_pagesize) >> PAGE_SHIFT;
>
>         /*
>          * Read mmu_invalidate_seq so that KVM can detect if the results =
of
> @@ -511,8 +541,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>         if (mmu_invalidate_retry(kvm, mmu_seq))
>                 goto out_unlock;
>
> -       /* Check if we are backed by a THP and thus use block mapping if =
possible */
> -       if (!logging && (vma_pagesize =3D=3D PAGE_SIZE))
> +       /*
> +        * Check if we are backed by a THP and thus use block mapping if
> +        * possible. Hugetlb mappings already selected their target size =
above,
> +        * so do not promote them through the THP helper.
> +        */
> +       if (!logging && !is_hugetlb && vma_pagesize =3D=3D PAGE_SIZE)
>                 vma_pagesize =3D transparent_hugepage_adjust(kvm, memslot=
, hva, &hfn, &gpa);
>
>         if (writable) {
> --
> 2.43.0
>

Queued this patch for Linux-7.2

Thanks,
Anup
