Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2003B7B6E;
	Wed, 26 Aug 2026 08:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732817; cv=none; b=peESiRmxm9+knBYO7/W1CW2aq/ZSR6LZq8Ww9nfWd2AMAafJY5xATylZqJPiKkgYZGj3KSYUWdpywc/HWEoUd+Un9x8Y6ygicI5Ownznfgr7I1aWIr7/ebp43e5w9QrX9Dmbai0XvZxDO9GaCTDk/v5waxyfxPQrqPvZpYFIshM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732817; c=relaxed/simple;
	bh=ffC2F63al/Ef4j0Fsqvq/nU7950u0pWRTQY2EH1H4VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=qDiF53F3xNnRZIsjZozARG56kFnrEwGQVhe0UmH5zYHavZsyqNz4wHForN9Rsqe+542YrILNEXOimy9eoRvNj6LUeT0Jfr1pXmFB3YHVBgPISjw3nPwlhMnyRiZeSidlSeNYpN3DYJa9dKDvbdjnbZN4AiIHmTSu2kpq59EE4PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZC8GM8fD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZC8GM8fD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86300176A;
	Wed, 26 Aug 2026 01:26:39 -0700 (PDT)
Received: from [192.168.7.252] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFEB73F7D8;
	Wed, 26 Aug 2026 01:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787732803; bh=ffC2F63al/Ef4j0Fsqvq/nU7950u0pWRTQY2EH1H4VU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ZC8GM8fDR7M8D3wHsts2j8AaJEydieWRKVP/M3m4CnifF1ZDE6S0lE2RAVi9JFwJ0
	 /ccpoUH4fpT7dy1sqWgVzFl5uGlz5Ksi/9s37MKsx8h9C4qLYM42+QDKNqKNStIrPS
	 ZKekhtKJHE1MtkX2XZtkNmQ9bf8aXbKJ4zHErBUc=
Message-ID: <30d29c7a-3d66-498f-9777-8dadbb0a4584@arm.com>
Date: Wed, 26 Aug 2026 09:26:40 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] selftests/arm64: Treat KSM merge_across_nodes as
 optional
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
 <20260825111929.2882324-3-usama.anjum@arm.com>
Content-Language: en-GB
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260825111929.2882324-3-usama.anjum@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 25/08/2026 12:18, Muhammad Usama Anjum wrote:
> The MTE KSM test requires write access to KSM sysfs but does not check
> that it is running as root. It also unconditionally saves, enables and
> restores the merge_across_nodes attribute. The kernel only creates this
> attribute when CONFIG_NUMA=y, so a non-NUMA kernel prints the following
> message three times even though every KSM subtest passes:
> 
>   # ERR: missing /sys/kernel/mm/ksm/merge_across_nodes
> 
> Skip the test when it is not running as root. Check that the optional
> attribute is readable and writable, treating ENOENT as its expected
> absence on non-NUMA kernels and skipping the test for other access
> failures. Only save, enable and restore the attribute when it is
> available.
> 
> Check MTE availability before the privilege and sysfs checks so systems
> without MTE retain the existing feature-unavailable skip result.
> 
> This preserves the existing behavior on NUMA kernels without requiring
> NUMA or reducing KSM coverage on single-node systems.
> 
> Fixes: f981d8fa2646 ("kselftest/arm64: Verify KSM page merge for MTE pages")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@arm.com>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

...
