Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386B93A4538
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791063199; cv=pass; b=bZs+Kr0z6/wJ13kCus6aGSDLNnUsrEdUv4YIkvBAeMCimsMzztD8tBqC8KvTVsF9UwmTiTnbD5vt8X9mxyteG4StZGDPYKgiLWTAx0NL9s/k6JNUOuFSxSuVHnDR2jnTINqn8N/64D2UFCLYFP2+zH7o4MeSxOHYRzWzVNq3RbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791063199; c=relaxed/simple;
	bh=ZIBhrntP8+qxeEqIpQb91mOxIVspTOx+NPlmlo2K79c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GvKn8XMg5PTKV0ubnDmLFOYRuG+vMjmVV8hYtD9ifLKE7X7l4ei7f8UkhzMu1CbNQK7eGTmdA5yfmFTBC/PhndKyikC8KtJUmNfj6p+51wG3I4ZmfH/mwMR23QjB/27/Vj/6Xik6nb/6oQCKWyjeg3bUuyqtCqqtxCplTk3A4aA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=b9h1mQB3; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="b9h1mQB3"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so230944f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 14:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791063193; cv=none;
        d=google.com; s=arc-20260327;
        b=DwEhO3Uf6ipg0/cubvaQ3wjXhVDZLPAvE6cOLAK/cY1bgq5OSv0TBKQ9CyORBc5JQO
         GTnil1t/IfNH0XXdzJuFi4BRVIsXYgITCjyHIUUN1eDzDOq055msQdxBHp/bakvPOvWD
         ibFwF/fsNtcht0MuVrEs4lb7DLJZma6mMKKwpWMWsMTw/Oez6l284JOkV0HmPLVzB6OS
         XcJ5ofkUmZq++ll1uJvT1TLAeHawmyysfqMI+Niclq53dqNpSpNfR0dDsbmrW0UbmIOQ
         hxdXG++zFv6WpHkJKZEdOaFFcjNZwav7+wd42cuWu4VscJvas79QuEj+nFL7Cj6fNTzx
         PCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        fh=/aevXb2wMCulR1v0/Iy8GPQcW9ofMSGzyD5T69Batgk=;
        b=f2JaIFn2Naee0X1159HlsqqTXJIofeU2j+9mpTllOKZZEq96t+p612PudgElEC+UXg
         jmCYhMXrusNvDTnRxNUGG+CTWbDZX3as6cidzXXC3nrnNHKIZBuoDw5iQeexJBD9X4NW
         e/11xjAETiw7+1Uk5rXaS7nySkIP512yQwYebi7ayo+xsND3L/YwPwXwtrTTAbvgueR3
         1s1xt06vM3zD8/y9F2nQZY4lumWyYOfZq8d7/cONg08Qj8P36Us681g5dn/8XwackMwO
         R0N2ErZuUFs/LdGHM13QSE5/dPOycasvAg8CxqTGZRWulEc9WqgxZAvPrWUSToBjrCsJ
         M4Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791063193; x=1791667993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=b9h1mQB33U3g6N/GXja/y9MG8VQxGFxSa2PhDrVi3pbIz4xsK2O+n9cewvNgKpUBa7
         DQd07QiPH6WUxIUnS+fin0JICEUlfthjSm1mmCjhmuVxePQZovQbEkUGxC5+F0ZaiCDB
         o50ML1y4TlaNXiTTjP1qijbKzhqvwpa2dxEfCmralxS7QiGBAdIxztRnef6yPuVfdqSk
         24ejB+8jCJpVOgNCJAgp2UJWCBXG2Y94cbzIQNmA7MhPlMhuc7vEnM1Gh8ZgFtAbgS7J
         kwOD9umHAhbKsL9+bTohv40oEl81Vsyi4q5b8WiJOAxS+VV+0d1OJ+ZF0DH4sk28ipUb
         vq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791063193; x=1791667993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfZvs7JHnwLbB5TOb4/EZHNkBzF/EHZB9b3YDWrj+qc=;
        b=zHbpdIPhzOxyf6I2mpfIPN1h4crw/HbPl/NZoaznyaulG3BEcwHgf8vGGJGP3VGkjI
         aDZwaWFv00l6eagx+auH7AOrWENX79ASDO6m4p1NLhU8iDSO/5LBeN+h4hwea5kpPiGv
         y2lZENS5PgF4eFaMwZVpAzThBcWJ3u57mpYfkbqTzigNlHFxwEV/unS6Wu/bYI6+a5gD
         riv8r62cRWPGsGpJPCNbIHLfSxxIc4Vw5kpY6yhP6N1kdPGqTTx9QT+TELUr6Tbpb8+p
         bXd2fK1Vq14oaMjwyKeuk4sTeNW8LODGkLLuarMw1lTRznO6UyxMmuL57tCrBVy9nsT/
         QfOg==
