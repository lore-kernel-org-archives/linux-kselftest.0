Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083280;
	b=Nf6uje0+GxhJr3HPaUkwmSpjUhDRnj5PwdGcHjnrxX06r7kPTZl5DluhBIihjIL19Ket
	 0r1Ahvs0JdfBJTXePL0xz7dKN950zpjYhS9OVV++txnFYM56JCJjpXV4stdqWgs14ljtf
	 M2t6OYUEhpOdbUtfeQjJBCgObLSpY5kepGEA7zst8uKAwuoXz9gTe2/g4qtgSi+ylvsIY
	 tsNG4+DyrG7z/FRj1yG4bnM57aep/thCqULxaDdSjAZ8sBgymVfL6iP2rT0XO6Dz/PBpy
	 W8bxiKPGRBqKNk7DLMrUt/KwlxbdCgry9thiz6t2ESvnXKgaO5g8FLCTrwNimr8I9gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083280;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=E6PaedIbWsGIFw12ximAg+3ujcDQEcqQA+eS1w62gu0=;
	b=bvhB/TE1+grO8bKnfzkDPBdmxR2xNQXAGZzwArDPEv0rO1zIClNRh78anIccwDe34/yi
	 Lkm31qzezJnuw5TZel0P0AUmxotRjC71pA123+AU+n7NeMngIh7qNLSBPcVK3YKcckh2L
	 crnEtOa8IqH4TT7057YDQtWhRInpMw3jpPU9/t+J83PCyEiChzWfGsB1EIHbyhrmiJM9h
	 uok+33JERc7Jo9339vcnD+1D/9lwl95FnBkouqtDkIPsmA1DXMuAi2VX/46Wy/cbT/Ld7
	 BKaytJfHOD022Lu+wZUeNMRry67nt+kmlK3Z4rXLvyGi5nUJjw3OsUiDM+OlDsLqysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EfMXmpKT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050CF606A324;
	Thu, 19 Nov 2026 10:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 050CF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=EfMXmpKT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 629771575;
	Thu, 19 Nov 2026 02:14:36 -0800 (PST)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7BC03F632;
	Thu, 19 Nov 2026 02:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795083279; bh=6NWbvSR0f3g3Q9Uy9G+y2I15dJrCHKFfvk2I/HZj43s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EfMXmpKTI/2lqjtWjkfA5oGOAVopz0eEtWJAOHB7j6QKfYDpAs8Fvzd0Th5pGI2nW
	 lzWVDuMeBHmk61Owh+4ZuSmGT6RSLNqGlZSnkhDUlIi6iIVmH8F2ncG10phCrajtQG
	 9iduahb2uhkrdtdogg8Ps4gkc5S/iHEIyz8nZ8cg=
Date: Thu, 19 Nov 2026 10:14:35 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: mm: Add note about overlays in PIE_EL1
Message-ID: <av7MCz-kJZqs6i3Y@e129823.arm.com>
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
 <20261119-poe_futex-v2-1-244c7a01f788@arm.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-poe_futex-v2-1-244c7a01f788@arm.com>

LGTM.

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>

On Thu, Nov 19, 2026 at 09:54:37AM +0000, Kevin Brodsky wrote:
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
> index 590ef4328f12..e6788e2e23bf 100644
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
> 2.56.0
> 

-- 
Sincerely,
Yeoreum Yun
