Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1D72C1584
	for <linux-kselftest@vger.kernel.org>; Sun, 12 Jul 2026 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858640; cv=none; b=PCyg+9iDqiJV/CE9Z1UsfbJuuSSorfrDBCdtNtp/vz460gFdZYl/qKeyAK4tzMiPKLcyhZhFFTM/dJBzgrEZGcO0C6Il2ud2TmUkyzhP0RsYZzOQFTHbqU9XbUMX7B0dFau/he269ZQU4wsZKK8IQds3F7dfy8HMu2sedXkV6PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858640; c=relaxed/simple;
	bh=GhZd/XfEUa+JlDioXYReZpiTb+QqWsKH4GGipILVAGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CA9RlRHI8hJ/yz6k2SKIntQhDKCCk7tISj2WbZu7M2cLJrq8A7tg74inzL3TEJn8eUnp72oqcJfaW38aKqpzNVp5HBnw7mMzvSPyfjBDmPYCTstjCN2rQBeJpRcSsgdIpzFQIEnHLWIaUWybwWJu6Iy1kgX9mi1Onb4waX3yGVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pnU3NpW0; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pnU3NpW0"
Message-ID: <904e6cbe-8774-42e6-8930-c4fc43cdbaec@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783858626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IOGsiwkurcz5QWt2OlGzDxgCUFJG3Ey9sVuWGXtSkU8=;
	b=pnU3NpW0AFK47qVGH7i+8a90by6FnkzINb5PnoAG8/qzUNJ0xC5AjRhXkzDt6kAD07Dlv4
	NI1yVPRdlSn+09FpfvAyfeLyNuZVmFlO2my8yC4iOMGTCRGhQtXQUtL/Z35QUHGNWo+poQ
	LhYCKEoXhOfMKolyWJtwFUC9LPvU7Ks=
Date: Sun, 12 Jul 2026 13:16:53 +0100
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net 0/2] ptp: fix scaled_ppm_to_ppb() overflow bypassing
 the max_adj check
To: Deep Shah <deepshah146@gmail.com>, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org
References: <20260712040922.6403-1-deepshah146@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20260712040922.6403-1-deepshah146@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/07/2026 05:09, Deep Shah wrote:
> ptp_clock_adjtime() validates an ADJ_FREQUENCY request by converting
> tx->freq to ppb and comparing it against ops->max_adj. On 64-bit systems
> that conversion can overflow s64 and wrap the result back into range, so
> a crafted tx->freq bypasses the check and reaches ->adjfine() unclamped.
> 
> Patch 1 rejects the overflow in ptp_clock_adjtime().
> Patch 2 adds a regression test that crafts struct timex.freq directly
> (testptp's int-ppb path cannot express the value) and confirms it is
> rejected with -ERANGE.
> 
> Deep Shah (2):
>    ptp: reject frequency adjustments that overflow scaled_ppm_to_ppb()
>    selftests: ptp: add a regression test for the frequency adjustment
>      overflow
> 
>   drivers/ptp/ptp_clock.c                       | 14 +++-
>   tools/testing/selftests/ptp/Makefile          |  2 +-
>   .../testing/selftests/ptp/ptp_freq_overflow.c | 74 +++++++++++++++++++
>   3 files changed, 88 insertions(+), 2 deletions(-)
>   create mode 100644 tools/testing/selftests/ptp/ptp_freq_overflow.c
> 
> 
> base-commit: 3f1f755366687d051174739fb99f7d560202f60b

For the series:
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
