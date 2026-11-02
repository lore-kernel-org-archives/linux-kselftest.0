Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643915;
	b=WS4EcA0nRbToB5StrKE29uYVAJuP8NqlvbcrUgtZn/2sySXRan2pRlxQFCmsJnrHxUyk
	 bdjE699c9CDkYGp4sBmuF9QOb4VRF1xd11TOTNT0vtegz26/iT6rLRh+W2tcejS7xzCN3
	 2Idzir/58OasU+9T/gO4I7KdgdtXPM8zPGamn+UGs2reM0qWRbrLzVoLJM0hWFUagmRGk
	 9si7mSoVR3Clq0pDRQN1ooS788lAZhwRS71xEA7u0Yg/CH1YaV8FpSF/MPjv5ZUpUdouM
	 JDkHDfLRatkggpAH+DBjzsbK/w1MB+3pVpRsVKs4fbxsMV3C0Z+eSAdE5F2EwMRDDng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643915;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=DwUxU5MMRSRGB53ooWpa2gSeYWoVPcRIMte/SUEqib4=;
	b=ukqx62unkBsJrIOoeOp52ckgQTD1nPwj9lexIvN4vNSlSbPoGul/S+uocmeLcWQYuOIO
	 jB38v1IdS6wiOuwXOf8Rh+k4zFc4B/R4PXpPps1khK88kHZByRq8b1ifbeS5nApiUVjKc
	 VCmjh95VwcPH/JRfGeALUHUzMq+BqnPQSfzro5Vo9s0IHXSaEH9GANhPbclxyDerIgihF
	 XvjmflSyhNuvql00MoJvaDTALJBtiIQidGTwDqmjFGM/x9R2XZEPhudjQGf/WYPjsgh+j
	 LW0tjEbJsUhc1az0XS+mE8syiYdAIBIsA39Npx+O2mcBFEPRkveBTwpwMEga3LVHe4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DO8KBDUo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C3E606D81A;
	Mon,  2 Nov 2026 18:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DO8KBDUo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB351F00A18;
	Mon,  2 Nov 2026 18:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643915;
	bh=DwUxU5MMRSRGB53ooWpa2gSeYWoVPcRIMte/SUEqib4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=DO8KBDUoinB2c8upVdaNfcUaaIt/J901VIQHV7jaeHgrZhqVWLSmBXL/iZMoQTtG4
	 /YaqyMZRH+OTXqjc/SD7cme+4VJFnTkGcEiZNJGbmCqleiHBKpH9YrUFwsZsQ6T7uB
	 m5axw0xZxrJvhKslFQfkhlLN4ydPs9UPWdlsn4m+DY4+gbAzoKDfymY+41p9hE1AWp
	 VgROnXVJcwPeO2Ufp5OWHCl5x8ezh4xUElFQ16W06lCerHsY5d6QhCzRan+6QByhtN
	 Wc9j9QAusfK8Ur+dDHEX3ts4EQ9AJr9Oaz6eLP40uVrijTixH8EzEj2xoIi86+Rx53
	 9NMV2aVORJB/Q==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id E7CF6F40068;
	Mon,  2 Nov 2026 13:25:13 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 02 Nov 2026 13:25:13 -0500
X-ME-Sender: <xms:idXoagBzuYlzre8QIG3-U-pGKG4EQRWBRKMIOXInVjJBoNgKwmao6Q>
    <xme:idXoatXK1iBgdCqf682ZKGCfsVcw0NNh-4bP9rxpiTEyWsCh8oALYaiOYdEgPW2sN
    cAZ0cyqPNfxpFEaqAy1scOjFOvOUba4-wGKabOSe5B7a-JOzArZ_N2i>