X-Forwarded-Encrypted: i=1; AKwUvBwkSwAwHKI8zeCbZfeDbhzN3msPVWnJcX1h32MsyePSf59FCuQPPURdSNfr0xiPlDuQrVgXF0BigBCtmoQRrlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEzwWMQTCE0DOxBOEV9Ub4YSvFm9G4bQ1rBnw/OrIAFaFpZ3LF
	EbWnbgbfdoLm9VwbmS+Pw1nr1YVMUFtl0+QqNce2B3/v6hTPH0zkytHkv1eCLUb7XZpRik22uzw
	7Kan/ZXu8W7UPFNIi/ggDT8dmryGSVFDmQwv+dI2ZyA==
X-Gm-Gg: AYBFou2Gw6LC0yJk6hRCdXV6Y0ybRqhVlmZpcc8wRE6fJHYYe9OIRSw+THONOl2v2WN
	K0E78Wzr9MD0yw2yCFU/n8TULPXLpHFmF+8FcQIhrl27aBYuAkMpihLjck8GrP5W3cChtlTNFrJ
	ACgi+ba5Kb39pGSOCIh2+e6OoNtYrUfs3C2aR9gVEbnTQ2SEMC3cTnAVEnbJdg/xpiHM5OczLNp
	gVPI8TxoXVm/64EB3tlI6cicX+WWKlIEY2WgLaV5UEWi3GYq6ln1uD12ZWV0yZ+WJft0LAOmQMo
	s5cjNfRZVlxK6tEtz3I9rPaYQdpDfP7Lh/w6w59ikMcUeKGubR1uO43XkiQKLchSLLoheefs8Mq
	IOKbQSR2VDFbKjrzgTOR1mNtaW3VWGuy2T3ODynRsnsi1rrlpK1fiyn4XYWXsPeZ+lLV6V1ARLn
	2O3URjITyz
X-Received: by 2002:a05:6000:2008:b0:48c:557d:ab24 with SMTP id
 ffacd0b85a97d-48c557daf9fmr296756f8f.4.1791063192798; Sat, 03 Oct 2026
 14:33:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260815102833.864330-1-jinyu.tang@linux.dev> <20260815103123.864738-1-jinyu.tang@linux.dev>
