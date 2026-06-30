Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41FC330B11
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 17:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839479; cv=none; b=mi8qrVQ3dbq+yp3IoZ8cjGF25rrRm5eQunqFspnp/pabRNegcUj/gYBedCxJAiexAkMI8YYUGIsST1OFvGZx+8Hx5bSmbUQ+Gn96+x3JQWtNfe9BlHlg6M1ZDosIdCD3bNG/MLW5qCu06119FK3oUbnCOC6QwJUlsQhxV1sREV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839479; c=relaxed/simple;
	bh=BxM8tCRL/LY3p016q2G8x8d9hhF+S3sM1Ssibu3JnEE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=DZlZtbbTvmH9hAy3UpJgUlPF/572/Qrw6OOwUywy5mqhvX6ltHWF2cNxhseOzh2kctctuZqCM9Ur3MMUTDDg2HSmqhASxYdLrLTRa8lxCRZIABBPNUyHblcHSfHv/k7bWcKDxx13MJrDt17z2x0/0DbIFcIhF3/qO3NCgWCcrBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rMoPlz4p; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMoPlz4p"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664c1406f91so3222593d50.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839477; x=1783444277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPJiBM1HvdVkRkqn01nRJ7T3toL0q0YlzVSn5/uUYBE=;
        b=rMoPlz4pAyQWbl0n7yhI0B5GyLcDUDnr3dck10vphqCX7Xn669qXR3THCo9euZHSUl
         MT9ZJZdx31+ODp1lsixkclpG8aell+0YG5p05XcL5JEtGCXssMjOhH938x0q/fM3WcsQ
         cF+PIzWkbNOMDzOJA9/cyg7QNrkPWDRXhMWBUim3NiDjHX9GWUHhdp4qfAHHU/yNt2JK
         24bFDUtnum0TbESHQVPhXPsHXNFCS6C++eMpW7IE9bbH9O5xicmtF7Mq8OEP4U5aXYtP
         1rmtrMn+jU3ydBRS2EmRI1QX/5WRepvFMwEyQd7mEq0rq/3NmHP4PPjxP9rvbKkWNKtZ
         7tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839477; x=1783444277;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPJiBM1HvdVkRkqn01nRJ7T3toL0q0YlzVSn5/uUYBE=;
        b=i/iImNuvRuN8ojENdNx7qhxdhAieXDUWuoT8VeBaYK1nWs+5R2/ktD+tvBNQVODHob
         TJTepZWQeQxmrCTj0+vdRbyqtcB1Fzx3aFE0M7eomUY5yqGrtmtyjEx2mqwBW9tMnByc
         taRrRqagsCLCjlKJhJmVEIi1VcPzGQU8R/2HTUJ7RSORwMew9ENdAc5vN2doVEnZDtjw
         6lm8bPDM0TYM5ozQdRfWUd5GxJilmvp6okrHdxz6fnQN8EHdJZLrzdmzCPZF8FXZa0cH
         jEG3TQn7ALMmpwoePNhKcoLQQS//P7TxF7cO5kMbw4YN2Cer+hni4WabV1CrLX41SxJb
         7P5g==
X-Forwarded-Encrypted: i=1; AHgh+RrAoQMkI8W67YbFklN4aouefjJjdE78fnRb9wynW+nmp5D6IGJ1DINyH8BThC8I35hNOTH9E7Lgk4DHZnYhvxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWejclBQZqoz0VCc0d3ET7pRfUX6gp+cPA7ZKWiZU0eOhc1cPM
	QO4VzJu3GgkmIHx4hiZEclbrD6M09lq2+tRo/YsrPUOMJt9x0Cs1qSHy
X-Gm-Gg: AfdE7ck9K27mVHvmhUuG9kbwVWRzNxcsl8P6kORpihysPEbRMKRTt/pKk0whoBkpfZ8
	fTkGFDeXNCFsmJSmkJSSguWoK9HkGpx0CQ9Pwy2p/7USDEHXLvzEOSJWWU5HrPABYm0vu6QQCgh
	Ps9mSOUgFNfuXMSGR7L5qizfmcdClPc7/e2H7mkVSA94wfViRiZ42QNMenl4xc5UPA/+V0S+zK7
	4+8hACHk33rGS+jOF6/rM324nlsg+k6/CO0NAa5SJPk4jD/Bpv3dMJKiDeiowkntvQcIjy+dGQM
	MCvUzMaCyxRlMrcfJ0N3FltBndqENXadownqwp7J1ey5YhpqO9G275GSQ0x4zy58h3l2L/gWL7E
	9Ga1PUfKxLZtFxhUbMGfWSoqPWnGarqAAsni87yi67Ej+cMaW3qAmKP5FJjrs8F2LaqHJ+L+OnS
	aZU/feMLwY59IzSD00vQce0sgXPHUSUsqgu/MYLjtSWjx24pT4Mqg0cdILIwwmdxUwDMNx
