Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3078F49
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Mar 2026 07:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780663; cv=pass; b=PuFJgjPmUAFcL9+VicPFon9kfp/JLUsTz2i3CbAbLUbfwAz8kqTWom8cyUqJvMIss/2P7tVH5PLXglqJUqzc58rX0Qf9Drr2HRcJ2ZEllt7EGSYwbTlnWdJKB4r1kP76RHtC+8R2Nhv+dv2/tz0sN/aMoJodP1pnGIcYXgqZ6Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780663; c=relaxed/simple;
	bh=lsFUimBeCGgmklTw1L3UbOz6SoEZi8IM6pklxGvk5YI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s0jsuvUBhsjAaacd896s9a+TwqKUDDeaIc4ChjXB1uFsD7ng8kltxB/IB6vxRMj3G83/rJU4nRbMREeDd4z00MzeLPd6E5a44GI2vcDeEeOR/Y9MZE6uVEL2exGcgsTqvYvgF/MIPT+E86i88fWErwx+0b/na2Yj9JwwyzXMp1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=JcGnauH/; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="JcGnauH/"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d55b97f358so6839773a34.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Mar 2026 23:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772780660; cv=none;
        d=google.com; s=arc-20240605;
        b=g14rHL32Jgz0JUIoX6pLYIzmNOIIVg77Vg2id3wGJjVAbJNcwLRF/mLVfVMzf2sKTN
         bugcKHd0iSlBPoqg1N1jN7UgXBbQMTKP+JQi7TJKMq0qs4VdPfEt2Cr5QExqsNDclql9
         2+QZkSEtzLtKl2lyr5Tlf+9w4vD/evWYg9YbojKLN6Z5D3brHhydgQ5GC8feq8mW10bl
         jVs/nWynHae/Od+LB+qYB5QyNgEPlxdR8TKNSa/3QxrIKW++jPN/DZeU5CqVZcTuaaa0
         bQ9/SrH92YTyV+ROBd66ywom/ydn0i1wzeWuhflilrB06AWkR4u53JAUqkI6s1dV7xs6
         AReg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        fh=9Crg3olVjNkISO6WFmAIdVMAnLEUYGo7rY707eahoeQ=;
        b=cdopD7He2kB2L1tnj/ZFKG+mDqu1gSG7zVXUB4wgC1LwDlcYBJvJF056jiEjiWKV6O
         SkCTXDFid1m0KhMmEq6ulJjRhnbOlUHl1UYJjSAEpFMCU/3+CV7gSH7z9wUh7wy5WXxx
         mdyYK3N1P1XCJezdcw5GqtsZLBB1f4RI/bNp6MQ9zJVhHPHVtEhAv8GxtP2KD/Cy/JIf
         EjKllSkqg0NoBNA2UrJE85h7tQAUVvcCp9YbQBngb5KDGsqI7xUL2T+rK1H8glJEFsKi
         FhCi9TmTMbIUZScAtoJwk1xN8Kq8aSgglR8irp8uwDPdUQTUjayZ647gepiyzthWgVwN
         otJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1772780660; x=1773385460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=JcGnauH/ED44P0zpJan4LSxkA+6CBJO9JIwmBoT2WYcUiEWUOnyORkykLxyCew7QA3
         vjBbEhOjtfWpVBp9+r3zqSmNWEdB/2nralkgizyH8ylWNeJ3geWiDgzHS8TNbndeElvu
         uyUDMFPZMs9X1nwHjfQyuMwX9H/3YvdvKCM+1C98OtbB62z6t/WWCvZQ4iN2JRH0JX4U
         0Q2ZmVQ6YR93zfLlhe81r0VFEn2wbGrj2+hVJ1lJhVC0uwiNhFZcw6GHPFPHxAL0QASm
         XVeAZgS+a8JWjJWYcVfwfNY55dPP62oDR7u/2VQSaim7vHrQENPh2zlepfw3jMGYEzC2
         qJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772780660; x=1773385460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yREeU4CE/jhwdCxENgT8cCU88WTqOERvy7IPLNknu0s=;
        b=iT+x++iBfZBV57SLS7rAl0wYI6yyrkxIJE0EKF3F1mtg6tUPbBhWJi0PLXOirRGnvK
         nDeq7U6TVjdW4eojARuak+ycRJkEQa7J0T5V5l+zlBVrSGRCjEsAj7lPydEjsEJp4Rqu
         va2sPvLlA7RBTju4ygmNknZrzKrgJrlbM/0v3mP/2BPKpP6Biy4HIqGlSZkFkRqdzS6m
         TxD/hsxKIXKupBGIET+bIVJr6Msl/idrV7drQNFaSxvpGuGH5lLZrQN803aeWFmAwKVL
         nKG57LWQtFDfJlJiynNCCpY+mnjN9832S9ne1NBPaFYv4n9HQH15CrlWCySTVmcVWv0C
         2kdw==
X-Forwarded-Encrypted: i=1; AJvYcCWeC3zgh8tSJrZ/xWNxGdp8t+TwBr4wOFGhFicWJMIus3m8TgH8XVcnYMdS7yWFE9SxvaNz/L4VmV0/CiyRvDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YykXqjQHYTq94T23VVqfL8ygUiUJ0pk+SFIsYErlpfCjuKi2K4s
	qvwp/CAoN4Z7D8ABE9SCOcB9FmvPyL07WA6VAWJSmCAYSDep/0s87J7sUat4xkKAJZvZbCF8tNu
	FAVytsMT6OFHRagbjukn5SJWT4R5T4v9B7RvHe8GyOPAk5PkLjhurQB8=
