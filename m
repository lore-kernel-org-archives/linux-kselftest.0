Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637097;
	b=uYsrufcVW7a8TNUDpXd1m7jIGl+Ik6xP+ayfsNgXF1gAmJhws3FSPgkxgMsNozkGOQFF
	 L4gU/D5RdhwWvKl0We1qpYOv23GpWDfMD843PuYwGUs5hhevUMq3iIwcGI5Wc/I2pRojT
	 t3bXAGHI2FGtKd360RwYoeJk3qzHx1yRSm8WyAuytXAyI2TJIi54OLv2qyjgzwwNNqoK1
	 zrd0yLjz3S6PHuvHMM6PvltB+ETcMuTm5bXeCSmACmb3nO3f4XZd4vgBDVOoItjisUHB5
	 Qydik++naefrkLQ3w7YGO1QKI+PEZK/SE2EZ/5+OZr+xwbZELerwecJ+7gY05semmJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
	b=2aoRNsJNZbsh4R1RshfLZ5T7z7didkxQPwfo1gImuR/qLXxeYG+lE1yYD+1B5T5+cFkg
	 f5rvAYwiSiWBUyM5bAT8g6CO13j0dQT1rG6VEAdvL+UjSm1quqwAY5U1KCGgUAVhoxlkO
	 7SYka9FITJJmE83sO1X/wofBLq823ZigxTOZtzNDi1xGVvG3Jx6HJWtNvxxeeO6B3qlCe
	 gggXvQzzmTc6vjzr9Ot/Z7sAWdK7ii7utItjif4ohKWlzRJXSFBaqiN29Meh9zdM174Nf
	 snkTmoWZy0GR2cXy2mcPCHwr9zCX4znjE9sAr6t0aC2x1jotcwqSUVjtn+PdX7kyNHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RPWNe8kW;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B221606A323
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 06:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B221606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RPWNe8kW
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed47dc8f3dso27737725ad.2
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 22:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794637097; x=1795241897; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=RPWNe8kW6TKiwXLjqnkCoYgS5gAJpO3Wq10a6c1ZOio8d2WsavBLFoJFnlL97ZPUVG
         HKzvD102yHB8UodEYSYtStuG7S/HlcQiD9q9IQeP3I3phhV7T6QG+86pDg3HO7TZXgl8
         77wugvBuQq+IniQj9Y1egAbsGUpOi22srgCoDPbKv4oXhB44L30GaMvF6gEMxrwt732j
         KssMtlZO+oPjXmL4uzx2fSJpyQugecpwMueF3h4iVnb72MxXCA+kJ75mvHK2mxYv5OdH
         aZC4F+8rpqSR2NgDXYKfvs/nv8bnHIKYlzUFAiVWv1IKx7RY9enKImzCRYErmFwfwDsw
         ZlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637097; x=1795241897;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kbowv03anJ9qQzCXwkdQnDnwVItu8Czzblu9Au/FdN8=;
        b=l0CyPq6HRJbas1MRkZqPtUskx+el0KNdQg/dS+36CtByxQ97BnyCbn8Qgw9RBYCYT6
         BnYev4YklMTn4h5WE/az2tngrQ27ltbZms//y9MJx4GgNV9/ftd63WwVAZR7GG6GwO1R
         A77StCCBdRBJuBH9E+xFi938NHAgEkr5O2Kurh0yMnmASKD07ZFpDGv5QofJT7k73vDt
         fBikie/a005mSM7TbzGf1M375X1ht3eR/SdAqoYOzEs63RJQpk7o/KtuI2pn79lprgYA
         SHbM7Mo1Zn/b9gF2f8kRDYsctiu9PpAF8l4qInHSbfBsLAvCoMiW1PGgUPP+I+2ZQhTD
         Ip/A==
X-Forwarded-Encrypted: i=1; AL+hErGGC7fdZ1PWESmOwV5jH2GiotgEstoRlWn7GqbGbUtbVGqs3KJQ0GNk/6K6D+wCiWma0mnLQH4O90jmQz6ddzc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CoiW4gTvOPYVAJOn+1ZmFqE9NbKji8W2F8xDSB7MyvNPMODeS
	4nLdreXLA0sy309Hz0Zgzrzx3sbeYKXhtFN0MYuO8KSUXPDghsrz3Y7kaS05EUEHlQpG+IJ8kkG
	wv6YMdw==
X-Received: from plww2.prod.google.com ([2002:a17:902:d102:b0:2e9:b079:3771])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:230b:b0:2ea:e084:332a
 with SMTP id d9443c01a7336-2ee0dee824cmr51445225ad.56.1794637096336; Fri, 13
 Nov 2026 22:18:16 -0800 (PST)
Date: Sat, 14 Nov 2026 06:18:15 +0000
In-Reply-To: <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-3-6f2e484ca8ea@gmail.com>
Message-ID: <avf9HomOtgXYiRLX@google.com>
Subject: Re: [PATCH net-next v4 3/4] selftests/net: packetdrill: add TCP black
 hole detection tests
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Yongjian Wang <echoowall@gmail.com>
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, ncardwell@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="us-ascii"

On Wed, 11 Nov 2026 00:45:57 +0800, Yongjian Wang wrote:
> Black hole detection (net.ipv4.tcp_mtu_probing=1) has no selftest
> coverage.
> 
> Add a test that only sets tcp_mtu_probing=1 on top of the default
> settings. A full-sized segment keeps timing out without any ICMP
> feedback. Check that the MSS drops to tcp_base_mss once tcp_retries1
> is exceeded, and that the smaller MSS is also used for new data after
> the retransmission is acknowledged.
> 
> Add a shorter variant with tcp_retries1=1 and TLP disabled, so that
> every retransmission comes from the RTO timer, which is what
> tcp_write_timeout() counts.
> 
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>

