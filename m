Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711016;
	b=OQArUklV9X3CEls1pCRi6Pof/9kmPvzMydtkj+XU4Rf4eDc/4OMfzs7RLkk/WtEcceji
	 LgXCM/qPr5EZIckZlhTAq5DqjcGYQOoW70b2/8Qn8ejIHxY4A9JR6dfpJg7OwHV8Mkneb
	 bdbuuEoUNldClIObKZTm+JfKJSz3kwlhdK4iw5b8DZlDQEof67fLZOvR4L0BkOGXwInnE
	 uNW/0doQwwhnkBoqqdUeb1Vwqdvhff76Mw01DIBS42myFi6hvfam0xURaCuJjw3Xc7EO1
	 lSQe4xTv05vrsFTlCReoaE2y9T16int67T44xe5F1zmksF4QDG3g/f978WaFhC6yegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711016;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=0P+ytSK0bOW8b158bPuMgr0LCfs97gULxxvFrsgq9Wc=;
	b=wf6LyI4S1yvCTu8RHQoBjtC+14l4K3I3Jir10y6krr8bLgCrul0rsXgI121NX+p3CWnc
	 typLoiqY+vxdK/FgVrfywcHvCMF4mh+B07xg/YhmD+2EjEi1iWmHOo0v9gD3kbb4NKuW8
	 5Bc8J69goJ/XrvNhw2WfVHaSAeJZuJ4iXA4CJsTvAwlHVsVFl9CHoL/CCtz7TicL5RqBc
	 DangsWa2cdGGglG+H/LV+hTwiKM4wrvqTrbkOjZXEbh/1ETpOKtdJyKMTOpwHSFRJSw1c
	 MDJBnHrQ7dUqQTpLvQIoIXcPGGNfXaDGGpebcAlsiBKS5rCI0YMMXepQLYM9PU5oCJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=dmcrOp8T;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3250606A324;
	Tue,  3 Nov 2026 13:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3250606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=dmcrOp8T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=0P+ytSK0bOW8b158bPuMgr0LCfs97gULxxvFrsgq9Wc=; t=1793711013; x=2109071013; 
	b=dmcrOp8TA3J/XsF6LBhqxZp6Zmp5phaf5KUuNbbbCTnHWSejPqerAhUSqmhehK8r5bJUFqEfC1T
	Z+FllVAwBABaZw/5YS073xy4ga2l07uRGA48eZP8HMhfPDdA3zQxDEbhrScJ1IR9S2dT+LY/s/78p
	xunRy03tI0JpxjxQWGK/FJTQmvjx7omUvjGRYVkwhlQgi/ClYUVAOe3nayVcKrceCUST7XUpxdqxz
	066ySTHV5E530equUjV+4pPeW7BaSaAZHyxwARbGFt8rvZH5NQQyuXzZepKKAfumnSN+DlMiP8GVL
	OQ9WKjOoddQIO8lolju4xVyhdN1b0tMXy1SA==;
Received: from [177.172.122.137] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xOEAb-001Ea8-LM; Tue, 03 Nov 2026 14:03:21 +0100
Message-ID: <8b8f7eee-96bb-432e-aab0-a76ec727a60f@igalia.com>
Date: Tue, 3 Nov 2026 10:03:27 -0300
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/futex: load atomic values before harness
 comparisons
To: Sasha Levin <sashal@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Darren Hart
 <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>, Shuah Khan <shuah@kernel.org>,
 llvm@lists.linux.dev, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261014200147.1364987-1-sashal@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20261014200147.1364987-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 14/10/2026 17:01, Sasha Levin escreveu:
> Clang 21 rejects the harness comparison because typeof(*futex) preserves
> the atomic qualification. Load the value explicitly in the three affected
> assertions so the harness compares unsigned integers. Atomic access and
> its existing sequentially consistent ordering are preserved.
> 
> The baseline produces three invalid-operands errors. The complete futex
> suite builds with Clang 21 and GCC 14 after the change.
> 
> Fixes: 608323bf7bb8 ("selftests: futex: Add tests for robust release operations")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Reviewed-by: André Almeida <andrealmeid@igalia.com>

