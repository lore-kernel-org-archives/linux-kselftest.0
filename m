Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297431F98F
	for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 20:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782764793; cv=pass; b=cL+e0k7xz5uobWQMfA7UX9BWmYw0NtFqr4Z/I8KUIv4RrVL2RqOAcaZugDO8yUZXFHvVZCPi26cmsu4Yw9AEMKdNvlBNizyV9PwAa96qGe3iDJ58j5nsGbACntqZwBvYqwLQpbhopOsahiT6fRjO4V4TWFqXHdV0Paq8MYz1OuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782764793; c=relaxed/simple;
	bh=MY09JxyG9hMdQzyhoPmIVD3awpBb1JpfMGTAFRP/ZJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DELYYStu9bTFqWpHHFVPCpuOrOKI73b6EKaRlWQadDHcPIscglMoUNQ4sNpDgEJ+0Jp4fNYpUyqtmffqNcc6apX7JR8jwlhcZsHTkdq50Q3CRlimmLZ1uoFIf7MSAn2SH5hHHzVQDWliqDfr9dXo/Nv3FloPzQzehu5AURo+G/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahs/IiZA; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahs/IiZA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b29be0d6so10855755e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 13:26:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782764790; cv=none;
        d=google.com; s=arc-20260327;
        b=ZYLng0XINSjuHAMgyfToHcjfJLdCOEKpp3RkqSd78lR0+bKicMXqRVPfIR0aq6IeuO
         97vgfDffH3W4V/pkK41hPhvD/AKl0o6Daj0y623sHuGBp20BCafjUG5/EUesYsMhJ0QI
         Q3auNdC+ItRAmQqAvSjM5Hwl3Pu313moYnpqvDS9NtcWSNRjSSMwDXJIpW4X5j6f5hzL
         YpBXrKucHWwjHAgOiqdGQrWYEyt10TLi3uZGd4p/DYq4IlOFsFEyKYVV4gSLS1r93n4N
         dBxhsN/Lat3PNIlAp8/WyF4cJuKZwYjOonARX2U5p3aP4E87U0OTg+sjo1vTH6CEQa3W
         XpAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        fh=8MsRn6tapsuDBAGh4PVQWO9s99O+3aUr3n28WIK9fMs=;
        b=DRjVggrW3yWBbfGzdULceUAejWepWo5bQ1jaO/kZXgB2b94rdtwTNkUJuWiuReHBV3
         HSPQZ6WX131mJO3Sizjs4vc38gQ3vro5IyDEUvlfBf3EQjTfYSiyonAQvfAngPrqyeJB
         Bc0pQl0LN0PdShXeoLOOO82oaHg5pP0WPcIoiHHbzlVZ4s3C+iIIjGpwpXCyhmJQ9NX7
         d8DLnbYBwZxNuD99+Xi7640sJUPWEaxfqC6XwXZrUUUl8q+eUFhSRzMEq2z0jN+6C4sM
         Vgnk9D3R0dkS2sWIOobHlyo0YI5CIVakOs6piuM8CDg5gpSZLXOZWHB90IKLU6wBNzJh
         qgMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782764790; x=1783369590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        b=ahs/IiZAT1D4ZUNH/eo0GWK7kkSLcG30YWdjLvpvKRlhFLHNx8pQ7jsJ8lgR3pyXUQ
         ePkT6RuKgnzJU8onOjEhSJrC7swN9PkGMMDEAZGVJMa8gki7kXb+PyG7245asH0WivrR
         bvZ0+34PnqR/ItfCVNmC9rwTXYoJKI21uoPpMPs1hrEdxZJxUtSDvtz+ykjjgSpjiUoj
         yP37fv4DTPqj7Wpx4VMnF7nnf9otAxcQkxLjjGAJSb7G/qin/PXt4ybL4gQiSxvy+XJ0
         h9LLfb3yIxpC+0ffQ/ycbu/rcLcN6GzyqPrbFBhbkok5xFTkN1t9X+uMYHn4vIjShjAt
         Bonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764790; x=1783369590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RDrF/yyIMpS6ZA2Riz+vcoNoOC8Zd0lhJXN7Go9GtGA=;
        b=qlrJjVWB3eH21fCilkmySn0GVwA5VolyWnQve/zKjh/HzK3xiQTNovFYmbqc6FnTy4
         N9mVooopbcGf/+G7ckw2q5nq+tA3FQVR1Ysyn0wxzqj7dLV/frTmCBHi3FGzCDESElfY
         8G+w/hkXmH01k2lyow4HfLWa8gJUzxZhPIfF/dg+yJWYAJtnAOFTodJwO+KCyB1zI6ik
         1hcYqpjvsGnAs/b7NP8hk8Gu9XRMXHb7jB7KCvX3W6pwlQTpYz+/NLxfqFPQ+AjQihJk
         Uay0OzXwvrZEW7CrG5cLwwq+W/cSyhb/GKl1NuTVyJWw5cQLYvbwN5qL+o/6nTsMbqbX
         5Hhw==
