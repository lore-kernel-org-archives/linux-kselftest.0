Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20861471263
	for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 17:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786555590; cv=pass; b=CPLzZWgROizw9cXWx9i8HbEWxVIrPqhb1VaV1zI6Woy/5srX0u1NX+K3uxFCrHBC5DWBI4GMmrGim4rtPFAulH2Mq4VmiPv3cAIzyYpkoNgOYfQ7s+IcvEXCmLb/fmunM+laAdGEfEOkDGzW6/J0ZdAa6AMzqGgpwWt9HnTLzXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786555590; c=relaxed/simple;
	bh=ta2r+MXrofiKskIPBz8zMDvkxB3jNjdiEPLMmGX+1zk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1DhfG88rBSaadp9hpDe/d7GsWcDvwtRtdYuEdqua5SB1KPtryRmPtyy05T3hfGSSmeaGjRYzjBMXc1B7lgKiU6Ov5+OiH6Dgwe5DjDGUp2NzuGIsDpgrq4IWxj7UfPQf/Nk9xwNrQVmi7kK15oRdgbSwp/ODXIN6Xlb+0LVmD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=aA07fkBC; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="aA07fkBC"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49558ce01afso9822385e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 10:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786555586; cv=none;
        d=google.com; s=arc-20260327;
        b=Qoix4nBOFwoguxb4vUPmGyYGDmnU818vSdSfYPHU2DVqg+utpPHggl1MWh+Zf3++Wu
         Y9iPFm1rQ3F46jI2kKJw6ZbGdn3G2yDqIMsz+oiHg8WwSWGimaH6Id8cccp5zjdEgCfm
         ZQ2g6/24iwob4vcuT5aAbeGEDjOdcTxhlCtO4nX1qR234Hy4y3hgILvOIAzF+cVou3Zg
         yhpSzMLelhNR+uIvyrQMkAOzLp7tj+A8PUka/+kw7jR8meLPiGSQO/Iu5Lro0OjtT3ub
         h/5vjDM42ZRsCvIb5f77JD684KpsDq5ApbE+4Ss8bNRm3URxUYb+8kBSbb0ZrhJcmzbY
         3sMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dA6y6PhGE/45uAcglqNuchK/GS3YEtQSFjGCxv/WTsQ=;
        fh=+8v+jJP9+xU9bAAxvfILRYe1mKQLoW7IOeoashP9eZA=;
        b=AJsCAj9QWzSDwTleYpaYhhamxK355wLu2WQhzl/il62NcFIJfSXbJUVtV5QTBACRmc
         K2A6gw2QX+OJK4TS3lR5L4IUfBcSCmGHKTbTncxKOoAnn+DoFlbDwh1ZhPEv3kREyNsB
         UBgym/TXIupVm4nAq7Gd5SPjRIZlubQw27gLi5PVp1x5vImIwZg4nDO11qEZpw/DiHE1
         alTJ7ygEfBnMtQhiYpPwVd82f/G1MHx9MT8W+AMSbGwnFio2bPESNT/QdAMGEoWzktVN
         FoB6b3EwEcOVISg2QS5sckjQ1IQGkrI4iHEGMcw4tLaJp3xiOdQ84bLaymZr/WwYu5pm
         r1aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786555586; x=1787160386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dA6y6PhGE/45uAcglqNuchK/GS3YEtQSFjGCxv/WTsQ=;
        b=aA07fkBCdLY1QhnKT2SxEA6QJa4QCITbLh57ciSCQlDfab75KWOlQgERdymg4gykHM
         j4ml1wq2EfBQ4YZR38L5kFFT8kD3dYkqkYzXx7m3meLdsYis6RNQkkqRMLMFwrcN36oM
         ts9eGSMgK3AWioDsFoVl389Jw8OfJRBA630Shhvob/8NmPc4ZKcMsatWJAj8/RGgVN1r
         zxwA+g6OHT0DixwTCd2Kv/F9TKaUB3MVulM6bM56Y994/su8VTvmP+HixmlIh9au2O7t
         LjUT+ldpzp5n6UexocVUWRFUx3jVSVaUNlpJ/pqBxpi/P1MPR8ZOEOdvWbWxBWcHeccJ
         v4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786555586; x=1787160386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dA6y6PhGE/45uAcglqNuchK/GS3YEtQSFjGCxv/WTsQ=;
        b=g2RKc2oWluf6jMZZ8yOHs8jQJgjcMReKf1M0LfhsowtAX42Sx2xEaAo8rTZ8LTBuTj
         suVDS8fUBzfj4zAfFFEfWuNSKqr8Wn6fwmIMrvqmg2fNn1+eJQmqFrQlMA0/Zt1YebDG
         glSNJjjL46LYH1rhbCxosT8EknzCrozL25Cu7HDpbZG1hGi0V8TIzZnX20HVXuumL/B2
         4i7WbRz/A9gUGGBcaXeOqWW1vVWdfSN6UyLPNtDVWr8tnfeKEotihnxgiVExuOl7dzFh
         5Bp/c5WNmCFAbyT4n2t/u6Udl97ubabR152hCIuLeAtG2VB56GaTOZSHzklm6YFOfTKD
         +/LA==
