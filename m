Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF15C419303;
	Mon, 13 Jul 2026 13:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948343; cv=none; b=gClTwnClLiZLhIOSwN5kuc92Sbkv8C9/urxA9xIrs8i7C0Fcw1EgsjyfZJJoNit0KRd1tmE37sSM1iN3hL/KkGHYWJc2+jzcHvJxJ3kdJw8mesSP4KYi09h9rRB1CNvCgIk3nlH5XC+MhuV4t2lOB9Agj0b9zl/qLMiUBcJIws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948343; c=relaxed/simple;
	bh=w5RxZXMVEYANqtOlQqqY97QF8fW+CMXXCf45JaqfUIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0bGhwyWtcWTKi7fu2GN5f2R562108260hark7hX3TKS92fa4PG6heBtXyAIdyryV4tDae7gUKtjSEJ4T2zuUYKOb6IyJ7m2gSgRefkftQCpDU1CVcsjQKT+9KiEXQzFEtbcwuSKRmMnmhXhSatT/gSbveV2f09mPS3Eg8QioA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5976fmX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5976fmX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B124A1F000E9;
	Mon, 13 Jul 2026 13:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948342;
	bh=yrHgwT9ZQSGf+NVPUAnehfl7ebx4MKMj541Yhxfc8Y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A5976fmXoYPItXNoPXhKwpkwS1wvQbGrwjMGNuw26bH095SURG05vry9TY9oJGuKc
	 q7yegn/8zUDuXGUEG5Z2IX5YiQII1zjVPY4A5Q6dnWjneq7q3CzaTGzEzKZLOfFBDp
	 pyX0pFlK/+DlTHG090DL6hY7OGBZSoCCW9PyoqtjdkEy7i9F4SuQU8rzae4x2AFqSg
	 YF7ie5DwuoBxUMjlXqhZFIQCXR7iCb1sznEPCgMi/odi+GqFLm7OntlIJQZjA+QZig
	 0xGGhAHFViIaL+mVvxmRaZG3jz9MOGQ5gkWAgtqXcENQrzP27DrrfKOB60Fp3hxIr4
	 ZTWGVPcMhTCwQ==
Date: Mon, 13 Jul 2026 14:12:18 +0100
From: Simon Horman <horms@kernel.org>
To: Ricardo =?utf-8?B?Qi4gTWFybGnDqHJl?= <rbm@suse.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>, Xu Du <xudu@redhat.com>,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] selftests/net: Fix tun IPv6 test addresses to avoid
 6to4 range
Message-ID: <20260713131218.GE1364329@horms.kernel.org>
References: <20260706-b4-net_tun_addr-v1-1-3d3cb2473560@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260706-b4-net_tun_addr-v1-1-3d3cb2473560@suse.com>

On Mon, Jul 06, 2026 at 01:24:04PM -0300, Ricardo B. Marlière wrote:
> The IPv6 addresses used for the tun_vnet_udptnl fixture currently fall in
> the 2002::/16 prefix, which is reserved for the 6to4 transition mechanism
> (RFC 3056).
> 
> On systems where the sit module is loaded, the kernel automatically claims
> 2002::/16 as a 6to4 tunnel prefix. When the test assigns a 2002:: address
> to a TUN interface, sit registers a competing local route for the same
> address. This ambiguity breaks the GENEVE decapsulation path: packets
> injected via the TUN fd are not delivered to the test socket, causing the
> IPv6-outer gtgso send_gso_packet variants to fail.
> 
> Replace all four IPv6 test addresses with addresses from the fd00:db8::/32
> range, which is part of the ULA space (fc00::/7, RFC 4193) and carries no
> special kernel semantics.
> 
> Fixes: 24e59f26eef2 ("selftest: tun: Add helpers for GSO over UDP tunnel")
> Signed-off-by: Ricardo B. Marlière <rbm@suse.com>

Reviewed-by: Simon Horman <horms@kernel.org>

