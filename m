Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 961713438AD;
	Fri, 22 May 2026 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441624; cv=none; b=GGROYL0lzJY4N/KU6zz2WK47jtm1a7llonJ+29huawEEXUq4CeHavhBV5vmD4+jTdLBM9S02NPoKYCpoGmclU9D7QbJjI6LuChQVkPiX8T/xuhPLdQ7ZSLcJlquOFWLoKxZzsyb09/A66vW2tUAno94Ax/rflN7MBynx9bzq/+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441624; c=relaxed/simple;
	bh=5/WDhjKZ0zxg7IRZA5h/AyU0LXUj7WScqINlbmD6ppM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfvGiVBB/GsSLAoHsp6ztdRHZBGxfeJnTN4bGDfUxNQk1CzMod4y0ayXNSY41sRnKpRlPawbVcSIeUNYZ1yGD6ILrik+lZFLpebnBVEZTXs/0FmIjj95TTjVY+KCaouWNGzJS1bQI8dwXOMZxyquFeMa60T9QIr86lKd45oVtos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=J2LXS/vJ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="J2LXS/vJ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CD5B81C01;
	Fri, 22 May 2026 02:20:13 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55DC23F7B4;
	Fri, 22 May 2026 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779441618; bh=5/WDhjKZ0zxg7IRZA5h/AyU0LXUj7WScqINlbmD6ppM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2LXS/vJuoNb23KU68GTNQemU1r9hgJAVxyds7wFfIKQlXi6O6cDkTs+Sw6i9Ra6B
	 dP2G+aAxT4uSm64QcR/rLNHOGmNHf5KDrmdHOqiQS1Z25VRKw+bQG/wAOEKP59foBt
	 RMUUleX2MIaGNA7Gb4pPPY4KGJd3CKz79trOQk54=
Date: Fri, 22 May 2026 10:20:14 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
Message-ID: <ahAfznOLiv+oG+Bv@e129823.arm.com>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

> It isn't completely obvious why user page types do not have overlays
> applied in PIE_EL1. Add a comment to that effect, to avoid
> unpleasant surprises in the future.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable-prot.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
> index 212ce1b02e15..6e2f99820909 100644
> --- a/arch/arm64/include/asm/pgtable-prot.h
> +++ b/arch/arm64/include/asm/pgtable-prot.h
> @@ -175,6 +175,13 @@ static inline bool __pure lpa2_is_enabled(void)
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_READONLY),      PIE_R_O)   | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_SHARED),        PIE_RW_O))
>  
> +/*
> + * Regular user page types such as _PAGE_SHARED must not have overlays applied
> + * in PIE_EL1. If POE is enabled at EL1, and in the absence of FEAT_LSUI, this
> + * would break futex atomic operations on user memory with a non-default
> + * POIndex; the privileged atomic load/store instructions would be mistakenly
> + * checked against POR_EL1.
> + */
>  #define PIE_E1	( \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
>  	PIRx_ELx_PERM_PREP(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
> 
> -- 
> 2.51.2
> 
> 

-- 
Sincerely,
Yeoreum Yun
