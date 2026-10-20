Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792523941;
	b=bdZsJipmn7HuuQaqPofFrpBeM4c9gYymmQ26TD+SpztUN63+gG0MVpWvA7qJPhZ4yiLr
	 udbL4A52G0aUPvY6g1gOfQvUyNq5IxtAl7XcSbCwIgWleKnolHIKRR+rJs+dwoRur8vik
	 LNA7jJUxxHjpAWf+88frlTOAN5hb1z2tIRGQT9s52sBXvgbMiVVYiKWKJZj8YtcYvyI07
	 SnMU/6NlQbfihuaROPSmORcl96EBbl9NjHP9JNRvgSlpkAunFAk/6H9VQtMoaEnplPNih
	 a1RMzq9j6KFK6aeQ01BvTz/Hq61Zs8R3tRGIigbTq++ded5KQyc2+0/b+Wf47BdWrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o+qYngWD3VtHRYJROR8r2QEagYzTVh9jUdoxhwafRww=;
	b=gdoHODeoncCBU+8sItiS/rXB3QTdA/8BwDlyLDXF1ZPBdhhS8CFsMBnOU+TPrr2FiidK
	 eCIK/rSyl/0jEjop2RsAIyX0tYFJ0D2nPsigSxWOO3U7dE/ZKveGR3BjNbKOA3UWJb74Q
	 vu/6iHnvzpJyUEKu7c5Zav/oeNQATS4Jz75W/fAL862XUanLRj3+PYI5dHtGsNX/IyLJY
	 C2MICUA03EnFVAN2Yq4kfGJAnLkcZMeHgZIGQNpqNvvBNXg8zT+B2S8RZiH4OurGz9oKp
	 /njZaLAtnbcN4QO4PeoMh5wxIbWg9AQrHjg9z+bXYDeEeJytPgxdORv9ooeSU07BPDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7w0gEdO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE96606A319;
	Tue, 20 Oct 2026 19:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A7w0gEdO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921281F000C9;
	Tue, 20 Oct 2026 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792523940;
	bh=o+qYngWD3VtHRYJROR8r2QEagYzTVh9jUdoxhwafRww=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=A7w0gEdOvYzmk0vkW1JwU8bkYmH1HgaxOPga0sFNm0yLcYM4qvuuthmiN2t9Vfdoz
	 Cvd4nrhYU5g2767tUif4Olx3uzuA/n46c9VtZTpU9WVxwL3YptLYYmWfvH3KroQ5Dv
	 lWcBo5Qsj0pQHd7fBmqd0z0hPK+h7fEvL4kUx4Cf4987ztpjXd5CyKl5iAy+0FURRY
	 9bvyzOZvLD2ZovXoR9m02gJzdFd6jpTAWE45BDZ1zpEeJsVqIGwY2blTooVEy7m6e5
	 MEg/4Um77dGmgbveH57cGzYzZiXaO9DwLdLyfo9Y4AkHpPdJWnWc5E/IUoMft3kNva
	 1dzazHcVxQ7kg==
Date: Tue, 20 Oct 2026 12:18:58 -0700
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
Subject: Re: [PATCH net v4 3/4] netdevsim: support devmem RX and TX bindings
Message-ID: <20261020121858.3b9107c5@kernel.org>
In-Reply-To: <20261015163915.1166043-4-almasrymina@google.com>
References: <20261015163915.1166043-1-almasrymina@google.com>
	<20261015163915.1166043-4-almasrymina@google.com>
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

On Thu, 15 Oct 2026 16:39:14 +0000 Mina Almasry wrote:
> Set a 64-bit DMA mask on nsim_bus_dev, enable NETMEM_TX_DMA on the
> netdevsim net_device, and configure page_pool instances with
> PP_FLAG_ALLOW_UNREADABLE_NETMEM and queue_idx, plus PP_FLAG_DMA_MAP |
> PP_FLAG_DMA_SYNC_DEV when CONFIG_HAS_DMA is set, so devmem bind-rx and
> bind-tx netlink operations can be tested against netdevsim in software
> selftests.

Slightly worried this will bring a bunch of maintenance burden and
"bugs" in netdevsim. IOW that this will be more pain than gain.
