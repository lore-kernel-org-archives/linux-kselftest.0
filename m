Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=206.220.120.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860843;
	b=CksXDoULgVw8S4JjqTAjjF0qg6ODVzW8RGEZpU+l3WE0W1BTQ8W0yAL92asQLfEhnvmO
	 b/yWwtr0haxAg/N9EYgrc8hToyilI8IFtCsDFQHdmFGJvGk3lRX/mT3TgscE+IWSmVD29
	 ta/S4MLvvlLJVR3R+k+S1tEKM/RIcmzJzbjQ/q7dUgrDeSZm81FwGtllHpZx5aAnhEzuc
	 WJnwRmiNG3a9hmi05lXWueQ1CwuZ9XjUnSUlQqhNmsj4Y267JzOhVQfTdtX+D3pm99TKQ
	 Abqwe901ho9JfHERVBpyQ4qYV6hNbl9Vl+4otJsSamAwH8bmM7cuRzODpgMGEI01gIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860843;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0WMQcIQU3ZkRLrBvKaKSISN5Vyl+xSvzx5nVPCr95XY=;
	b=cgevjuyPlJ990iWzGHCbQ0RSKwlsUqV+uKgJPEVU6emz5uMQRFGPiYCRThaDuFlPyI8X
	 EAjBdvqed+kIb9jHEvphGo3sShHVqaogXkXhHtvx/8nN+k/5OXRLqT9z0Hq/1fvAKxHcv
	 p7Gnjm59Nj9bHQ5eutTLLqN+kwKzeZIfYL0svzb30CrDQasRULSRV2J7oUOIz4s0Axk84
	 PqbkrfelOvNscH4QUnJ60ITSCoxrqw+OKOuWvcdq789vSRll7aCCCRTZIcNFNdS0Vt+8g
	 lNpqMmKt8k4l7+dYG4sjnAa6zdnYUDvusB8dyvTeaVN/rtNh1fnMdWmWy9pA60FEYdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=grapheneos.org;
	spf=pass smtp.mailfrom=grapheneos.org;
	dkim=pass header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cR4mHlRA;
	arc=none smtp.remote-ip=206.220.120.4
Received: from mail.grapheneos.org (mail.grapheneos.org [206.220.120.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64025606A322;
	Mon, 16 Nov 2026 20:27:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64025606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grapheneos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=grapheneos.org header.i=@grapheneos.org header.a=rsa-sha256 header.s=default header.b=cR4mHlRA
Received: by mail.grapheneos.org (Postfix) id 300523C08B8CF;
	Mon, 16 Nov 2026 20:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grapheneos.org;
	s=default; t=1794860842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0WMQcIQU3ZkRLrBvKaKSISN5Vyl+xSvzx5nVPCr95XY=;
	b=cR4mHlRAQWtsoSAWUgYahOitbYAPslLUxXKv4xkwt6QQcJtBwohzg0YHfPMT2rdPZH6UPy
	XSaxSPrCcPxScFqC4tPvOvHosyQ7qwKATtWsQCA2DHdWfaJfrykouJeMOVid3heEKUPCbu
	9l68lXPfOBbzFqXgAvJxtqkC6iRTI2epu68CjK8H3A041huLmIRTdN6S4dLG1h2kXEYHJn
	N1wVNqGTICbr8B2KXcySIGTDZfoEt6nWxPEum/BkBP4uTXqLiP2N+a03ZG6GnnYgkAjXlm
	oRDXKxtpgy0lhIopNSt1AtJ+OFG9kk+JTGkUz2u4mgWzGmc7sAjQG5q1HjBMWA==
Message-ID: <e45013e2-b854-45c6-ad15-3d60a1cadb83@grapheneos.org>
Date: Mon, 16 Nov 2026 20:27:13 +0000
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 3/4] selftests: net: test restricted on-link
 fallback
To: Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Liam Smith <liamsmith827@proton.me>
References: <20261115215640.18728-1-liamsmith827@grapheneos.org>
 <20261115215640.18728-4-liamsmith827@grapheneos.org>
 <20261116085945.GA105971@shredder>
Content-Language: en-US
From: liamsmith827 <liamsmith827@grapheneos.org>
In-Reply-To: <20261116085945.GA105971@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/26 08:59, Ido Schimmel wrote:
> Don't submit tests without running them.

My branch versioning is out of sync with my submission versioning and it 
looks like I ran the tests on the wrong branch, sorry about that.

I've made a new submission, v5. This will be my final submission for 
this issue unless we encounter any bugs as we begin shipping this 
ourselves downstream.
