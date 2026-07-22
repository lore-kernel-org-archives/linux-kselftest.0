Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2D411F9D
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740812; cv=none; b=VWkmHdEOCEo55WiHNxbS6yKrltxzQFUlNveA1Xs2zj6dt0oWY2wzVnZMC8ZIZbX1wtPs5NGfu2Rx3d4lMy9H9/fWmpIhDMyN5VCJ7YL3t0y+BCY17rzWsGPVqX4l+THSNCdLHil7hBmV2D00n+qY9Gl4kgWSMLFyYR0RKDCE2OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740812; c=relaxed/simple;
	bh=2DNM5hwTyYjmClgefcOyZjDARMLTZoKh5uOhfdL0aZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJUFHK3ciE8eVTz1ba9RarB+rtGURTa+cMim6CKJcQQ8kAG7hXbFPoty5VlF2E4fgtsph2YTYWQ3GwAUTf2mbDlqxm0j0ez9ahloWqPAz60+cvAgFxupySWXCckqwlCV8YXAG+g26J/eQitmvSsQ/Kcpn9V34CWXyGIpyQFRSkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ENV5ITnW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ENV5ITnW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caf228a910so102418405ad.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740810; x=1785345610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L/P5jmNBEnuW7gDGxtookRVKN0SYP+YjEdzh1uXpFYw=;
        b=ENV5ITnWAyFfjyKmrc/Xq8YW8xaiVOqYAi/1bsRbF9239teiy8RNDNge0y40wcP1/U
         TAhXb//pGwrgyO7Gmq60e+4ca/8JiklzyMt2n8dNS3Pv3jJBdK8SNc0ckSog/DJ6NM9t
         s0TcP3rCvlHfuewKAfYm2I0r1J+AYDg1NG6nCUeeiyTBJvMq1LESpEhdqVqOrMGPAtBI
         WUtEc8L7qHrJ5gR2H2yTbGYA6cFUNcPAYyErFJzJyhpm4/lRqwvRtOdiJ/AirNQPayqN
         BuOqzStBPXlt1pfQyYcaxPwqkZmxcLnDtstbkVQGQChVuw7vLDIObGWRgMVKw8hQ3b16
         xzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740810; x=1785345610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L/P5jmNBEnuW7gDGxtookRVKN0SYP+YjEdzh1uXpFYw=;
        b=GGIxU+PRSlRsOrfhgDzWKJ/9Llqt2kP6RIYEGB8u7yphlc+JA7sF0fTjP1QOu4qK8w
         N/RXl9wW7vF72USsh6YzkPbEEqs6MfubapNTjl+M5me71B52xJ1Cjp2AfU2PO/qrsh29
         ucrLO0uDMUJEesuUeqDw8m9fvBMaWjjH/4xTI5Hj6Y6442UdHrQgHXtyci18ePnhyaxt
         IRlgEteGbFW9BNvfpRQyz2dOqbaDKTJnVgerkbNel6r6OVxYCwkOlARoCduvSJZR574B
         /su7i4+UL+CJPDjFH9oP9UZv+OufvrN//ODFFONh1H0ob5JugwzXna7jxkvT2ygheHmj
         Qxeg==
X-Forwarded-Encrypted: i=1; AHgh+RpzLDWR95Wb7aQrUbRAMEys+xNLFGSbipzxfM7RpV8o2rPIi88ycTELqin0MjlyghFoz43YpiKDVlSBqe0TRvY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9oyq4jUC/rS+HCaoSTJ59M+mncPMXPYiPCWhQZnCuhLLCJ4kf
	yFkaimp/TlCeXJYv5ERQV1SNS+GCu3ltIDv83vkXA3C1cCJ/KP7gfITy
