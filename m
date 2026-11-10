Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794278862;
	b=mgU7XyI2f3LpUvrH/5wcgk1ETEY+fBP688jzTYl0KZQS86e35o++4sBJNRFrtSudNohm
	 GBD/EwnLXVSTkIUU3RLWKMeaxZOKqzkNG2H52c9AbdgrO2e39HjHFYyNuKgPHJclBp7rY
	 7QK7M+pKMRE0acGKjzBKBzSF9BnlydrZUYghShNPoseI8I8y+JAz+K6IYcC3LxLTnvJSF
	 MrrydFMHrDmD4rnX4JYrnNAHSXa7hRiSZDJn2QpjPxcKzq67UUOG8oJvODUU9eRKvYzMN
	 ZXxqaf4eheyv6y9pDGHDpn0NDs786prY4JRfv7Zwfrkg4L3Luj6HQAuv3DqGDvlV2/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794278862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
	b=iR0yBe8AY3PsHJ77uW8VcOEPvuLXw5an+OFyTrncmjhFXMpVPSYi0HSDJCCwA2mU3mkV
	 BOq+lpRUeccunjq0nEp0oPND65+Wxre31l9fOBk9OL9HnGaLqvTuRYOwV7f3V9ffD+upt
	 7I0nYFWZwjevSft6oCyAsx0f6lZZSFmIxmAQ/2Uc6sTSNiZRVZH0SmLfvf02Jfpzm58pv
	 EXGCU2wqHPLIXZxHRohfb5gj4lGnTOq68WijMImQ2i+gVFnaLfGwUxNxtvnNGhJjJBafi
	 6nGC7rH2RFPEQylmyrqwPYm3lgU3zm2zYKmRoZI7dgLKOt0dxTWj+Fmh+X2endv4zEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXDhpVPK;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0EBE606A321
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0EBE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xXDhpVPK
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so1073070137.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Nov 2026 18:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794278861; x=1794883661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
        b=xXDhpVPKhEwmXYlSdgVQWRD0yKtOa/0Jw/dE9lGk+00h/qpIBRBu6nYBUWXUzsBIKu
         Mk8lf9mhxkiuZuVqgGV/DcNb6gN+cqUzzGaoVl5hEoVetgWT1Qa6qEvst+uqueb0Rluy
         rBpM45G0Kgmf7f7iLFzxPiXDygzfN35egxwAa8x2ibzfO5rHCUYA8aFVS8vz4Sid4MJh
         tx52lBzwWWNdu2Bllk8DdCHnir32H9HeDfZcmF9poJ44gPcpBRnEuLO/ceeQNmo9So/9
         ZnR5bGpZAXa1CAiDxN+3JKm0XU4q8b6B+hCLP1i5opauNmPLdkxI/Vd+TEPrE4qYv449
         BA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794278861; x=1794883661;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGI87JTmKxRRfHEIswCBbT6wa5pP+uXrDb2vu3bdzdI=;
        b=jW4FLwgmHt3Da51ptujTCeCwSpbQCdZPZG8byTs7eQVpCPchTkCpFFmKaRYTNupzOY
         PZovGM1r+IihOoQa6b/Lg/930Hg8JT1F60Rqq/D/xJcjBm7IOgzR4Rm1hc6TDRxUspgd
         +DRG1q16C0OZu6qiyr26fLI60OOzeWVMDSWRJJtaewjoxdN3N/yArsEJI5Mjr056CeIq
         tWPhAa/A19ARhvtV8CacPTR2zp2NG3NpP7QDv6qRdAjVMlFY6Z2VLASfHa8tkN0Az0sx
         YiNnKrztg7ahNCQtR+QOcb+kdq8S89DFmThBswLwWj4GpLy9eOu9NKamavOSe8QGypZN
         I/4g==
X-Forwarded-Encrypted: i=1; AL+hErHTiOdNH1+9IvWQAg7J0L6ySGOh30iLeWUlyvfNLIbV2BCMEVn9HmcdMbPysjmgo6j73AXxkbALNPxk6dBl41k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RUq13slHNoxPx6Xt1o+4s4tFVPi/K0R5LzI0mulIPQB6Htk3Y
	3n3Yp9ZbvM4NC5RrSkAN+PLbhbJuXkrIq9OOrm7JxwHMZ8HqD2II5XbJZP6Yfw==
