Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC75E2931D5;
	Thu, 17 Sep 2026 01:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789609671; cv=none; b=Np1SO3Dj3aIbVcvWzWB9kkggOFZxCJeUHdxVf/kNv0L3UhQrnElGdyovCmLAFKj9nX4MbDbq9OOwBLrCjLsU2a+EC3oaeXzrDbNIOF355h0JGJKAHqj2tWzKaJGaMqo9LzNVLSoT6HlrfKwowfTXuLqKx6toJeoGI3u8TxxRlGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789609671; c=relaxed/simple;
	bh=m6n84ufDW7Lq5V3cSO0Q2YS+GtLNfR3kF6Gyo3gSnCg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pCAks0aqcmV5CZnZ+S2xxmVAoflG4eF9HPqyLsFd/21GTCN2GCG9iOJ3M8bf+Pq7gQhporkpb1RgKXvHcjMuQgBQowXRt5TRzmmCYLlrQuwvn7rsyKNXY4BEIBPHTza6pXNkk9yUzd3L/EUe60D5qRY+MDHWlvEznKVhvTzzwb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E7FON8Ll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E7FON8Ll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93981F000FF;
	Thu, 17 Sep 2026 01:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789609670;
	bh=1c+IMTF/reQ7yiDPWmp5EDxLa+NRr4ovH5BnYP0NYx4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=E7FON8LlglE0stCv3RHx5Qc53cKYaY5AmMBZlpeuj4fNZouUmw5ABX7MubP1VgG7L
	 GGpn1Hj3+/Nvb2tUeJOZIq9aKFroDJL6/kC6ps45ZzPjppcKTjy0mbIrQaMJ4w9kYe
	 AgudHRBXT/rMFehm6n7QDHXg8g7ARjT3d6dBmDX4v2v4SSK1BI3Ry5+Pte3JTa12tZ
	 Yzl20N8Q5JE/5AAMo6gz34QIooZ5KM8PGUiCg1VFmqFh/mscNLTFrZLp3IEd/NOaXr
	 IOaW6CnBekgiGdV1YBFfypcBOgX9+lFiwjPT8N/OB1BqiwZk6/au+VbHNHW6SSiUiA
	 TZbhi4Sy2v24A==
Date: Wed, 16 Sep 2026 18:47:48 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, Donald Hunter
 <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, Ido Schimmel
 <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki
 Iwashima <kuniyu@google.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon
 Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v5 0/4] rtnetlink: dump link-layer multicast
 addresses
Message-ID: <20260916184748.52ae812d@kernel.org>
In-Reply-To: <20260914014539.5015-1-sigefriedhyy@gmail.com>
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Sep 2026 10:45:35 +0900 Yuyang Huang wrote:
> "ip maddr show" prints three kinds of entries: link-layer, IPv4 and
> IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
> had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
> ("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
> added later so the user count no longer has to come from procfs.

You compare the situation to IP but for L2 the UC addresses
are not exposed via RTM_GETADDR. Are you going to add it?

> The link-layer list is the missing piece. dev->mc, the addresses
> programmed into the device filter, is only exported via
> /proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
> that. This series closes the gap so that "ip maddr show" can be served
> from rtnetlink alone.

Is that the only justification? To avoid reading proc?
Are you planning to extend this interface with new features?

> Patch 1 fixes the type of target-netnsid in the rt-addr spec. Patch 2
> handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET and
> walks dev->mc under netif_addr_lock_bh(), no RTNL. The reply reuses
> the ifaddrmsg format of the IPv4 and IPv6 dumps: IFA_MULTICAST carries
> the raw link-layer address, IFA_MC_USERS the reference count, and a new
> IFA_F_GLOBAL flag in IFA_FLAGS marks entries added explicitly, which is
> the "static" column /proc/net/dev_mcast has and "ip maddr" prints. A
> non-zero ifa_index limits the dump to one device and IFA_TARGET_NETNSID
> selects another netns, like the IPv4 and IPv6 dumps.
> 
> Patch 3 updates the rt-addr spec and patch 4 adds a selftest that
> checks the filter, the user count, the global flag and target-netnsid.
> 
> Nothing changes for other families. AF_PACKET dumps returned
> -EOPNOTSUPP before, so iproute2 can keep the procfs fallback for older
> kernels. I have the iproute2 side ready and will post it once this is
> in; with it, "ip maddr show" does not open /proc/net at all.