X-Forwarded-Encrypted: i=1; AFNElJ9aI69O4sCbpyTCLhz0/m7uw7pgPR2aZ5s7dTT3Wf9wiR4Z9CMXmRNZZFdWHtzyAPAimtFz/tieBfvp9Vlpem0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yybtu52nnYjVB3z26nyigxw/EZZqFLaECHeNkZZBGVYRAhnuh9K
	XP/2k3twgVVTFJkEjzvPVtl8VIXCnqkWMXs6BF+LYPPz6CMwO4mJ21fXW6UNqkrVm/8Dvq9N0F2
	xS9x1GFVtF6phL77CnVUr0E2Bqagy7wg=
X-Gm-Gg: AfdE7clSx+Ol58R+7dO5vknOPzuZQvQzXjWT30RPzJVFWNWQoeDIYgA0D5IDQNw6OLY
	H+Jg8WCCbmePdFyOU2b8xBtNs0DG33LF3W7LpjI9vxlDaAkziufr2yOox+24k63B3awrYNItljj
	TBd9knWPThxZJqL29tUZwKfdGIi+B7FdKkmqGzpWm2z2s9Tg1mX1eohpFHNzoDLGZmTXpaBtlrY
	pMKiuGH7K4dGPujY00FjTrythf9Cp5QO9DDD5m7vWzKD1rJJ4jL6MFptpNs4uhR4n/ynByiUEC7
	UATnJD4sI9TB0WQMddTyyCeEDAkZASj7xZjq5XmX
X-Received: by 2002:a05:600c:2307:b0:47d:52ef:c572 with SMTP id
 5b1f17b1804b1-493b8c362f0mr8930275e9.1.1782764789542; Mon, 29 Jun 2026
 13:26:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com> <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Mon, 29 Jun 2026 16:25:53 -0400
X-Gm-Features: AVVi8CfcJ5_Gyn04QD1uaVCzrs31IcTfWuPBgWH8Bbn0CKPr59m0ofaAdOQj3Go
Message-ID: <CAJFTR8T33Yw-wqPFVLe8it2cWjXCz_xPpRCRmoVMQyn7_=UBqw@mail.gmail.com>
Subject: Re: [PATCH v2 08/16] riscv: kvm: Use generated instruction headers
 for csr code
To: thecharlesjenkins@gmail.com
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Nam Cao <namcao@linutronix.de>, 
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 1:08=E2=80=AFAM Charlie Jenkins via B4 Relay
<devnull+thecharlesjenkins.gmail.com@kernel.org> wrote:
>
> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> Migrate the csr parsing code to use the generated instruction headers
> instead of the hand-written instruction composition functions.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
> ---
>
> This is a simple transformation that I have again validated through
> brute force.
> ---
>  arch/riscv/kvm/vcpu_insn.c | 47 +++++++++++++++++++++++-----------------=
------
>  1 file changed, 24 insertions(+), 23 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> index f09f9251d1f0..8ccf6ec722f0 100644
> --- a/arch/riscv/kvm/vcpu_insn.c
> +++ b/arch/riscv/kvm/vcpu_insn.c
> @@ -146,43 +146,44 @@ int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu=
, struct kvm_run *run)
>
>  static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong in=
sn)
>  {
> +       #define GET_REG(_rd) (*((unsigned long *)(&vcpu->arch.guest_conte=
xt) + _rd))
> +

