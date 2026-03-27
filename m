Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB539890F
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774616386; cv=pass; b=fDz6CnVrOU3ZEcxTRNDKO3XJgHu4PESugBXngVueNdvE00qeJf+F5EyWd5Nf/tlB2g3bGygphNtIfXD3FmCDj0HA95neVNhxxdzA1c5GuDHckTMcDLh7/bgfbkuoUrHDK6P0cxu8F84poBEdnJ75u31sewHczTxxCk9keZpWrWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774616386; c=relaxed/simple;
	bh=ozuDkFvVq9yOIhaYMtBDUtrCZfh4dazZtVZ9qVU/W2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=neZW9qdEsTtA9uZyEHiybV27bK75Y2lt/kEpIsiuFpRkjiliMcDZm5/K25ZM8IbI8StGsVjuHeevbbEpGXMA9H7FZkIVGSybes9amSUPQcPEnST5nhLIyYXDs/YMvhwUFzb+hk/kLCZS0gh0WRRhR+r1/u94C/pJmE4G2BlLQDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org; spf=none smtp.mailfrom=brainfault.org; dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b=OtaAWIOP; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=brainfault.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brainfault-org.20230601.gappssmtp.com header.i=@brainfault-org.20230601.gappssmtp.com header.b="OtaAWIOP"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-67e00a230adso1293806eaf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 05:59:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774616384; cv=none;
        d=google.com; s=arc-20240605;
        b=FeTR1i+7emuF6l+HsfplWeXtMTklBqcIxiCBARidzTQ3ESoM1AWP33sir03AdmSjqc
         nS1WdxwPdSkgGf7xkNp2vP2sxlDZpzJQEOPcMAJknZg14NFaRgJdfon/+pSZ1nuq2BQE
         Do0cOsnn3g4K5yNmrtOMUrMX2g+oLko0Oz9D5OVJYAh5E7XIRGjDhvo/X675Tlusmbne
         h519NleyhXGR1UCpCYh9Wxsn/01CoaNj3QcRohoVlvySTsY0ynBa0uqr1FYflkCjG/1k
         sMVmH5vSwBSE3+DT1BVXYaCrPRXaZ2n5xVjvvi4iFTLU5Nf1EwSM/Ywj7VcZT6i9U7WI
         0+yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        fh=eDfko6NO7jIknGHaocsXRavbIGz1ka8XOxUVCRwrTAc=;
        b=PrSmbfQfwo7kke7CbZ4+g3IaXiF1fQTzshFXW2SQWyw26lO3a2lW4cCUTCdjKRcQHB
         7Vpit4HJzxOivhzko0PXtiIz50SmKyK5incHDn+CeiatW/2RuEwuHIiEEoZ8Q77EMl/N
         bzu7PFWiggL+d6MSq9Dyx7V1X5tjblQi78BObwU17+lqODIFeWHND29nCavj1oek17Er
         /D5DGRoeXaV97J/hCCyeQaG3O7DyOi7m5nL81Mntkdj9Kpo2ljU06oYfIRPXYIqlQ2eS
         DC2C/Yrh33ILej42qxbqEu1x8ZUQNJzA5+8h85crVy/7M08aKS7geR+Osd/NsXD3eywO
         4EyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774616384; x=1775221184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=OtaAWIOPiM6RbZVpXG6ZFjRNFEPuBYBBp00v5u0TuXcJ4JXTz8DS5A7Qb75a3prmGQ
         wX6fttO1v8mlZxz/5cPwu18czC3/Zz7W3C7e6uLUjdUXLMuJgHYwC15yiY6ucT3Xglh9
         18UeeQNGJ/GVhvS2PK+WifA2BQHuKlZRv46y0uo26OVXf6VRGEpXRe4Dkbbraez4IPXG
         taJUK1YEe21ZK5qr/kvp6zq8gy5SEGXicAImhiWDWHy1pBzKcjuy+uLNGcxSc068wsMU
         ZyumAxmy9/kJxTQKsYzHpGmfS/hJIox+VEij+jj72loRnzAAH2kbyq0duBkAJ83fxN1i
         y5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774616384; x=1775221184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSJNEQ4IUrIGBafuDjT61HQhcBt0f+9/E/O9i7xBSsY=;
        b=nMLAp4RFRCnIsyM+pM5yd/d3b1JyO9gExSF0k7RZ8GgnkWEyZUW9bgnDgkg3Y5DK8y
         n7oDyOeZtpDfY8fofQWeSbUYay0vqPPX0ywTXYL2XPZV3vrrpV42iioK/aheFLbiE4YY
         BtI4hRNaxDChxSizaAOjo8arJZTj4yZf+he8l7R3abwCsrz4jwHtYMwS1g1/9UhCcfxn
         Pk2JIB4n2njmBvJNKpQC/GmEqjUxhYP8v7AT/0+aRS+sYxXjgQ0RwYS1s1499E++6WNQ
         EfSZnTxzjubIRxn3oguEWYJ2BUeQS73OlE5UeluAB8hvW1aDgdP+8KdmVs4h4ORuGGjb
         wlyw==
