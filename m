Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B701E33B96B;
	Thu, 22 Jan 2026 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769103799; cv=none; b=Rode/uarOPyJC/RPEjjMJjBoQzTOec4Q1RIlrSIT5O0yOD5fTh9SW/ddU2Dag3qtRlb5E9y9RfADR3+rqG7rbrdZWDl7toKG7DQ57R9O4AnejF1YmGKeEI8CFQVR60W1BjBE9UbbnYqWpXxS9/FaXkT9KLfc7byvpwl4eUAxInU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769103799; c=relaxed/simple;
	bh=kd5U81ugSFrI2oYb9PjmzcUiQvmaYEyWje4S/R3TWbQ=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MzBo5UD23Fz/0u0Od4V66A+w+QWvqKl+0b+YkBeZiE8+ZJTntxTHJAGSuPdIdIhM2eXSnKvyFu3nfSvLmpMTvChGjhI9VMT4MwyK1+1yLWinWrv5TjvO0GsuZw59JPj8K2GjVxbR6COYfJvUEMsziHmZVAtQg5o5fs2lKvstza8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CAA1476;
	Thu, 22 Jan 2026 09:43:05 -0800 (PST)
Received: from [10.1.194.63] (e142334-100.cambridge.arm.com [10.1.194.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DE1C3F632;
	Thu, 22 Jan 2026 09:43:10 -0800 (PST)
Message-ID: <189f12fb-a558-41aa-9194-19053c6b350b@arm.com>
Date: Thu, 22 Jan 2026 17:43:09 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Mark Brown
 <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH v3 7/9] selftests/mm: fix faulting-in code in
 pagemap_ioctl test
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
References: <20260122170224.4056513-1-kevin.brodsky@arm.com>
 <20260122170224.4056513-8-kevin.brodsky@arm.com>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@arm.com>
In-Reply-To: <20260122170224.4056513-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/01/2026 5:02 pm, Kevin Brodsky wrote:
> One of the pagemap_ioctl tests attempts to fault in pages by
> memcpy()'ing them to an unused buffer. This probably worked
> originally, but since commit 46036188ea1f ("selftests/mm: build with
> -O2") the compiler is free to optimise away that unused buffer and
> the memcpy() with it. As a result there might not be any resident
> page in the mapping and the test may fail.
> 
> We don't need to copy all that memory anyway. Just fault in every
> page.
> 
> While at it also make sure to compute the number of pages once using
> simple integer arithmetic instead of ceilf() and implicit
> conversions.
> 
> Fixes: 46036188ea1f ("selftests/mm: build with -O2")
> Cc: Usama Anjum <Usama.Anjum@arm.com>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>


