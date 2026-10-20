Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523767;
	b=chVTsK5iezZIHYrVHwSIJ8SnwN4f1ngTXzFQhxMb+WV5xogomwnUdCu6wJH+t2J+MkCs
	 Q8H6Dbm4WhfOqMymS+9px2uZLxylVkGVITlFpMrFLYwN7WHo/KPVaw/j2zBshASmMr6pY
	 O+PP+yA9PKcLJpzFaju9F2wIAK6GjXhsRb55wUq1PzozXSNJDE83IxemmVTRtsx7kqt9Q
	 86noWYKaMqk1EDIZkGgKxgmA23/v5drY8GtHVdSIC7/pk+xiSrvbVDq2NXnUHtOsYGDco
	 qJRWhxJWhQpw02WjZpl/4zUrrm+4Hg8mXuUMcZpr6XFnNLhp2BXfFaSlY1MYOS4kf0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523767;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UjcRWvdL2BC3TrFlxjVScdtXMjuSFx/nZAKVfJjRpTY=;
	b=DkBerqvaJue0aDl+hZs2SosHXX0xNOLbIG+pRClyt1Auwa1ko/qGIOfDJ/m4lDVsWstD
	 +QjzK6nThEiujJM1Tx93Cn13ODcjJmkUN9pAYr73/+3e2drzIJY+nHtr4pIYsA8H9IgPr
	 +nMfGpkq4msHXCZ6dnYQfhujEad+bTwJYP7qTaRNZ8I5LXl3uQ74Osi9EjYxFDWEn7sCh
	 MSnddmnqRYnQIXFPaY4V4fVRv6n4UtT8MtQQSACGKvLhlG9f5zyn3ZuTtx/LWnfETc7eu
	 P4H03iMUHBbl0EBNbw6xXaZWBF1j9pWlG9cZEaJGFV5zq5wGrJreZHtRkWlsgYML3ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gQa6/Cle";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3261606A320;
	Tue, 20 Oct 2026 19:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gQa6/Cle
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671BA1F000C9;
	Tue, 20 Oct 2026 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523767;
	bh=UjcRWvdL2BC3TrFlxjVScdtXMjuSFx/nZAKVfJjRpTY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=gQa6/CleNS3xUJ8mhSgRJbW9WzgAGva4e2f9agAcAvBfEFQE2JEz6PDfO89WvSqVh
	 fAAVaYQWrFHxzd1XRWwoZIGtusEmqs1DNrP3Npu8l3bL0vYrAzCNX7vUQkhC3xSTYd
	 GOFG50rIu7R+tAOdysAuiFYu5k7fPUNKF6QX8SdbLDoNRHa1p4xwSeQpJTqgiy5Qos
	 9TlOdWlF9sCuhLDcfbvlMhR8HAa23s8gZEGcbUFhqxP/QqESUeNUqlFkOnkOWCj2rT
	 B1rTqwHLpLgd2HhfBrOQA6oLAR14kzmq/hC8/91NDgd870bVzab5XrK4b3/PrXlwvI
	 LOgnGEnsnkZnA==
Date: Tue, 20 Oct 2026 12:16:05 -0700
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
 <sumit.semwal@linaro.org>, "Christian =?UTF-8?B?S8O2bmln?="
 <christian.koenig@amd.com>, Dragos Tatulea <dtatulea@nvidia.com>, Nikolay
 Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Subject: Re: [PATCH net v4 0/4] net: devmem: fix RX and TX binding teardown
 on device unregistration
Message-ID: <20261020121605.2e0004cd@kernel.org>
In-Reply-To: <20261015163915.1166043-1-almasrymina@google.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
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

On Thu, 15 Oct 2026 16:39:11 +0000 Mina Almasry wrote:
> Fix two device-unregistration lifecycle bugs in devmem TCP bindings and
> add netdevsim support plus selftests covering both RX and TX device
> unregistration:

This seems to conflict with something in net-next.
Please wait for net-next -> net merge during this merge window,
rebase and repost. I'm assuming this is based on an LLM report
and not something you're hitting in real life? (cover letter
should state how you discovered the issue)
-- 
pw-bot: cr
