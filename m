Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608A2C21F7
	for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891531; cv=none; b=iLjUd5TsoKkkKPrn1O319aCpc3j0+gYPQq+eByOhtXXzqvSp9Nu+8MqIak+auTBRHYQqhf4q8k4yO+wYvFdG04lp0oeLr6jWnwt/92b38c90iVvt6LaPz95c/WfY6+1JWSVo9PoTDnPdDpcB0rfIaNFBPhrGYOfMuaCnxDLWCbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891531; c=relaxed/simple;
	bh=NnyYFE+HJVLJxtcsT92HLFm8mSe3dFIK/BDLxpKXpk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5zHKDDZza+OQAa6bqBZ1w0mv+Nrk3vfcz+rjucdSa9RQ7ecb1kOP3qt8w80ol4bpXFzTREMEzQcHRDr5pRQYo/zhxO3+wp+aTjLgvP0MtWKqpjmr2PIMQpu+AVLkLW72pUAyr6xl7NdxYiZY7daClt/0plfdyoziaR4yvVe03w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=3OtttYzE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="3OtttYzE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35da8d037a5so512224a91.0
        for <linux-kselftest@vger.kernel.org>; Mon, 30 Mar 2026 10:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1774891530; x=1775496330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4onAiBRNZOZ3SZoDzbxcCiu00GtL8ucl3I9j0zyMyW0=;
        b=3OtttYzEJgroh67iVYPSE8N2X0NeztMY+l6lUU1py3PoW54ggsF5/MMlIXuMsOltaA
         HWyBe656zNt/PLi+pr32AjiwpX/pvf83wAY+Lb45iIjrwq99wk0iggSWKFn9RSFB3zro
         W62dL6X5tmyTi+OuHjFR6m7dG1TzzDvVDJ/e7AdxSh/4SSb4X7VNiqjN4FMxBCJIWkTx
         OblUyIqYIPESB5pbFd+q28VUQqoda0xWKdueIG8huDjnclHlUuytewJAyygFl9IFzc0F
         fecJSKD4w7ICLpgSJeVxiGn4qckwJB3yS1KciyxHu/nj9eoRrz+ojKmHrK/v/u1uOvvG
         FAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891530; x=1775496330;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4onAiBRNZOZ3SZoDzbxcCiu00GtL8ucl3I9j0zyMyW0=;
        b=YG5mnRuGw7RDpCw4wb0l09p8Xat6fr+2Ss++WKNIJJ3y6dhryO5MYwVlV3IzLDubg4
         OriljvcrODT/q3Ap4CxQY2H/dLRuAmOUN2he0tm7aNiqvcPeibN9+mEHC3fQsdl/sI8L
         qjEqLomtW/i1A3wseFdBMffJZ1SDflLv7qvCG29/y32Fh8wsw76soEBRBfn4AsWhgWAa
         jleg0QrDY+46PF9OyPUFOxSnRaE6K8wbj3NqVB8p4zvmYUedES8PJ4jznFqbxpX+CsJq
         QRIswLI8PodO5bNwcglpClj80UcfVvkk26p32KkWrtAWP1R0Rz3cl/1E+RMfc//t/BMa
         Oy5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQ4cvudHWXo/lqohXu47xLKI5RZyvHEmB+4iVdWIBJIbNms4Z/0IGmvE6QazbHXBTKxnJopfbF/m1CevGeyvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR7KMrB7p7BJsB8tKPiVth1h+PlBvqwtJe+k8TRAADa1XVSgjX
	U3e1DmF78RhpMpIEGt12f0lZXdNNs18QE8DulTgV33caGY9IkNr4Ttl2W+qcM4PkVrk4VjuwRi0
	6Wn7hokM=
