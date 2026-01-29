Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32F233EAE9
	for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 16:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704778; cv=none; b=Bor/QbJPmEPIskx3oGKradCcquZX9Fq3mdScalPUTfl5ierE6Kz9bWTxG3IxU+ovIiwdgkOS34SbhZCzm1TF6MYtfhQnFZJguTdl8EpSCFzDsasW8yw3zPafKGqFdiybNZyfVeKHb3HOLoXS0HBzfN1e3aIW0wBBImADx+XZpAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704778; c=relaxed/simple;
	bh=B/VHJ92gUrkCQ08cznGlZPMEjHU0vpIWoo2Ylnqd+/4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZIKaS/Uz3+NXoLupJr6ce6348PVNDRrRTM4Dpio2+y+1uqw35auMJjl8Z52Vg7QdXyCLBkbCIWvyBZZ47aGNbrk6Sa11mZkPPTUNGPARWyQ86kq2sXlFBHfJT/gcYk+BeiIWMEA/TRoILijJjUEr1gxuyEwZ/LFm/t3mCtWBrFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XPYYX1fN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XPYYX1fN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso9308725e9.1
        for <linux-kselftest@vger.kernel.org>; Thu, 29 Jan 2026 08:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769704775; x=1770309575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twFvpc0i3TryasBkxK98iJJPXOi65K0zMxpJo29cyB0=;
        b=XPYYX1fNq1dgLxdSTF1N1yUorRWvWx5EkK+2Kuggn1NUHsQcWi6kp0TNUsxMDB+Qj/
         q0fShi7qygpWlXHgi69hsgcy8ZtbF9wfItkUznZxHwXX4uex4P2YONiobHI4rrqqNLv2
         Gm0pfk7Xb07ViNIDhdmS2zbQgKdU5HPQgZu6He3kVhyoa18Z0ogLlR+1CotAc2ETDyPL
         UKTPtcRzxRt1AACkZ2losHDEGlzNIx6vPlHmOYvNXG6Kbh0MS1ZbHK4YbHEzlLz0438+
         12KO0UMTZwtc3wboiTKDjSyNEcPV3KkkgtLBL/8Li74N+BcO32d3VQYEsd+s/euFvgHG
         NMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704775; x=1770309575;
        h=content-transfer-encoding:mime-version:user-agent:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twFvpc0i3TryasBkxK98iJJPXOi65K0zMxpJo29cyB0=;
        b=REBw7MUlOfsEtE/gzDScjITFmm5JadtHe8NrtG0IYP58giNtu0W22sWOfrn4583zr2
         U5vxnw+yyma/L3joX+33rCwnJQfbzHiSWdVueiFlglkW6vb7IDMwhh4Zno6Rz8ffkVqa
         /KlUBONhgOXLRtArvciDHqjIwAbbEtltKtyJNduhrukyVHMjOcbqIX8uRvnopjGAobuA
         WgPqlgickcLj9twoCHJpaC+yHIZi27Ci6dtumC13M4PpEKfBVIH60KaLoboDiOWxUux0
         IusaYUqrYzz7D9osEeDqFDrxX+3FkoX5Dw6vaLGuZdyeuZ1TyBNpCjW/QvAMmW2cewR/
         BNdA==
X-Forwarded-Encrypted: i=1; AJvYcCWVT6N55MVIfn1EKzKsJDqwINmZFHWwaL5sIZrcJOdQHr6qOnd4FsGq7o6VyzetauxEz/Ppg0I/h9Jd4fouMrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjFeZ0W/mpwaOMIybP72R2iDOnoYS31E90mF4fob5JE/+EGhy
	M+5nB3rAWHwm80QYlGE5H1MaTQPFeD2Y1iz/2w4KF4tCkbZ93uX+5PZilw1tSOP58HM=