X-Forwarded-Encrypted: i=1; AHgh+RodKIMdgOErkQFPaGKm4x5Rd65Q+cKKrm8SlJiAEjrUO7wXqCDAFrbWwy+2oYGs0503uOSDidzHOJHUw5flIAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4S3mvZdzIx7eycb95uW8t+/9wAxnZVB6dANoK3m/9gBAXTQe
	3K0snvKoaIaNQ4EU4fHq5i3QXsvmOhOWauaNBTl8ugDxb5wJ2RMHXEKensvmVJkUvx0zd7gA1ic
	MPljOfirQdHvOJHwgf4P1N3FTLz8cdeOHXLQtn3maaA==
X-Gm-Gg: AR+sD12/HleWQo1/uGBVWOOzpdqOAFAC9vLhT2YbTm8Xnb0GjB22U1BUuqlnb+As5sK
	h/0VM0K73ztTAGc4zYixnrZYfsYZ6mqqFSlImRZeR6toTP+OvcGdjk+SVOm555v/dKCJHxC8Dgw
	Uxana40TMJw8ZPkwdDiumsGI5S/C+Dyv0VMEPY1IGJKGg34scDCG6cqxo0KK7ZTVsduc5+P1NJJ
	KLvGj6b0D/lMgidpOdRc0iq3OAsxAdVsq6BOUseRp2t2rvZz74pQLFk28bIq89Jq01XMl9Cmccz
	p1PCJizTXVWTC7OYHygxeYnZGphxKaIKkmuUU3WgUhn5HDIR+uibRriqN5SUjAc4KqODRtQfjvQ
	lNnRmhJj49rriG+pho4tvqDpXtv0KWocWngPHaBLN0pu7n671Q1dXNPDT+XuQknZ2
X-Received: by 2002:a05:600c:3b19:b0:493:e983:806e with SMTP id
 5b1f17b1804b1-4997c0f7575mr91001305e9.3.1786555586180; Wed, 12 Aug 2026
 10:26:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722073344.771230-1-jinrui@haiwei.tech> <034CA48A67574B32+20260811085036.2862645-1-jinrui@haiwei.tech>
In-Reply-To: <034CA48A67574B32+20260811085036.2862645-1-jinrui@haiwei.tech>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Aug 2026 22:56:14 +0530
X-Gm-Features: AUfX_mxTb8kd-0mF-_iQMqEbcxOgkLvwD2fPyWg4u1ceODY3a_3MOM_LK6jBndc
Message-ID: <CAAhSdy0K5H23AC9X_OA-cj6wppcw7fWPEHQZFzkTR+Rjnv6jBw@mail.gmail.com>
Subject: Re: [PATCH v9] KVM: selftests: riscv: Add lazy V extension enablement
 for guests
