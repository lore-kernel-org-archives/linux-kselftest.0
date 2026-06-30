Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E193E3163
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 06:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782800276; cv=none; b=ptqWY72W7Ki89su+HFfrwFABNKRXGxDDkv5sr/SrF8OJmKuV18AIul63lQFsbYJR9fy2QME4C+NP2p6DOFwU3SzsaogPvU1GDpPY1UvZQVmv6evKYMhzq4rHE5cCd2/V3niD3/NzWsW7NypN28aOHBGnHNCxt5RnYzkQVw2zOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782800276; c=relaxed/simple;
	bh=rtzEqKJ3lSJLlG6ekherfDyGEniFcemmWjlnIRujPjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1spOkZToGH2g2HE1XAjsU0AVWyh/beBfo/jE2msrRH5E60c0EJYpHmQoCZZ24DinJMUXqz3vgZ20waR0LM6EfgJnYQjmlPZCBR7bDrQCRbGft552ZsCNPF4Gemg6RcSDHfhoCSD9boAX6+aHOyvHvqrWm/GwrziBZUvr/DQ0UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvjVcB0z; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvjVcB0z"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-139f71a5201so308233c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 29 Jun 2026 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782800274; x=1783405074; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJsH3I+i++RnxS0RIEDx7KJuxyJs96diVU6IFO/NzsQ=;
        b=qvjVcB0zNV2gVuYWiLsLScenPJiNkgtMNLoyLnXpp7wL4h1PxQ90cQCev+5OlsPPv0
         Et5Zlv4Rk92EFgVPrdiT6Wgg8iOwVTfAol0zuxn4vciOGtIBkDJDcOl7NvInbU6atEq/
         5x2wRtxFwiaVM8IkTP7JIgi4g0ut5y1bAblPTyvWDuXbNbbLsLj6kQyhT8WDDXbjMHD7
         EvWGjBjsolTYj1PqpmuLyjEAm1eLVdxXp6ZLiiLj4L+o5tTBcZNHM1y+K4uZaQSWf9mJ
         E4FhG4tYT0YSy/jU+xwTSKhTDnM6bqwd6w5sCn5nRJhgR45P1WCrDQf1mXAPCrb0K2gw
         GBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782800274; x=1783405074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJsH3I+i++RnxS0RIEDx7KJuxyJs96diVU6IFO/NzsQ=;
        b=VPAZFHZhlZBkUy+m4/f2y/sm081tyq6VrsBUhdWFhmR8PlXJJKDUfyVQdOuwmkOyxd
         biuxe0pJ6bTlRfxIBtz5OqM24mPUx/Ks9oLTXawXIjkbIDiuWECL9H6imHZgSvO8bE4t
         tEBh49Krw/86smy1fvcQX3rOzgapwiADe2tVUhFY4XmLQGMAceHOiAWg+b860SN6yiuu
         rcGOsvqTW6J8ZXU/NZ3CtJ2+ZANnbDVp0rHcCdeIaWIVsttN7IGTUJsgJbH+Pfalkr5C
         Pi5BCAw+Ni71oWzcvv4or3DnC8w/3eLfyjJfoGaL836KCXEYcC9sGwcihNZ0Wf+8ZR6N
         qHnQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VTyWLtJVv5b85fJmBotXSPjDNpO6EmIJ3EHy7pu3YZw2CjA48LhTcG8T8M0lRV5Iy8BOuYnNYTkP6NWqEq5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwG5s1PZgnkumCuCV0uwnH0KbEwM561uKF+Xxh0lT2IslZmNh8
	8eK5H1H4nrVvwj9WWDRq8Yr+/z740maAZNATHc4EdJxO3/iWKsUa1YN2
X-Gm-Gg: AfdE7ckHvgH4ZGSMsR9B8Z3Df1D17oB6+0CTep8or2x+5P2xQ1ypOVMeVE70M8h9CUL
	MjOWjPFkqbwksjoBDBBVOQnmwgDS7g3vIi1qsIE6MsqOnn/SAYoRzQOx/iI+GnkwVFv1qim5a96
	TLcFyE/aVcULe3QeyuHpjrJj4QDM4TgCGxM/LWE8esFI+IrRe2IhtInoKTQTjoxfJxIijqwlotX
	ZJOLV6de5HiFMTFvj31nQUdV7XHZ2zhpjkcR+B0C+IUd7RyMYj+90jQ4cX7dMv+ogoN00mP/uOT
	B1HGt/MhxNKOPN4M9eF3Cgk8OgnhfwQC0a1/eflCZ8g32uepACSiPD73Ho/+NYxfhjNkS5BS1J+
	RF/PDeX5RkD7UvtRqfJF6tpQfumeLt3F2xv4hfFjdYAwnUH6imRwaT8nV0rxZSoaboDJzPutIjr
	B3x6W/K1aYN4ShcCojTW60C3YKxwQEZdgD
X-Received: by 2002:a05:7022:206:b0:139:fe25:a53 with SMTP id a92af1059eb24-13b2e32bb8fmr435157c88.21.1782800273787;
        Mon, 29 Jun 2026 23:17:53 -0700 (PDT)
