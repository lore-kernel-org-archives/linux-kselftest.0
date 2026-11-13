Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572502;
	b=3mKLeqU+rbUn2Hgs5/nddlyO7MpYKGj0PSmPiCBLX8f8e3wF5R0jI6wjy31DKBcUhv/l
	 NycF8uztCm5oYQA/ka7S48DZU0TE3S9TYhTTP5ePQja4idPH1qz4UykUlpc5ISTbTDwbQ
	 YnSgXRUcE0nhprcdPlebxm63W1lG4sLtPl3mBSmgzLMAbhYw6Tda1bzaS7GZznpu6WpVe
	 iTzf65k9yCvMRAbQU9qvuh2k09GdgikORgbdH9rp793/5KSrDvkv55DZW4LMysBiY3wQU
	 gpVEJm4FSQk1UTTMASQtPgcH5uUreARW73p338kedFdahemzBr0SzyywfHHwQ6criIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572502;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=sIrF5qN/w2GsqpKDUFenvPv4QmhVj8/qRHXjXTYxo2Y=;
	b=yB146k3WW1LzGP9HyC41/+uulosNEutbApLTtF7nN6+iC1a6DM2KD+iDbMsctTRXYhcW
	 a5xUDr7Gkw3ddPHsTc3pKPGEU46U1lfUUH5iubWPjda2F6eWW44PjxAGb3G3Qly8t248V
	 8nF5zI1o5WeNJLCgw49Kmx4BiCdd5+8WZCdlEq65ojZgaNmf1bwsAgm+997cN+rv22wZJ
	 7tFXtSH6pWWC4eD2YoGqRcWuEwrE8Qc8aodmU8oxZa6YBmwlfPfVNQWc4lgLhrf3ZKtqv
	 sYS2/wbbtFt8LfL/34B+YwOji7QgG4Ot6hV/POLTWsiI4qvXeah02wqEDdQSZTvLldA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=gmnMKrmE;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F475606A8A3;
	Fri, 13 Nov 2026 12:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F475606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=gmnMKrmE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sIrF5qN/w2GsqpKDUFenvPv4QmhVj8/qRHXjXTYxo2Y=; b=gmnMKrmE6E+vUJmcq5WF83hoIT
	u6kr4TN9jUr/fVVpkG3Vvhwg+BG1cOPlvrZ3iFrI6qTPlyPoziQ7lOiwuEI7xr4gwHbtKpeegFEUO
	v1tn+qv1ffh+lDIgRwqA74cmWcYWzZOYcTV+38W02VZa8dBb4ikYkp40pKZQv6+4Ua2Nm91LXWQ6j
	+Zl6lBpqjBcdnXg0yIgalAzfGFaBkflwLlffGBrSOhLADxhvcGPlVawCXQAwCpQFDMTUYmlv0SmOY
	woqOb6Sx7HSaFu/7PN+Dgt25zdFz0/NHgVtig1oDbNMbNelgRfV79/8/KhoWAJ4pnLkVbgfhRyBDL
	Q6zSDyYA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRqHj-00EkKb-0m;
	Fri, 13 Nov 2026 12:21:39 +0000
Date: Fri, 13 Nov 2026 04:21:33 -0800
From: Breno Leitao <leitao@debian.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 5/5] selftests: drv-net: devmem: TX from a
 hugepage-backed dmabuf
Message-ID: <avcAw_0ElvSFuRqp@gmail.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <20261111224740.2744522-6-sdf@fomichev.me>
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
In-Reply-To: <20261111224740.2744522-6-sdf@fomichev.me>
X-Debian-User: leitao

On Wed, Nov 11, 2026 at 02:47:40PM -0800, Stanislav Fomichev wrote:
> TX net_iovs are now sized from the dmabuf layout, but the TX tests
> use a regular memfd, which usually keeps them small. Add -H to ncdevmem
> to back the udmabuf with 2MB hugepages and a TX test which sends a 3MB
> buffer from it, so that frags end at and continue past the 2MB net_iov
> boundary. The payload has a 7 byte period to catch offset errors.
> 
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
