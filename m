Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794523741;
	b=rvSXnfemKiuLBWvQjGJ0ubvDcJzpEMAriDQBc9WM2wZoBKx7ibC04DBMg/7pFpDLq4aF
	 lj5fg/f8d3phjOZ+z1+KGPsRyZHe6GLcwUc7y6L6tlpA1ORJBYkoP2k4sF9M+VG8uWKgb
	 60PxNqOOFexzpbQsc7iUUDYPxKw6x/fhGOQy2p8LCpn+zNoVQm88mEgYcxgz/gcWmsXRX
	 Xs8syYtO3cEsA1otljSKTl/HffPRIA443SwH7Qh/6mg4LqfpkgkMHN9r/V3p5jh0g1jCL
	 l4EwIGPg4ZtiaNPLJ54ScI8vKtuBnxeizL7sTdif2lbvorPGWSwAVfeoxd9qMqn32OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794523741;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ut1VFrY0YPVQTBxfOczSHMEdGd9VAyGuW8roa+/aAC8=;
	b=P2ywLaHJCbq4hRvCSDJWhUGfL9wyrlIocktxIu62BxQsRgmFqaWvf8JqNpsLGf31RYz6
	 TFnMr0noDyqjZMmr7qZm5OCbtAcfO/4gUrYWnqpXmapmNgLFb1T2n9ZZmzitqpw/+RpRs
	 rcNxdoN4PNFcyYQmJ18IR4DMoicC1cNoLVd6iDHuzdp91Ayog4w+aEdWu//8xk2bt8KdI
	 MXMa9z0V9WLEQAcyu+OaCUh7PaI0RVpSOG5Qio7EOiBvRYyaEAH6cK/ANa4zAjHvmL9Tg
	 uGhCJCmQwS0w8fzEUA4GVOo2i8AdyZKHqf42BmK4iM6ZxeqAhsGgdAmJbIvkS37yTtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwWRv+ij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5190606A337;
	Thu, 12 Nov 2026 22:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IwWRv+ij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53AA61F000C4;
	Thu, 12 Nov 2026 22:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794523741;
	bh=Ut1VFrY0YPVQTBxfOczSHMEdGd9VAyGuW8roa+/aAC8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=IwWRv+ijQ+t7Tdba5jT5qHnR6q+TPRzgi27s6dycs4VDchj/ZOEFMA2/aZymNL5ue
	 183Uh/Re9KecyGtor6mgpniRYj9KgQ+nGYs2kjI77Y5nixL1MqcanTas18IWSz+uAC
	 28V34rFvX1Jk44ur2KQ8KPRd0MAR32GqWJGT01akcfSC43nXqN7pF8t95Vv8ce+41A
	 i3O774S+Z9cuqek9Q/rLpbgoKItl+JuMvL1xY6jGbNvCciyUuTrzUJGscNO2doxiLp
	 qKsyHvcVdglnMUCGaxr9Kl3K7qsARVxOzyldCJuJoMD1XnxZa/0MLlaAxWLmtXnrJO
	 Wk9RkH8a9r3cQ==
Subject: Re: [PATCH net-next v4 2/5] net: devmem: charge the frag length to TX
 skb truesize
From: netdev-bot+sashiko@kernel.org
To: sdf.kernel@gmail.com
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, michael.chan@broadcom.com,
 pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@kernel.org,
 horms@kernel.org, shuah@kernel.org, almasrymina@google.com, sdf@fomichev.me,
 leitao@debian.org, dtatulea@nvidia.com, asml.silence@gmail.com,
 bobbyeshleman@meta.com, daniel@iogearbox.net, razor@blackwall.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Thu, 12 Nov 2026 22:48:59 +0000
Message-ID: <179452373981.2199510.14348859011242169844@kernel.org>
In-Reply-To: <20261111224740.2744522-3-sdf@fomichev.me>
References: <20261111224740.2744522-3-sdf@fomichev.me>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit's author identity doesn't match its Signed-off-by
  identity.

--

net: devmem: charge the frag length to TX skb truesize

The devmem TX path in zerocopy_fill_skb_from_devmem() used to charge
PAGE_SIZE (the net_iov size) to skb->truesize for each frag. This patch
charges the frag length instead. With TX net_iovs about to grow to 2MB,
charging the net_iov size would overcharge the send buffer, and the frag
length also matches what TCP uncharges.

> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> [ ... ]
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

[Severity: Low]
This isn't a bug, but the author address and the Signed-off-by address
are different. The author is sdf.kernel@gmail.com, and the only sign-off
from the author is sdf@fomichev.me.

checkpatch.pl reports this as FROM_SIGN_OFF_MISMATCH ("From:/Signed-off-by:
email address mismatch"). The other patches in the series have the same
mismatch, from "bnxt_en: let the stack segment GSO skbs with too many
frags" through "selftests: drv-net: devmem: TX from a hugepage-backed
dmabuf".

When resending, could you add an in-body "From: Stanislav Fomichev
<sdf@fomichev.me>" line, or a Signed-off-by for the gmail address?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111224740.2744522-1-sdf%40fomichev.me
