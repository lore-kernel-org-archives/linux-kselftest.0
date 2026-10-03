Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F04D14883F
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791019169; cv=pass; b=hAr6AAvOgHM+rxa5alYtUWHLhJsFgQHb13r7hkABObb7qMrctLSmxPhLuzdx/xwKa3f3JTcY8FNHebUlD+IY3lVbr5lPHS4sWVU1tCjSiWQh+GkWwSNeJvL+L7c4JnbGNt1aY+lORgZRgjO2rGFdZXDVjP4BEi/8uAzWtSwcMIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791019169; c=relaxed/simple;
	bh=1vkbLOapIoZdupJGLkgKVFftR3WGofzckhtFonhwkmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTyyaajqePD1aJ9GEl+FRTSVj1ABbRO5V8LVmmyMrK0f1eSzBLcLuhCaBeCjb6e6QSo3Fx4T2Cgb4GbaxQ5P1Vp2d9GcjOVulkZ7TIWQkKN4z5U5AZ1VzRnpZxKFxhxfNa7vhITvSkhyrYek5hwda4UGLrS5r15zav0M872q32c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=CxXdmGYr; arc=pass smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="CxXdmGYr"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so106304f8f.1
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 02:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791019165; cv=none;
        d=google.com; s=arc-20260327;
        b=jWjngIXMawfNBUJNqKNKlYWSmjXDCQClfOmNGEJpVldGdkkl10LoZlAw2GCgUEaT5J
         b1dJAQ88oncVk1QnB1CQl1cQ9dhelfX9wR5229ws5sd4NSqTh+0XcuRrPIvIPi+eMSFP
         e+kGclrZxtT5yZQ57S6983X9TAdFcgAL+xySErJfwjM7jItjO76Fnb3pIvdgHC4K+IGr
         dt0qqMW4CxK/m6Y42rEXHHbqjEFIYrS2F+TEIi18rJo/iWhXCeW3cNdI4Xzxk2DHhnjb
         5K4AaDhsVGAqN2hNHa8iLVu2R4LiuQv2WYCSydtnp9A/13gqyz38s+df4aqmgI6nzmL0
         eDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        fh=fFg9j9TLfTKko2T3yyBGztkA75UhGzjzM1us6Q6Y3Gk=;
        b=HQ0USvtkeF5fY2DLfJ6jrQnwR/tGv+DG9MqNgWzwCoIfOx1+BCxuJ6hADQczgi9wbQ
         TJoZgDaTxQYwyn3pe3O7ja0KP+8ib1eMHylFvmEpbeG45gOc7wiKlP0rk7zHMqS2/FYk
         z/sCJoRfNpZsYLerv3BZLSij7n7lKtnHfsbk1+jKiQI2ssgWb6Z68DgoU61a4TuJyUns
         t8g+yS79vREyaRQgH4ADDOxefmlnJvBtgFjBtPppqGaKyaatWO4ZJFzlIXnJbv2AM9oX
         59SWpIrW5ahTtAth4+fKQEIvfAaFCz75tQLaTtTHGFG+eAsjdtQaF6xj9VjOzwu2DuUr
         R+NA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791019165; x=1791623965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        b=CxXdmGYrA6t3j6pahclV2ZdEhiB7E0rH3NoeRO6XYogSXvGfo/ygDNLeL6VIvcqMA5
         jylLnXX0qE6wBhNiEP8JqpzkhI8ZGtlI/Z9b9eLRpfr3bCunjKid7U8AdhmZ/8Qp08vR
         X/cbxYttPFSGkxVIcrN+TBLNBvnufoXjTsyzZtdRvGYxTT1znRXeY1vJy0Ave7/zXI7+
         dtAwW1Kiylj2qVyjOK+BqVk2DbHRgBbg/6KMj/SccpbOx7Ozy8fgXKtvhy5zdKM9/KXk
         Ky4/cLKxmTIu3Efc6tJwjWnZCIlXEW1ayUqBILGihs/jmWJfyF7ab07C6f4u5SfMN+6M
         K9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791019165; x=1791623965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7G906vmlH00LsrZjaBVRjiLd8jr6S5ZtecbYcljE/E=;
        b=0P1uVit1cnoJvt92NPG/tKIWrPZq6nzCa/RHTUugynSRKf7JAD27d0jnNZgViJoVK+
         2/xR4o22xuzAs5Jxn3uDRZtndPoyrkCfVxo5n/FsxfPYslav3tDdUaLj95OPQh6e2BQ2
         kClyNGprFQEf1SDnAJtRWWXbbjugxNJbQI3QV/OgHBUVDcjlIvujbkHp+9i8Z5dw2c+0
         WRQyvCfLNLWKjUbGa4CgUWjQ9CBqESKmHCtibZDGbYiJdgdiL9hlqyPy1cGxcFYTnIhp
         uBKPTSagNf6qmffEcryv7J0fPWs/6iJovmyYPZio69wwaLauxd/jBgVxBfVDtnTxMJWI
         q/2g==
