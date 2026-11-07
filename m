Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794032916;
	b=YwABok/EC4Amn+8GhReh0cWl4iL3is5AGZ5wVs5c1mt9KRhvCdybY1CtEtB3leCeNP7P
	 F3Q374Oz+b5wRYg66WAN8tO4hnWnja+n3QK46E31z4bHhr0QJWdU90LEzzSeO9W0yGVAz
	 DI6l58N9vy30qO3Nswumb4NfoAuYn6Daf0rnVPpi3qMRRdLdDtpyjT5wdLPTGr8lXoR/E
	 kEp9GSgyIXTZHhcWHTQ4gM8y9l13/R5nGmCNvw8a1GMesGkA1cOdYMJ0lZvEDfyG657rw
	 0DrGj+A3yp90UTdqPXJrGTrdByyxJxkXPSdYn198o+Q/SBGbE2HBw+OmgWKVZC1o5hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794032916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
	b=wiwvIfi2UNFpA050YN/tBK7KtmUmv/Qc5zw5Q+/TezuNxEjbrIW8vOPwmz8YFPXY+N+Q
	 ssFzKxjlLIwAdX9aHuBvXdrPqAhQyh/Wz8FYiLnV0RmfK2wF2+c4CTCBPtTCKR6o6T/nK
	 6qUk2C0pjqKstdZknTcXvvdLaSNC3seAPLMxz2tw5UtrZKwETAWLzguzmYprxzApIeSCu
	 I6h183uMb/hxGJSvBWyB+WdDhRTA8TQJ2/aViBZNJ2hotFy/Wsu1I3egbob1VEL07wJSL
	 wHTK2xsATzAi5hxP9s9Wl3UrD/6ZvtNCGJ0WSikcPcfy0sEI3MALGQAMv6K8b03tLfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE03606A32E
	for <linux-kselftest@vger.kernel.org>; Sat,  7 Nov 2026 06:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE03606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q7zAdbIM
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ed0890476fso7206385ad.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 22:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794032915; x=1794637715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=q7zAdbIMkptkkFDlti+X0Wa3Z7jrU9yPPQq01Q6EArrGJ2FUruaEi2/1Hp2EAL3kxQ
         wlCSarsWFfQBdr+E/M1M2GuzcHs3bSNPxaVNvjVtR8liPd94qpR9QNhpXCPMp6f09303
         R1vvI+zoW1cfUaINREvos2TpRr/2Z7V1KU384BWTN06fRKzaHhyvoafscuu1BhDADMzV
         OpvtKi8Jp2w2059j2Y6IosLTQ/VNsRZBTzo+3IRLAl9f00RVaPEwifvmkr2GGinN7cBF
         xI+Am02u0eh/k+AL7FOB7AaXury6qLrh+eqASjK6cEYk/PrVXeZ1Hp1a2d6iB61RWoSW
         uH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794032915; x=1794637715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y3fAM8CU6fD90S4RyczeRFzjWR9lUGI2XBHnFrKKF58=;
        b=pvQ8uxZcq8p8FwFZ6F+RX/BPTDjlN2AKbmuimfUvtfs3BhDFKUnT2jmSu0o4bpkpkw
         Fmy+tbwZBMvBfLJJgc6zRaKzOedwSM5Mx4m2RMjVIa027NOeq0hTUMNviL+Auh+QkWzN
         QuqkjEee0Q99WjrY3KHPmZOp7qiIeuAeuqYbCBYIjuzV8Cf4A2tZUJy1tDeWT7h76AWB
         tX8Fj1jkcN01J141pVamtndYbKbyZcGWjyvwkC4YVeROqBXpAmbVWBVqqtnUb16o5WZj
         JcqMDGsjU96Ptt8grwRANtcfcFU0LH4tDp1dk4wMrJ81akBzjTm5zVcfPf0Fqk324d4s
         NXEA==
X-Forwarded-Encrypted: i=1; AL+hErHirq9Sm2ylkzY+gmSniyfj2RtSL0SymtPbsjh9yChkBOuv8oeNGMiXeX2DXueJSJA1yE2rpagm+/GAUXxdDZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rdvMrAqiK83dr6B1On7sH5NEdcOkYwjp6eg5yMCN3SXXhfqqn
	Srv0/Bg/6Opm3oniqFMoi062jDbcs0upVGp11Kz45x/s/rvYcBSFpf45
X-Gm-Gg: AYBFou37qUnCdaDbvoHFA2T27bonhllS9wftyQ2qpc59fZIdM3F/QQMu2wWxiK7uCAt
	4AQ7cPBUJ4nvWfXqccWHVv9krnm2Iz92xxJ0a20q7olPaDkF8o6FbwuAgDdMCuui0ligNuCPxV1
	T36oZnR4OuTmIGejTZJ1ijoc5gEudiNFxuRx7ZCf3iQDLiIcL66qLfxxUJL7BYhGeTsykawXI9a
	UtcFGc9l4Pq5xXLN9NOzgzeA1XiYrJFyKMzU+QaSVNv2kV+B9v32iqwm9xHbJp8XwPoDisElVYV
	U3Q6rpGO/EqXCt4+mqwZgwgnzKlya5Wlw+GFoIowKOsvqKA8T68eg99uEd9DLGiLH6tppPLeQdN
	ou2blRTPdOLp23ABT03X/tgrBK6LfAg6NpDMx6o8neIZh5faV99RkUlirzRmYotW7cA5uOuPH6C
	8mIUlzW7957AgfheEqbcx5KNNLETQF2bxLybVy0s2rtqmEfiqPp/Wbg8t7XHSaYbH9fyKRdl/qk
	PkN9Bc1VNfzBrNN7+jF0yeaN4sPsldzS6WMZI8jiTGRZMTTqwJh/HoNRI+t3yFV/PTRYLuF/B11
	58bI/xtHRONEfjYHEl1SF2REDXD+MCwCC+u2j5FZ6NAnCwlNY1seB9uJMnaA+5/l9FtTQA==
X-Received: by 2002:a17:902:e80f:b0:2ed:3ca1:848d with SMTP id d9443c01a7336-2ed40c17e5emr56027075ad.25.1794032915018;
        Fri, 06 Nov 2026 22:28:35 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da3e33sm11176045ad.76.2026.11.06.22.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:28:34 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: sashiko-bot@kernel.org
Cc: rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com
Subject: Re: [PATCH v8 3/5] tracing: Add stackmap statistics interface
Date: Sat,  7 Nov 2026 14:28:05 +0800
Message-Id: <20261107062805.3361142-1-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-202646@kernel.org>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com> <20261107055139.3138633-4-lipengfei28@xiaomi.com> <sashiko-outbox-202646@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pengfei Li <lipengfei28@xiaomi.com>

On Sat, 07 Nov 2026 06:04:59 +0000, sashiko-bot@kernel.org wrote:

> Can ftrace_stackmap_get_cookie() undercount smap->fallbacks when the
> element pool runs out during a concurrent insert?

Yes. The slot left without an element makes later lookups of that stack
take the "insert in progress" exit, so they are recorded in full but not
counted. It only happens once the pool is exhausted, when fallbacks is
already non-zero, so the counter still shows that the map is full; it
just reads low. The next version counts that case as a fallback.

Thanks,
Pengfei Li
