Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084713;
	b=vWm0o2hb8Eb78JO4I85VcvSauHJteZakaAdlgXV0ofB0KjMnVnpSwiXk4yJxtKtPFbMa
	 8iil219hir4vFAkxnrO86KZB9gLp5U9u5AjUMUmEA1dY7+tZ4Px5Bjq+HYq7PtO6UmY3+
	 fZctFjD8AHouhEn041RIjaANiK9NOtjpbixeby3zUM13l1e8sDOtg81yE590dj+Srwi9m
	 5sPH/33f/QaDZ1+35DijC9L/ZSuHak5zorppxexaO6LiJjPAwVeeiKGZZQat130GuDaHU
	 dxtocjCAJF04HnduGvqmCBzEXF0ywl/yj6YA/x0vqRmMtMx0gaZVO2ZKfRmzb5ARuBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084713;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=1E9aeKD0ViG7J+qDgtkquYRiN07MXNXZrVg0YWEXHdA=;
	b=it2i5hUWMHWCX2Y5Oqt67BXSdFi07QcTeCxrbvn5Lxa/47l8TJjTzIYWBrCCy9tYhpgR
	 TaEI/WTnNzjGQpmhC3VmfyQfpYeOYlyJ9q6wHjK1B+IakrtWdZqme0hZSdfTV9U+HCx9f
	 MAvfs4JiaKTfFbu+fKmC383H9ThEvYwzNbEPnrAAHHVnV2cIp6fD+pkEmQL0XbSpMGRow
	 blOKI/YNzs+2APqAX1Gt+aZKKx77UghVMq6Npf0iP4sNQrm2d5PHW4hbc60SF76uponvI
	 O+C5x6BkdQ20S49sVnt3Tx3gbbzcmkFn7sfnkIPYVuP/MWyaEjIDSIlF+XR8fdWpf6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bDpd4c76;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268D8606A320;
	Thu, 19 Nov 2026 10:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 268D8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=bDpd4c76
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2CC61575;
	Thu, 19 Nov 2026 02:38:29 -0800 (PST)
Received: from [10.43.16.22] (unknown [10.43.16.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 048213F632;
	Thu, 19 Nov 2026 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1795084712; bh=x1fzo650tskHuvw39pi4izoFCVukJDZuJ4305LusYok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bDpd4c76baiHnPktB9iWk7TmT3YJu9ALX+K4/DuzM0re9Yr3YRDWuxopWtg2m5zET
	 HLVBz8WXXiC2a+J7ABKE16mDFkiEBXfpr9XI7WnIqIX/IpIM7MVn4cPEKXWKwspzrv
	 vR9QP5Xroxlu9V4bdWCKE9UuhZ4ZGN2v9WtiBBAY=
Message-ID: <243812f7-3883-4225-8f46-aa2a5face413@arm.com>
Date: Thu, 19 Nov 2026 11:38:27 +0100
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add test for atomic uaccess with permission
 overlay
To: linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Joey Gouly
 <joey.gouly@arm.com>, Linu Cherian <linu.cherian@arm.com>,
 Mark Brown <broonie@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20261119-poe_futex-v2-0-244c7a01f788@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2026 10:54, Kevin Brodsky wrote:
> POE is not currently enabled at EL1, but my series [1] protecting
> page tables does exactly that, and it has revealed an interesting
> issue.
>
> Regular uaccess uses unprivileged loads/stores, which have overlays
> applied and are checked against the user's POR_EL0 as intended (same
> restrictions as when accessing memory from userspace). In some
> cases, such as atomic operations when FEAT_LSUI isn't available, we
> need to use privileged L/S with PAN disabled instead; overlays are
> not applied in that case.
>
> Once POE is enabled at EL1, we have to ensure that overlays are
> still not applied to these accesses. Otherwise, they will be checked
> against POR_EL1, which is completely invalid as kernel
> pkeys/POIndices are unrelated to user pkeys.
>
> If PIE is used, then we have to ensure that user memory types do not
> have overlays applied in POR_EL1, as Sashiko reported [2] on an
> earlier version of my series protecting page tables. Patch 1 tries
> to preempt such errors by adding a comment. If PIE isn't available,
> then... we're out of luck, as Sashiko reported later on [3]: we
> cannot prevent overlays from being applied to user memory. We'll
> most likely have to require PIE at least when POE is enabled at
> EL1.
>
> To avoid accidents in the future, patch 2 adds a kselftest to ensure
> that atomic futex uaccess (which uses privileged loads/stores unless
> FEAT_LSUI is available) does work on memory mapped with a
> non-default pkey. 
>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>
> [1] https://lore.kernel.org/r/20261109-kpkeys-v10-0-aa6c4d9603bc@arm.com
> [2] https://sashiko.dev/#/patchset/20260505-kpkeys-v7-0-20c0bdd97197%40arm.com?part=3
> [3] https://lore.kernel.org/r/sashiko-outbox-207324@kernel.org
>
> ---
> v1..v2:
>
> * Reworded the cover letter and the commit message of patch 2 in
>   light of Sashiko's new findings (when PIE isn't available).
> * Rebased on v7.4-rc3
>
> v1: https://lore.kernel.org/all/20260521-poe_futex-v1-0-1da286b8f9b2@arm.com/
>
> ---
> To: linux-arm-kernel@lists.infradead.org
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Joey Gouly <joey.gouly@arm.com>
> Cc: Linu Cherian <linu.cherian@arm.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shuah Khan <shuah@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Yeoreum Yun <yeoreum.yun@arm.com>
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-kselftest@vger.kernel.org
>
> ---
> Kevin Brodsky (2):
>       arm64: mm: Add note about overlays in PIE_EL1
>       kselftest/arm64: Add test for atomic futex uaccess with POE

I completely forgot to address Mark's comment from v1... Please ignore
this for now, sending a v3 soon.

- Kevin
