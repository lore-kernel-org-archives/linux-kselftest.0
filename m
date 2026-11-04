Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793754551;
	b=RiBsUJoxdu3bXMMy32n9vsejwRoFzQczCcaE9ig5DVOx5IRw1x3oVsXjihzKENEsJVFv
	 Su/SJk5XdfcJUfTW3FBwMoXWDkII2sA3AhC4zOptGELW8HQA9Zu0SXFk7H9oiSplOJRpN
	 Bxd9EhsPL/yNIJMCxNFI1xBATT1TO85jda8MuyVch1vrz5GotrcXxrAl90B09FI275dGu
	 rk76OIrAoXnwOmSenmY8C0KL7Iz8W+S+4QWWedRpzdsdkB9y/v4EbhOQIJ7xyz2onKUzN
	 iw3iotmW6UwaSCwbzZZ3Q9ZnaCZCHQQs08KXatf+1hf9OejF81jZW8RorR8khkhNPZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793754551;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DNwT7MNivvmsp5v/G1sivGjjeFDSrEE4yVOfX4tFs4M=;
	b=EvUG+e5wmGYknQP7JYe0xJ6shtAYggWn6V0MMeV0CTpMccuxOUoe/vuyHEYYW3f1nD1W
	 SGjg4O1S+VStd5qzRWTzneTJhHgU7FXe3gxzUFjgipYnn/aJEqA9zmk1XCDsFO162AnMZ
	 vJ/yS9TyToslsWVwUYRxjQpRe9OdWKXditHOozoMCa9Bbgv0hCD2f2kEwBDwrF0z3056l
	 U0RLpahmf1oXCds9VqIAWfoFG6egSmGqrYHIM7wKj/50AHJ9PwKGCF3V3rrshC9R4u/IM
	 pfanvWqZyjurMyZxZo0h5ouwwCy8YFstUbq58l4cIjrxdWr79QjbqVh8RFRtqbjX57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wLARo31D;
	arc=none smtp.remote-ip=95.215.58.23
Received: from mta1.migadu.com (out-23.mta1.migadu.com [95.215.58.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77D8606A31B
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 01:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E77D8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wLARo31D
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UYbkNfTSJAbnMkgRK5RbseIFJJx2cVqZzvm9C00qXZk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793754542; v=1; x=1794359342;
 b=wLARo31DHaReFtavynBp863pM1J3r5+hVQ6MX9Z4rPoiNHUjDwjqMGFWXSluNureUdJ+52jr
 sn4+Joq353j/BgLkZgr8ne8hxIhVJ3vW06opsuEyiIBkCHwMOgWX326pNDSZp+cjKfwVtfrW4Ln
 gY7QvlD4hYvMpiMFMrjyq0A0=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09a24c3c5e0efcac;
	Wed, 04 Nov 2026 01:09:02 +0000
X-Mizu-Trace-ID: 09a24c3c5e0efcac
X-Migadu-Flow: FLOW_OUT
Message-ID: <d3c8baa0-3ed9-4f3c-805d-86c98a6bdfe7@linux.dev>
Date: Wed, 4 Nov 2026 09:10:24 +0800
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
Subject: Re: [PATCH] kselftest: alloc_tag: use the ll64 types on powerpc64
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suren Baghdasaryan <surenb@google.com>
References: <20261103155454.534649-1-sashal@kernel.org>
Content-Language: en-US
From: Hao Ge <hao.ge@linux.dev>
In-Reply-To: <20261103155454.534649-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2026/11/3 23:54, Sasha Levin wrote:
> On powerpc64 __u64 is an unsigned long unless __SANE_USERSPACE_TYPES__
> is defined, so printing and scanning the __u64 fields with %llu warns:
> 
>   allocinfo_ioctl_test.c:93:73: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
> 
> Define __SANE_USERSPACE_TYPES__, as other selftests do.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Hao Ge <hao.ge@linux.dev>

> ---
> KernelCI's powerpc kselftest builds show this. The define makes the same
> change on alpha and mips64 and none on the other architectures; the
> x86_64 and 32-bit builds don't change.
> 
>  tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> index 74fd64b2370cc..18c761fecfde0 100644
> --- a/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> +++ b/tools/testing/selftests/alloc_tag/allocinfo_ioctl_test.c
> @@ -1,4 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> +#define __SANE_USERSPACE_TYPES__
>  
>  /* kselftest for allocinfo ioctl
>   * allocinfo ioctl retrieves allocinfo data through ioctl
