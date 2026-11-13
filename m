Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571561;
	b=utLn4hWRf5ZuN56iPpguWmsaODHDso3XnxFz5i8UbC1kiNCkle1uVDNqQ4d+fCDAjZOZ
	 fT0satzN9c9cc8YQXucOC2LUEO7TtzLdEqhjipcEWGnIk4T2MBWBXEPaGS3xk4ozq6zmJ
	 aEg1sHqRmrLx1c22/BNugmmRdKL/ShDT4uWjJtwQ+te1rHUKGC+bMEc1YJasjMs/iyU0Q
	 WIf/Ol/DI9PZnILdnE0gKzQ4GJEuD1iSY5d71aleKRzT9/ou5efKI/YhdU8pzudyUt7e5
	 HqDBUB4q/62mV8NwuCMmZXw9FyA9p9qNBMjo5Dtv5lgIGmbUg7pfaLaa211TsNt0kfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571561;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=EfXphdCKIXv9Uwxy9CfujdrOz6OEGjuhAJtXv6fdipE=;
	b=UmOj2r8nKPAoJ8X1AxThwTdB9/1DCcpopXpLEoV6FLXIiD2P659adyy+x4K34Ybg38ZK
	 rqJ4Zc5FfNG/mEnKcqOjRjwjHqdhpWAVxTwBz5PcUE2srlRs7z3gdzEYctNClHEzUJUPM
	 KbpTPfpg97ODY5YMAtayHV4VnxZpa3ssWSXN3+VaQv7j1ZYuXFXFcLZ60ivCtpZ22GqUh
	 EiJ7qNZoAizpWf80ul+wEpxLQHmbLkAf2f0hWeuln/NXd3hVIg2EPsBhg08asLgFJzTP0
	 yU+YAvwbz/8rJuNfZVuDqcfh0IlvYsOHjpIG5tR9E9Y01VidaWYhvOT1zoK++y93+hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eC89Kk81;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410B8606AEB2;
	Fri, 13 Nov 2026 12:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 410B8606AEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=eC89Kk81
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EfXphdCKIXv9Uwxy9CfujdrOz6OEGjuhAJtXv6fdipE=; b=eC89Kk81kDpWNqbfCrZjZHvmhG
	l5h5zFhDa9igeCZM89483crp2z2ytus1UmspG1vq9dQw7kc5ZwOHaah01eKtQm38B+BQTmxhHI7pq
	2HF9gAy9JhLz42JZVZ4TS0ttcys/UYYH2umbCKMiUXhB2POzjdQh8/mF2/zMJUQWnq01LpERv4hUc
	9rJ72h5wGGi2GdCDGq3wFaesLLBSRkcR+00GQMgVbA/hDr5HFw3iGvuNGKhoH+ekWe4TDp4lxveaX
	qR3FUzmWP3Twg86qBFOGLLYUQZ6BglZleurVWysKezKzyUAejnm4MzVrEms3Sei5JtmAm+kw9TyP6
	tnWPjzGQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRq2Q-00EjoI-2X;
	Fri, 13 Nov 2026 12:05:51 +0000
Date: Fri, 13 Nov 2026 04:05:44 -0800
From: Breno Leitao <leitao@debian.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 3/5] net: devmem: use niov_shift in
 net_devmem_get_niov_at()
Message-ID: <avb9CdqQ00h-Dwrr@gmail.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <20261111224740.2744522-4-sdf@fomichev.me>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111224740.2744522-4-sdf@fomichev.me>
X-Debian-User: leitao

On Wed, Nov 11, 2026 at 02:47:38PM -0800, Stanislav Fomichev wrote:
> TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
> Derive the index and offset from binding->niov_shift instead, so TX
> bindings can use larger net_iovs. No functional change, TX bindings are
> still created with PAGE_SHIFT.
> 
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
