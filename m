Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452498;
	b=ypcDA2SkGJfh+p5Z+AZCDvNu/p+OrUhDLGAudoKMM2FvzglKTjsOr6ahclpmpJR6ufcI
	 3gClvMQi3Wsl/R/s4j3tig8r3J/kGiJWkkyoWLEFqpKwFln1m4ngOkeEi1NZ7ZlaEetoe
	 mbP4G0H6SuLntT7Tans/hftjWdT2T54FlqFUOGKWrxQfgTYXQXcbVsmS/nAP3gQsSVpUL
	 qmyRs+/4uqcNzpIdEbrhCI4A/wY2zJJNATH0NvGgoiBSHehRN7x5Gl9vAGT5RqCCcnHAL
	 cZHIFQgwfGGVw2v5oPDo5pdW7Pog1Fd0grIFA1UGUiLWunqYUaWrO7NmMC4x/yEAYGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452498;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=doDQWejrullsVYFGySwnbyd1nx0Kc8hjk3Zuvv2FYpw=;
	b=qOkiE1pZKvFlfsuD0uI4TklOcpoa7IfB2udz2LDLwvlVgewaLXPQvQv0Jb6kXomUROfW
	 yHVMcCtMDqCeENgHBgGtLq6rHXnogmi3oarh8+BYlxcS20MGEh2/0NxbcBWICffWogVPI
	 72DrCD2qFJXB+iwN2ZieQfPa15dUYoG3Jj/Vy9uIwtT4++4aPHjEys1wGd7MwOCDaZc7L
	 meWpEZ68qorkLxSFQXXXSyphU2fNL5OU069KQoiTIY2mD0YQCQBFNKJ2d7fYrq2j4hz61
	 9xf+t54BfFWuHKOoI/uaC8EIiM/+B+P0LjqYlm4akPpDykuJTIoTiL7prOleSCMPPlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAPaJ5PO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C99C606A31A;
	Mon, 19 Oct 2026 23:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dAPaJ5PO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C193B1F000C4;
	Mon, 19 Oct 2026 23:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792452498;
	bh=doDQWejrullsVYFGySwnbyd1nx0Kc8hjk3Zuvv2FYpw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=dAPaJ5POG1VgZU8faTBA7Ni69Z/b8FSlKSb+HDaEXIND4cC5HaSc4hKk6LKG4d2mm
	 3kNp5amrhQ9TAKBQBMPn0k730XzprLWDdCUCPsqRn9CBcQr6Le+JHciD9TWBtTOqG0
	 hJQSz3QKKfz4Ykhq00WqP6uj9sji0fvhzPJJeoYVagVvgqlI8RjcKKfwftE/wWsOfM
	 lHlHqRRXjwk30R2JM7gaYEA+Es9+ApMJatJ8T9CdneMgTGsEuDEWE9AlwjVlHYloxn
	 9MWlQHTPj94694HkG4ON+/Dk3Uvlp3hfDQJPhVmE2ObHYxxqp966b6vzE0J2rMV4TX
	 hiv2ij/oGZq8A==
Date: Mon, 19 Oct 2026 16:28:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Omar Ramadan <omar@blockcast.net>
Cc: Taehee Yoo <ap420073@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan
 <shuah@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 00/13] amt: add an IPv6 outer transport
Message-ID: <20261019162817.0855e1bb@kernel.org>
In-Reply-To: <20261009122426.551178-1-omar@blockcast.net>
References: <20261009122426.551178-1-omar@blockcast.net>
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

On Fri,  9 Oct 2026 12:24:13 +0000 Omar Ramadan wrote:
> The amt driver runs AMT (RFC 7450) only over IPv4. The relay and the
> gateway bind one AF_INET UDP socket, and every message is routed and
> sent with the IPv4 helpers. RFC 7450 defines the protocol over both IP
> versions, with an IPv6 form of the Relay Advertisement. A gateway on an
> IPv6-only access network cannot reach an amt relay today.

Plenty of AI feedback here.

When you repost the v2 (and not that net-next is closed, so you should
wait with that: https://netdev.bots.linux.dev/net-next.html )
Could you explain if you are currently using AMT and what is your use
case? I'm curious if you have experience using the existing AMT code
because from the patch stream alone it seems a bit buggy.
