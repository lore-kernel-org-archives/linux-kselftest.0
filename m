Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.230.174.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334781;
	b=Na5WpmUdqtH+MF6p9OixuOTl1zB0kfXESBVMeMpAfcgQqD1WYt0iErBdqA3JNcKmMyuk
	 BVhpj92SNIKJa44uQO0JD7yjrxTRePeC73jrd0cEFB4JflG5PIr3u/moCWuj9uLTj9W3V
	 PrUodB/5wL4kVDqDjQSRyW1JfU+vFFYNpaKgHCc8Dfyfgas4cypbY2YLkhy2hQwMoxZk7
	 WULfzut1ZjEkqxtQz4m//NEtBsC1z6HCTGb31XFU8ICmzw5Hb+tMTO0mJbJmvwurhZto3
	 /alcmyglxaA1tVyJysZbBgzQLoAh2CyTRV7+dZ6/r6K1gp5QEMja03CDRUXZjZr6Fdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334781;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VpKp3qfT9I2/4AIFnOHw2thJ8PJrOYzM5pM3X9hSNw4=;
	b=0y4kTBJ2GsmiZYLmvIEcv1Gn4ar2zf7SVtwJ2yjCX/TdbL7kAvjM5Md9iq+Vb0SU2zzB
	 7glFvUdKS44DG4F+LLhqnoYjjNn6DGVjSH5wTgPR0/sCQtcVc1xCmHau5cEUJcojaHgub
	 +YztuCdtArHImaTj0oitxQDUfygwLwGd1kGehiRmu2U3xFbiNR6eFhI/Vhigy8PmwJEJ8
	 tYp3LztJKw5z4nAnLd+VTmrHYCecA0oxb8aCbfXTNBLNFjNhe2rGuvTbMIpZqI+L6Qe1e
	 e/RQrrC/eTbaxaGSiuWxXCC0yDEMrXj1KFt31OD3j/SaxVK0dzvetd/CgkgxgdbdnOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.ru;
	spf=pass smtp.mailfrom=yandex.ru;
	dkim=pass header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=io6hQch6;
	arc=none smtp.remote-ip=37.230.174.44
Received: from forward504a.mail.yandex.net (forward504a.mail.yandex.net [37.230.174.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10A1606A320;
	Tue, 10 Nov 2026 18:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10A1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.ru header.i=@yandex.ru header.a=rsa-sha256 header.s=mail header.b=io6hQch6
Received: from mail-nwsmtp-smtp-production-main-65 (mail-nwsmtp-smtp-production-main-65.yp-c.yandex.net)
	by forward504a.mail.yandex.net (postfix) with ESMTPS id 50958C0184;
	Tue, 10 Nov 2026 21:19:31 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-65 with ESMTPSA id DJXb7GFia0U0-UuobqHqp;
	Tue, 10 Nov 2026 21:19:30 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1794334770; bh=VpKp3qfT9I2/4AIFnOHw2thJ8PJrOYzM5pM3X9hSNw4=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=io6hQch6nxz7t+B89tSpK4FHF7YCawH7TZJcvP2USlG6IPMNsETp8OIJYWzxb9KQK
	 2bWsz3AxDOhjRAJigmwP62k4ZioW0UNfDO1iHw/Ea+BQgOYbDQrPrWCFv1xL0odl3t
	 WzFeAUXNNdFkrtKsAb3BNKdpMwExD1GAJoTpJlAM=
Authentication-Results: mail-nwsmtp-smtp-production-main-65; dkim=pass header.i=@yandex.ru
From: Roman Khromenok <roma55592@yandex.ru>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH wireguard] wireguard: device: allow userspace to enable IPv6 link-local addresses
Date: Tue, 10 Nov 2026 20:19:10 +0200
Message-ID: <20261110181910.2679973-1-roma55592@yandex.ru>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <avNKp7OVA7d1X3fL@zx2c4.com>
References: <avNKp7OVA7d1X3fL@zx2c4.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Nov 10, 2026 at 04:47:35PM +0000, Jason A. Donenfeld wrote:
> This is an old decision, but one I think I'm inclined to stick with. You
> can't use WireGuard with LL generated addresses, because AllowedIPs
> requires explicitly binding to public keys. So you wind up having to do
> coordination between the chosen IP address and the distribution of keys.

Thanks for the explanation, understood. Just to note, the use case I had
in mind is one peer per interface with AllowedIPs ::/0, as commonly used
for Babel/BIRD meshes, where no address/key coordination is needed.

> That's the direction I'd like this to go in, not breaking the whole
> allowedips model, which is what this moves toward. I hope that's
> understandable.

It is. I see the direction you prefer, so I'll drop this patch.

Roman