In-Reply-To: <20260815103123.864738-1-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Oct 2026 03:00:50 +0530
X-Gm-Features: AclHuK_HLZyYPpTxHZ72T9yKE8JtgWcR285DcDxiQ-zUi9vakSvTlMiSylojJss
Message-ID: <CAAhSdy01fWGXx37Nq1LsVWajoH8B_O=hvU0b4vw5AsnOQm054w@mail.gmail.com>
Subject: Re: [PATCH v4 RESEND 1/5] KVM: riscv: Avoid overwriting G-stage
 tables with huge leaves
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Nutty Liu <nutty.liu@hotmail.com>, Jinyu Tang <tjytimi@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2026 at 4:01=E2=80=AFPM Jinyu Tang <jinyu.tang@linux.dev> w=
rote:
>
> RISC-V KVM can overwrite an existing G-stage table entry when
> installing a huge leaf mapping. If the target huge range already has a
> lower-level page table, kvm_riscv_gstage_set_pte() can replace the
> non-leaf entry with a leaf PTE and disconnect the lower-level page
> table.
>
> Reject replacing a valid table entry with a leaf PTE. If huge-page
> installation hits such a conflict, fall back to a 4K mapping for the
> original faulting GPA in the MMU fault path, where the original GPA and
> HFN are still available.
>
> Suggested-by: Sashiko <sashiko-bot@kernel.org>
> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programmin=
g")
> Signed-off-by: Jinyu Tang <jinyu.tang@linux.dev>
> ---
>  arch/riscv/kvm/gstage.c |  6 ++++++
>  arch/riscv/kvm/mmu.c    | 24 +++++++++++++++++++++++-
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index e5002cb9cbef..54d45addf18f 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -174,6 +174,12 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gsta=
ge,
>
>         if (pte_val(*ptep) !=3D pte_val(map->pte)) {
>                 bool was_invalid =3D !pte_val(*ptep);
> +
> +               /* Avoid replacing an existing lower-level table with a l=
eaf mapping. */
> +               if (!gstage_pte_leaf(ptep) && !was_invalid &&
> +                   gstage_pte_leaf(&map->pte))
> +                       return -EEXIST;
> +
>                 set_pte(ptep, map->pte);
>                 if (gstage_pte_leaf(ptep) &&
>                     !(was_invalid && riscv_has_extension_unlikely(RISCV_I=
SA_EXT_SVVPTC)))
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 6035b5ec9503..bfd6168ebe30 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -625,10 +625,11 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct=
 kvm_memory_slot *memslot,
>                       struct kvm_gstage_mapping *out_map)
>  {
>         int ret;
> -       kvm_pfn_t hfn;
> +       kvm_pfn_t fault_hfn, hfn;
>         bool is_hugetlb;
>         bool writable;
>         unsigned int vma_pageshift;
> +       gpa_t fault_gpa =3D gpa;
>         gfn_t gfn =3D gpa >> PAGE_SHIFT;
>         struct vm_area_struct *vma;
>         struct kvm *kvm =3D vcpu->kvm;
> @@ -709,6 +710,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct k=
vm_memory_slot *memslot,
>         }
>         if (is_error_noslot_pfn(hfn))
>                 return -EFAULT;
> +       fault_hfn =3D hfn + ((fault_gpa >> PAGE_SHIFT) - gfn);
>
>         /*
>          * If logging is active then we allow writable pages only
> @@ -734,9 +736,29 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct =
kvm_memory_slot *memslot,
>                 mark_page_dirty_in_slot(kvm, memslot, gfn);
>                 ret =3D kvm_riscv_gstage_map_page(&gstage, pcache, gpa, h=
fn << PAGE_SHIFT,
>                                                 vma_pagesize, false, true=
, out_map);
> +               if (ret =3D=3D -EEXIST) {
> +                       /*
> +                        * Retry at 4K granularity for the original fault=
ing GPA
> +                        * when a huge leaf cannot replace an existing ta=
ble.
> +                        */
> +                       ret =3D kvm_riscv_gstage_map_page(&gstage, pcache=
, fault_gpa,
> +                                                       fault_hfn << PAGE=
_SHIFT,
> +                                                       PAGE_SIZE, false,=
 true,
> +                                                       out_map);
> +               }

If you were attempting to map 1G hugepage then you should first try
2M and not 4K. This patch needs more work.

>         } else {
>                 ret =3D kvm_riscv_gstage_map_page(&gstage, pcache, gpa, h=
fn << PAGE_SHIFT,
>                                                 vma_pagesize, true, true,=
 out_map);
> +               if (ret =3D=3D -EEXIST) {
> +                       /*
> +                        * Retry at 4K granularity for the original fault=
ing GPA
> +                        * when a huge leaf cannot replace an existing ta=
ble.
> +                        */
> +                       ret =3D kvm_riscv_gstage_map_page(&gstage, pcache=
, fault_gpa,
> +                                                       fault_hfn << PAGE=
_SHIFT,
> +                                                       PAGE_SIZE, true, =
true,
> +                                                       out_map);
> +               }
>         }
>
>         if (ret)
> --
> 2.43.0
>

Regards,
Anup
