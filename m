Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794255383;
	b=a7Z9L2lShQu1niMkzaqamQQr807qnUv41U/TFcxljTaHDaax3oHxp/r4H4zCuUyV0o9f
	 0ep+qKzDmbXP9Nc8SLl8ajePALVk4odJgrfpFomyB3a4MJ7gl6Eu78ictj4FkNrcc3acn
	 JG/cJhp8tqxPRTJqPWiNqpvfe3P+7CNsYY465L56Qi/kHZqsM55Ry4Kn5h17XwB6w0Se/
	 du9ZHKZkNcI8afInVcihcTSZDB45td+qyF69PimJNeWg9BEUd6yynWLcQHYQyWLGfEAC/
	 AD2rwEHpq+9Hdo0N6Zwsml9zHTq/l9s1YDeHPtGb+5ZQvRu79MqZ0oxekLRCbblt79w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255383;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=rNpqqUKyZIk9hFE2nU6+0ja1VPu3/8roBqqGxvmYkhU=;
	b=oK3oLIcdN7Wg5D5AukISevBPNN50szlqkgbyOIbl5MlgS7Dq6t8Ky4poFt2igE21E377
	 aAkdP2OiOJXZJdFibRL8/upNzZWxzsmfsU2zM05zKxvWiav8ctJhpfvfQQtlrUFm1rj9Y
	 aV8rahRwK9eEaEWoIAlykhKWPOIjbB/1pt6b0OtOoJdySsOjdA0Wpr4fkCThOa4TPbQsc
	 o5K1JzvPXfhmBoW8ccPGxb5FffJ40uEXY/PMlfaCu9TgBgJaxSD/PgTENqI0KwDp8tTav
	 ArBHkJaM3wQEqwwBpaBmTnHeaPWibAb/iyiF5DuY/2ZHiypg0x6d2p1S1s8FDHrp8aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I/0EpYBM";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E0F606A332;
	Mon,  9 Nov 2026 20:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I/0EpYBM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124E41F0089F;
	Mon,  9 Nov 2026 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794255382;
	bh=rNpqqUKyZIk9hFE2nU6+0ja1VPu3/8roBqqGxvmYkhU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=I/0EpYBMlf3I72fROSKr90zZKxtd1GorGCytYnDNq5lDERVmu/Ukmk/+HJDttMyWb
	 acR6aU02DpPD/I6ShN6OGXbE+hZBhUbDQzMV0TyrqOoNVDmzqc63V7jSpXAcQ2EIy8
	 Zqit+6bxTvgOzClCwmTkbLkdw6ohpcB78IcD/8ZEOSbC1plY93IraUuzhH0NlLMtn9
	 T6hm0uGylUC+WGlrmLbjTxSjDVueTMdqEspIUlujWrhk6AfnFbRcvmT+KwzZZx6vC8
	 eIq7C4iifohM/QCJEPfUHWzj5qLtzrIpUjbQAkA1YrWt1RVSda4z46rYYKoF3D6akG
	 15SBPBCmVzfqw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6346FF40066;
	Mon,  9 Nov 2026 15:16:21 -0500 (EST)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 09 Nov 2026 15:16:21 -0500
X-ME-Sender: <xms:FSryamggSwyhEMH-1I2uz9U3a6U5KWX0T88wLfA_xZrHhO4abOncWg>
    <xme:FSryah0QiaaFtrH_7rcg14Q8NYcKjX_iAL9jlgcKN_CnHd1-YTK0Nur7WN9jU20mR
    1-seVtcSzmfEn4qTvMRmwxNnKjentQHollQ-gFC8RHTNkySB0jmJQOwvQ>
X-ME-Proxy-Cause: dmFkZTG34HtRlLNWvelVjT7bDBbAOAlPccCpaWxZs7rDSEQHji2oSwTfHcsmij/8ifVGTH
    I2j/KRmLNSuYxY4AkZ4qyeXzjZGdhGAA2WAb67tuiEIJHQt5rRuKIuVqTPAfWxa52YljuR
    a8SE6gZN3sCJZxfCKqjZRrqqQQ6pSlENVE4viSYCE857wZa8Q2gzduG9o6k8hYaSpDAJlt
    EJZy4BCcL2N5+qUAXUkV9mhF3z9M0UOxdF8M6AxFzFkIkiZp4IsxA+iXFo5MA0BUCXauCF
    n4m/vQPaIRuK2t0sY+ac3Qu6G3PaIt/9xWHbma4e5BrfwV6uBIW0LBG+h7e7Pn3nI7TwKT
    rJcPHV2MeVWRCeemIyOIhcU7bdSO21fZd9YYvDyO8I2tABiJXc1VmEfRHRviwMc1SRCmMI
    OZEG/R/T9Rz0UdwQB3ngL2uRJyWEjjqK2eteY5v353i+SEzGx5Ad2//TENnLir9IL3SD6f
    4vxASei/7bFZYedcN3Lae1bj9rqDlJOw0/fNcdCtNOvMnAwlxlb2CAYLfrc74vgkyGbWIp
    8gVlBy6ND5ABa9qJa9vlT1UFPFzCv7Nbd1RTcrtdgyMiOJsRLpWQBHwgAdS7gjRHupW8GH
    /IYyUFRN147LULf0PB74WWIlpo+GoYQbFYLKARlSSzZt9X/KEJHCqaZ0y9Kw
X-ME-Proxy: <xmx:FSryagN6brtXunjvvf-HSa4jJJjTRe11SKPben2hpWxEPaJmg6npiA>
    <xmx:FSryas8cb_2fFnIlK6M5Hyu2l0Uxb-DOY5J1zfJsRvGB76T98Yd5Fg>
    <xmx:FSryaiGnxWA_-F_rawJjI_jDxAi4rSmTCO3QBZqEeUMH87d-dKwj6w>
    <xmx:FSryarjfLTvAjAq9Cy_kzxyEyyM5tjcEN7_JONXnQBORFMeTPhtQTw>
    <xmx:FSryantTosBsOufpLgNE7vRbkDSu7ig4KuzjgNP41s8kTc2d98MDt_SA>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F56A782738; Mon,  9 Nov 2026 15:16:21 -0500 (EST)
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
X-ThreadId: AIsCzDX_oYso
Date: Mon, 09 Nov 2026 15:16:01 -0500
From: "Chuck Lever" <cel@kernel.org>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
 sd@queasysnail.net, shuah@kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <539d42b2-e786-4924-be7f-32029c80cd05@slotpi15m67>
In-Reply-To: <20261109175836.1246840-1-kuba@kernel.org>
References: <20261109175836.1246840-1-kuba@kernel.org>
Subject: Re: [PATCH net 0/5] net: tls: break the connection after a burst of empty data
 records
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

In patch 4/5, zero_len_peek lost the poll() check that v6 had after
the EAGAIN case. Without the poll() check, the 0data_0data_0data
variant passes on a kernel that lacks 1/5 when decryption is
synchronous. The peek queues all three empty records on rx_list and
recv() still returns EAGAIN. With patch 1/5 applied, the peek consumes
the empty records, so poll() reports the socket as not readable.

Restoring

	/* A record left on rx_list keeps the socket readable */
	EXPECT_EQ(poll(&pfd, 1, 0), 0);

after the errno check, along with the pfd declaration, would cover
the MSG_PEEK change in patch 1/5. But I have not run this series. If
the check fails with patch 1/5 applied, I'd like to understand why.

The loop rewrite in patch 2/5 looks fine to me. For patches 1/5 and
5/5:

Reviewed-by: Chuck Lever <cel@kernel.org>


-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