X-Gm-Gg: ATEYQzxuro4pPa9QSOZWLgmg1WsiBJQWuruFQPNoimaeV0ur3oNIUdWA64sw0sejsp6
	jGtndloy80I0TuW1hRev74gIFhWEc85YmTnFbw8u7y/qTpwYQbCiTxO4rzs1YlFD0dcbX0jGyw/
	2XZiBX1DTxTkXJYIFjCGtf7QKiDzhBnYGZsV8quadG0EH44cjCxTK+5iUJAHrGrB2cEJvWj/+oa
	XmUOejJBdEd4w33I+5WzpbcvIp4M5yk2chcwJ94tm2ko2/E+5vy3HyqpheaXFizf4IUsUP2I83v
	sGrMWL2nBhqlVqTSOPJ47fsXH6WHbznEF7FHmrJutRf3mWjBIGEiNl86z7ZnH8uxDjc6+v6bRyk
	eMY5IZNtlAVLtW6w8Uqo/fIB/EQ==
X-Received: by 2002:a05:6820:1b05:b0:674:62e7:190f with SMTP id
 006d021491bc7-67b9bca7baamr925571eaf.17.1772780660047; Thu, 05 Mar 2026
 23:04:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com> <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-2-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Mar 2026 12:34:08 +0530
X-Gm-Features: AaiRm533kBoYnXDCQRSDQXrP3bNbpBpz22jiDNqrmWLzZZYwaIGtUWbuuXDPWwo
Message-ID: <CAAhSdy2u3C2JyakhnSZxuSO2ecJsaz9DXWkRp96CArqHz4Ce9w@mail.gmail.com>
Subject: Re: [PATCH 01/27] RISC-V: KVM: Fix error code returned for Smstateen ONE_REG
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
> Return -ENOENT for Smstateen ONE_REG when:
> 1) Smstateen is not enabled for a VCPU
> 2) When ONE_REG id is out of range
>
> This will make Smstateen ONE_REG error codes consistent
> with other ONE_REG interfaces of KVM RISC-V.
>
> Fixes: c04913f2b54e ("RISCV: KVM: Add sstateen0 to ONE_REG")
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>

Queued this as fix for Linux-7.0-rcX

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu_onereg.c | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index e7ab6cb00646..6dab4deed86d 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -549,9 +549,11 @@ static inline int kvm_riscv_vcpu_smstateen_set_csr(s=
truct kvm_vcpu *vcpu,
>  {
>         struct kvm_vcpu_smstateen_csr *csr =3D &vcpu->arch.smstateen_csr;
>
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
> +               return -ENOENT;
>         if (reg_num >=3D sizeof(struct kvm_riscv_smstateen_csr) /
>                 sizeof(unsigned long))
> -               return -EINVAL;
> +               return -ENOENT;
>
>         ((unsigned long *)csr)[reg_num] =3D reg_val;
>         return 0;
> @@ -563,9 +565,11 @@ static int kvm_riscv_vcpu_smstateen_get_csr(struct k=
vm_vcpu *vcpu,
>  {
>         struct kvm_vcpu_smstateen_csr *csr =3D &vcpu->arch.smstateen_csr;
>
> +       if (!riscv_isa_extension_available(vcpu->arch.isa, SMSTATEEN))
> +               return -ENOENT;
>         if (reg_num >=3D sizeof(struct kvm_riscv_smstateen_csr) /
>                 sizeof(unsigned long))
> -               return -EINVAL;
> +               return -ENOENT;
>
>         *out_val =3D ((unsigned long *)csr)[reg_num];
>         return 0;
> @@ -595,10 +599,7 @@ static int kvm_riscv_vcpu_get_reg_csr(struct kvm_vcp=
u *vcpu,
>                 rc =3D kvm_riscv_vcpu_aia_get_csr(vcpu, reg_num, &reg_val=
);
>                 break;
>         case KVM_REG_RISCV_CSR_SMSTATEEN:
> -               rc =3D -EINVAL;
> -               if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)=
)
> -                       rc =3D kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg=
_num,
> -                                                             &reg_val);
> +               rc =3D kvm_riscv_vcpu_smstateen_get_csr(vcpu, reg_num, &r=
eg_val);
>                 break;
>         default:
>                 rc =3D -ENOENT;
> @@ -640,10 +641,7 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcp=
u *vcpu,
>                 rc =3D kvm_riscv_vcpu_aia_set_csr(vcpu, reg_num, reg_val)=
;
>                 break;
>         case KVM_REG_RISCV_CSR_SMSTATEEN:
> -               rc =3D -EINVAL;
> -               if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)=
)
> -                       rc =3D kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg=
_num,
> -                                                             reg_val);
> +               rc =3D kvm_riscv_vcpu_smstateen_set_csr(vcpu, reg_num, re=
g_val);
>                 break;
>         default:
>                 rc =3D -ENOENT;
> --
> 2.43.0
>