X-Forwarded-Encrypted: i=1; AKwUvByPp6eHsqDAVAQ+AI04RMEDNkU4S5wiHJ6fNVFMuAfDIf45pLon+tnoVIodWeP4mff9YYV53leqX697wEfxBK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsDLZ7jOkd+SHJjLOT6wjYm4CmendMlOgHrGbkQNntWM+hyVZV
	iJLNYrXNLBs6RYYLIsDBr4ah/y6zXBzafs2niHbO5ssmttPItSyLvfCR1NSN2/r00ic2FLzJP+V
	H0gUjBGpm1x9KWwSx0oYReVMpKLCfXCDy00/Ojd0QyA==
X-Gm-Gg: AYBFou1C93U565jEpbKY3rSC3NlLrT8sH3fSVHLOitcnk+90A7kNvZzMquccyjxp+ry
	HnDO56cJTEc8nvat1Pr7WtrKQN4+LYUpvqSehNrLB8Lkv6AjFNq35bvZcjx9GwepYgLzo0dnBXL
	lnD2/9QeGb33NZk3+Mtf+4ntaEEylaDjyXcYq4RlWVbrW/iRpSvfySvP13kUbzYXr49VdpaUiH7
	/6fC01v1AYgGppdjYwNf8T+loPUp2iBTnnnnhBdfpcqd2yiumFk2xlDlH6t2w7Ezolm5lJMf2w5
	PFLH/HOZYu05yOSLzNvQuHbfxN5cy6dKBECQMV1mofFW3WdcHNc1v6f7jL9e3hmv3oOoKv9rGO5
	V+xC6uUyyHqgdg4ZuP/Odu36QjY9MgyqQOjl+jGTGEKRlMTbUN/wvlE9D/h5XaHxzcwYZ2KrWJC
	RQ
X-Received: by 2002:adf:f14c:0:b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48b1275c3d9mr6420136f8f.47.1791019164372; Sat, 03 Oct 2026
 02:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7C0512E558D1614D+20260813095615.3843757-1-jinrui@haiwei.tech> <20EA6EE00884FB87+20260813102930.3892251-1-jinrui@haiwei.tech>
In-Reply-To: <20EA6EE00884FB87+20260813102930.3892251-1-jinrui@haiwei.tech>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 14:49:10 +0530
X-Gm-Features: AclHuK-xVBdazlcCE3cizjwPJo6pXdqplydNmBBVwMTC6dRcHa5DgpPQEbOzyeI
Message-ID: <CAAhSdy04HzvdSnOn7oWQH9zvGtjBWQW6DJsyun7EOR77PNqS=Q@mail.gmail.com>
Subject: Re: [PATCH v13] KVM: selftests: riscv: Add lazy V extension
 enablement for guests
