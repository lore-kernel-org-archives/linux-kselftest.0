Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EA376A14;
	Tue, 19 May 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204280; cv=none; b=u36D2cIYCn9N3cZ5Lx6gfoKHZeqeorR6vHCM2Lf8220m5gGzNOHQorhs6m7cWpi5WykaVQ/ghbcZsCfL+yWqUSRVgH0Kx8PKbm6aVUdUxRZf0hGVPVLFSzdNnZjja1cykU5NrUBDwFZENoKzIvG0XuoCwPxHti2f1sG7Ngjt/VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204280; c=relaxed/simple;
	bh=ZpDPEyrHHGSEIW/Lk4hpvpfy/+NDSsltJfIB8NnQOKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saMZ2rYA5MakSyx38eA8g+MJ2S/lQJSrCZXfBLBF9QZIN3I9FIvwssPH4ef29oLmeTGXSTCoOtPuPTnn9wrJw2B2nNm0EHHweIvSqbgmD0pY6fnQ76AEZSUrjyCBZOiS7qY0i0/tUcJmLdN9ntf0cuxKgDBtepo62X1SOQl1c3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vMLyGIE1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vMLyGIE1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E56C2BCB3;
	Tue, 19 May 2026 15:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204279;
	bh=ZpDPEyrHHGSEIW/Lk4hpvpfy/+NDSsltJfIB8NnQOKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMLyGIE1zDz7NIASBpV6KbBPyd5xb2HjOeJPCgEHRlFT+TNaInQb+b3uKbmpngnXF
	 zd2uvG9TiUEPzLgHY7blf8fGMO07AS60F2OprZ52E74Lm/hvq69Yyc0XgW03l/etF1
	 vHYF1l/ts6bMekTy8Xu/f0ES67uIVpOxyFaXZLtxhxO2QgqgGj1tshcEHvOBxcFxGS
	 HCIf+4DWCGl8arZloEFXAn3FpfxceAYfEhG2tSVOtk1F19VNBfIDzvqetXF2OPT4cN
	 ha6vhOu1zwgCU1LBAWY3ebLC0jpDiGKUMBqiMjILmugn5i/1jtwcDoAEx+adO3TqyY
	 h1CcaCpRTyXyQ==
Date: Tue, 19 May 2026 16:24:35 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64/cpufeature: Define hwcaps for 2025 dpISA
 features
Message-ID: <agyAs0UXGulhFXga@willie-the-truck>
References: <20260518-arm64-dpisa-2025-v2-0-b3367b73bd00@kernel.org>
 <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518-arm64-dpisa-2025-v2-1-b3367b73bd00@kernel.org>

On Mon, May 18, 2026 at 04:07:29PM +0100, Mark Brown wrote:
> The features added by the 2025 dpISA are all straightforward instruction
> only features so there is no state to manage, we can just expose hwcaps to
> let userspace know they are available.
> 
> F16MM is slightly odd in that the feature is FEAT_F16MM but it is discovered
> via ID_AA64FPFR0_EL1.F16MM2. We follow the feature name.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  Documentation/arch/arm64/elf_hwcaps.rst | 24 ++++++++++++++++++++++++
>  arch/arm64/include/uapi/asm/hwcap.h     |  8 ++++++++
>  arch/arm64/kernel/cpufeature.c          | 11 +++++++++++
>  arch/arm64/kernel/cpuinfo.c             |  8 ++++++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> index 97315ae6c0da..07ff9ea1d605 100644
> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> @@ -451,6 +451,30 @@ HWCAP3_LS64
>      of CPU. User should only use ld64b/st64b on supported target (device)
>      memory location, otherwise fallback to the non-atomic alternatives.
>  
> +HWCAP3_SVE_B16MM
> +    Functionality implied by ID_AA64ZFR0_EL1.B16B16 == 0b0011
> +
> +HWCAP3_SVE2P3
> +    Functionality implied by ID_AA64ZFR0_EL1.SVEver == 0b0100
> +
> +HWCAP3_SME_LUT6
> +    Functionality implied by ID_AA64SMFR0_EL1.LUT6 == 0b1
> +
> +HWCAP3_SME2P3
> +    Functionality implied by ID_AA64SMFR0_EL1.SMEver == 0b0100
> +
> +HWCAP3_F16MM
> +    Functionality implied by ID_AA64FPFR0_EL1.F16MM2 == 0b1
> +
> +HWCAP3_F16F32DOT
> +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0010
> +
> +HWCAP3_F16F32MM
> +    Functionality implied by ID_AA64ISAR0_EL1.FHM == 0b0011
> +
> +HWCAP3_SVE_LUT6
> +    Functionality implied by ID_AA64ISAR2_EL1.LUT == 0b0010 and
> +    ID_AA64PFR0_EL1.SVE == 0b0001.

I've queued this, but I'm curious why you've called out the
'ID_AA64PFR0_EL1.SVE == 0b0001' part here and not for any of the other
SVE caps you're adding? It's also formatted inconsistently from
pre-existing entries (such as HWCAP2_SVE_B16B16) which put the
ID_AA64PFR0_EL1.SVE part of the antecedent first.

Will
