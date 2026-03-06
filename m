Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CC9371D1A
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 07:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780677; cv=pass; b=eicrWQLPc+TzRAEYjA5u0cEXKVqVug42VfUNZwVRJhTz902840PtJnloRvSS0DZbQ3m3vLBYZ2fv6uX+1BxCN9zh3KM4R9/wloxT9/UEXScxVrp/+pTtWJAttbP/O+Wy+on94Bx15/GYJbdWOmRoEEIodGood0dAUFh9NwZiwLQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780677; c=relaxed/simple;
	bh=dhtII8dmf1sBf2SIW54TZ+6cqwlmdPdfPzEW3ZiC1Ks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qeqWfTVT0lD5UXbCn6XwNtorsSBHdAPucsR5s2xC5fdFdy/qYPIKcHwHgVoMOjByKyqIwuUixZmEcwESmv83aCss5T1y4kDl73kcV1/1BxGPVcE7OJ7wCccD/NLdsS4FQ1CTpXfjz4snbweS4SNsOQzdlUNoqURwKAyrx4fN6hg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=jCs5iTLs; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="jCs5iTLs"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7d4c85307b2so6086742a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 23:04:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780675; cv=none;
        d=google.com; s=arc-20240605;
        b=FEbC2jq/xaFy+DX/3toq58e/+q/DWCtvp3sCmELjJ+r8aKrlCnPVWniU2PhtyQJgkH
         q20vYLwF9/nh2EjEOqN8Xm2bDSkpPBsZLCk0CRjqO5z8A00jt1bEJRFcGRzap+NJIWXD
         hyVxfcSToPtpaF5rWNU1/nz/A7Zyg5EAOH2t6wdTCs5pMnP3UQwmcZpUmyzMuGZ5eDui
         0sE9d0y/QvaKK58snax4TtpJZk/Dfn8SQifQxrVGdey/Na+/kL325gls6CFvSfS2UsaD
         8lSDe92STeSNVXt89vQVitbCVsj9tv/DgKkyTTERv37+IEyuD7evq4QyJxytGSepGTy7
         SEoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        fh=ZQn7+BuuHZVLc+OkMwFyuf73za1F/j6wptLYd+wRAQo=;
        b=CaLOEfpL7VMHWZ9n75nLf7ZYumS1aFT/+lfk6YlxiQoBxEoFkFwMeG61QL0NkBWl1x
         RycPyghSQaVqrqdU5SfVPMj2oGpJ3MAgcKOuOfDo3ECsNDNEj0UVAPwnhnwS+dkF/ZYf
         mIcqolaCWolPQ7qmO1k7kIG1/C1pC0tX9CZdrtZxP8xY8huzbBRpDmiv0tfsdLCQiTT0
         GH5nQyj0zQlSf60qzJlw1YvMkE+HDUeoDkRi63G4lz43MmDoPQMm4AiatjXzRJ9VQPss
         giZRgP1J85Csz1dcm2TAds+qKTs0WeweRB4eQw4s00ZHZAQh6cFwK9IYvRx4J+TpAKeP
         tSUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780675; x=1773385475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=jCs5iTLsf1B/L1UaVlW62J5gTd4GPW3DSu5Bs11uZKuCYhk+n/l+1gCzN/eO7nbIPQ
         yhLQ+6BaZEMmG9FdWXA5zGFPry7tVqu0B6and2Qd+8cJHPnMd+bWkfQYXqrLK9ws3uV0
         2mUu0gWoCpTFFGDsTbBKvegctRftSmaHqcRcyObm1fgyddfoYGzBDIdUMuyW27a/CPkw
         I5uYHGtBT4zYAozCo7T5NZ/UEf7PHBRrD6nVmJnp2/kkKoEe5KuptZIvZQaYTR2JjQDn
         CHnE7l3Dd11Ly5letex8IzUYJmNraAE2Bc7y74cQoH+38dAn2Cq56qwE/a5J+LtEhIEp
         U8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780675; x=1773385475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivXnTCaqI3lRQ19wdmdY/Vg2LOO+anvFx2bukYGj6N0=;
        b=CE8ca7yghQu/auxoOLIm756DnfN56mv2zHcZdt16wiUMSZBc8u/wjXcFdYsnAHneMu
         eAnnbm7nJxrxDmAowEgd/n6JMgnTUtSgFyqzIEcGNE56awfLR9RGsdbHimha4taHXIF8
         KtJ2TeYUW8YjVFVkX/PAAykTnD8grup0xqxtwgTXCb7aTwf8o0pSlEsd3yAyVDDY3+N2
         UFYxF/jmBKgnyfQr+Ap6p1tN32FrESn27v30j89TzFbB/vG4sjhtaADlMy3g4FVAFMVr
         9pZYRnHd4A+wc8tm2pZFrOE1ojlCGil9VH54tMK3COtp+J7jxRuMEGNEiUUFUiU0oYPY
         K80A==