To: JinRui <jinrui@haiwei.tech>
Cc: pbonzini@redhat.com, shuah@kernel.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	alex@ghiti.fr, sashiko-bot@kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:59=E2=80=AFPM JinRui <jinrui@haiwei.tech> wrote:
>
> From: jinrui <jinrui@haiwei.tech>
>
> When the cross-compiler defaults to an -march that includes the V
> (vector) extension, -O2 auto-vectorization generates vector instructions
> (e.g. vsetvli, vadd.vv) in guest code. Executing such an instruction with
> sstatus.VS Off raises EXC_INST_ILLEGAL (scause=3D2); KVM's hedeleg forwar=
ds
> it to the guest, but the bare-metal selftest cannot handle it, so all
> guest tests fail. A real kernel handles this via
> riscv_v_first_use_handler(), which enables V and re-executes the
> instruction.
>
> Fix it in processor.c:
>
> 1. Delete the now-unused guest_unexp_trap() handler, replaced by the full
>    exception vector table.
>
> 2. In vm_arch_vcpu_add(), advertise V to KVM via __vcpu_set_reg(V, 1)
>    (best-effort, errors ignored on hardware without V) and install the
>    full exception vector table instead of a raw stvec handler.
>
> 3. In route_exception(), decode the faulting instruction (stval) with
>    insn_is_vector() and, when it is a vector instruction while sstatus.VS
>    is Off, set VS to Initial and sret to re-execute it, before any
>    test-registered handler. Genuinely illegal instructions still reach
>    the unexpected-exception path.
>
> 4. Make vm_init_vector_tables() idempotent by checking vm->handlers
>    before allocating, so tests that call it directly (ebreak_test,
>    arch_timer, sbi_pmu_test) do not leak memory.
>
> Tested on a riscv64 host with KVM enabled.
>
> Signed-off-by: jinrui <jinrui@haiwei.tech>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup

