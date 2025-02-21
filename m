Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96BB61E9B31
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Feb 2025 17:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159512; cv=none; b=bOGPr7nTngJZsWrjQI2Z/UMkeVDBFX8hDdmJHy+fsLKoTU4Y83h0gjctIVsJanoTU21RfYTpWZgwRA9nL/FBjZs2n+wInDe1C7McVs7vsU65IIfjKvTLGK8tCYMglDN16kdFKDIWCTiwQZ83+5ZKdB561oD7oquwDAf1Z0D4ATY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159512; c=relaxed/simple;
	bh=gAY0n108LYAy4alBq1qIG2Qku7MUhVAyMwIQtEwPGbw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tg4LBtqDMg1ow3L+8ql9zdgRMI6gYPJNpeVxRfSgPiexqXqcfR2/Zw1PbH4KGgQ2xtXbef3cTSRMkIEFdJ2Fa4q+V8icQiGSlVLL1SHq8O21wTNDJ2dG7tM7DyL+qy+b/pVir9EzxeYkIJuQ7lh8jq9WfQABILIGHZuaOxA1I20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79C411063;
	Fri, 21 Feb 2025 09:38:47 -0800 (PST)
Received: from [10.163.38.241] (unknown [10.163.38.241])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE87E3F5A1;
	Fri, 21 Feb 2025 09:38:27 -0800 (PST)
Message-ID: <1ead03ad-5f7c-4f80-a350-61c29fb7e451@arm.com>
Date: Fri, 21 Feb 2025 23:08:24 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kselftest/arm64: mte: Skip the hugetlb tests if MTE
 not supported on such mappings
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Yang Shi <yang@os.amperecomputing.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250221093331.2184245-1-catalin.marinas@arm.com>
 <20250221093331.2184245-3-catalin.marinas@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250221093331.2184245-3-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/02/25 3:03 pm, Catalin Marinas wrote:
> While the kselftest was added at the same time with the kernel support
> for MTE on hugetlb mappings, the tests may be run on older kernels. Skip
> the tests if PROT_MTE is not supported on MAP_HUGETLB mappings.
> 
> Fixes: 27879e8cb6b0 ("selftests: arm64: add hugetlb mte tests")
> Cc: Yang Shi <yang@os.amperecomputing.com>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>

Reviewed-by: Dev Jain <dev.jain@arm.com>

