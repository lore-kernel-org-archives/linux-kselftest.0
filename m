Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD5411605
	for <linux-kselftest@vger.kernel.org>; Mon,  2 Mar 2026 15:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466550; cv=none; b=vE+JFq0IA/zkC9HLWr47AODjzDvxfM32h0H2wcyhrSD9tzxYChBlgGcAuQ5chiw0f7fooX7qih5ImtwHsEYgf4IO++BiuPsItfDtREBNNNly3V1QbJ5HKZMcQ7uBwWXcJ0K9Nd7pRZFwrd66Yd7Hc7ytpZZHpsPs4NarJjSfq10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466550; c=relaxed/simple;
	bh=GmZVrQsPKyO0mE+7f3nSOvSJIW9k/uVI5rYijR2wkjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MhT0MMEn6zvBoQjxp5BnMHtswSY0Xf48efgKJI8ImvgIt6e7WF/qZBTjwaGGArBDT0OoplKt1NaCbRJLktW4BX6EgeB3zyJtD+T6ta/n7+WD690DacVsDBhhNW2mEjRuO9NSW/C1uHN/G/vctuDaEV5BUM4gbQR9x3yCCnKhpdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk; spf=none smtp.mailfrom=davidwei.uk; dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b=uj9wYsAM; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=davidwei.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=davidwei-uk.20230601.gappssmtp.com header.i=@davidwei-uk.20230601.gappssmtp.com header.b="uj9wYsAM"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1275750cf9cso3579823c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 02 Mar 2026 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidwei-uk.20230601.gappssmtp.com; s=20230601; t=1772466547; x=1773071347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hKcLgp4ecTYImMNgqgWm4N1laI6U5+FQMPbSa6L123Q=;
        b=uj9wYsAMTqN4Orqw1jAf0xMIBj/akw7Kueq6HOwpTdyvUcSDLQ6Ao5U6WcDy0T15BW
         kMQ28DwarlYMF+PkuI2ITSxkxyi6+3n8B+ePLFfCvvmM0ORywI80MgV3rNuc9NhKibGt
         eVknKfjkd5Ciz8m051nWFI65NBh2NXkZqV+nEIeAkf52ftrjLMr4MSzpM+6y29noRj4q
         5HcZm3qQbWI0ig24BfyzmixGYCm/usuzbjNq0FAUrgUZvqFV8xyXrm4PE7nl2te6bIM7
         8Sa/J2PndioGfHmROC/M1eopLDZeLxMvcdjWNdWJ5LRU3paCXqyHVVWRogYqy2s75wu8
         SRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772466547; x=1773071347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKcLgp4ecTYImMNgqgWm4N1laI6U5+FQMPbSa6L123Q=;
        b=POYiLrxy1a6Yg1X4S2bb+tySshkOd6spXJ93d86QM4ULtaGTWUjs6OoINHOswhuyF4
         YAlJ7uaipPxjO/dJVFOmnO+IsOfxUXed6lTsQQLWiWsS8pd5lcwfkz7102umzOkZlLxr
         dn6o+DYE1MxFNkZlW6d7667jcfmtKZE89cTwgLfS1kC1A9dOiShJGyZBGAbvMNVonQKE
         v/C644GVXtSuJhOfaKlVry4WHZP2qc6BvEryzNHuUM91nOTi/+HKZdCUtSpOdzeXTibB
         40wEekcKL6HkDa+8Qvzjzw32J698yGHTyda/WMKJFiX7obOL4qR1DeBuC709QukoQui7
         rdbA==
X-Forwarded-Encrypted: i=1; AJvYcCVZxwhSowNjqbNMXGAkxq4AmWAwmkXY598bgCr6zAPnr8hfr2Qd1otHlCceooi9lLTwuNS2s0cKnc5u/fqbMmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXIb61OfxthjvNml18VTOFAreFBNRDyAJkXCp14PWUr9o06w+
	3EIazim6hJ8hXlVRlAcw6qTCx2FJvvYkQzNQcLCIiJgT73ZvVVT3RoKsqNL1LQLHfIo=