X-Forwarded-Encrypted: i=1; AJvYcCWe/FsU942G/hqtkuB6GM9Ch4x9Su2IqvHBteknlWhgkIHhmFKmi7i9Ohq4rneEfOo320h5Y1WY01YlBDYq1p8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmTtneMYZqpHvZx9hGM8WlNgoRA3jTgYyvOlg1l9wcoDiWZijH
	imtNTDBNLQYb0Nv+Q78GQ9lioAxJEAqS+3vBduq5TAqqJePGAtHty5/D386TKRkbx4MOlKWiuRi
	ydmlhC5FZuHoDpPvuz93b4jJdIPzS7Yr6CehvjoCWUQ==
X-Gm-Gg: ATEYQzwQumAb7DjOag7HaPCdFVRklEfr/yHsUNukr8FwZHDvR0az+4qvE3uuf9sMQoF
	5/1zyOiWgW73w3nNaaJlVrOxQSQ0KhBx9oq//x3lDjMJlKzzzURNZpy1i7GPB9FSZM8xPvvhud4
	D97LBcXz5T7tuSnPfm6gC1IuXvxtYhPRx4s+dCMdfOC4n6gdBKu26a+y81yfyTOT6wlICeAtJor
	vUJh/+3wO6fCVEPkZgIfBtDi8DoEWCmEEG77opYZwUsoAtYNho6yPK8MlJk55bp+VmP/TvuvPh7
	Bjd+0xR2bxbgqKS2tRfReP9Hr/nrY5hlhO5u9Zn1AuzGesz02S3d6jtqwdv2y4uUqlAF5QyqTLX
	1a3MgHe5kbTSlzhgEUbHuPzZzow==
X-Received: by 2002:a05:6820:221a:b0:67c:2b6b:520c with SMTP id
 006d021491bc7-67e1875a871mr1122414eaf.62.1774616383734; Fri, 27 Mar 2026
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260303010859.1763177-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Mar 2026 18:29:31 +0530
X-Gm-Features: AQROBzCGKH8Yynm5vTwqjoLikHfT_rvE6B5eaTVPa88iE5QN8BHshTiNb-us74k
Message-ID: <CAAhSdy0Jw_XvVK5brSRN3QGvnYHNEJc=tL65z+iUnSSjFObuPA@mail.gmail.com>
Subject: Re: [PATCH v10 0/3] RISC-V: KVM: Validate SBI STA shmem alignment
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 6:39=E2=80=AFAM Jiakai Xu <xujiakai2025@iscas.ac.cn>=
 wrote:
>
> This series fixes a missing validation in the RISC-V KVM SBI
> steal-time accounting (STA) register handling.
>
> Patch 1 validates the configured SBI STA shared memory GPA at
> KVM_SET_ONE_REG, enforcing the 64-byte alignment requirement
> defined by the SBI specification or allowing INVALID_GPA to explicitly
> disable steal-time accounting. This prevents invalid userspace state
> from reaching runtime code paths and avoids WARN_ON() triggers during
> KVM_RUN.
>
> Patch 2 refactors existing UAPI tests from steal_time_init() into
> a dedicated check_steal_time_uapi() function for better code organization=
,
> and adds an empty stub for RISC-V.
>
> Patch 3 fills in the RISC-V stub with tests that verify KVM correctly
> enforces the STA alignment requirements.
>
> Jiakai Xu (3):
>   RISC-V: KVM: Validate SBI STA shmem alignment in
>     kvm_sbi_ext_sta_set_reg()
>   KVM: selftests: Refactor UAPI tests into dedicated function
>   RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests
>
>  arch/riscv/kvm/vcpu_sbi_sta.c                 | 16 ++-
>  .../selftests/kvm/include/kvm_util_types.h    |  2 +
>  tools/testing/selftests/kvm/steal_time.c      | 98 ++++++++++++++++---
>  3 files changed, 95 insertions(+), 21 deletions(-)
>
> --
> 2.34.1
>

Queued this series for Linux-7.1

Thanks,
Anup
