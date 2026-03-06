Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362401E3DDE;
	Fri,  6 Mar 2026 03:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772767203; cv=none; b=p0O6zevPJT3Z+EGhirOpG0npFlsN3Np8wU2NGItdWZDV0+sR9t4itlkqyJ9XEzMnlAgCg96SLxWHwUwEYi+ln5JCC+LiKrkOtfAgrRQUqeXXn1Xwy0YFUxBKTNYXS6HdPOamXMgGZRzdgYFnFxW0EidWUmINsF/i+6rMnzOi7lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772767203; c=relaxed/simple;
	bh=D/z6UnDkgHvDdSn8bobeBH2eE2oF4oe9gXPC+g60INg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wu/IsWD/S/q3+oAnjSCziyMCGFEiOJ932Qkm1OCo+5k6x6NrEREb+uJiXvBSvHEkXJ/WQahP8Kh9IA6cOOXEIwDzSHUsTge6a0nraD20fk6oky2py4VUnTKqJt3udT5X1aFSxQSjvMeyOLcaf60Zs4k5z5LesDkllMzS7YJ7cXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X0yajPTW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X0yajPTW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44001C116C6;
	Fri,  6 Mar 2026 03:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772767202;
	bh=D/z6UnDkgHvDdSn8bobeBH2eE2oF4oe9gXPC+g60INg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X0yajPTWG2Yk8g/wRoN4bq5aefh0qMQyjV52i7LRM2nBazrYgixWHo/wd5+iPdZpv
	 bmMuokY/vHp0x7GSkDGwcFGcZ+hbbDVd/kavvdtWLLgGVGFVJBiOZcBZHnBR6P08uu
	 9isUsJcNBJDWQXeKaPhft4IWyWUB5m4FMe6JY4Eba4Wdhbu94yYeE0Amgsl6zjwXHj
	 adx1LPOFhnfbRJOuvKEYpugjhASiD3xGhkWn49uCUypvbhAYwWyNOrZL6gDnMrjEo+
	 PK/CD9nIlgSXqx9tllPQLUkR0UaH5Vx3rjH+8Y06q2Mxj4vPVO5JFfqK26JlwygOu5
	 E/1PHC120tH0A==
Date: Thu, 5 Mar 2026 19:20:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Antonio Quartulli <antonio@openvpn.net>
Cc: netdev@vger.kernel.org, Ralf Lici <ralf@mandelbit.com>, Sabrina Dubroca
 <sd@queasysnail.net>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, horms@kernel.org
Subject: Re: [PATCH net-next 7/9] selftests: ovpn: check asymmetric peer-id
Message-ID: <20260305192001.1e70393f@kernel.org>
In-Reply-To: <20260304230643.1014-8-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
	<20260304230643.1014-8-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Mar 2026 00:06:25 +0100 Antonio Quartulli wrote:
> From: Ralf Lici <ralf@mandelbit.com>
> 
> Extend the base test to verify that the correct peer-id is set in data
> packet headers. This is done by capturing ping packets with ngrep during
> the initial exchange and matching the first portion of the header
> against the expected sequence for every connection.

AI asks

> @@ -2204,15 +2217,15 @@ static int ovpn_parse_cmd_args(struct ovpn_ctx *ovpn, int argc, char *argv[])
>  		if (argc < 7)
>  			return -EINVAL;

The CMD_CONNECT case was correctly updated from 'argc < 6' to 'argc < 7'
for the new tx_id argument. However, was CMD_NEW_PEER also updated?

Looking at the usage text, CMD_NEW_PEER now expects:
  new_peer <iface> <peer_id> <tx_id> <lport> <raddr> <rport> [vpnaddr]

That's argv[0] through argv[7] for 8 required arguments (indices 0-7),
but the check at the start of CMD_NEW_PEER still requires only argc < 7.

With argc=7, argv[7] would be NULL according to the C standard, so when
ovpn_parse_new_peer() passes argv[7] as rport and calls getaddrinfo(),
the NULL service parameter would silently produce port 0 instead of
the intended port.

Should the check be 'argc < 8' instead?
