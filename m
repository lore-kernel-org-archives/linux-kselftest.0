Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA26298CA5
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 10:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540462; cv=pass; b=ZlfzMGxQ6CBtX0PS6jIiT6QfsqJVbWZj56JibunTXrJhxT7Lmxuri+eYMhcaCYWquuTAS3UuP/ZW/N7G16xNmHeB+FjX/8o3TtJ1m1H5VZXQ5eYUqwiy+xs4r48JR9ccbqH7XyWEQff/Y/C0mpjTynGRqQeCzrG6e00MDYC2tk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540462; c=relaxed/simple;
	bh=GkWN5edVJbSqZ/Lu7tScH+pETGbwVkwJGGt+4owIDBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ga+q5cc7Lg1TvDPAVbMUgFY4lZjBQ9PtbuLYlN3DMlyL3QvuhC+Ti394WdlXPjk9b5ByZs0kOZzs7hCMyGv/fMRM+2Yvia/l77sAcFErtmUoTZUKzv5+eeevJkINiOt11b3KU3eSTQFDLq0SBZXz44dQe7brAeJNsCU8ZOjydtc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b=gR/5hSI2; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.b="gR/5hSI2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0ef9c76eso4692850f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 03:07:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791540459; cv=none;
        d=google.com; s=arc-20260327;
        b=jrE6HO1kjPeYtSOJFzdhls4OzI99wyrTxTLOd5xHtMUyQHxOzrqOxWPwtyFZY8wN5J
         I4qzht07Hd1/7B3Gm8VAPT45z8pMp0Uy/g10pc2ZUuW5SdjDtaDXrcKAo3DlsUwNF9jm
         9MsfSUDtYxR/akuBOqo2DGJjSbyZxzmBVmDbkQHBsuZ0rktaf4FL6JQjsQ+vOMN0snbL
         Fz6tfdPtdtcBrJUGTpBAXJLjIt5vPC2fBc23PAwSE70DbX1Ysd+6H89WVCJ4mOGcXv8K
         1xE91UcvEVgTy3s6OcnJ8Ppolw3WDe387XJKq1uMMTXM+as+hm7DDFqiU+aIMBOVTQhY
         O82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        fh=ORwYkYb7Uvl7k6FWCpLsl/+VI1hOBJuz3snwqcfbNJo=;
        b=qJhtYGnupTciSqQM/MWvCLyLH359l6RYc/0+b0KL5/TH7LfxQngDqO+0iZne2Jl4rS
         sIquuMtfve9Tw70xA9EHVHhjYMWl5onD9ED7AauBUm6kn6UL80t4U4sTWS8cxueNTiYT
         3vCkK0Hz+uB/dhoNcRkM7Nb1kbOcCJicnZ0/VJ6GtfkL4mJIf4UoFulvONRhhDC0TcT+
         714Ot4riHwOZf/1meTZOg1rA6q13eDKgS9VWvNDqhf6z11KkvGtoR0DHGLgkSvTFEAU+
         /pKhtRW/X8/pGhc+snwEgEixWMBpB5uz1ypoi0qahGj+A4DYP3ElBDYNeQkFADAP6CqZ
         ZBww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791540459; x=1792145259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=gR/5hSI2Yeusppe/jk1I2k41WyZpPYsJp9XMOYQC2zVFAdTu6CKhJep31XoaXX4oTD
         7GJVek8p6rDxlQRWLGGmi+NrmSahlHWnm9VqT7SHUzAcn41GTBRQd9Bki2DdbI/CF2In
         TKj08i9skPnr7MJ3zGzMyUW9RfnxjvQtdvulxAY/FerMjOwOdc6QaSk9UF8XzBI1JFas
         5GTtgQm/jiUtjr603dgqFB/Klivj6NEieuYYBFfeEq7E2ZfE3XvArQKhnN+YtRHFLkaE
         c2CfrozvEQkUANPqxW6wsXYh02y5kNhoKDc+K8ZAuOdtl4pyzR0BTfBxuv8/7ECV/scv
         rOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540459; x=1792145259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YhlTmiSSnyAhAbjv/VolTrl3XZ08TdurV9y8UvnnMXY=;
        b=pYab8ezMz3sB2q+u5ONmD/BSGWkVLxeVwDYkLwWOT7FN3p6lmyb2LYgzT79B3SwUTW
         mCfEc+2P8T3O+fuyOHLkRG2VtosbjP7b0dYPx9DgizhTprnNr6XltwnYd3QLXD4kvIUW
         bi5FZFi8OP3s8HitA+5FlBotbY7Rs3ULcHSubd4xRoVa9nppLItEj4zFxFFyKzAJEgab
         KfUpHdgW3sJ7kdcIdh9lVB+7dAepd8SFknqls8DRs5HN8Hwn9fE4i7Log06rocSzupu9
         jNs3gM3ToPW8aJzEx1Ns6mu6VhCVXkNQJneYesjMs/2V1v4KgXbmXdqIxP1LB/y0Slfg
         p/fg==