To: JinRui <jinrui@haiwei.tech>
Cc: pbonzini@redhat.com, shuah@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	alex@ghiti.fr, sashiko-bot@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 2:21=E2=80=AFPM JinRui <jinrui@haiwei.tech> wrote:
>
> From: jinrui <jinrui@haiwei.tech>
>
> When the cross-compiler defaults to an -march that includes the V
> (vector) extension, -O2 auto-vectorization generates vector
> instructions (e.g. vsetvli, vadd.vv) in Guest binary code. If the
> Guest executes a vector instruction while sstatus.VS is Off, an
> EXC_INST_ILLEGAL (scause=3D2) is raised. KVM's hedeleg delegates this
> exception to the Guest, but the selftest has no way to handle it as a
> bare-metal program, causing all Guest tests to fail.
>
> In contrast, a real OS kernel handles this via riscv_v_first_use_handler(=
),
> which detects the vector instruction, sets sstatus.VS to Initial, and
> srets to re-execute.
>
> Fix this with four changes in processor.c:
>
> 1. Delete the now-unused guest_unexp_trap() handler, which is replaced
>    by the full exception vector table.
>
> 2. In vm_arch_vcpu_add(), notify KVM that the Guest is allowed to use
>    the V extension via __vcpu_set_reg(V, 1) (best-effort, silently
>    ignores errors on hardware without V). Also replace the raw stvec
>    handler with the full exception vector table, which provides
>    save_context/restore_context for safe lazy enablement.
>
> 3. In route_exception(), add a lazy V enablement check that runs
>    before any test-registered handler. When the cause is a non-IRQ
>    EXC_INST_ILLEGAL and sstatus.VS is Off, set VS to Initial and
>    return so the faulting instruction is re-executed via sret.
>    Track the epc per-vCPU via a flexible array member to avoid
>    infinite loops on hardware without V and eliminate races between
>    concurrent vCPUs.
>
> 4. Make vm_init_vector_tables() idempotent by checking vm->handlers
>    before allocation, so tests that manually call it (ebreak_test,
>    arch_timer, sbi_pmu_test) do not leak memory.
>
> The check runs before test-registered EXC_INST_ILLEGAL handlers
> (e.g. sbi_pmu_test) to ensure V enablement takes priority.
>
> Tested on a riscv64 host with KVM enabled: all 20 KVM selftest
> binaries pass (arch_timer, ebreak_test, steal_time, get-reg-list,
> sbi_pmu_test, etc.).
>
> Signed-off-by: jinrui <jinrui@haiwei.tech>
> ---
> Changes in v9:
> - Size the per-vCPU epc array by KVM_CAP_MAX_VCPU_ID instead of
>   KVM_CAP_MAX_VCPUS, since vcpu_id may be sparse and exceed the vCPU
>   count (found by sashiko-bot review).
>
>  .../selftests/kvm/lib/riscv/processor.c       | 115 +++++++++++++++---
>  1 file changed, 100 insertions(+), 15 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3..05e20ef40 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -17,6 +17,13 @@
>
>  static gva_t exception_handlers;
>
> +struct handlers {
> +       exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS=
];
> +       bool v_available;
> +       unsigned int v_epc_capacity;
> +       unsigned long v_epc[];
> +};
> +
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
>  {
>         unsigned long value =3D 0;
> @@ -298,13 +305,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *v=
cpu, u8 indent)
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
>  }
>
> -static void __aligned(16) guest_unexp_trap(void)
> -{
> -       sbi_ecall(KVM_RISCV_SELFTESTS_SBI_EXT,
> -                 KVM_RISCV_SELFTESTS_SBI_UNEXP,
> -                 0, 0, 0, 0, 0, 0);
> -}
> -
>  void vcpu_arch_set_entry_point(struct kvm_vcpu *vcpu, void *guest_code)
>  {
>         vcpu_set_reg(vcpu, RISCV_CORE_REG(regs.pc), (unsigned long)guest_=
code);
> @@ -348,8 +348,33 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm,=
 u32 vcpu_id)