X-ME-Proxy-Cause: dmFkZTEOGs0hcWdWXEfyub+Da46+PL0kBKeqpM/w6ivdu9YCedEBg8rRqdVWHz8/X/SdFG
    y7yuL51ylboXPbp6xTMl35xletDjsoSwkB83fzOO1+spFr7ySCYZLQf45dI0zjtpHD/B80
    VzPHj8DAvF6CJ0Ui1QZQYhFXngMxCWh92FQG9aZcyphw9KGIRq3ea5NMO5umPnbnt0wfte
    MKGi98qj9MlNLgMkH+QKMO+xA03SpJjdE55F+77r47OQZ1KmFCSzZjXJ7LP3FNArjN8mNB
    JcrXzIL8Fx1SLpHJaqCVgwfX66WGNBQPYopXKrH7Bj+bDL/BkH6LT82I5Rm75wp/8aKrdE
    nWUremJ3Zh8jKKYElUWff2RgEKAWDvlbF/Xl46rvHFoq4yzseH5wRf/+beEmIguatoPM5L
    z6s4dljP0FTtYYSQIFUUXzh3bVrA/mO4sdoNSUzA+NPEax1yrBV88yejZexohRxOsf1xRw
    mi5+OlZrbIQmf5G7Ecuol/sHv4jvv0oRNVod31oVZdVJ2Wicc6/KH5p5Vb+t7Otqu5/F5E
    5/A91xgw01/AumWly9nqkU74X8c/CypAOrRo9IJJrCVZiDPqHX6J3HzdNQLGk4LmkYval6
    P1fCLwX+ObUaxhmENw8edXwGd6QnCsaQBR5Q3oO7kSzXJeUUx7gup9ehVfTA
X-ME-Proxy: <xmx:idXoai6BOZPE-0YxtScKYT1-KJqnzjA0ayaxpNx2tS7DPPqVuQrhxw>
    <xmx:idXoasQIAh4VIeRLEL3A7mZxV6_7sptA8LUxHvzpqtl35Oslm1JdZw>
    <xmx:idXoainhJyYhSy2cnJmk5TnO7tKeYdg-EJYPr4MVg-qvgGxKZ5w4bw>
    <xmx:idXoarJl49Cg-lh4ohVOgxPP81N_OtiHP38WAwtp4Lp7tEQ2R5CPCA>
    <xmx:idXoalQ9d_XagLm4DSz8YqPXKIgvmtgKN4Y7WmM1LwLIBzGOebXFoikh>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B6154782738; Mon,  2 Nov 2026 13:25:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: ANkgOu9LufOw
Date: Mon, 02 Nov 2026 13:24:52 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Martin Belanger" <martin.belanger@dell.com>
Cc: "John Fastabend" <john.fastabend@gmail.com>,
 "Jakub Kicinski" <kuba@kernel.org>, "Sabrina Dubroca" <sd@queasysnail.net>,
 "David S. Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>,
 "Simon Horman" <horms@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>, "Shuah Khan" <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 "Hannes Reinecke" <hare@kernel.org>, kernel-tls-handshake@lists.linux.dev,
 linux-nvme@lists.infradead.org, "Alistair Francis" <alistair.francis@wdc.com>
Message-Id: <785aa669-8229-4909-ad33-66f0824687bd@slotpi15m67>
In-Reply-To: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
References: <20261102-keyupdate-rfc-v4-0-f17419972b9f@gmail.com>
Subject: Re: [PATCH net-next v4 0/5] tls: perform TLS 1.3 KeyUpdate in the kernel
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 02 Nov 2026 11:57:57 -0500, Martin Belanger wrote:
> The matching tlshd change for ktls-utils is a small patch to be
> submitted at a later time if this series is accepted.

Recognizing that there may be further API changes, for the series:

  Reviewed-by: Chuck Lever <cel@kernel.org>

I don't expect any changes for the sunrpc consumers will be necessary.
For tlshd, as far as I can tell the whole change is:

- In tlshd_start_tls_handshake(), register a callback with
  gnutls_handshake_set_secret_function() before the gnutls_handshake()
  loop, as quic.c already does. We rely on SSLKEYLOGFILE to decrypt
  NFS traffic in Wireshark, so that needs to continue to work.

- In tlshd_initialize_ktls(), after the existing TLS_TX and TLS_RX
  install succeeds and only for a TLS 1.3 session, set
  TLS_TX_TRAFFIC_SECRET with the write secret, then
  TLS_RX_TRAFFIC_SECRET with the read secret.

- A configure.ac check for TLS_TX_TRAFFIC_SECRET in the installed
  uapi header, so the build works against older kernels.

I assume you plan to send tlshd patches, but let me know if instead
you'd like the ktls-handshake folks to take care of this.


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
