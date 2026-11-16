Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866917;
	b=vFHQetlsTj2LoakMtXkUxdpL3LCVng1VVkFxuflOEFAUVbE+gVuXdBvXquLns3pCTWfW
	 i59C0H0QkZfLbGe/DM4Dp7doxIt1mje/1cH3QbltNL6PlsZRwe3t9Myio6htk5ejf7L9T
	 1xHPv8dddwRhgQFCB/tcqwSdhjVqbgZZim5qYbvgZWLRefeLo4q4nm0Z7RmL9Z68qFiE+
	 7latczx2g+417Y9GwclsCJOEjY9W0QtT6rPsEHUNZVV0BDhyiES/cQiYbfeFspFG7wPhY
	 SJvghF9hdnf5TU2nI4OzNmFUTdJteAeCtdZqX+IU961gMNpMW0cjyyZRhwyTfD2pnmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866917;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=8O0t5d9d7FzzruzbNmZIybbrVFyyYL7UO/lvMO3VYcU=;
	b=yjD6fyZw47DpiwPygFVx1qcMcYa3LBr9t8CKBzObuNo2FkSjh2OX7xEON9LFQlGt4KWv
	 xhykUytXCaYVZScu6NMh1FIS1q9qLUwoWL2MWNkubP+fh/oXQlarNNnszkpgGMjmJ+/0o
	 63Xo6cj8ZS2mcXB69emgrpVNpL6Wo1dl4MwOXfHnY1MhSc2JFC9siajeCDoishYqd+9f+
	 pjrOs4jrrZQYyEFTha15tbEPubpuAjq4UkaiVtl7zMVNx2ZvKydeeBhnFdmTgc2f9mitk
	 Eigb9wmXmMy3C4sS7A+euPN2Haososv159mCjmzG4VP0QDkmrhOHkJxlIP4OLl+kydQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ6aacQJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168BD606A8B8;
	Mon, 16 Nov 2026 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJ6aacQJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1102F1F000C6;
	Mon, 16 Nov 2026 22:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794866916;
	bh=8O0t5d9d7FzzruzbNmZIybbrVFyyYL7UO/lvMO3VYcU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bJ6aacQJbvpieRaPhv9xZNyX0HgnmnGI0673tg/K6tHVz5Pgfcxc8keJOAZgGsiQS
	 mLpUbZIP+xS6a+XgXudAuPg2h+ocFyX6S+dEjpO6+6Lp/hl2gzp9r2QIkFKPyDTL+v
	 67Rw82ZPseEwiTLAqe93yNOekpfdpFZuGDrgSFVSGWfFjQR0vfd7FgIQNx307yE/IH
	 /fcJZiJw0RjpJ/AztuJEonpw1JdMTFwi6Owl9jFdpRlPDW0PePXbBanwVatwvUfQ58
	 kthCz9mxOYNCf/wPBmdsWRbH7h8UoH6w9ytAnbCCAgfda71BVGXuOofTtDeVfP3frT
	 XazXueksQb3bQ==
Subject:
 Re: [PATCH net-next v4 2/4] ipv4: restrict on-link fallback to lookup misses
From: netdev-bot+sashiko@kernel.org
To: liamsmith827@grapheneos.org
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 horms@kernel.org, shuah@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, liamsmith827@proton.me
Date: Mon, 16 Nov 2026 22:08:35 +0000
Message-ID: <179486691560.3136.15548474074992828914@kernel.org>
In-Reply-To: <20261115215640.18728-3-liamsmith827@grapheneos.org>
References: <20261115215640.18728-3-liamsmith827@grapheneos.org>
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

- [Low] The commit "ipv4: restrict on-link fallback to lookup misses" is
  written up as a bug fix with security impact: "unprivileged Android…

--

ipv4: restrict on-link fallback to lookup misses

This patch changes ip_route_output_key_hash_rcu() so that, for non-vrf
unicast with an oif set, the on-link fallback happens only when
fib_lookup() reports a lookup miss (-ESRCH via FIB_LOOKUP_REPORT_MISS).
Before, it happened for any lookup error. Blackhole, prohibit and
unreachable routes and rules are now honored for oif-bound sends, and
-ESRCH is mapped back to -ENETUNREACH on the error path.

> A specific example of this being a problem is within Android, where the
> VPN "kill switch" is implemented with prohibit rules. Any process that
> can set flowi4_oif (SO_BINDTODEVICE, IP_UNICAST_IF, IP_PKTINFO, etc.) is
> able to utilize this fallback, meaning unprivileged Android apps can
> trivially bypass the VPN. This is particularly bad on cellular networks,
> where ARP is often not needed.

[ ... ]

> Signed-off-by: Liam Smith <liamsmith827@proton.me>

[Severity: Low]
This isn't a code bug, but should the commit carry a Fixes: tag?

The message describes this as a fix for a VPN bypass. The trailer block
only has Signed-off-by. Documentation/process/maintainer-netdev.rst says:

  "for fixes the Fixes: tag is required, regardless of the tree"

In ip_route_output_key_hash_rcu(), falling back to on-link for any
fib_lookup() error goes back to:

  1da177e4c3f4 ("Linux-2.6.12-rc2")

The baseline form of the condition this patch changes:

  (ipv4_is_multicast(fl4->daddr) || !fl4->flowi4_l3mdev)

comes from:

  40867d74c374 ("net: Add l3mdev index to flow struct and avoid oif reset for port devices")

Could one of these be named in a Fixes: tag? That would make it clear
whether this change is meant for stable. It also changes what oif-bound
sockets see when they hit reject routes or rules: those sends now return
an error instead of going out on-link.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115215640.18728-1-liamsmith827%40grapheneos.org
