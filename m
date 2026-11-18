Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018543;
	b=2GGF9MzxZap6tB88gnmOAcDJj/+G/Ur6EmE2zt3YMq9mqyOlXhWJ8DkIAtxIn4I+FQrm
	 /f6DkgHwfuznFfKk/PPyBx24M6k5icwYH2E5BH6K8cS8b7jFuJ45/7mdoI10Lf6iPUNII
	 DEtElaO/ALiXvRA5Mc4sSB+6obnwaMggee2Rsqyf+rQciYdrbR6nkDR8CW4e7MJdL5Hxh
	 LBuujG27pUvPdK3BTT3mGG+9hipSrBuWT2pbuetGK1ymQD6ehPci340IZafkzPFSRTndc
	 3WBlkETDW4GsuGpGNJ9JRkmJnahtDFejRHNizAPRxw3IaWaPqIzjXDk/JSTx9Yw1pSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
	b=wjFehuInmqEdiXrzhGHTsPGudRFOw5Rh5pSqDxUdHw1soYj9aNTEq74uIogy+p8Hy1X0
	 eWcD0EAJwtqWNDPHQaraDlhgFoMedOdJRs0s0k+IWoA2Amg95U49beoF3l4KGTGWW5Tsy
	 YLgG/7ds8j8DmlLoiEClZaqVRr8EgnQTH8fy4NKWNhDTl5WNC8vI/4PbRyeBlv74xVBYd
	 5rIs4WBFXgYLKhGusRUo4T+Uhkd7ZSyBQzP8whnB2dVqSRxTmn5oQz8VZ2eG33OSVPJZu
	 j/rnmVXNEZc2T69lxyYjB1CeEzizAeelpJoTzXdifkIotYPEn4bCt+7v5dEdlPjICcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gOtPPGZ2;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DF606A320
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 16:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8DF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=gOtPPGZ2
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f84a55e31aso746941a34.2
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 08:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1795018541; x=1795623341; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
        b=gOtPPGZ2bHmtTKeYCy4EAz7T/pFGWFi6gsfTd7EE5Acfd52wwtbSj7q3qXRGzYuYpa
         FKq3J6b0XhWnKKflE4CYhyuuPijwHI3URihDUxLOX76XV0LdsWgC+xOOPnPpzOpYQfnr
         t6K4qRawk1bSr8pE9S2Z3OXGZMb6d3pleGuxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018541; x=1795623341;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaUSzwjrD11B5B9a8gnRbixfst3fcr+VZgafM92sW4=;
        b=CMVr5WdMCQt9wB0Tp8Bdk6B0WXLjaASODKo+q+WDDYaZbSmR4ByYDGX2uTTji7sLcB
         Z6H4XJMNDdNHn63ttkPbiaBDfHvOsTD7CmrR5g1FUuTXNkXvlFVAul/9KJ9zclpUjHhu
         Nwvr/n1BnMRGIwspP+3dWGuOObFBW5tSgL4RowVHaIuq9Iq/H9ClnlFtMDvOSZPBQ1my
         5Gltp+wm2dSgjHzHs6ofon/lS6Tt2NWGvdPIGdl66A7chE8ewCfFdOWjME/Tsv3lJBKQ
         Nopxwqsa4W193zAzBtcawm1h+6346KTluMZ4xqFDem1YpetbXL2hY57RZJe458/utmTn
         SJTg==
X-Gm-Message-State: APuU4Z/t0X2x825ut9bjEbEchB7KuVEK652xkuKHbFdKTsrKmoaQmcXk
	6pc8r93b4Q8dl5pZDCt+vJ+sujBS2u0d6PdFqUKd6hAQjA7f5jayeSE4OuMmJsARuVo=