X-Gm-Gg: AZuq6aJ+6mE9xpTZcJcIYRO00pBzoQyFq+qZEA5jpNgH9/CUQ9M/p/C8oRyyroMKfYI
	ja9FjqWd83qm+55zui75QB71W1/h4yfGCPHVCTVH5xnG0+KSWAhc4IycQi8P4oLKnTGxo4JsVUh
	nf1z2NzheoJ/UdHkQ4t+0Rt0YZ/IA/noBrQyTlk4e5pwIpGB9BDcWz31zEKE1836eIbEXomRCWe
	Eu+KmaCOMzAVdd8b5hGKREbkInl3jYp2qxSSfWTcoZRQxVJwLoRHafT4p4AeQlOj9+z7eO8+i2K
	KkzNawN5TypQyd1OUiaMLAIM4dVTJL3kVXasbeK5Dg3M+/5yYVkufea0K9uNuOH4AWjvD4pfDRt
	4yENmeXnz1xf14Gp9W7qrf7QT0ONIISFwphmxy4XCkcc9NF+lMZNx9LWbzToTIrFI0j+/nCJcKG
	Nom4QNLkTx3RI=
X-Received: by 2002:a05:6000:184e:b0:432:5b81:48b with SMTP id ffacd0b85a97d-435f3ad5c6dmr249217f8f.61.1769704775134;
        Thu, 29 Jan 2026 08:39:35 -0800 (PST)
Received: from draig.lan ([185.124.0.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfd4sm14914838f8f.25.2026.01.29.08.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:39:34 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A5D885F878;
	Thu, 29 Jan 2026 16:39:33 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,  Joey Gouly <joey.gouly@arm.com>,
  Catalin Marinas <catalin.marinas@arm.com>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Will Deacon <will@kernel.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <shuah@kernel.org>,  Oliver Upton <oupton@kernel.org>,  Dave Martin
 <Dave.Martin@arm.com>,  Fuad Tabba <tabba@google.com>,  Mark Rutland
 <mark.rutland@arm.com>,  Ben Horgan <ben.horgan@arm.com>,
  linux-arm-kernel@lists.infradead.org,  kvmarm@lists.linux.dev,
  linux-kernel@vger.kernel.org,  kvm@vger.kernel.org,
  linux-doc@vger.kernel.org,  linux-kselftest@vger.kernel.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v9 04/30] arm64/fpsimd: Check enable bit for FA64 when
 saving EFI state
In-Reply-To: <20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org> (Mark
	Brown's message of "Tue, 23 Dec 2025 01:20:58 +0000")
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
	<20251223-kvm-arm64-sme-v9-4-8be3867cb883@kernel.org>
Date: Thu, 29 Jan 2026 16:39:33 +0000
Message-ID: <87343o8jay.fsf@draig.linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Mark Brown <broonie@kernel.org> writes:

> Currently when deciding if we need to save FFR when in streaming mode pri=
or
> to EFI calls we check if FA64 is supported by the system. Since KVM guest
> support will mean that FA64 might be enabled and disabled at runtime swit=
ch
> to checking if traps for FA64 are enabled in SMCR_EL1 instead.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/kernel/fpsimd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
> index 887fce177c92..f4e8cee00198 100644
> --- a/arch/arm64/kernel/fpsimd.c
> +++ b/arch/arm64/kernel/fpsimd.c
> @@ -1948,6 +1948,11 @@ static bool efi_sm_state;
>   * either doing something wrong or you need to propose some refactoring.
>   */
>=20=20
> +static bool fa64_enabled(void)
> +{
> +	return read_sysreg_s(SYS_SMCR_EL1) & SMCR_ELx_FA64;
> +}
> +
>  /*
>   * __efi_fpsimd_begin(): prepare FPSIMD for making an EFI runtime servic=
es call
>   */
> @@ -1980,7 +1985,7 @@ void __efi_fpsimd_begin(void)
>  				 * Unless we have FA64 FFR does not
>  				 * exist in streaming mode.
>  				 */
> -				if (!system_supports_fa64())
> +				if (!fa64_enabled())
>  					ffr =3D !(svcr & SVCR_SM_MASK);
>  			}
>=20=20
> @@ -2028,7 +2033,7 @@ void __efi_fpsimd_end(void)
>  					 * Unless we have FA64 FFR does not
>  					 * exist in streaming mode.
>  					 */
> -					if (!system_supports_fa64())
> +					if (!fa64_enabled())
>  						ffr =3D false;
>  				}
>  			}

This is conflicting with the now merged 63de2b3859ba1 (arm64/efi: Remove
unneeded SVE/SME fallback preserve/store handling) so I think this patch
can now be dropped?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