X-Gm-Gg: ATEYQzxWS0Z0FMY9LepCgHsZ89l6PME+RnS2Pjnel+QY6TdumvJvYgFYEzOqEkyRuYD
	j3bNOWRHzy3zCfFQqVRLA4Xwn4GBmK7j8CuyH1tpWDQw6A9bthaAtgh8sD+o46ZqfGeEzXpA/Vi
	1EZWDIZhinb7sJr1gS3ZIaimKURG+/r21Trk2lsAuXB9sAEUc1094Xz1AuvR582l7Ae/cJdZJUn
	NOLpn21he8JA0MEcuNJveTswnzYNo8Mko0rzHZaGm/27j80W+EdX+E9eoKl31A3tUbYRApdG/UM
	7M0FDGXyfDBsoTEAenTdl3i4cetDjqQc92gD0ioY7f1uNg44EIwL+2cUeIinD8yF2TzHP4m8T6h
	AAO4EZoz6Q1mbjW3G+p82/TM51HpOjaV/o9XSdavnbnxQCxDEvkTtd3iCFcjuA48e7Ag2yYR7Lp
	sAwiI=
X-Received: by 2002:a17:90b:2ec7:b0:35d:974d:8f3 with SMTP id 98e67ed59e1d1-35d974d1935mr7478634a91.15.1774891529936;
        Mon, 30 Mar 2026 10:25:29 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:1::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2eaf1dbfsm5134650a91.3.2026.03.30.10.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:25:29 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:25:28 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, horms@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org,
	leon@kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [net-next v6 12/12] selftests: drv-net: Add USO test
Message-ID: <acqyCOYz7HqvnvQz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, linux-kernel@vger.kernel.org,
	leon@kernel.org, linux-kselftest@vger.kernel.org
References: <20260326235238.2940471-1-joe@dama.to>
 <20260326235238.2940471-13-joe@dama.to>
 <20260329153130.61b29766@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260329153130.61b29766@kernel.org>

On Sun, Mar 29, 2026 at 03:31:30PM -0700, Jakub Kicinski wrote:
> On Thu, 26 Mar 2026 16:52:31 -0700 Joe Damato wrote:
> > Add a simple test for USO. Can be used with netdevsim or real hardware.
> > Tests both ipv4 and ipv6 with several full segments and a partial
> > segment.
> 
> 
> > +def _test_uso(cfg, ipver, mss, total_payload):
> > +    cfg.require_ipver(ipver)
> > +
> > +    try:
> > +        ethtool(f"-K {cfg.ifname} tx-udp-segmentation on")
> > +    except Exception as exc:
> > +        raise KsftSkipEx(
> > +            "Device does not support tx-udp-segmentation") from exc
> > +    defer(ethtool, f"-K {cfg.ifname} tx-udp-segmentation off")
> 
> If may have been on already when we started, no?

Right, yea. I'll fix it. Is there a helper that does this generically for any
features, by any chance?

> > +    expected_segs = (total_payload + mss - 1) // mss
> > +
> > +    rx_before = _get_rx_packets(cfg)
> 
> Let's run a little program on the remote that receives the packets
> and validates they were correct? Maybe socat can do?

Sure, I can do that in the v7.

> > +    port = rand_port(stype=socket.SOCK_DGRAM)
> > +    _send_uso(cfg, ipver, mss, total_payload, port)
> > +
> > +    time.sleep(0.5)
> 
> What's this? Did you mean to wait for stats to settle?
> cfg.wait_hw_stats_settle()

Yea. cfg.wait_hw_stats_settle is clearly better, thanks.
 
> > +    rx_after = _get_rx_packets(cfg)
> > +    rx_delta = rx_after - rx_before
> 
> Instead of checking Rx (which is probably fine) we may want to check Tx
> has the right number of frames. Sender may have mis-counted the whole
> USO as one packet if it's buggy?

Sure.

> > +    ksft_ge(rx_delta, expected_segs,
> > +            comment=f"Expected >= {expected_segs} rx packets, got {rx_delta}")
> > +
> > +
> > +def test_uso_v4(cfg):
> > +    """USO IPv4: 11 segments (10 full + 1 partial)."""
> > +    _test_uso(cfg, "4", 1400, 1400 * 10 + 500)
> > +
> > +
> > +def test_uso_v6(cfg):
> > +    """USO IPv6: 11 segments (10 full + 1 partial)."""
> > +    _test_uso(cfg, "6", 1400, 1400 * 10 + 500)
> > +
> > +
> > +def test_uso_v4_exact(cfg):
> > +    """USO IPv4: exact multiple of MSS (5 full segments)."""
> > +    _test_uso(cfg, "4", 1400, 1400 * 5)
> 
> Variants are probably a good fit here.

Is the right way to do this by using test_builder?
