Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422548;
	b=jiNQcCt9C7h2zLOEUY5bXDpHVIsJJVBOyU1dtW2wBbJ9AfRqtMtHwNqohUKAJdMWweI/
	 +NJRjQmN9qxwb153q57V45rIb5ShB60cpPq6zs2c2rNI+BDmto3bd6r6URRBFB57QAyRK
	 GAWQNdI0GZTIi/f81ZRW1N+fcjcLiaKkUremcfM3uEUpm1o9JwMSbBdc3VVB/zaJTo0b3
	 j30P7NDYkQm6jLwmx9hex9UH6HJq6jPFaQtLSwWUVY75+iguPIQq8nbFRHcrzcYIzBdV+
	 p1IfdwEHzMN/3/zTBLW5CxVSHLn82mQ1zoSodBuneIWFIUqsbVHqsVYpuQxKwd9x0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422548;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=eJEkBIhXXAf3FhdflPiK5NHoR3jA0xDuLAOre8wI7t0=;
	b=ls5ytvsUm+PZq2PP8UaXDko47Rp1SwU8T4GiuOxG1+oXgr6wVHYBRa1vDPEyo7SlHkPq
	 +HHxGo7XeIbXLyXr7oLmbAt2VByUH+RG0gJJbyRtVGTUtpCCylmdnaAaLfh9mm0g6lSID
	 hUWo8DZGR/cpEmOpzInvhrLmwrlD8d1ELDoaL+i211+fQT5x+Q+OfVWEG4Ig9ODngV1++
	 KQlw3hMr1gsThbN5NoSSeNXvSqmPd/rRNLcU1jhSwGuD7uTp8x6fL9lweackc6HyOZqFK
	 YilL6k6h+wYx75B+PkkL0+3y+r2pRZahPPrGj7LduFn0gLNpP4763meUB2wrWw20SDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="i3/UFB6f";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC24608606C
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i3/UFB6f
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE461F000C5;
	Mon, 19 Oct 2026 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422547;
	bh=eJEkBIhXXAf3FhdflPiK5NHoR3jA0xDuLAOre8wI7t0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=i3/UFB6fLpIqo4E7EfvhU8Wuk0kTmnCV/UPFd+dPlAnqiDRok7tdGbz+aBYTloQK2
	 UGSTtGxyfaSCMIvIJHVGGZF0L9yRDdC9MrPHusLwDO0zElia+xI3I1nNucFykg2c6q
	 eRTpMijuUBGOIUFTzSGJzpl9WAAWidiUou1R6Ke8mB0oWGOhiyCDBf/v9YXyRbHbVi
	 KKJ6lRmqcT/ercVVS2B+cQHjwgtmy3TGHzgCD2gg4qFyCAitXiBT2ZJjLXx4LJ0z/8
	 NoFSl9/ywq5eiJAZ0cvQ+eYGEBvPtB+kz3vq11L680UViuGTLt9e7W9CJVKdo5h/bT
	 sCXR/ADJWPeAw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5288EF40066;
	Mon, 19 Oct 2026 11:09:06 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 11:09:06 -0400
X-ME-Sender: <xms:kjLWak0kWU0SFkq2k6oD0B4jiLwI8Rp9MGhwShFTh40KOfOfqKgfNQ>
    <xme:kjLWap52HB496PPEff-ZEib_qN8-iA0AGHPK5O-ab6EgHwCutoyvaOHywx6EYAGBU
    QPQarApiBhpcZzLB_QatAqCTHKG4rtWn5uuCVjADbjTRhgWBdkP0jEX>
