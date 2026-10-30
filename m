Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399776;
	b=QxEy+N3475R0wj/t/nsDvASVGf6Qwk1FvhXQMHg83OBSTOxFy7HodWiKvIGklg24QlAA
	 aUbTjO0aj7zlczraUmhUbdcuh69L5Gf9eILubuomWRPDa7OhKVjuocqI6ulT6id8DR5Z9
	 hzgi61LN87yukF1NYJxaSHWafZyr+/C3zAIy/XZ4uhi6JlccKCZPFm9CXjs5ukNzwKkik
	 mYb7uatf32S0H2YJ68DzfMbIaVlVHQ+gnzsYqbZy9LgyY/bbfWxA+Ke9X4uX3nLEOAB9q
	 yo9ymSqFGmlJ0ImQr4yQOlpgbTGUBemFpvl7BgEkI5QuXtP9RXE91qQX2kC0zzjcCiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399776;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=xJaZGyGRTXly/D3ajaKHXuMKN8mCutGTBbOpgpdo12Y=;
	b=iWQChQSTpZlUdiI6uRZK9xbDCOZ3cVDPHs7XebWRliUL4rqVt7y7/K96+gv689u2f9Gp
	 wreplBKhr5UQsTM/AN+z/9vjuyN02X1Re8sZsTFGFOJ1ChFYDcTa6hHhmSoBq2Ehr12yf
	 Cl8dgtr6LnD8bMWhnMW9yVQnjKrykRDAmT6MsLM0tBGJZ3+phBI3TYWJVGglDhrPy5F08
	 rUecq3Y7r1lwyny3T/N09Di8AaXsPjLFdeM9zIY62FKWbFCQm/Z12g+52ZqIQmHehB896
	 SdBofT3l38X5ShmBM+JbQEShhXE+XtPe9DXcD8DJqfbDCd3xz4Qao2MGx8JsI7qB/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FpVs4/Hc";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE73E606A320;
	Fri, 30 Oct 2026 22:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FpVs4/Hc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0731F000C1;
	Fri, 30 Oct 2026 22:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793399775;
	bh=xJaZGyGRTXly/D3ajaKHXuMKN8mCutGTBbOpgpdo12Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FpVs4/HcY1ua/lkkPUJDo4FIxssjLUwdbQAJdPKkTgjMvmmnExRU7L7Gp4UxXNto0
	 nvUD5ex7sFCThSIGoII39rpX7a9jKw0BnGnkLDadLIDKHTVpqJfP6rv9l8CDXjTnq7
	 QW7AsrY8RpsM1MGB39dyiQ4Uf9/3ex1yhr3OQV9qz7ZG/1szbd8xNXZQNH5cmHEUWI
	 PVCjB5zjuc1J+k6qdltMZXYjWPRyZ+yRjdN5POjYQaRkd4DMHuiqG9uzp6mONm1iip
	 Z7Mai91Mr+uaXGO/MHXjUanb9d99MgyP5dmjVMCst362AhJ236pbrpyPvmOJKhHqOP
	 hXO9a3+OtVRoQ==
Date: Fri, 30 Oct 2026 15:36:14 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Hermin Anggawijaya <hermin.anggawijaya@alliedtelesis.co.nz>
Cc: dsahern@kernel.org, idosch@nvidia.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next 0/2] ipv6: addrconf: keep lifetimes of manual
 addresses on RA
Message-ID: <20261030153614.60de73d3@kernel.org>
In-Reply-To: <20261030055757.2094944-1-hermin.anggawijaya@alliedtelesis.co.nz>
References: <20261030055757.2094944-1-hermin.anggawijaya@alliedtelesis.co.nz>
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

On Fri, 30 Oct 2026 18:57:55 +1300 Hermin Anggawijaya wrote:
> A PIO with the autonomous flag set refreshes the lifetimes of any
> address on the interface that equals the address SLAAC would form from
> the prefix, including manually added ones. RFC 4862 Section 5.5.3 e)
> only applies this to addresses configured by stateless
> autoconfiguration, and the result is that a static, permanent address
> silently becomes one that expires.

## Form letter - net-next-closed

The merge window for Linux v7.4 has begun, and the net-next
tree is now closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens. There is some uncertainty
about how long this merge window will last, so please check
https://netdev.bots.linux.dev/net-next.html
before reposting. net-next _may_ reopen on Nov 2nd.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed

