Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82DE36A03F;
	Tue, 21 Jul 2026 00:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784595588; cv=none; b=e0Ii3KSEFcJ131Lw0UcffovgASE4po1BElJQqcTzjyVXOASRkpqc7F/PHneLVFMLmRkPbUB3J8DLiAz2kkPhoZLfkrgS0si4hLLJPyzG7JTCqEuFkzwqJytwQg66oWci4JhC0R+XeSKgFvpUVs4dByUfl8imxk/Ni75G9aAS4Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784595588; c=relaxed/simple;
	bh=0ktd2y+3JHz4M62Un4TPTK7jq8xv7qCCqknT7RVJG9k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRuf3eTChiyCQiGrES5pOpOBdhNKHNsQB+qkV5+cI3MH4DVELy0WtzWhZqP0ff9XG7JUtF9rpjYlsfdbYJ85s1xjVdsLS4u1qY2d0ESs8SLVlhZK/A+4ULdnLRgAVeWHqOdpbM06EWm+wj88uOmqnfmsOz0pOlaIPME+5rTKCBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mCodatb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mCodatb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032DE1F00A3A;
	Tue, 21 Jul 2026 00:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784595587;
	bh=0ktd2y+3JHz4M62Un4TPTK7jq8xv7qCCqknT7RVJG9k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=mCodatb7MIZ3fVfx+fxH+/7L5Rlm+Ov7o97atXo2hisZxz5+TO+bpD1gKMXmtWc5x
	 RyGlljnu8/vQm5B7TtHQrlz6eLfR7kBDg6cojv7OMzI9NDlzptVjDL0/lFCJXQqeJ+
	 xXgrMDvUZJeBtua1SqpLvR+/3K3Qa4Kt4b6qV1Hr4yFNPJZTtb7wk5kY4VtwdcUKFd
	 uaVm7lGOVD98mtVxKSQb5A3rZC9tPkUut0TxgFL7rwZeggf5Rn5s48UIoCa6YdNxgI
	 FWNmI9SMHml5PFnEcIBX55zBRQIUWRieAP1YXbUkkguTeDuIcgJQxmrzS2UFX5g+ow
	 R7SuVLzhwRzBw==
Date: Mon, 20 Jul 2026 17:59:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: "Ricardo B. =?UTF-8?B?TWFybGnDqHJl?=" <rbm@suse.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Xu Du <xudu@redhat.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests/net: Fix tun IPv6 test addresses to avoid
 6to4 range
Message-ID: <20260720175946.63a25f5e@kernel.org>
In-Reply-To: <20260706-b4-net_tun_addr-v1-1-3d3cb2473560@suse.com>
References: <20260706-b4-net_tun_addr-v1-1-3d3cb2473560@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 06 Jul 2026 13:24:04 -0300 Ricardo B. Marli=C3=A8re wrote:
> The IPv6 addresses used for the tun_vnet_udptnl fixture currently fall in
> the 2002::/16 prefix, which is reserved for the 6to4 transition mechanism
> (RFC 3056).


Applied, thanks.
