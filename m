Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0E4E36DF;
	Tue, 29 Sep 2026 16:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698078; cv=none; b=qDOIP6ENYDuznevJ8N7ZAwFryXtDCN12MoYEqAMVcUS4KfgAMzp//WVHp1UBvxg0BXjTr2HajIrpDxS7dc2c+xRvtygOUQ9FMDVfKge0S+RkMZ4WuTEh/CSKlYFOfMlvR9zjGvpwgS2KDHEUrAcJ17nBg4zxSufJt12h6QFE5co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698078; c=relaxed/simple;
	bh=8pzOtnEI9QGF7Q4KS7u8yKxdrrASgPpmPOvOAsDFo0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLQv4h/cId4F5MIVfuWXmhMYYdMSIdpSDkZAf/90ZeO0nuSw3rEPjoMEPTeKDDkizVqyCxYriBcm6QPRqgljJ5Jf+JqCsanoW86Y21+Dwp6Rib8OV/3Jr7fqAYvDbz/PRxeX0UwqzOaaLcapkCAwlBcAP8L48HfWA9e0gMIcsMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iuj10jRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iuj10jRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8582E1F000FF;
	Tue, 29 Sep 2026 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698077;
	bh=8pzOtnEI9QGF7Q4KS7u8yKxdrrASgPpmPOvOAsDFo0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Iuj10jRjnyL5TZL08SdpWIdpltnEIv5kzNn3L9xHYBwB8CORDJyzHVaiJrsHcWhLB
	 uKRHAB4I7btnc3Fua8+heVnjM9tQGAYNrrBrXZ0ns0M81AZwrKT23me9c7ESJ7hkrE
	 8I6DG4OeGYF/HxkV32fyzqbgB7cVyRhWjY/hotxkYRCaIcXG+L1RnkPH1K/yTDQ4l/
	 9hU75SJfi5UgvsveZYmMm8LFb1GXACwDQtP42SIZYMnO/kEOaDEJGuXUpKQMNzS0wm
	 6NsVoK9PW76uHdTp7VTgSrafGVikUbcneXTyZigwUezktvjn2peOIV3vxYYkzxSd8C
	 3Uf+wlmPHDFtg==
Date: Tue, 29 Sep 2026 17:07:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 02/11] kselftest/arm64: Factor shared signal handlers out
 of fp-stress loads
Message-ID: <arvhSiSpGXMZH5D1@gremlin>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-2-31bce995b49b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-arm64-fp-stress-kvm-v1-2-31bce995b49b@kernel.org>

On Tue, Sep 01, 2026 at 06:06:42PM +0100, Mark Brown wrote:

> Signed-off-by: Mark Brown <broonie@kernel.org>

Nice cleanup! Yikes at that duplication.

Nit below but otherwise LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> diff --git a/tools/testing/selftests/arm64/fp/Makefile b/tools/testing/selftests/arm64/fp/Makefile
> index 183e9d319b65..d92a755837ff 100644
> --- a/tools/testing/selftests/arm64/fp/Makefile
> +++ b/tools/testing/selftests/arm64/fp/Makefile

> -ASM_UTILS := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o
> +ASM_UTILS_LINUX := $(OUTPUT)/asm-utils.o $(OUTPUT)/asm-utils-linux.o

NIT: I wonder if it's worth renaming this ASM_UTILS_LINUX in the previous patch
to reduce the churn a bit?

--
Cheers, Lorenzo