Received: from blinky ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b2abbba82sm4607658c88.14.2026.06.29.23.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:17:53 -0700 (PDT)
Date: Mon, 29 Jun 2026 23:17:50 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Jesse T <mr.bossman075@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Conor Dooley <conor@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Radim =?utf-8?B?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 08/16] riscv: kvm: Use generated instruction headers
 for csr code
Message-ID: <akNfjsbVVcPGNg5a@blinky>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
 <20260621-riscv_insn_table-v2-8-7f0810ee2274@gmail.com>
 <CAJFTR8T33Yw-wqPFVLe8it2cWjXCz_xPpRCRmoVMQyn7_=UBqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJFTR8T33Yw-wqPFVLe8it2cWjXCz_xPpRCRmoVMQyn7_=UBqw@mail.gmail.com>

On Mon, Jun 29, 2026 at 04:25:53PM -0400, Jesse T wrote:
> On Mon, Jun 22, 2026 at 1:08 AM Charlie Jenkins via B4 Relay
> <devnull+thecharlesjenkins.gmail.com@kernel.org> wrote:
> >
> > From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> >
> > Migrate the csr parsing code to use the generated instruction headers
> > instead of the hand-written instruction composition functions.
> >
> > Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> >
> > ---
> >
> > This is a simple transformation that I have again validated through
> > brute force.
> > ---
> >  arch/riscv/kvm/vcpu_insn.c | 47 +++++++++++++++++++++++-----------------------
> >  1 file changed, 24 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
> > index f09f9251d1f0..8ccf6ec722f0 100644
> > --- a/arch/riscv/kvm/vcpu_insn.c
> > +++ b/arch/riscv/kvm/vcpu_insn.c
> > @@ -146,43 +146,44 @@ int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
> >
> >  static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
> >  {
> > +       #define GET_REG(_rd) (*((unsigned long *)(&vcpu->arch.guest_context) + _rd))
> > +
> 
> IMO it would be better to make this a static inline function, otherwise.

Yeah that's fair, I'll make that change!

> 
> Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
> 
> >         int i, rc = KVM_INSN_ILLEGAL_TRAP;
> > -       unsigned int csr_num = insn >> SH_RS2;
> > -       unsigned int rs1_num = (insn >> SH_RS1) & MASK_RX;
> > -       ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
> > +       unsigned int csr_num;
> >         const struct csr_func *tcfn, *cfn = NULL;
> >         ulong val = 0, wr_mask = 0, new_val = 0;
> >
> >         /* Decode the CSR instruction */
> > -       switch (GET_FUNCT3(insn)) {
> > -       case GET_FUNCT3(INSN_MATCH_CSRRW):
> > +       if (riscv_insn_is_csrrw(insn)) {
> >                 wr_mask = -1UL;
> > -               new_val = rs1_val;
> > -               break;
> > -       case GET_FUNCT3(INSN_MATCH_CSRRS):
> > -               wr_mask = rs1_val;
> > +               new_val = GET_REG(riscv_insn_csrrw_extract_xs1(insn));
> > +               csr_num = riscv_insn_csrrw_extract_csr(insn);
> > +       } else if (riscv_insn_is_csrrs(insn)) {
> > +               wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
> >                 new_val = -1UL;
> > -               break;
> > -       case GET_FUNCT3(INSN_MATCH_CSRRC):
> > -               wr_mask = rs1_val;
> > +               csr_num = riscv_insn_csrrs_extract_csr(insn);
> > +       } else if (riscv_insn_is_csrrc(insn)) {
> > +               wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
> >                 new_val = 0;
> > -               break;
> > -       case GET_FUNCT3(INSN_MATCH_CSRRWI):
> > +               csr_num = riscv_insn_csrrc_extract_csr(insn);
> > +       } else if (riscv_insn_is_csrrwi(insn)) {
> >                 wr_mask = -1UL;
> > -               new_val = rs1_num;
> > -               break;
> > -       case GET_FUNCT3(INSN_MATCH_CSRRSI):
> > -               wr_mask = rs1_num;
> > +               new_val = riscv_insn_csrrwi_extract_imm(insn);
> > +               csr_num = riscv_insn_csrrwi_extract_csr(insn);
> > +       } else if (riscv_insn_is_csrrsi(insn)) {
> > +               wr_mask = riscv_insn_csrrwi_extract_imm(insn);
> >                 new_val = -1UL;
> > -               break;
> > -       case GET_FUNCT3(INSN_MATCH_CSRRCI):
> > -               wr_mask = rs1_num;
> > +               csr_num = riscv_insn_csrrsi_extract_csr(insn);
> > +       } else if (riscv_insn_is_csrrci(insn)) {
> > +               wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
> >                 new_val = 0;
> > -               break;
> > -       default:
> > +               csr_num = riscv_insn_csrrwi_extract_csr(insn);
> > +       } else {
> >                 return rc;
> >         }
> >
> > +       #undef GET_REG
> > +
> >         /* Save instruction decode info */
> >         vcpu->arch.csr_decode.insn = insn;
> >         vcpu->arch.csr_decode.return_handled = 0;
> >
> > --
> > 2.54.0
> >
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