X-Gm-Gg: AYBFou2rt+Iu+G2uuCuU8YZ+VHdvoC6wSM83TLQSXnQ8LXF2DSxo8wkCrW2VaDDcSSv
	gCzTvRBL4cANWeLbtwSJAjQcrBRwI8vfRhcRdu/PRs5eglWoZMbeX280J/cbXx7F67c0sIqCGBl
	LCIbptTzcBV//Vj7BRR9brGOuE1Oa9pd+7dGS9akxNktvDxc/lzJxdBU5ucnXnmWsQ64B01jjyv
	frTfeYMOeD7JaTD18f53shNgLaCFthDUxq8jyd7HO1AmoeVOKSui2Fv35eW0Du0wf6IPBmmMirS
	/d+1nYUYGv1DkxTWi8Yp1Ams48wDpVWIWxXPyDJEdrndb9ESQBdYRjEGksEqPKNGMdwuiyauY1r
	uNyKWvu6xpFLlPRgyZcxkptDDRdaxWRZo0PmkoNuf61qRRzL8zZbKOh4uWDJ36FK+dfLNq7FiLZ
	FCQrMBVQFdMuPlyqVW1PnMoCmizoGuxc47R5gcYpHjZ8wC/03o1TXorjhLQvWvrwMPDxU6VbjTg
	+j7zWo/B3IIHJP+FHwEWnIxJyy1KoruByiCowQ9ZwMQr1FT59y06he25BqF2vODSROBt/L5Grdv
	8gjFxJAklwvYJVfhRc/9NNVrej3U300NN/k/g/0=
X-Received: by 2002:a05:6830:4390:b0:81a:9522:f00f with SMTP id 46e09a7af769-862f08ed4ecmr2929188a34.6.1795018541594;
        Wed, 18 Nov 2026 08:15:41 -0800 (PST)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f01facf7sm2346292a34.13.2026.11.18.08.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 08:15:40 -0800 (PST)
Message-ID: <13c6ec9c-c4ea-4471-b5e8-77d1a786796b@linuxfoundation.org>
Date: Wed, 18 Nov 2026 09:15:39 -0700
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
Subject: Re: [PATCH 0/3] selftests: add option to print the time spent per
 test
To: "Jori Koolstra (CIQ)" <jkoolstra@xs4all.nl>, Shuah Khan
 <shuah@kernel.org>, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Hangbin Liu
 <hangbin.liu@linux.dev>, =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re?=
 <ricardo@marliere.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20261118-kselftest-run-timer-v1-0-53a838b2d62b@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/26 06:40, Jori Koolstra (CIQ) wrote:
> For CI/CD purposes it is useful to know how much time each selftest
> took to complete, for instance, to know which suites to run for a
> quick-fail diagnostic, or what percentage of tests you can expect to
> complete on a paricular --override-timeout value.
> 
> Add a -T/--timed option to run_kselftest.sh. When it is set, run_one()
> prints a KTAP diagnostic line with the elapsed wall-clock time just
> before the result line of each test that is actually run, e.g.:
> 
>        # selftests: timers: nanosleep
>        # time: 12.34s
>        ok 3 selftests: timers: nanosleep
> 
> The other two patches clean up the use of 'local' in runner.sh and fix a
> bug when using --netns in run_kselftest.sh. Strictly these could be sent
> as separate patches, but "selftests: add option to print the time spent
> per test" builds on these, and it would otherwise require needless
> rebasing for two small fixes.
> 
> Signed-off-by: Jori Koolstra (CIQ) <jkoolstra@xs4all.nl>
> ---
> Jori Koolstra (CIQ) (3):
>        selftests: use local variables consistently in runner.sh

Please spilt the convention related changes and real changes.

>        selftests: pass the timeout override to tests run in a netns
>        selftests: add option to print the time spent per test

These two look good to me. I will pull them all as a series once you
fix the problem with patch 1/3

> 
>   tools/testing/selftests/kselftest/runner.sh | 50 ++++++++++++++++++++++-------
>   tools/testing/selftests/run_kselftest.sh    |  8 +++++
>   2 files changed, 47 insertions(+), 11 deletions(-)
> ---
> base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
> change-id: 20261117-kselftest-run-timer-df3ac531652e
> 
> Best regards,

thanks,
-- Shuah