X-ME-Proxy-Cause: dmFkZTE4B3Z2Yr93NlxKmJefPp/N7QvXesMFrxkNDmnsi069KzAsm9FfolxF6Kp17vU320
    aa7K/tZ1hdSyrTKuAMtUES4zdtv402iMV/ySjOP1d1NssSax3hZaErmE5iU+ZXHJEFTSSb
    OFNJ/X2Zc7mnjSfW7etGuvlNRrdN/RJxvqzWbhl18wv4JEcXOJp7aQiXijsPV3DqMYDc36
    0byw0i4ZPstb4C1QnPGA4xipM/OQ3aitxKndLlDrv1srZ6pSpfQ2YRqqRYwfnsl2C6bEZW
    Um2ydHQDhcLIpBrjBHFum+T4KCSkTMZGd+dG/0Vb4f0QgUcIBmeQ6LmJc6ffJ2N4xilaCN
    424AZ/SE3ZQC4ko5aKu6+vJaFYgQ5HDxBQmGLN2Ny8ZoiXCdyyLNphvgzG+kPaUsMOQOlv
    Yb/v85+h//ATnmwdLsKobzwf7VnFyYJoR3TOSFiCZeMTNECCcDkEfWawBwQ87X39Mr5nJ5
    TgFvQL2aMWda66YwZ9bGlU5K4WY8vDAKsogHJjwdbFt4t/gRFQEbO4JSpdD1VycUGWTkIO
    eL/OmD6h13QuGkq1DWBT4PxRYzJZT5E3TYSRntcUtqfstppDZSSqLeqWVrgY4LDWgBRKi6
    XoJB/vMXgTBWV+h3B99u/82SjS/6T4/X2aOswloONSiQ6LUSWdYNPE3T+6xw
X-ME-Proxy: <xmx:kjLWampcWR5VGJdpKfQydfBdtEQ2IyfC9np7xfMSkf7yn-4tohshaw>
    <xmx:kjLWahXhdWAY60ZR3kuzNvhM2dBo-lqolKIPC4YygyqBS6caHBcnNA>
    <xmx:kjLWavGWsyn-0x1pEnnEUxAywncFC1KBVqyIWiM2sqH0nBNITTjL4Q>
    <xmx:kjLWagC-Bd1tZBcgkQU_iTjrlxNgvPtfpYKFbcHs4K2nu1JUIe3spw>
    <xmx:kjLWapwznTPMmfgCe1K-hjUAtCfW0exw6uOYa5SHv-khgBDFPTR1GRBB>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2C01E782738; Mon, 19 Oct 2026 11:09:06 -0400 (EDT)
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
Date: Mon, 19 Oct 2026 11:05:49 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <8e161133-9663-4610-84de-56cdfdfeadbc@slotpi15m67>
In-Reply-To: <179235137390.3135.8037803967508250404@kernel.org>
References: <20261014-tls-follow-on-v5-1-e76c301d4f05@kernel.org>
 <179235137390.3135.8037803967508250404@kernel.org>
Subject: Re: [PATCH net-next v5 01/10] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026, at 3:22 PM, netdev-bot+sashiko@kernel.org wrote:
> - [High] The new limit only counts consecutive empty records, so a peer
>   can get around it by mixing in small records.

A record that delivers bytes runs the read_actor, and the consumer
can stop there. The cap bounds the run during which the read_actor
is never called and the consumer cannot act. v6 will make that the
argument in the description and drop the sentence about
desc->count, which invites the reading above.

> - [Medium] When tls_sw_read_sock() stops at TLS_RX_NODATA_LIMIT, it
>   queues data_ready_work only if tls_strp_msg_ready(ctx) is true=E2=80=A6

Confirmed, but not specific to the cap. Any parse that strp->work
completes on an nvme-tcp socket announces through saved_data_ready,
which nvme-tcp never replaced. Before this patch the loop retried
tls_strp_check_rcv() once more, so the stall needed two allocation
failures instead of one. The announce path needs its own fix; v6
leaves it alone.

> - [Low] (Baseline: not confirmed after checking the end of the series.)
>   At this commit, the wake condition at the new TLS_RX_NODATA_LIMIT ex=
it=E2=80=A6

Agreed. Patch 5 keeps empty records off rx_list, which closes this
at the end of the series.

pw-bot: cr

--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