X-Gm-Gg: ATEYQzzWAWh2QpHsdLSsFxPmKvFnlZir+8sj3q6aD0Oa/5AXBKh0SWfOzTZF4HRFMjF
	rGVL1NJ7p6dOW2o04v4MUUrH9TT/i3A86UZgSjMfWQwTSFCs17JdD05iLJ/OhZxFllOEFEPROUl
	vJbqDjI2eFjQEbrbbmYVTeg9/UfgDRluyIMf8OQ9XjSYiYKHubb53numKXVHO4hoO/j8HXhIEpc
	4+ac3tpVNEf7B79qMSHnMwv3AP1q46IGYRBX64LikkhgWlib5JZWWa7Z4e5yn4oW2vJOC/mb3lY
	lTpTBQOLRoffd133/zKcu4X5dUV6wDqAUkS6o5eBK5n9MQFa2ZZ5OWBUhNKALrPILfk4JLY+AqJ
	Fv79+b3ywPbhrwy4Ui9/PmcUX4yahbaMTXRYDowO/5dexMVIRIhL3tZJYAXVUBLs+OUYASCfdtn
	VD2dByUtjspT/nhFM/A7SYKKeol1H2LQg5m0XLFZvp7zfguGeS7recEGZMfcbG/kpqW4wkybJWd
	qaJLiXpo+zcALZ/Wdq5JQ==
X-Received: by 2002:a05:7022:f83:b0:127:366c:8727 with SMTP id a92af1059eb24-1278fc915a9mr4984202c88.40.1772466546711;
        Mon, 02 Mar 2026 07:49:06 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1156:1:c8f:b917:4342:fa09? ([2620:10d:c090:500::badb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a32dabsm16392875c88.11.2026.03.02.07.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 07:49:06 -0800 (PST)
Message-ID: <8489fcbf-ab76-48a9-a21f-d7f6873b9a2f@davidwei.uk>
Date: Mon, 2 Mar 2026 07:49:01 -0800
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] selftests: drv-net: iou-zcrx: wait for
 memory provider cleanup
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, jdamato@fastly.com,
 asml.silence@gmail.com, io-uring@vger.kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org
References: <20260227171305.2848240-1-kuba@kernel.org>
 <20260227171305.2848240-2-kuba@kernel.org>
Content-Language: en-US
From: David Wei <dw@davidwei.uk>
In-Reply-To: <20260227171305.2848240-2-kuba@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-02-27 09:13, Jakub Kicinski wrote:
> io_uring defers zcrx context teardown to the iou_exit workqueue.
> 
>    # ps aux | grep iou
>    ...    07:58   0:00 [kworker/u19:0-iou_exit]
>    ... 07:58   0:00 [kworker/u18:2-iou_exit]
> 
> When the test's receiver process exits, bkg() returns but the memory
> provider may still be attached to the rx queue. The subsequent defer()
> that restores tcp-data-split then fails:
> 
>    # Exception while handling defer / cleanup (callback 3 of 3)!
>    # Defer Exception| net.ynl.pyynl.lib.ynl.NlError:
>        Netlink error: can't disable tcp-data-split while device has
>                       memory provider enabled: Invalid argument
>    not ok 1 iou-zcrx.test_zcrx.single
> 
> Add a helper that polls netdev queue-get until no rx queue reports
> the io-uring memory provider attribute. Register it as a defer()
> just before tcp-data-split is restored as a "barrier".
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: shuah@kernel.org
> CC: dw@davidwei.uk
> CC: jdamato@fastly.com
> CC: linux-kselftest@vger.kernel.org
> ---
>   .../selftests/drivers/net/hw/iou-zcrx.py       | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> index c63d6d6450d2..c27c2064701d 100755
> --- a/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> +++ b/tools/testing/selftests/drivers/net/hw/iou-zcrx.py
> @@ -2,14 +2,27 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   import re
> +import time
>   from os import path
>   from lib.py import ksft_run, ksft_exit, KsftSkipEx, ksft_variants, KsftNamedVariant
>   from lib.py import NetDrvEpEnv
>   from lib.py import bkg, cmd, defer, ethtool, rand_port, wait_port_listen
> -from lib.py import EthtoolFamily
> +from lib.py import EthtoolFamily, NetdevFamily
>   
>   SKIP_CODE = 42
>   
> +
> +def mp_clear_wait(cfg):
> +    """Wait for io_uring memory providers to clear from all device queues."""
> +    deadline = time.time() + 5

This is potentially a very long time to wait if code is buggy, as I
found out when debugging netkit queue lease. How about reducing this to
say 1 second?
