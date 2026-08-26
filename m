Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EA703B7B6B;
	Wed, 26 Aug 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732875; cv=none; b=rO0xc4Rrs9EA+MY7fatyDKyF94z4BCxbvqvgkNWT9iWGhQtpsCaEitX93fn/7pU78X3vfxqMPuVbrUMZTq29xeJ2QPh/Vvc5yp6Hg07mt6iIm4Ds6PgIlzVnIqxcqGdPJDYo54ZHwi/NUiMMGToTKd6MsvIJYZBtXoxmp76CAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732875; c=relaxed/simple;
	bh=sm4GmlZJbEITbLdvJPR+mx1iHf4DvQ7pT/81r+XFUxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Zi1rkVCalnuvbAzrrX/7wNt6oFfhygLncYW5kDscNyR0lJ9QKd2ye5qLLvNaJw+3g7dbwEErcm/pHkGy9u4OrtfafigGN4xhBXHZHqhN637TIH8VJIKYDJ+msPgwKxhc61WD6FmwrTBSRdprtwkjLLY+DKhbtFvUpSMyO81KMTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Jh7ZOcqs; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Jh7ZOcqs"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DA9C176A;
	Wed, 26 Aug 2026 01:27:43 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5009C3F7D8;
	Wed, 26 Aug 2026 01:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732866; bh=sm4GmlZJbEITbLdvJPR+mx1iHf4DvQ7pT/81r+XFUxc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Jh7ZOcqs24gvP4MKupaY7GIUsq4ynRKIDg82XnW4zfy7FCjpa+F5FUvf0FyEmWWmH
	 56YP+/MEoM6abq1/yeS97hZ/iGX5jwlvpETtMupif5EnLriOf2VDo/y1UvsEAijG+2
	 kIwknCXgPoHqAoZriDe174lSN6eZ/8fwr3ns6XbE=
Message-ID: <817b9dc4-9f60-4ba1-b2ec-9dacaf3cb4c3@arm.com>
Date: Wed, 26 Aug 2026 09:27:44 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] selftests/arm64: Add MTE test config fragment
To: Muhammad Usama Anjum <usama.anjum@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Shuah Khan <shuah@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>, Yeoreum Yun
 <yeoreum.yun@arm.com>, Mark Brown <broonie@kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
 <20260825111929.2882324-5-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-5-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> The arm64 selftest collection has no Kconfig fragment, so kernels built
> with the selftest requirements are not guaranteed to provide the support
> used by these tests.
> 
> Add a fragment covering all tests in arm64.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>
Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...