X-Forwarded-Encrypted: i=1; AJvYcCXvmMr4Y4/TrqJqEMUgxU5fz071XZMxQjdXNLlz5prq9mhlx1rkK0nl7EXTebJLyW/xUrIaBrdvClK3zVwHyy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgm3LFfG0YV2G5zvePvlrDAOxKGsWsU36CeVfQAt4GzSfG9DJn
	XFb8yv5O6ncIVzWN9VJDds9BRAXELJCYw0MUwKNgLhYm5EQ4b4ZCrVcVUaDNSGl78I7oc1qIAQW
	6mcYAN/WDLVjzLRm1TDjNykPrYW5Doq8ioglvc9bZ3Q==
X-Gm-Gg: ATEYQzy1jzW/1/hALT0NCpL4RInc8/VKzynkEEt806AhytTAoWmGLB8K/C2pwFWAgPt
	IGxyeuuio3PyPrkl5O8yt9YkogUphIKyHBowg1K/HmbhewYbAM61mSLTqDrsLgYJ/gazImHH0yP
	KSuSYVYh0A6R6sJYC6czSygPcroxfF+ttrJNSReja/k1lfcYdOLjatobJbo9eTsZltMN5f+08Bp
	q4pQvHpQPiIF8LPPsfOiPWrM6p7hynNoipH11YefrBU0N2Jg4Ch8gn+LSzcpvEfx0WmAJOqduyB
	Q0JWYcSv9R5PgoQJ6Nj2KSRXiUZMW92yuPt7n4ecRdCsYNN2AeAY9oyhPOyod4NJz8mkckgYOEP
	bNYX9SxdJlOcLku5bMGlE4rQ/Lw==
X-Received: by 2002:a05:6820:1787:b0:675:2e2e:569c with SMTP id
 006d021491bc7-67b9bca66c2mr902114eaf.25.1772780675004; Thu, 05 Mar 2026
 23:04:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-3-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:22 +0530
X-Gm-Features: AaiRm52sAuSfM9cJRWnAGnwsD5n99Tkn6MwnQdCUOUYqaB6vd5qGlGeCvH3Tt3k
Message-ID: <CAAhSdy1tMeD2k4DXNd3m_qgrD+VOOML2Rd_q-ykcLXPv0UzMiA@mail.gmail.com>
Subject: Re: [PATCH 02/27] RISC-V: KVM: Fix error code returned for Ssaia ONE_REG
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atish.patra@linux.dev>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	Shuah Khan <shuah@kernel.org>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 1:30=E2=80=AFPM Anup Patel <anup.patel@oss.qualcomm=
.com> wrote:
>
> Return -ENOENT for Ssaia ONE_REG when Ssaia is not enabled
> for a VCPU.
>
> This will make Ssaia ONE_REG error codes consistent with
> other ONE_REG interfaces of KVM RISC-V.
>
> Fixes: 2a88f38cd58d ("RISC-V: KVM: return ENOENT in *_one_reg() when reg =
is unknown")
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Queued this as fix for Linux-7.0-rcX

Regards,
Anup

> ---
>  arch/riscv/kvm/aia.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index dad318185660..31baea9f0589 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -183,6 +183,8 @@ int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
>  {
>         struct kvm_vcpu_aia_csr *csr =3D &vcpu->arch.aia_context.guest_cs=
r;
>
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, SSAIA))
> +               return -ENOENT;
>         if (reg_num >=3D sizeof(struct kvm_riscv_aia_csr) / sizeof(unsign=
ed long))
>                 return -ENOENT;
>
> @@ -199,6 +201,8 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
>  {
>         struct kvm_vcpu_aia_csr *csr =3D &vcpu->arch.aia_context.guest_cs=
r;
>
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, SSAIA))
> +               return -ENOENT;
>         if (reg_num >=3D sizeof(struct kvm_riscv_aia_csr) / sizeof(unsign=
ed long))
>                 return -ENOENT;
>
> --
> 2.43.0
>
