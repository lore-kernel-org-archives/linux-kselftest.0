Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777268;
	b=0dUMHmj6fvPmiBypE0pdz7ZxEVkwBaIwg8pXtNho5xpmGOn1bRLmrz21Mky/IxaI4UAV
	 uxjOUZu35df8hWLcxHCR4ezeClSXWi7q912tqRaiS19OCrYMemAQb16ubNF2Owsy9CxUK
	 sVK6Xjs3Z3BmI+QkjNuIQtN6YoZvqWwQn53tM/dLQWxGKzNwM2p4qI+9PRbv8neYIQFDB
	 qRAg2wjJf02VF8GzediIa1yKHN7DmJpat/mjZ6UwnWVy25JVG/qId6zAj8BKPbnmCo221
	 Zd6mHbx9XrHYdnPIaca6ZckidevIavt9Nq5kOUpuGAvqH8uKM4oZK5ZLTlhwa4+l5eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777268;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bP9xDmNL6n8HSW3FN+T6xQwv9mEs6FoPklQ0Shvye/4=;
	b=3YjRtwjRuDZOfRFocC6CFqpLvB6Mh44puXBp8It+1gPB39ZMII3fZksredPqfnu2LTxT
	 aovoukypTC7zSr9koGl3/xq6/ix7QjRxCRaS4JIimZnBUFEVy5gVWdnWFPpcv1xtojdaB
	 5vqiV84PK1IAYRgcaxgyDDK4Sz/CdjW3H0jXsJ775Rd/dEPSkJTSDHw70vmTFQqaYKWng
	 c2Jg/RnTCPa4o1bX2qGQtNrZZcE8tnh32ZP9P3+M8t7FHlJRloPk1U2+1mkJDSBRqFrXc
	 pfJSf3y5Pj6HtaM0PeyDC0t5HPR8fJhy7aqF9et4XnbkB6xWxHlmbX+/lXGV6BWhKDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=MK979sBD;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D795D606A323;
	Sun, 15 Nov 2026 21:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D795D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=MK979sBD
Received: by mail.grapheneos.org (Postfix) id 6E4593C08EF33;
	Sun, 15 Nov 2026 21:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794777260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bP9xDmNL6n8HSW3FN+T6xQwv9mEs6FoPklQ0Shvye/4=;
	b=MK979sBDgKdDWaUiBPvuEAPD7ba04SVeD2IV0eQ+RSMR0CYOXdFCqFT/0udd2jbYZzpdlC
	RLlMzqMmYYs968zK7AXcJqpFu8QPw3LHdeQL0mhpPrfI+hhIbfXRMpsxPuW5Jk6/LUHOfD
	ZncMgQX3eQc8L5BzbPkR7vP30woUf3Rl/cph308O06nh6ZXtDvF3yqykzyieyRb1AW/fQK
	XhNEx7s4COT6j3SNHOhYzwg/8qyJYZTfVPv20IWB7dea65YDdCLerHuSvCXAAA5xacJkX0
	rQ15ZxpRnsWXBhAxcp6VsHROJUhMxpSw2OjgK4a86FnRnRUXLyIZKuuRWsuAQw==
Message-ID: <e5a3b758-a145-4823-b1bc-4c7c4d3c9808@grapheneos.org>
Date: Sun, 15 Nov 2026 21:14:11 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 0/4] ipv4: restrict on-link fallback to lookup
 misses
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Smith <liamsmith827@proton.me>
References: <20261112235932.23836-1-liamsmith827@grapheneos.org>
 <20261115083007.GA3764829@shredder>
Content-Language: en-US
From: liamsmith827 <liamsmith827@grapheneos.org>
In-Reply-To: <20261115083007.GA3764829@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 08:30, Ido Schimmel wrote:
> Please also mention that omitting the fallback for multicast packets
> will break multicast traffic in a VRF, which hits the default
> unreachable route by design.

I don't understand the purpose of highlighting this one case. As I 
explained in my reply to the v1 feedback, omitting the fallback for 
multicast will break non-VRF too. There's also no requirement that a VRF 
routing table must have an unreachable default, that's just one specific 
VRF configuration. I have chosen not to document this specific case 
because I believe doing so creates confusion.
