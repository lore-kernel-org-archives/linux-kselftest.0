Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837413E315F
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311903; cv=none; b=r+kF8Tiz0ZRyRk/PZSgz5/XHed9g6MMZJAmWe79q/snuHZtc9eP9ClYcZpjxAirz5k0lPWulIdDfew+FW+vC6CfB5K8upHdxcf9Xiwz5oWAYacvT37nVASJyZkHESmCbfbWpzEWJWhrwP1p5LYh1gHxSEvXssPpXaYJIjC0QQ8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311903; c=relaxed/simple;
	bh=4Y4O3agHDFOBx+xyDha/Oc3P8x3xjQzyHRXVKrvNyAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aBMKHT+UYpMaW1J8N8wPPJ+Igzfh5S6z8kmDqnNRblV4wBM5GKF1PMbMJQl58/EaJoK3Fc7oGekg86J5nXgA44YfiExCvyzIjaLybiP7RtWHChpLXxZlYF05SCzh+nc0LRSeoF8s1bYVTakHwwvNSQzTuFNSFRx3CQmCdWZWIOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YF2ltafx; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YF2ltafx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2de831d2b20so1356204eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777311898; x=1777916698; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9D2K1vsMEYoTo0SmC/YpuFOBiDy6YrczCVTaUbkCqYs=;
        b=YF2ltafxYQfnwjMybByuwxiJX5hpz7KLNzPgFc6ZpRTY/ZnyvimTZhTPb5950qgW7u
         gIGZvnnSg2rTFdXtxfSJeqU62Wl4gQDVihfK/oRNY2y6HBzq+hD+VUFgFhbaGZEWvC0d
         v/Nkia7QfaqMo/lHdKeNaf2Pt4Wt4QfEZWxYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311898; x=1777916698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9D2K1vsMEYoTo0SmC/YpuFOBiDy6YrczCVTaUbkCqYs=;
        b=OpwKFav6aBlCtTOzN0hFgLW7AjPgTX/GozvqzBu9ES/EEYPo+84/fm3hFjusjWs0hR
         bRhjROMV94s2vr9eTp0U7/cuOd/3QDB71tLtIzVJUCoP1ixVudKtXKoQpp0D/9T8WD4r
         1NaBmuQT29frWwZC3Em97zmcqAurCiNY1UGgMGfRRbEgMvFVMcp3C5PvO3othsbue4/o
         kHAeKYwLGjyVhxR4XW8JB1FUxxNEeDdEYkQojxrfuOFiFhAA6Dx3brwCJEa1ikTcqXGO
         2GUMty+PhyikxTb6qvP50QeEaDM/0wtsqg/2TE8uFt/i6P+4ATF0qXEJXuhT/EzwPg4G
         8ARg==
X-Forwarded-Encrypted: i=1; AFNElJ8eZ6y/q2VNCEk1dakCZ5owto5fBn92oJp2cg4eOwT22ADSLD5/SA6lPWvfwK4wegdv/NHw77q96WovIDi1w10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSkFxvY3xSNamOjKOzEkcVWxg5S1y0A4or/4DvtN5akKM4IlH6
	9YjTF/gknVanMpLuvpppty63NpNoeoeJ9FAy0WiEQkbHayrR/rceT8ToShfTerRvu20=
X-Gm-Gg: AeBDiesdPvSFfnrIVkAGO3nikrlaNFLeBNxZCQiY54swN2E0HHPQzYtdp4GBgGSLAir
	n806jzAA1SCeqYjUb3GGONReThHhNmVNFX4YXuTKOyhPU4l2zjX6RZ9nL6oYC6S9BFrGYzYH9Np
	o+eE44BcuiMGJfetHbVen6z21Qzwfzy+kSMe2aOH0oUeSfpkUCWRtlzA1nHyCpQc/oLTmMbVWD9
	pDoupJRsUUESPjw1XYmyrHU8mEknEDgLtBM/bDYcbbbBERLFeuA9ZzeL8D36yUye/xqEB1AlEsL
	liNTrljoM81sBYXGqGia19WS31rkgqdHKpj+q+jPJdwyOyLCLIAUm8tdk7rowwJDIS3C8AI029z
	L3n4ehEaIZEZ2LFZTa3UUnJiMV1Jj47O+8R1RoJ5aY12NLm+yMh9wpy7udyOdUC5ztdaKo59fXm
	WnkSRt5spedBg5igRzZQMdnbmcPD1y1d5fDnx9Rg4Qrmds
X-Received: by 2002:a05:7022:fe0a:b0:12a:72af:83d1 with SMTP id a92af1059eb24-12ddd50b1dbmr148212c88.11.1777311897824;
        Mon, 27 Apr 2026 10:44:57 -0700 (PDT)
Received: from [172.30.76.185] ([50.224.25.13])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12dca2c1c16sm14378525c88.5.2026.04.27.10.44.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 10:44:57 -0700 (PDT)
Message-ID: <7b424355-58bf-470f-ab5a-071ef9c5646f@linuxfoundation.org>
Date: Mon, 27 Apr 2026 11:44:56 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: kselftest: fix wrong test number in
 ksft_exit_skip
To: Sarthak Sharma <sarthak.sharma@arm.com>, shuah@kernel.org
Cc: pbonzini@redhat.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260427112447.147985-1-sarthak.sharma@arm.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260427112447.147985-1-sarthak.sharma@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/26 05:24, Sarthak Sharma wrote:
> ksft_exit_skip() increments ksft_xskip before printing the KTAP
> result. As a result, ksft_test_num() already includes the skipped
> test.
> 
> Adding 1 to ksft_test_num() increments the printed test number
> again, producing an incorrect test number and wrong KTAP output.
> 
> Drop the extra increment and print ksft_test_num() directly.

I applied this patch to linux-kselftest fixes branch.

I ran a few tests and couldn't really see the problem this patch
fixes with and without the patch.

Can you send me before and after for mm or timers test runs?

> 
> Fixes: b85d387c9b09 ("kselftest: fix TAP output for skipped tests")
> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> ---
>   tools/testing/selftests/kselftest.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
> index afbcf8412ae5..827b47cf4df8 100644
> --- a/tools/testing/selftests/kselftest.h
> +++ b/tools/testing/selftests/kselftest.h
> @@ -449,7 +449,7 @@ static inline __noreturn __printf(1, 2) void ksft_exit_skip(const char *msg, ...
>   	 */
>   	if (ksft_plan || ksft_test_num()) {
>   		ksft_cnt.ksft_xskip++;
> -		printf("ok %u # SKIP ", 1 + ksft_test_num());
> +		printf("ok %u # SKIP ", ksft_test_num());
>   	} else {
>   		printf("1..0 # SKIP ");
>   	}

thanks,
-- Shuah
