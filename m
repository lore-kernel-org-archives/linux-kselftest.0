Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553D7347FFE;
	Thu, 21 May 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356898; cv=none; b=XwohPEFJ1HpiY3LdVhqMTnPyPqf3BqTOpxmeNuWN1xD1wwDu1vAlSihf2l+NieSNPk+JU0uUs2+dk425+J2YdOe0K5yc2NugL7fZ1nzSxd2mjxEFECYaHLam2lLHJkcT7D1hlJHPsy4v2sirqilmil6WQd5/+aTJ7fmpPuFtrSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356898; c=relaxed/simple;
	bh=I1igY6byiAjI8Q/ivTGS1HbZflb65Cl/d4J5xRl+oT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fnlECu46vx+eavu1rx8SbdQWjlQRYr+tTFWk5YBe/c6sw6F046Yz035Ct9Qi8shTM1PaYiXP2CCBqiw0AgEQhjA/xJbUwzahMH6heoovHbfBj8i+PgRY3PgRlig+Ta05qzmw2wqk8xagNC2F6crlboNLJ29eytB8eVuqTGmdDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=X9/CfiHa; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="X9/CfiHa"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 957023D4B;
	Thu, 21 May 2026 02:48:11 -0700 (PDT)
Received: from [10.57.91.210] (unknown [10.57.91.210])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D39CF3F7B4;
	Thu, 21 May 2026 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779356896; bh=I1igY6byiAjI8Q/ivTGS1HbZflb65Cl/d4J5xRl+oT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9/CfiHaz/oFMO8092Kn48SADgX8OE0FaBuUJbJ8BdPRjgX6dRyAWagamrJ+5YL+/
	 rJLFUkcfC5++AdiNLlSnMqG0fUqWKITHrnW/2GUtb1JZOG9F0c3mhfNNhnj9qF1sei
	 k65gIEKSOHJcGS6598z+nLHikHac7AOsF2xJ8CGY=
Message-ID: <92d46358-e347-4fd6-bf20-19927fb5dad7@arm.com>
Date: Thu, 21 May 2026 11:48:12 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: mm: Add note about overlays in PIE_EL1
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Mark Brown <broonie@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260521-poe_futex-v1-1-1da286b8f9b2@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/05/2026 11:42, Kevin Brodsky wrote:
> It isn't completely obvious why user page types do not have overlays
> applied in PIE_EL1. Add a comment to that effect, to avoid
> unpleasant surprises in the future.

Should probably s/PIE_EL1/PIR_EL1/ in this whole patch.

I'm also tempted to rename PIE_E* to PIR_E* to avoid anyone else's brain
being confused like mine... The extension is called PIE, but this is
really about the register configuration, i.e. PIR.

- Kevin

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