X-Forwarded-Encrypted: i=1; AKwUvBzRGzigty2+xLB0uRcZM/TJzl5we9kXfthntM+IJVV3iH50cIZQhX0f9o19oYRX8QFVXvUsT2ol7uumDpyxbEM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqOwCoLt2Dju+oSnY01gIphr86MVdgYbD4OaSPviM46aNCvKRw
	WCP6GhDsYqzmwTIzkk8KPJIie17xgWrTKChX5CdRFjbA4Ud7an26Oarwb+yEojKBzmU0dfBzPJU
	hhy/j3sJGbOJ5PY30inSikI3QlKezx6a6vc+ogzr9Yg==
X-Gm-Gg: AYBFou29XKCn1QWOarvOXQ+YK0+cwRK6zQ3S1i95p0ggGBHMpsfHZhRbkMNLSEuTokm
	R9ENj5rDFWgUnqKR6r1OqV6wjp6UiDICfMIvjLbDWWk9PD+BEaWFLuaDVNT8QTpPH8cLlPk53/h
	NaD3/Ee5KI8LAZrFghpudDRGXJcQbjo2fKzuTZVAX9tLeluZ6HfEoeO7MyJLOntdHaGdnmDqRRX
	/gcNHY35+Wqv6fzbT2OL0bu+pMhaGsJaadKn3Y0iJnr8MOj7wL0O04JxBeikvnogNfIC++I6AQ9
	Ojk7Q3o18Nyk1K+aj6dWXTsJno1DW6JIoNudy1vi//W62zMtRCxUaeAVypVJ+OwQ1QK46+Zqtmk
	9aQjo4cNU5ZMrpSnsRsJlPfQzmI5UW9c0O+PqwrzAVcYyrImAFcwE9hd9UBDVkpri3QVMY+Lbtw
	==
X-Received: by 2002:a5d:5d83:0:b0:48a:efed:ac97 with SMTP id
 ffacd0b85a97d-48dba9d326amr2435668f8f.33.1791540458537; Fri, 09 Oct 2026
 03:07:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
In-Reply-To: <20260831-kvm_kselftest_dump-v1-1-55b022c6ef8e@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 12:07:26 +0200
X-Gm-Features: AclHuK8s2qRUsbqTNG8YPqEmgy3yDujBoTHugKHr0lrqk5zZyltW7DxQdyuRR9k
Message-ID: <CAAhSdy3TOK6B5SUpFs+dQBzfLDy3-otMxTPEPwzOsoNsqY3cKg@mail.gmail.com>
Subject: Re: [PATCH] KVM: riscv: selftests: Dump sepc/scause/stval on vcpu_arch_dump()
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, zong.li@sifive.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 5:57=E2=80=AFAM Yong-Xuan Wang <yongxuan.wang@sifive=
.com> wrote:
>
> vcpu_arch_dump() omits trap-related CSRs, making it hard to diagnose
> unexpected guest exceptions from the dump output alone.
>
> Print sepc, scause, and stval alongside the existing register dump.
>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Queued this patch for Linux-7.4

Thanks,
Anup


> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/te=
sting/selftests/kvm/lib/riscv/processor.c
> index ded5429f3448..bf355afa8486 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -235,6 +235,7 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
>  void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vcpu, u8 indent)
>  {
>         struct kvm_riscv_core core;
> +       struct kvm_riscv_csr general_csr;
>
>         core.mode =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(mode));
>         core.regs.pc =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.pc));
> @@ -270,6 +271,10 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *v=
cpu, u8 indent)
>         core.regs.t5 =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t5));
>         core.regs.t6 =3D vcpu_get_reg(vcpu, RISCV_CORE_REG(regs.t6));
>
> +       general_csr.sepc =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(sep=
c));
> +       general_csr.scause =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(s=
cause));
> +       general_csr.stval =3D vcpu_get_reg(vcpu, RISCV_GENERAL_CSR_REG(st=
val));
> +
>         fprintf(stream,
>                 " MODE:  0x%lx\n", core.mode);
>         fprintf(stream,
> @@ -296,6 +301,9 @@ void vcpu_arch_dump(FILE *stream, struct kvm_vcpu *vc=
pu, u8 indent)
>         fprintf(stream,
>                 " T3: 0x%016lx   T4: 0x%016lx T5: 0x%016lx T6: 0x%016lx\n=
",
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
> +       fprintf(stream,
> +               "SEPC: 0x%016lx SCAUSE: 0x%016lx STVAL: 0x%016lx\n",
> +               general_csr.sepc, general_csr.scause, general_csr.stval);
>  }
>
>  static void __aligned(16) guest_unexp_trap(void)
>
> ---
> base-commit: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650
> change-id: 20260831-kvm_kselftest_dump-3f8d4daf5c60
>