X-Gm-Gg: AYBFou2LKVdG6P0FmFrGlO2Smj+lY/BeTJPZ+47NbpSAzIDLB9qMPzJgt3nyfWfSxvx
	cnNvu0FzEDAW8ytwe6dIPDkKvN0Ian7WT6JKVbK59QAhb0ezS28r/CWz/d7ECzA/bFBrSb9s6Rj
	bYEWAYqTnT3jWOinLsOOeBxsDwJCbrFfVV4Yd9cXUEZwsTEU1c8dFQ0H2UJqVW6RGBc+6F9cT2f
	v33kg8wY6C5F0NjpOFCx6ldsNAAs5nenmzjpGc/0fxl4PyEq+dQ7GhD0vG8KJRF03UqkZuhc8Xf
	ylJ0W2OaNFjj0rKTtl1jo/96XMKHFvDjF6PQK2AcpSC7hQ3N7G2Rh6uo8VbIjg8ocs2HOm5A0pX
	45gBhTsxNKVH5mR+xYeiPx/WPhtLfp/nB1/lRHuv+MzkXgRPBpYXQ/wAAdC1TO/eM7Q1IKO9Z+U
	C8aTj68QGPGGf1LQwOI0jW6g+HdAomytEBkwywfmxWoPEmkBydoHf+A8JmzH6zxdS3S/7fr16b+
	/ZoXfeRl2KQvwOZuAPIWdM1+GWHH+dqIyGkDnw69h/zMi0zlb6m+6Z1mHZzrnf9uxvH/eYqYQjV
	/HnFTLhzQ2CQz3xxlSBPaFgPhEAs72BwP4BrdFP6r3S7OeTPs89hkhgDqOwUkIKxbpNERob/Vqd
	SnaXzPw+jO5s4EEpnak3dqqTX9Mv6ien2ge2cOZZXjwkScwlkQanOlmUYUhBOTbxovFcN4xU=
X-Received: by 2002:a67:e116:0:b0:7d2:d876:fb3c with SMTP id ada2fe7eead31-7d3011e2755mr389213137.35.1794278860666;
        Mon, 09 Nov 2026 18:47:40 -0800 (PST)
Received: from gmail.com (223.230.150.34.bc.googleusercontent.com. [34.150.230.223])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c2019bf87sm1116873241.11.2026.11.09.18.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 18:47:40 -0800 (PST)
Date: Mon, 09 Nov 2026 21:47:39 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Xia Yan <yanxia@cmss.chinamobile.com>, 
 netdev@vger.kernel.org
Cc: dsahern@kernel.org, 
 idosch@nvidia.com, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 yana06070@163.com, 
 shuah@kernel.org, 
 linux-kselftest@vger.kernel.org, 
 willemb@google.com, 
 tpluszz77@gmail.com
Message-ID: <willemdebruijn.kernel.2c8d7027641a5@gmail.com>
In-Reply-To: <20261109014400.9025-2-yanxia@cmss.chinamobile.com>
References: <20261109014400.9025-1-yanxia@cmss.chinamobile.com>
 <20261109014400.9025-2-yanxia@cmss.chinamobile.com>
Subject: Re: [PATCH net v3 2/2] selftests: net: exercise SO_MARK on connected
 sockets
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Xia Yan wrote:
> cmsg_so_mark.sh sends to explicit destinations, so it does not test the
> route cached by connect().
> 
> Add -k to cmsg_sender to connect first and send without msg_name.
> Check connected IPv4 and IPv6 UDP, ping and raw sockets with equal,
> prohibited and zero per-message marks.
> 
> Add an exact mark 0 prohibit rule before the connected cases. Connect
> with an allowed socket mark, then require rejection of a mark 0 cmsg.
> 
> The same test fails four IPv6 cases before the kernel fix and passes
> all 54 with it.

nit: empty line before Signed-off-by block

> Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>

Reviewed-by: Willem de Bruijn <willemb@google.com>
