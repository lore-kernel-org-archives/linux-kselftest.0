Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794626368;
	b=dAQs5jIyR43O1m0wfTLUBXrTWSmu9GSgIUavKmwPQcCjqlWatff0Po7+916oHyY4amHU
	 sG28NDXJ/yWgjQni2VanGVVpDwJ2prdIs9ZMmwSKCIqPMkkjZMKR5Pb400TUuCYnBiMAz
	 Q80U2hJYULUPXkDWlDP+9jiqyHzLvNkj1LfZ6lIKpAH549HxVcKdaxSea+glu4p4FjhK1
	 8pnOKu5svIQijfAPsANE7hK5n45FQgq0qZJ+3mT/EnPKM2b3FuajhTrUrWw4KippisOZZ
	 YL+pWxjV0LIGO8FzjRvRGv3ocIsC+hR09qsUsXXventMc9OyDMkiFcccgAVgBh4SwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794626368;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=FJFtTvdOQXQvhn6g+VJkLVHkjFPfk/wouFgUh6gdpPg=;
	b=BqHNvtCgkOUfd3d8S9dT9EFojYxuSUB0gXNq+wSMLPEooUvpB6oVrKK0D7wQqJqz8AXK
	 pP4NpacNwSOLbdNqfXfkK3ZGfZuMmEOqwY1go7qBDrH5PZBVehr3Y2nQ4Lhr8UKed1eNF
	 SfBJHBx/r35z754CS2BjOtXHwKnCwR7hSjd6zYqA3soIixecTDRs8sKjQtP20LMiUfHJ4
	 kXRuKDm7ANGHaBLeB02XjDgIXH8XUcLobYLqmVdfKVEVjHwZnNqDX5t2nEnb9Ae8QfUWg
	 B1Smlg5G1Dz69Ty8JibZ4yuYRm18MI8olyhfjWU8C+1iII4zO1iQ0sFJSEnZrQvoxmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BH5VMDj+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0443606A329;
	Sat, 14 Nov 2026 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BH5VMDj+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08BDB1F000C4;
	Sat, 14 Nov 2026 03:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794626367;
	bh=FJFtTvdOQXQvhn6g+VJkLVHkjFPfk/wouFgUh6gdpPg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BH5VMDj+j8z09qUVz3jvgewmhMPv1KlklPZPUEavFkS/gaXSs/oCNFfwCWt+jFPwo
	 zg0GFosCBWlhGINU0P2JuhUShWPsKXMwFjMaMHuy/JsyBUxoiw+rc3qEDylV2p3FvU
	 vayVqOVYqzxzGOB0fuk5iF4qDLRYooEFtFl3Y15cTrSVT40OkDvU+dWujfp/8Xvfdd
	 TQo2K8QY5wmRwum1NWQ1I8vslbyi7iZ7sSgCSpjw5gR2ACqTO++3gOwK8v6wVZQQbG
	 kcUsVEAcF0r8301ugbdzMpS/D7gBbdF7d64DaNUIhTBZ1n625dbyaf1S8SMh9NhcAP
	 TyP2mJl16bgoA==
Date: Fri, 13 Nov 2026 19:19:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Donald Hunter <donald.hunter@gmail.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/5] psp: support rekeying psp protected tcp
 connections
Message-ID: <20261113191926.53af1680@kernel.org>
In-Reply-To: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
References: <20261106-psp-v3-0-a8dd38f5a727@gmail.com>
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

On Fri, 06 Nov 2026 12:12:08 -0800 Daniel Zahka wrote:
> To keep this series short, I have split off some of the content that
> appeared in v2, and also have planned future work that will make this
> feature more robust, but not necessary to start.

Needs a respin, selftest conflicts with Wei's changes, I think
-- 
pw-bot: cr
