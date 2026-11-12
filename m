Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524925;
	b=h/Kd/QvDjVTdXywr+UjiiP6tA+RY2UzxRuMWpnPFMhjyfHZHOLwVo9vzIvsYoq9dv3hG
	 sVv1xdB1YBnfryGBIeiCUiUX7LV018zi0H/ZUrvp07LSqCh5ts1T9g6l5x/SbHC4dbA6u
	 DQYH6jiZjJTskSGtWPqdq63Zla1108Ol4jVIxekBNoqoyxOGEVJEOEXpAnvjuW5Y1pU+d
	 grNRBmKCZ/OBfeipdEOkD2AJZq1aR2C88u5w9/WHOLW9jXpFgebdsJmkaPi4fAapzKxCY
	 GWzqUyl2ipejzs+QLYm28nSn4aHXFaMv0WsqlTjvASAi27vondm0mPS27IyGqkXuv2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524925;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Y+P7XadM8mg2ZusdvDmS9q16oQmmftq9v/082mmiWRs=;
	b=Eo0ZVMKanrdXoeYq3l+SX/fqdUR35Eqbx6i18j+sgCPdFtT9Jhpzvranor0aHxB8zdYT
	 h6zblU+6rbbeZCHu58v4S7aQbUhEnx6G4xdN8Y4OlasiLkLxPKRIiPAJ8oFXirnuaCrTJ
	 jedSd03F4pg2diGobcFRtbIK2OXmm8WnhwVcB01E5ClLB1186wlmMjj0X9VJcCKfERATF
	 R63q9vU84Hy0102hn/okuqRmClE3CM3qgak0mi/8fVxAkwIGlqPsEgmIrclQpqqFrAg36
	 iLrYOkC4bPykYpcpFm/40dddD+Oc4geFAwVxUopXDaE7bAIiOUVVNUmPFB1nWdZhGvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b="HIvcmT2/";
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B5B606A323;
	Thu, 12 Nov 2026 23:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1B5B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=HIvcmT2/
Received: by mail.grapheneos.org (Postfix) id 7EAA93C08EF81;
	Thu, 12 Nov 2026 23:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794524918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+P7XadM8mg2ZusdvDmS9q16oQmmftq9v/082mmiWRs=;
	b=HIvcmT2/ut5/iOXALOpYFMWoKzu+HnRR1rBUEG6T4m6sycjeu65DG7Il8689yADCeBuFZj
	v0gx9mPQO1yhL3u22W6RXpJbSbtaEFO3eR7hB6x8EX0WY9A1Oz1FvUAZifDEI3lngN1J+w
	sQAaQfLGKrZERpLcNMwBCi0MLMWVecfvZKv/3CSikU+/M3QEhtUkaAvqMhgB4YGWmrmL5x
	sAD1ufyZkVE2q90rdXC2QFIy1WqXix8QaJ5DzUDZ6SAJLUmmMQ3xHv27MAVOmKfP1zkaPn
	+xOSn/NTAS+sbAF9ETH8jT+83BbFp23QtpRrKzouv0w8tbWOjRRH+8dcF81Cjg==
Message-ID: <2503cfd2-5629-448f-bb9b-111ea239efb6@grapheneos.org>
Date: Thu, 12 Nov 2026 23:08:28 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH net v2 2/4] ipv4: restrict on-link fallback to lookup
 misses
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, horms@kernel.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 liamsmith827@proton.me
References: <20261110061536.10811-3-liamsmith827@grapheneos.org>
 <179451823511.2199510.15480690224597348773@kernel.org>
Content-Language: en-US
From: liamsmith827 <liamsmith827@grapheneos.org>
In-Reply-To: <179451823511.2199510.15480690224597348773@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 21:17, netdev-bot+sashiko@kernel.org wrote:
> - [High] The fix is incomplete for route-based restrictions.

This is not a legitimate issue. A RT_SCOPE_UNIVERSE route not matching a 
RT_SCOPE_LINK lookup is expected. Route maintainers should install the 
correct routes. An unprivileged process can influence which rules/routes 
are matched in many ways other than MSG_DONTROUTE.
