Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305206;
	b=ujpxqM5Pq0tghTkE0Evd2FOqxwv10HemtJJDpgENi8p39aCLrkYnj9G2J1q+XoCwTS8M
	 Mo+VLZ15VlG5AAFoGglj8L5iM3gdFts1hr/S2gdwX4lt1TL7+TIrI/kwCZvK7gP86v8n3
	 tzblWzD2NwCcabQjzhzFYTFOi4G71svFGUSXL3GjKorHsvyR0iZGU8+ET2Xas53hFcRhm
	 rhNd81vHFiUgvTUTqdmoxRRRpOYbnSj3w6vonkcGtStDvf/HrutDoIhFGMI9XSscY6kLc
	 bo0BhZp8+xY5I2TYfz9+dpi/maWOwmRy0xdVORm5TLdlKynK2mDfZIvWwYcwQaekL8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305206;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	b=aAAHhazZNdLURUvsRCYJSUXyyGeHzA5R62p6EIhkh0dZBQQh+4JiniOqfh3wpunZzRrG
	 oe23t0S9IcPKZScyoWbwIxmvGqEhHmPQQRCF9GLevzBneOARuYwEqLXOkfXAG9OrBPKzn
	 ULH4NfvJKOb88M6EcpWEiKCWQlKt+FLPCrWH4nVB8VDYXjwcCy8Mh2DI+cc3amYPOyEW/
	 UJRRI8SdQHoPl2nLZ/tfrd/gTf83xBsIiyz9rtr5C3J+9iGuXV3tt0RX3IKSzBhhJ2yUF
	 tRS4CW054xLGop9QwWt07wfh/9qSH89uwjqv0+c+/OW/SPneRbRiZNNCTGIJdo9Mkfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bd/O4OE6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4997D606A334;
	Tue, 10 Nov 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bd/O4OE6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635DD1F008A1;
	Tue, 10 Nov 2026 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305206;
	bh=PJRu7W6/Or1we5Gv3BgoLEtby0D0Y0UGgfjBHfRc5+k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bd/O4OE6MVr49LvzckZIOT3Vx4Yb0e8kDzhGTyiXv1R4vp6D6dalN3KkTwfaC36ie
	 g4KRPEEdnNSFSQXsyNU1hWgxpa0mYODLwg2jH5Q3+ffMNQLG1dq5nGw+yQOgMAY5au
	 67bxNITA7ew3Qo60vB/iAG7Zav2fteTeLF710lZJAUYx9MMmw5+8yNuOuUsUZ/dc/u
	 8+80vcbFCGcT1cZaviXMFNMZU26i2UAYTa5lHnQdpQAzBUsHE9Iho0G3rXymTgQ6ye
	 w3MXEHiGmgR0wtaQONsJp9cKa0BDPw9dUdXQSG7MwoC8Kd/ofhEFWOTYo+ewenNLJB
	 r1EH+px47+JNQ==
From: netdev-bot+sinfo@kernel.org
To: Vladimir Vdovin <deliran@verdict.gg>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v2 0/3] ipv4/ipv6: Cache pmtu on all paths of a
 multipath route
Date: Tue, 10 Nov 2026 10:06:44 +0000
Message-ID: <179430520494.488859.8396860489135491042@kernel.org>
In-Reply-To: <20261110095903.84813-1-deliran@verdict.gg>
References: <20261110095903.84813-1-deliran@verdict.gg>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.