IMO it would be better to make this a static inline function, otherwise.

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>

>         int i, rc =3D KVM_INSN_ILLEGAL_TRAP;
> -       unsigned int csr_num =3D insn >> SH_RS2;
> -       unsigned int rs1_num =3D (insn >> SH_RS1) & MASK_RX;
> -       ulong rs1_val =3D GET_RS1(insn, &vcpu->arch.guest_context);
> +       unsigned int csr_num;
>         const struct csr_func *tcfn, *cfn =3D NULL;
>         ulong val =3D 0, wr_mask =3D 0, new_val =3D 0;
>
>         /* Decode the CSR instruction */
> -       switch (GET_FUNCT3(insn)) {
> -       case GET_FUNCT3(INSN_MATCH_CSRRW):
> +       if (riscv_insn_is_csrrw(insn)) {
>                 wr_mask =3D -1UL;
> -               new_val =3D rs1_val;
> -               break;
> -       case GET_FUNCT3(INSN_MATCH_CSRRS):
> -               wr_mask =3D rs1_val;
> +               new_val =3D GET_REG(riscv_insn_csrrw_extract_xs1(insn));
> +               csr_num =3D riscv_insn_csrrw_extract_csr(insn);
> +       } else if (riscv_insn_is_csrrs(insn)) {
> +               wr_mask =3D GET_REG(riscv_insn_csrrs_extract_xs1(insn));
>                 new_val =3D -1UL;
> -               break;
> -       case GET_FUNCT3(INSN_MATCH_CSRRC):
> -               wr_mask =3D rs1_val;
> +               csr_num =3D riscv_insn_csrrs_extract_csr(insn);
> +       } else if (riscv_insn_is_csrrc(insn)) {
> +               wr_mask =3D GET_REG(riscv_insn_csrrs_extract_xs1(insn));
>                 new_val =3D 0;
> -               break;
> -       case GET_FUNCT3(INSN_MATCH_CSRRWI):
> +               csr_num =3D riscv_insn_csrrc_extract_csr(insn);
> +       } else if (riscv_insn_is_csrrwi(insn)) {
>                 wr_mask =3D -1UL;
> -               new_val =3D rs1_num;
> -               break;
> -       case GET_FUNCT3(INSN_MATCH_CSRRSI):
> -               wr_mask =3D rs1_num;
> +               new_val =3D riscv_insn_csrrwi_extract_imm(insn);
> +               csr_num =3D riscv_insn_csrrwi_extract_csr(insn);
> +       } else if (riscv_insn_is_csrrsi(insn)) {
> +               wr_mask =3D riscv_insn_csrrwi_extract_imm(insn);
>                 new_val =3D -1UL;
> -               break;
> -       case GET_FUNCT3(INSN_MATCH_CSRRCI):
> -               wr_mask =3D rs1_num;
> +               csr_num =3D riscv_insn_csrrsi_extract_csr(insn);
> +       } else if (riscv_insn_is_csrrci(insn)) {
> +               wr_mask =3D GET_REG(riscv_insn_csrrwi_extract_imm(insn));
>                 new_val =3D 0;
> -               break;
> -       default:
> +               csr_num =3D riscv_insn_csrrwi_extract_csr(insn);
> +       } else {
>                 return rc;
>         }
>
> +       #undef GET_REG
> +
>         /* Save instruction decode info */
>         vcpu->arch.csr_decode.insn =3D insn;
>         vcpu->arch.csr_decode.return_handled =3D 0;
>
> --
> 2.54.0
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
