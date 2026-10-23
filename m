Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792777980;
	b=xGtBGZ1Uwe2qw27p6ZTDnitjsIUpLA1cL7FCe1O8x8PiNm4G6X1M18uRmyxyv+3Gp+yt
	 h3XG3S52TFCiovvqQiVCQBMmlHtYw8FuHKXtciSqxXXvmyjAdjX9h3k3rxmXx2kYwvGE8
	 wZmVpebII8SRR0LrR8Hj68lkRHIa8Q8QF2gxfUvXNtUljFrswz2aCM48VbLasFQbLx8Go
	 r9vjotAL7oveY8hD0RjNKP5eGCgHwn2oEiFSKs2Ugqvw5nENV6BpFVoZ/twnuuHc4cwnc
	 xFaJvswKC6usu4sleffPh+vy/75W+ptCXsYdnNEg4YOawcgEhjo40JIlk0HyDAs7KVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792777980;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zfbSS3RV3vTYd7uVbgoNjRsvAB3uNZqAW+R3s+y6inM=;
	b=r1VkZ3vz3bs3lk3w5A/fbSpOVUwz2Dagl6sYRssKUUktp9fxOP2WFJHsY9F/K2V4bqqM
	 r8UB5Dixqj1wMwo6QZQhQHZami1JnX2cqHvtfj0EnreAcqTx7Mwv3fEQ+g0QNF8oiAIFm
	 yhQ7au4kr13ndAqRe/dXVhJ/wa5akR+fKD39CDaSn6qIBH8AZlAho8I1gYlrnUNyeu/5G
	 nhFq4CG1x+N2vkeKh+lGwm3+9OIpM5PoIwQagu5y1nWlOeWIg11dQn7wlehsCmNHyBCUk
	 aezw09DWqIwqy4GxeWAOjR6QmE3HW7nSO0GKfJqD5Ix4skKR8uNs58tf8UVCPMuultw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PKny6dER;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E66606A31A;
	Fri, 23 Oct 2026 17:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PKny6dER
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0491F01829;
	Fri, 23 Oct 2026 17:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792777979;
	bh=zfbSS3RV3vTYd7uVbgoNjRsvAB3uNZqAW+R3s+y6inM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=PKny6dER+6L/Mjcok1LxNLmAR9TlSETIeARYYC8lZz/POezFlqcvt6LtFRk2DgP9M
	 PjTOKdDvRSdM2o4kD9CFl9weMLBIppzuchXQP9RO+iP23ESPmXwfjed3nxEEqtFrei
	 ZCxUHgO+GJ4zfcDajn118QmnT8WLlfsM/O5BisvPFKOtRAsy2llaD6L/TE5HbdfGuv
	 Qde6CcjDa7qtaNkoiLW+g3o/LVcRjrkRRVFqUxf9zqeorPub02nNy9I53CHSP838OS
	 bRtk+9NRgc59eYsaj0eiETH0YJEHAxmvMO9FvCb9qvcAQbZM40E4bSmWSTNFGrmd+Z
	 ejyycknZ4S5hA==
Date: Fri, 23 Oct 2026 10:52:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Russell King <linux@armlinux.org.uk>, Shuah Khan
 <skhan@linuxfoundation.org>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Breno Leitao <leitao@debian.org>,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net] selftests: drv-net: devmem: Skip when hugetlbfs
 isn't supported
Message-ID: <20261023105258.2a6349f9@kernel.org>
In-Reply-To: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
References: <20261021090852.996899-1-maxime.chevallier@bootlin.com>
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

On Wed, 21 Oct 2026 11:08:51 +0200 Maxime Chevallier wrote:
> The devmem selftest requires accessing /proc/sys/vm/nr_hugepages,
> which is only available when hugetlbfs is supported. This isn't the
> case on all CPU architectures, for example it isn't supported on ARM
> 32-bits on cores that don't support LPAE.
> 
> On these devices, the devmem kselftest doesn't skip gracefully

We don't require graceful skipping. If anything IMO hiding the stack
traces isn't great.

If the check is extraneous and makes us fail some tests which don't
actually require huge pages please make that clear in the commit
message. Otherwise the net benefit of the changes is unclear.
-- 
pw-bot: cr