X-Gm-Gg: AR+sD13fnIMTJy0ypsvGTqEY4dFQjI4ZfWcIm5dY0UrwyyvE2DE4GcN43mLIE/JdQPS
	k3F/+J/uS/Anmnianqps0jTLhB8XOrvcvlUkm1LUO2z85zgN1pBEYOTpv9QebuZnJ8cGpQqzePW
	EsX5q1HpZeGvlHP3jPG3o1YoEcWRWSp+PzWTr2ckcsuCjc0IivYTeqLyWO/WZUSPEitGS1j/fui
	jTlHVwiQrmyKM9dHUomYBIk8HWDE+AEN2tfFaS2q0WCzYX8lk4J4h+B1VklfHycEojonQ0+OvVn
	tdyJCSk2EHWv6wNHWcRu4Vemsfb7e3r1yxnNQshJKk3kPujWq/MnlI4yyfuU5+GaK3ZxD+NSS8B
	lMIhQF3l1uPKjCklBr8XFikjgE+SxBKfs3wqGE+1M9n10ujrmWdzXeZRkxP+dWkX+rjPZoOBKzO
	+DS6l2fpS1q7zuwDWMDyJ85z6bFKNT2Ruj9Q==
X-Received: by 2002:a17:903:1c8:b0:2cc:f7c6:834e with SMTP id d9443c01a7336-2cf349a3e33mr255048305ad.32.1784740810011;
        Wed, 22 Jul 2026 10:20:10 -0700 (PDT)
Received: from devvm29614.prn0.facebook.com ([2a03:2880:ff:45::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8f2e6247sm18204425ad.54.2026.07.22.10.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:20:09 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:20:07 -0700
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Gal Pressman <gal@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Michael Chan <michael.chan@broadcom.com>,
	linux-kselftest@vger.kernel.org, Nimrod Oren <noren@nvidia.com>
Subject: Re: [PATCH net] selftests: drv-net: rss_ctx: fix persist tests skip
 on IPv6 setups
Message-ID: <amD7xzvgFwnlUj2S@devvm29614.prn0.facebook.com>
References: <20260722123844.1673299-1-gal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722123844.1673299-1-gal@nvidia.com>

On Wed, Jul 22, 2026 at 03:38:44PM +0300, Gal Pressman wrote:
> test_rss_context_persist_ifupdown() cycles the interface down/up and
> pings the remote host before verifying the contexts survived.
> 
> When using IPv6, the down operation deletes the configured IPv6 address
> (default keep_addr_on_down=0) and nothing restores it after the up, so
> all ping attempts fail and both tests skip with "Cannot reach remote
> host after interface up".
> 
> Set the interface's keep_addr_on_down sysctl around the flap to retain
> the address.
> 
> Fixes: ce5a0f4612db ("selftests: drv-net: rss_ctx: test RSS contexts persist after ifdown/up")
> Reviewed-by: Nimrod Oren <noren@nvidia.com>
> Signed-off-by: Gal Pressman <gal@nvidia.com>
> ---
> Disclaimer: I'm not sure if this should go to net or net-next.
> ---
>  tools/testing/selftests/drivers/net/hw/rss_ctx.py | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tools/testing/selftests/drivers/net/hw/rss_ctx.py b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
> index f36f76d6ca59..eeea2fb292ac 100755
> --- a/tools/testing/selftests/drivers/net/hw/rss_ctx.py
> +++ b/tools/testing/selftests/drivers/net/hw/rss_ctx.py
> @@ -938,6 +938,13 @@ def test_rss_context_persist_ifupdown(cfg, pre_down=False):
>      ethtool(f"-X {cfg.ifname} equal 2")
>      defer(ethtool, f"-X {cfg.ifname} default")
>  
> +    # IPv6 addresses are deleted on admin down and not restored on up
> +    knob = f"net/ipv6/conf/{cfg.ifname}/keep_addr_on_down"
> +    probe = cmd(f"sysctl -n {knob}", fail=False)
> +    if probe.ret == 0:
> +        cmd(f"sysctl -qw {knob}=1")
> +        defer(cmd, f"sysctl -qw {knob}={probe.stdout.strip()}")
> +
>      ifup = defer(ip, f"link set dev {cfg.ifname} up")
>      if pre_down:
>          ip(f"link set dev {cfg.ifname} down")
> -- 
> 2.54.0
> 

Makes sense to me.

Reviewed-by: Bobby Eshleman <bobbyeshleman@meta.com>
