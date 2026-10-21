Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792614187;
	b=XTcSMrpMaa96WqBXlVx95x/+Qmvf6iMsEdIkClJTOFTIvV0JrG7RqS9X4j7QdOW0HaEm
	 fvO2kBVoGFyH3gHSfZ5dkyBjhSW5WMm+4ISpCzGBhxTlMHw1twddi2gJ02SWiVc8VrHgh
	 3qLQKOBcszjfmkAPCjfEVlnmTkbUj/zG6qjsU1M1MF1KXjyKGaxBff3vYGNnByLNMhHPF
	 GbHz1qfQCph495Im1mvITQQN/ZNlGIrhNK+yOrTmV01DxRF8FrK4f6Ot/gemkyeUYeFPj
	 Au9BCPw2iCGWw/P+D2C17RS7cwJYdwVJuUx5gc+8lCs8+sJzp8PP7Qb3WhVqHRQ47Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792614187;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=svbLHawCS4fbgc8FgUAE9dACgxqB99TX/pf/aIWHxmw=;
	b=PBJPg4b0JVgLwyKdh28vgga5MJOeA7Tc3tYumhhrH/iE+RFYyPnjn4vjdL1DnTX5JtKv
	 MfGu1o0TzgMYVVADOGijIcusH/nxgJF8WhKxCKyCzX51alqpJsTbeKanSMnaCIpFOrbY4
	 jPNk8DtA+xkuvrUZD2yjpzMmYVcGeMEUDtXCy8QwuOLoJ82Eczo+W8rFaZJZ383xWfbtI
	 Y+/jXYs6S8MuRo1qWBSjHP0Ux29xmrCAbv66IRWPu32Hl+7K7As3toIEBDnr0iO52W9wa
	 LwY82LqhIe6FNs40q3ruVp/qkPKquctBjVt2g9naj0LtyZesSXrAMHarL3j+WjoW4/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Xt6/atqy";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5BC606A31B;
	Wed, 21 Oct 2026 20:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xt6/atqy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7038B1F000C1;
	Wed, 21 Oct 2026 20:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792614186;
	bh=svbLHawCS4fbgc8FgUAE9dACgxqB99TX/pf/aIWHxmw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Xt6/atqypGAD9faryuoH3pgi4bQyVVE+O07lp7aASyyT+FjnI8XTnoivNgxAwDhec
	 Xfo3gi2XcyeLmjrLYvmosrThi+PoBZYzkwjHAo0eRu+Vlc9DI+00/VrcYgSCZrPdHb
	 JOGx4pQdXWFUq8yH3QQEzSRu6hrI+GjfUedgt53bUyqFAQV7XQZTF0LwdsCb1sHWuM
	 moz22KoG1vi7VY4g0aCEA7fdlfYla+rzgWwRFk5/9HUG5gPMTqGokYS6omzjbIT0O/
	 ZNvHAn9mKMOD9soFx/Go9d98JombmkpZrOCi4rh36dgn9CTej7Xb6ItJQmx50xcWcQ
	 suBfY00yvRSqA==
Date: Wed, 21 Oct 2026 13:23:04 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Mina Almasry <almasrymina@google.com>
Cc: Pavel Begunkov <asml.silence@gmail.com>, David Wei <dw@davidwei.uk>,
 Stanislav Fomichev <sdf@fomichev.me>, Taehee Yoo <ap420073@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Kaiyuan Zhang <kaiyuanz@google.com>, Bobby
 Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
Message-ID: <20261021132304.23e0a4e7@kernel.org>
In-Reply-To: <CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
	<20261015163915.1166043-4-almasrymina@google.com>
	<20261020121858.3b9107c5@kernel.org>
	<CAHS8izPwWT+vbgAe49m5vXsRxT3unbfjLTkVZBScgAPdQTo2dQ@mail.gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 23:17:34 -0700 Mina Almasry wrote:
> But on the other hand the test coverage is nice, and maybe one day if
> we add enough devmem support in netdevsim we'll be able to fuzz the
> data path or something. Is there a way to get the best of both worlds?
> Like put a comment on top of netdevsim that this is test simulator
> device and any missing functionality and/or bugs in it should be
> medium criticality max or something? Or is it too much trouble and I
> should drop the netdevsim support and tests?

I already strip Fixes tags and apply the patches to net-next.
But it's still a burden. If you're signing up to fix the issues /
review the slop we can try.
