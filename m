Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528D4478E4B;
	Thu, 22 Jan 2026 05:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769060425; cv=none; b=Xy1XF6hsBMCe0z6D9muP4WO82MgGEzh0+X7Kwp2tTbAw/KagjVH7M5z4wa/VBMABT/YbXz8/NRFemYZhN8AkCkB6TFs1zo6FUkhzKjgFTGEqEpvfR1pIeU/WpG6fZyR9RTDBrTYbhHM6Q9AoG+uNXsy3Dyn/X6G0VQNGYRk5zBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769060425; c=relaxed/simple;
	bh=Yho00Wz8MZw3BXiG/dlKspDJeqqDMQPoA7dZhhkY2YQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WNMjOW4e2YioZ3HUEN7FDfoWyBmKZLgGGrKRCi8KnyhbkFbKkFPwVybqjyTsq9PHKbl2xFHk+3G0XMZF04rxXh1GJYfawK4sgg3pHm9RlLUBtdtqrckwklLrQE7vybFIHDMpMosXyvqeYuhG+1AWkRGarD2NBkOimvgk3Iv1OQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 849431476;
	Wed, 21 Jan 2026 21:40:13 -0800 (PST)
Received: from [10.164.18.63] (MacBook-Pro.blr.arm.com [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595943F632;
	Wed, 21 Jan 2026 21:40:17 -0800 (PST)
Message-ID: <be2513e0-0d8b-42bf-a1f2-485041b5d320@arm.com>
Date: Thu, 22 Jan 2026 11:10:14 +0530
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] selftests/mm: fix usage of FORCE_READ() in cow
 tests
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
References: <20260107164842.3289559-1-kevin.brodsky@arm.com>
 <20260107164842.3289559-5-kevin.brodsky@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260107164842.3289559-5-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 07/01/26 10:18 pm, Kevin Brodsky wrote:
> Commit 5bbc2b785e63 ("selftests/mm: fix FORCE_READ to read input
> value correctly") modified FORCE_READ() to take a value instead of a
> pointer. It also changed most of the call sites accordingly, but
> missed many of them in cow.c. In those cases, we ended up with the
> pointer itself being read, not the memory it points to.
>
> No failure occurred as a result, so it looks like the tests work
> just fine without faulting in. However, the huge_zeropage tests
> explicitly check that pages are populated, so those became skipped.
>
> Convert all the remaining FORCE_READ() to fault in the mapped page,
> as was originally intended. This allows the huge_zeropage tests to
> run again (3 tests in total).
>
> Fixes: 5bbc2b785e63 ("selftests/mm: fix FORCE_READ to read input value correctly")
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Dev Jain <dev.jain@arm.com>