X-Received: by 2002:a05:690e:43da:b0:664:77d8:ffc0 with SMTP id 956f58d0204a3-66510b067d5mr829578d50.39.1782839476992;
        Tue, 30 Jun 2026 10:11:16 -0700 (PDT)
Received: from gmail.com (141.139.145.34.bc.googleusercontent.com. [34.145.139.141])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650168a556sm1140056d50.18.2026.06.30.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:11:16 -0700 (PDT)
Date: Tue, 30 Jun 2026 13:11:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net
Cc: netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 Jakub Kicinski <kuba@kernel.org>, 
 shuah@kernel.org, 
 willemb@google.com, 
 noren@nvidia.com, 
 gal@nvidia.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.23684913d1fd4@gmail.com>
In-Reply-To: <20260629234354.2154541-1-kuba@kernel.org>
References: <20260629234354.2154541-1-kuba@kernel.org>
Subject: Re: [PATCH net-next] selftests: drv-net: toeplitz: cap the Rx queue
 count
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> The RPS test needs a free CPU within the first RPS_MAX_CPUS (16)
> cores. This is easily violated if the NIC or env allocates the
> IRQs to cores linearly.
> 
> Cap the Rx queues at 8, we don't need more. This makes the test
> pass on CX7 in NIPA.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Willem de Bruijn <willemb@google.com>

> ---
> CC: shuah@kernel.org
> CC: willemb@google.com
> CC: noren@nvidia.com
> CC: gal@nvidia.com
> CC: linux-kselftest@vger.kernel.org
> ---
>  .../selftests/drivers/net/hw/toeplitz.py      | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/toeplitz.py b/tools/testing/selftests/drivers/net/hw/toeplitz.py
> index cd7e080e6f84..571732198b93 100755
> --- a/tools/testing/selftests/drivers/net/hw/toeplitz.py
> +++ b/tools/testing/selftests/drivers/net/hw/toeplitz.py
> @@ -21,6 +21,8 @@ from lib.py import ksft_variants, KsftNamedVariant, KsftSkipEx, KsftFailEx
>  ETH_RSS_HASH_TOP = 1
>  # Must match RPS_MAX_CPUS in toeplitz.c
>  RPS_MAX_CPUS = 16
> +# Cap Rx queues so IRQ pinning leaves free CPUs in the RPS_MAX_CPUS range
> +QUEUE_CAP = 8
>  
>  
>  def _check_rps_and_rfs_not_configured(cfg):
> @@ -48,6 +50,25 @@ RPS_MAX_CPUS = 16
>          return int(data)
>  
>  
> +def _cap_queue_count(cfg):
> +    ehdr = {"header": {"dev-index": cfg.ifindex}}
> +    chans = cfg.ethnl.channels_get(ehdr)
> +
> +    config = {}
> +    restore = {}
> +    for key in ("combined-count", "rx-count"):

This assumes that combined and rx are not set at the same time.
SGTM, not expected in real devices. But technically they could be.

> +        cur = chans.get(key, 0)
> +        if cur > QUEUE_CAP:
> +            config[key] = QUEUE_CAP
> +            restore[key] = cur
> +
> +    if not config:
> +        return
> +
> +    cfg.ethnl.channels_set(ehdr | config)
> +    defer(cfg.ethnl.channels_set, ehdr | restore)
> +
> +
>  def _get_irq_cpus(cfg):
>      """
>      Read the list of IRQs for the device Rx queues.
> @@ -177,6 +198,7 @@ RPS_MAX_CPUS = 16
>      ]
>  
>      if grp:
> +        _cap_queue_count(cfg)
>          _check_rps_and_rfs_not_configured(cfg)
>      if grp == "rss":
>          irq_cpus = ",".join([str(x) for x in _get_irq_cpus(cfg)])
> -- 
> 2.54.0
> 