>         /* Setup sscratch for guest_get_vcpuid() */
>         vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(sscratch), vcpu_id);
>
> -       /* Setup default exception vector of guest */
> -       vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)g=
uest_unexp_trap);
> +       /*
> +        * Enable the V (vector) extension in KVM so that the compiler ca=
n
> +        * safely generate vector instructions (e.g. via -O2 auto-
> +        * vectorization). Silently ignore errors; the test will still wo=
rk
> +        * without V.
> +        */
> +       __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_V), 1);
> +
> +       /*
> +        * Use the full exception vector table (which provides lazy V
> +        * extension enablement for EXC_INST_ILLEGAL in route_exception)
> +        * as the default exception handler. vm_init_vector_tables() is
> +        * idempotent; tests that call it again will get a no-op.
> +        */
> +       vm_init_vector_tables(vm);
> +       vcpu_init_vector_tables(vcpu);
> +
> +       /*
> +        * Record V extension availability in the handlers struct so that
> +        * route_exception() (called from Guest context) can check it
> +        * without relying on a host-side global variable.
> +        */
> +       {
> +               struct handlers *h =3D addr_gva2hva(vm, vm->handlers);
> +
> +               h->v_available =3D __vcpu_has_isa_ext(vcpu, KVM_RISCV_ISA=
_EXT_V);
> +       }
>
>         return vcpu;
>  }
> @@ -408,19 +433,17 @@ void assert_on_unhandled_exception(struct kvm_vcpu =
*vcpu)
>         struct ucall uc;
>
>         if (get_ucall(vcpu, &uc) =3D=3D UCALL_UNHANDLED) {
> +               vcpu_dump(stderr, vcpu, 2);
>                 TEST_FAIL("Unexpected exception (vector:0x%lx, ec:0x%lx)"=
,
>                         uc.args[0], uc.args[1]);
>         }
>  }
>
> -struct handlers {
> -       exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS=
];
> -};
> -
>  void route_exception(struct pt_regs *regs)
>  {
>         struct handlers *handlers =3D (struct handlers *)exception_handle=
rs;
> -       int vector =3D 0, ec;
> +       int vector =3D 0;
> +       unsigned long ec;
>
>         ec =3D regs->cause & ~CAUSE_IRQ_FLAG;
>         if (ec >=3D NR_EXCEPTIONS)
> @@ -432,6 +455,46 @@ void route_exception(struct pt_regs *regs)
>                 ec =3D 0;
>         }
>
> +       /*
> +        * Handle V (vector) extension lazy enablement before any
> +        * registered handler. The compiler's default march may include
> +        * V, and auto-vectorization generates vector instructions that
> +        * trigger EXC_INST_ILLEGAL when VS (Vector Status) in sstatus
> +        * is Off. Enable VS to Initial and re-execute the faulting
> +        * instruction, mimicking what a real OS kernel does.
> +        *
> +        * This check runs before any test-registered handler, so tests
> +        * that install their own EXC_INST_ILLEGAL handler (e.g.
> +        * sbi_pmu_test) are not affected.
> +        */
> +       if (!(regs->cause & CAUSE_IRQ_FLAG) && ec =3D=3D EXC_INST_ILLEGAL=
) {
> +               /*
> +                * If KVM supports the V extension for this Guest and VS
> +                * (Vector Status) is Off in the saved sstatus, set it to
> +                * Initial and re-execute the faulting instruction.
> +                *
> +                * Use regs->status (saved at exception entry) rather tha=
n
> +                * reading the live CSR to avoid a TOCTOU race.
> +                *
> +                * Track the epc per-vCPU to avoid an infinite loop when
> +                * V is disabled or the hardware rejects the VS change.
> +                * Using a per-vCPU array avoids races between concurrent
> +                * vCPUs that would occur with a single shared (epc, vcpu=
)
> +                * pair.
> +                */
> +               if (handlers && handlers->v_available && !(regs->status &=
 SR_VS)) {

Treating all illegal exceptions as V instruction traps is not the right the=
 way.
We may have genuinely unexpected traps for which guest_unexp_trap()
should be called.

> +                       unsigned int vcpu_id;
> +
> +                       asm volatile("csrr %0, sscratch" : "=3Dr" (vcpu_i=
d));
> +                       if (vcpu_id < handlers->v_epc_capacity &&
> +                           handlers->v_epc[vcpu_id] !=3D regs->epc) {
> +                               handlers->v_epc[vcpu_id] =3D regs->epc;
> +                               regs->status |=3D SR_VS_INITIAL;
> +                               return;
> +                       }
> +               }
> +       }
> +
>         if (handlers && handlers->exception_handlers[vector][ec])
>                 return handlers->exception_handlers[vector][ec](regs);
>
> @@ -448,9 +511,31 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
>
>  void vm_init_vector_tables(struct kvm_vm *vm)
>  {
> -       vm->handlers =3D __vm_alloc(vm, sizeof(struct handlers), vm->page=
_size,
> +       unsigned int max_vcpu_id;
> +       size_t size;
> +
> +       if (vm->handlers)
> +               return;
> +
> +       max_vcpu_id =3D kvm_check_cap(KVM_CAP_MAX_VCPU_ID);
> +       if (max_vcpu_id =3D=3D 0)
> +               max_vcpu_id =3D 512;
> +
> +       /*
> +        * vcpu_id may be sparse and ranges from 0 to KVM_CAP_MAX_VCPU_ID
> +        * (which can be much larger than KVM_CAP_MAX_VCPUS), so size the
> +        * per-vCPU epc array accordingly.
> +        */
> +       size =3D sizeof(struct handlers) + (max_vcpu_id + 1) * sizeof(uns=
igned long);
> +       vm->handlers =3D __vm_alloc(vm, size, vm->page_size,
>                                   MEM_REGION_DATA);
>
> +       {
> +               struct handlers *h =3D addr_gva2hva(vm, vm->handlers);
> +
> +               h->v_epc_capacity =3D max_vcpu_id + 1;
> +       }
> +
>         *(gva_t *)addr_gva2hva(vm, (gva_t)(&exception_handlers)) =3D vm->=
handlers;
>  }
>
> --
> 2.53.0
>

Regards,
Anup
