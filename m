Received: from oak.phenome.org (oak.phenome.org [193.110.157.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C8D400967;
	Wed,  7 Oct 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.110.157.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791368937; cv=none; b=LjLnMdRtY0k7/J8JQZEMlTCxxqMi/2yA1M9Eda/J4huHAmffsBSIPt+63WmzeyclwkSMh6tp6B938BEvxWn+ehYtYenhmMXIEJcvCHDonlsdDF1cfjtpOfcECa3QkNPZjaV2rRQfuxpxiyBo2xQszStWLJLk9DCT3keaUuIRklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791368937; c=relaxed/simple;
	bh=lSYT75rM3t+cWhTlJEnKNVPvWuiA4ftgtUGUCt/tgKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flFiOrsjHYGHCnaot/Jx8cIeHuy964p9SSaTR6gwlUx/r8Xw+L0mUq4XMS4eFllSw49O4qYh+kMJc6sSl7dpKMlyTVjpQzgkKNFpv3QKPYy6S79Mr9Y+GPTfX9R8lSoYuexR2nnppa7//OLNOy+qqIrISSku03HpWeyF50T/PU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phenome.org; spf=pass smtp.mailfrom=phenome.org; dkim=pass (2048-bit key) header.d=phenome.org header.i=@phenome.org header.b=TyVicfsB; arc=none smtp.client-ip=193.110.157.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=phenome.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phenome.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phenome.org header.i=@phenome.org header.b="TyVicfsB"
Authentication-Results: oak.phenome.org (amavisd); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=phenome.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=phenome.org; h=
	in-reply-to:content-disposition:content-type:content-type
	:mime-version:references:message-id:subject:subject:from:from
	:date:date:received; s=oak1; t=1791368916; x=1792232917; bh=lSYT
	75rM3t+cWhTlJEnKNVPvWuiA4ftgtUGUCt/tgKE=; b=TyVicfsBNYMZjc6Lvzp/
	L1h/gkKqjczuqkoBYY32QGaWHlRt+ezxR8XyY1QxJeH7MdIJKaGmdm8VJsGsT3Hb
	YpvdxppzOGoQRSjECQcdhjXa0Xef0e/ZVhKyT5rbymEV6Hzle5t+eQHp5Wc8rYXz
	4vK7H1FVYQdZHbrVa7JQ9ojbcthX66P4iIvitYdgAyc7RF3upmaVE2I7PzkNgjNL
	WIdKV+FfPsTAwcQaQaaF3k/GlZ5wnrVwaWI5kmTrcrQKn9Llydh867kPGWxLXPwB
	F0k/NJ3Ry9sJR0okZHW7F4t7WGSS+YsoJZT+7lYunWF4nWdTsrsrLlpXaHWlBvCo
	UA==
X-Virus-Scanned: amavisd at oak.phenome.org
Received: by oak.phenome.org (Postfix);
	Wed, 07 Oct 2026 12:28:33 +0200 (CEST)
Date: Wed, 7 Oct 2026 12:28:32 +0200
From: Antony Antony <antony@phenome.org>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: Antony Antony <antony.antony@secunet.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>,
	Jamal Hadi Salim <hadi@cyberus.ca>, Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org, Yan Yan <evitayan@google.com>,
	Tobias Brunner <tobias@strongswan.org>,
	Florian Westphal <fw@strlen.de>, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH ipsec v3 0/6] xfrm: state: exact mark/mask match for
 control-plane SA lookups
Message-ID: <asYe0D61qDIOMhbL@Antony2201.local>
References: <migrate-state-fixes-v3-0-836125bb53dd@secunet.com>
 <arUCAefkfEw-Jl_z@krikkit>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arUCAefkfEw-Jl_z@krikkit>

On Thu, Sep 24, 2026 at 12:57:05PM +0200, Sabrina Dubroca wrote:
> 2026-09-21, 22:43:59 +0200, Antony Antony wrote:
..

> The series looks good, but why did you remove the selftests you had in v1?

> https://lore.kernel.org/all/migrate-state-fixes-v0-3-a69e8637ba3b@secunet.com/

Thanks for the review. sorry for late response.

The selftests were in v1; I dropped them from v2 on. I should have
mentiond it in change log! I used the tests to find unusual mark configurations,
ones that strongSwan would not set.
As far as I know these are unlikely, or plain misconfigurations: several
SAs with the same (SPI, daddr, proto) that differ only in mark, where
the SA a lookup finds depends on the order they were inserted in.

I did not post the script with the fixes: the tests got complicated,
and XFRM_MSG_MIGRATE* is not supported in iproute2. Adding those tests
would make the already big series even bigger and risk a long review
loop.

After v3, working on the fixes also reveled further problems with
misconfigured marks, such as bits outside the mask (0x10001/0xf), in both states and
policies. The kernel quietly sanitized them away on insert, so a later
exact lookup, e.g. delete, could not find the SA. The extra patches in
v4 and v5 address this. Android's test suite is good at catching such
misconfigurations, and Yan helped me there.

I could send the selftests separately as a follow-up after this series.

-antony