> ---
> Changes in v13:
> - Assemble the 32-bit instruction from two 16-bit halfword reads instead
>   of a single 32-bit load, since with IALIGN=3D16 a 32-bit instruction ca=
n
>   start on a 2-byte boundary (Sashiko review).
>
>  .../selftests/kvm/include/riscv/processor.h   | 13 +++
>  .../selftests/kvm/lib/riscv/processor.c       | 99 ++++++++++++++++---
>  2 files changed, 99 insertions(+), 13 deletions(-)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tool=
s/testing/selftests/kvm/include/riscv/processor.h
> index e3acf2ae9881..685baefebdb1 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -25,6 +25,19 @@
>  #define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHI=
FT_FUNCT3)
>  #define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SH=
IFT)
>
> +/* Vector (V) instruction decoding, matching arch/riscv/include/asm/insn=
.h */
> +#define RV_INSN_OPCODE_MASK    0x7f
> +#define RVG_OPCODE_SYSTEM      0x73
> +#define RVV_OPCODE_VECTOR      0x57
> +#define RVV_OPCODE_VL          0x07
> +#define RVV_OPCODE_VS          0x27
> +#define RVV_VL_VS_WIDTH_8      0
> +#define RVV_VL_VS_WIDTH_16     5
> +#define RVV_VL_VS_WIDTH_32     6
> +#define RVV_VL_VS_WIDTH_64     7
> +#define RVV_EXTRACT_VL_VS_WIDTH(insn)  (((insn) >> 12) & 0x7)
> +#define RVG_EXTRACT_SYSTEM_CSR(insn)   (((insn) >> 20) & 0xfff)
> +
>  static inline u64 __kvm_reg_id(u64 type, u64 subtype, u64 idx, u64 size)
>  {
>         return KVM_REG_RISCV | type | subtype | idx | size;
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..d00ac997291c 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -17,6 +17,11 @@
>
>  static gva_t exception_handlers;
>
> +struct handlers {
> +       exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS=
];
> +       bool v_available;
> +};
> +
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, u64 ext)
>  {
>         unsigned long value =3D 0;
> @@ -298,13 +303,6 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *v=
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
> @@ -348,8 +346,26 @@ struct kvm_vcpu *vm_arch_vcpu_add(struct kvm_vm *vm,=
 u32 vcpu_id)
>         /* Setup sscratch for guest_get_vcpuid() */
>         vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(sscratch), vcpu_id);
>
> -       /* Setup default exception vector of guest */
> -       vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(stvec), (unsigned long)g=
uest_unexp_trap);
> +       /*
> +        * Advertise V to KVM so -O2 auto-vectorization in guest code is =
valid;
> +        * ignore errors since the tests work without V too. Use the full
> +        * exception vector table (which lazily enables V in route_except=
ion())
> +        * as the default handler; vm_init_vector_tables() is idempotent.
> +        */
> +       __vcpu_set_reg(vcpu, RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_V), 1);
> +       vm_init_vector_tables(vm);
> +       vcpu_init_vector_tables(vcpu);
> +
> +       /*
> +        * Record V availability for route_exception(), which runs in gue=
st
> +        * context. V is enabled uniformly for every vCPU, so this is a
> +        * VM-wide property.
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
> @@ -408,19 +424,43 @@ void assert_on_unhandled_exception(struct kvm_vcpu =
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
> +static bool insn_is_vector(u32 insn)
> +{
> +       u32 opcode =3D insn & RV_INSN_OPCODE_MASK;
> +       u32 width, csr;
> +
> +       /* All V-related instructions are 4-byte, i.e. not compressed. */
> +       if ((insn & 0x3) !=3D 0x3)
> +               return false;
> +
> +       switch (opcode) {
> +       case RVV_OPCODE_VECTOR:
> +               return true;
> +       case RVV_OPCODE_VL:
> +       case RVV_OPCODE_VS:
> +               width =3D RVV_EXTRACT_VL_VS_WIDTH(insn);
> +               return width =3D=3D RVV_VL_VS_WIDTH_8 || width =3D=3D RVV=
_VL_VS_WIDTH_16 ||
> +                      width =3D=3D RVV_VL_VS_WIDTH_32 || width =3D=3D RV=
V_VL_VS_WIDTH_64;
> +       case RVG_OPCODE_SYSTEM:
> +               csr =3D RVG_EXTRACT_SYSTEM_CSR(insn);
> +               return (csr >=3D CSR_VSTART && csr <=3D CSR_VCSR) ||
> +                      (csr >=3D CSR_VL && csr <=3D CSR_VLENB);
> +       }
> +
> +       return false;
> +}
>
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
> @@ -432,6 +472,36 @@ void route_exception(struct pt_regs *regs)
>                 ec =3D 0;
>         }
>
> +       /*
> +        * Lazily enable V on the first vector instruction: if the faulti=
ng
> +        * instruction decodes as vector while VS is off, set VS to Initi=
al
> +        * and re-execute it, like the kernel's riscv_v_first_use_handler=
().
> +        * Genuinely illegal instructions continue to the unexpected-exce=
ption
> +        * path.
> +        */
> +       if (!(regs->cause & CAUSE_IRQ_FLAG) && ec =3D=3D EXC_INST_ILLEGAL=
 &&
> +           handlers && handlers->v_available && !(regs->status & SR_VS))=
 {
> +               u32 insn =3D (u32)regs->badaddr;
> +
> +               /*
> +                * stval is not guaranteed to hold the faulting instructi=
on.
> +                * Vector instructions are always 32-bit, so check the fi=
rst
> +                * 16-bit halfword and, for a 32-bit instruction, assembl=
e it
> +                * from two halfwords to avoid an unaligned 32-bit access=
.
> +                */
> +               if (!insn) {
> +                       u16 half =3D *(u16 *)regs->epc;
> +
> +                       if ((half & 0x3) =3D=3D 0x3)
> +                               insn =3D (u32)half | ((u32)*(u16 *)(regs-=
>epc + 2) << 16);
> +               }
> +
> +               if (insn_is_vector(insn)) {
> +                       regs->status |=3D SR_VS_INITIAL;
> +                       return;
> +               }
> +       }
> +
>         if (handlers && handlers->exception_handlers[vector][ec])
>                 return handlers->exception_handlers[vector][ec](regs);
>
> @@ -448,6 +518,9 @@ void vcpu_init_vector_tables(struct kvm_vcpu *vcpu)
>
>  void vm_init_vector_tables(struct kvm_vm *vm)
>  {
> +       if (vm->handlers)
> +               return;
> +
>         vm->handlers =3D __vm_alloc(vm, sizeof(struct handlers), vm->page=
_size,
>                                   MEM_REGION_DATA);
>
> --
> 2.53.0

Regards,
Anup
