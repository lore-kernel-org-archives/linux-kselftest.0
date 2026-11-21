Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795286103;
	b=f6YRcitzr6hsyrVmam4yq00vdxfyIb2ZJf21O0oFh6F/6XSzxfAG5e5LgWg0bMlNcWxt
	 Lt0k1YPn7AcSI+Cm+ewGehkOM6vuuzkWaGT3nT5x4Y2CbkhQUqMhpOVWXjzE21r3D2GG4
	 In6BBKr8JOQAfd+0J3LALv2ZCD2GvR1pHr9/CqNciB8XuOV49ShPaNjp9szO08VPC9Z2g
	 5GOB53JCF6bBT4+Rn2amwKA0g6dku+wSzoAsZqqJLDI9UxUkQQfMb102ip4tMOWF9hcSU
	 MZjeiR6ugSoSeYbLnQdM3rLnbAUujqVkLXTSd4EzBQx6rs9bWiBEWKjdPgAtM61MzAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795286103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
	b=PFrRt5KMcZypH/UFPPlZHI/afrX+cM8MtPAYV+T9mLXFgm9tTjen1mwwNEHKqBJe2xhh
	 /jJMqxWKA8N31lUOuTo49o/ZxxcXR5yYo5BEWyevZscsnUOpoBnpzbIS7QaFvP+l1nVuz
	 G5keIBHOolCvZ0GK82hlF94my+f+GsGzG48wiYXoCdNk8ylLZQv6WN4mcQjSBzdoqp/Hm
	 GEfWqu2fmsy/gPpif97tY27XO5e//UfDzmVTWVmijlrU2mGVGUorobw1Q36BlkjWIdh1i
	 ft2j40H2dlR3BVQQpb94bt0r6WYf88sesZeSuacfwUtbYfTv8N9VFfcbqCUbu07J5gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B67606A32C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 18:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8B67606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=a3zTH0VM
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0a7cbf164so1937890a91.3
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Nov 2026 10:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795286102; x=1795890902; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=a3zTH0VMfDOtA3qASaPnyRTKrbn0QPoswlB+TwNBUhyHrMnQxSfUx6JcQY0XZK4GFv
         ddqpHhn/lT88Xod5yWmMdd0jBOfshGBd4bJ4tzLCmz4ocn+YIWEdPRuroOse/IE5dnLf
         9v00BNW7ERSQF3WDPV2odW8vWdDVHs4+bin6/Q65eue9tF+EYuIDfTYGYN4en7Ft7qEz
         vot/4Uoghuda1BQrflDK9a/770qtve9526opQe2mxjHfUoqCoiTDPH8yTroT1NFHhqDV
         9SDCNx2Uj9G7wMKvLOMjyOaMwvfec7qEh6/BWqkRX+6mLuKJpht3T2zTAgF+pI4L36/c
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795286102; x=1795890902;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4kKgSANEna6VIiJcypGE8a5TeyleL9ds1EVO6d2+m6c=;
        b=lP5YwuDasQYDAwpcEkkwzamToaKAtU/2Y58JXlWG9LbIXOHAMhrGIUCY56hCBwed3k
         Vu725/pjAXJACYOLOGiVU1AfqUvTtqwiyE7Oevj5O98rsdGga+z2iI1lEb5bOANhZAEi
         GO68ab7GMSXYDrjbWap78gyxkP3iWf26owNMep6u6CdbnuHX7vBdS1ntlNBeFVNVtJn5
         OZasGrir7IjbDhuNmsxW7VLj/+n1nckSNNx/w2OSqjzZYmJI8nC5jk/R9kaz2d59zKky
         2Gv5LBwgH7ZkEnhBJCZ0lMW4NLXXdooP8ZDNXSJXEjgLbpOnErPjcrioiReOuds/AJAh
         RLmg==
X-Forwarded-Encrypted: i=1; AL+hErFeq2ev7lRAKl/vj2MbzL3mB60dlNkM6/gldBVwEhodQlbS8Pv02s4dFAwzgKkJFDhfGHTCczQZDHZQzZFiRaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WU+HXDKy4mOhSdgn/LOfrxavhe+LSr2N4R5+ynWna5KctgkIx
	Sf77ke7fj55ieTHFnCquSp06Mn/aDinGB5qBVQ9Lp9P8KRC3pl61V5be6hrcKTz9g6Fr3bVe4ZU
	+iDBPlg==
X-Received: from pjbrm1.prod.google.com ([2002:a17:90b:3ec1:b0:3aa:fb90:d203])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70c:b0:3ac:9df3:6b07
 with SMTP id 98e67ed59e1d1-3b41c9234b2mr7049150a91.24.1795286101862; Sat, 21
 Nov 2026 10:35:01 -0800 (PST)
Date: Sat, 21 Nov 2026 18:35:01 +0000
In-Reply-To: <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com> <20261118-tcp-mtu-probing-doc-v1-v2-2-e795f20b8cfe@gmail.com>
Message-ID: <awHkTCbtUgkJoAW7@google.com>
Subject: Re: [PATCH net-next v2 2/2] selftests/net: packetdrill: test tcp_mtu_probe_floor
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, kuba@kernel.org, 
	shuah@kernel.org, pabeni@redhat.com, rdunlap@infradead.org, 
	linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, 18 Nov 2026 16:10:53 +0800, Yongjian Wang wrote:
> tcp_mtu_probe_floor has no selftest coverage.
> 
> Add a test where a full-sized segment keeps timing out without any ICMP
> feedback. After the first detection falls back to tcp_base_mss, check
> that each further retransmission timeout halves the MSS, and that the
> MSS stops at tcp_mtu_probe_floor.
> 
> Use tcp_retries1=1 and disable TLP, as in
> tcp_mtu_probing_blackhole_no_tlp_retries1_is_1.pkt, so that every
> retransmission comes from the RTO timer.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
