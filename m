Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1843B774B;
	Wed, 26 Aug 2026 08:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732844; cv=none; b=Zc13dOWwH0344i7dYfkdujy9sQ6UosrMk1nesPozOfJf6mL2F8H3lDtYGViA5RV9XVaApQKfOAcq5NRF2RSDvfidZx9EAcs5+6CW0hi7SaOG70KxfPAM4acpx8eiPADed4Tf4yLIEkiQmQI8jyUJCzTzftK+tZz5fIU6CRPvl24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732844; c=relaxed/simple;
	bh=mGEZODoxHlgWN2rMotI3PBzoesFZ1tMUxHjv/4k7jaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=J/149DVKMkh9dTiXB0aTsUBY+no8BOxBmnjZcdvK/SiCyRLzBEula5zCkBNj6/+uiee685HTR6fDXvsERYZGJEhfVvNMVi4MIbMjWjNpe8fHX/q6o1lZv/ThqVGPWwValptIOtSoo1TOpuh/nB64MCnozDSb96ljT5e5IPkAj74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LTEo18E7; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LTEo18E7"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F8EE176A;
	Wed, 26 Aug 2026 01:27:10 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 86AA33F7D8;
	Wed, 26 Aug 2026 01:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732834; bh=mGEZODoxHlgWN2rMotI3PBzoesFZ1tMUxHjv/4k7jaY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LTEo18E75tVAlgJz3I9v5wbLc7rkBEv61lVX0BdAIVZI7GP8dDdrKGysp9CPMS9GQ
	 WIr3Dwhz+zB+KXCFNQXwEAiN9A16Cle/ec7PIvGUBYvGh8Y0HUju7S2qGrvkVQKKjl
	 caf7/82bBD18u+XV2QP6WEsc7mCUkHA2qWNy1qCM=
Message-ID: <21300ec8-272a-4a16-abe8-2ec1f54abe8b@arm.com>
Date: Wed, 26 Aug 2026 09:27:11 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] selftests/arm64: Fix MTE prctl TAP plan
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
 <20260825111929.2882324-4-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-4-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> The MTE prctl test emits one result from check_basic_read() followed by
> one result for each of the seven entries in mte_modes[]. However, the TAP
> plan only accounts for the array entries, producing:
> 
>   # Planned tests != run tests (7 != 8)
> 
> Include the basic read check in the plan so that all eight emitted results
> are declared.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Fixes: 1f488fb91378 ("kselftest/arm64/mte: Add MTE_STORE_ONLY testcases")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...
