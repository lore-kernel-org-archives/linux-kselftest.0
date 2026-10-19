Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422663;
	b=sMVoU0tsh5XOJT5spr3NPhj2URFsNLwYsE+Tsw4YOdBJzdiGjwXsS/xCwiFOik70RVb4
	 BsHtqsYocVihMj1Y/RwQeOUOBGkqNImbQmQx8H229HDcP44juPr2IOZPXS9qWB/LB7ENn
	 pPihBsoMsbTTYZTbBN81WRdYqy6WOk3UyRss02vXMWiKGqZIvvH9dMQT0JaafKOcl2qX9
	 mOYrdK8soG1cwsm+th+mIPWXewDMIoI+go/luKsA59aM7EBPWZF2Fpe9KIA0s28RNuTww
	 J9YecPZfyY7DIQDUuIqgBwHpynFFHtgadSJKvL50ePKTIbplPLOtHsTtsK5Vlk4+RUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422663;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=fEZDTifdhLcn6FE40PiPwUAHX7KfqbCNmtOKaENRH2Q=;
	b=l7SfwXYfchG4MWYAcX6TBvgcWdK9V3mcoQ/4iTR8XvPubkpzofO+yopNjwJJ+3zHo+fV
	 u0kp1pWr5/rSTmQtxZMqqwpKggrV9KkZ8xWSK5AAD+clVFrDr2wS8FsyuZwqW6FihdsBG
	 tmTWI1B+RVpE5rpWLij7B3qMucondJjdPmbAz/h3LSOn+kKczOwJTpLFJKjIKg1n4bl3k
	 2J3GtX44+0ubzS09rzLLxQjv9hF3zHv0K6g2pjoujEeZFbYIa2XSvP0pfAR4uVwo7gPgM
	 nD2SVpStd1DaqlZBSxms6OWuycsqdERg3RuzwUbsAx1QWnMOF+ATH4h1j58yYCEJ0jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIb8WBZw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9560892D8
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MIb8WBZw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F961F000C5;
	Mon, 19 Oct 2026 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422662;
	bh=fEZDTifdhLcn6FE40PiPwUAHX7KfqbCNmtOKaENRH2Q=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=MIb8WBZwDutGr3N8pKdKykYa2Ky+WRUWdvONXM137NPnQn3MavxDCmaArMwENEk9L
	 ZWTu4R+weZzSwq9Ouyz9atfjyHvfutch7pkhTJyq1PYeJf0bv9DjMggUhzNV5JJn2B
	 68KPLstfdaHqvD2pVh2iQCnTNkMR88UfHz4T49VNgDHmpMMoZAW+6R9P3/KUT9qd1k
	 8yt7nam12tVl6DSmGZdPR9szmi5LPmV6Tc3+lzFLloGx9qF9fDvX96lrsMnlluHQWy
	 4XxIyr8NseDqBqf9B+w/sc8bklniB16u2+D0ePNKTU3gglxNx9AHZyeYbOaDSLa/ZC
	 C+pZRkCmfeBQw==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 645C2F40066;
	Mon, 19 Oct 2026 11:11:01 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 11:11:01 -0400
X-ME-Sender: <xms:BTPWamxIeo0H_oTj2sBGmTkv4fslQQSzKI8NEuAvswGV5VNl3fgxpA>
    <xme:BTPWatGxQGG09KLSV0-U2MwH5J_QAFXL_Pd6OQ3NsABc4a0PrSV-5Uw6xOLbqcSSt
    K1rNE2EmWYJY1UFwIu0AtU-DjX870Exw2cvWwRt9Sr33ycWCLdVPEFu>
X-ME-Proxy-Cause: dmFkZTEdEDAniK+weQVIZ1l1HDd8KGWZLGLVNdKToWuh6sIbSIQOo5SVQv280pKVFx1as8
    BemCxPZn7hZx5ym0HJd/hRpkHxCRwHhRo7kbwK76mgPcEyInLmKnztI+RNzHNa50/lQ+/8
    en2+kncIwLVyB4mC2NE+JnEfSoIl0KATLsilco1zBbQaaD13c3LwG3mp2MqMl6EFd2g2ed
    CdU/9cpzBBGqZ/algTEBCHXEEM632zxyBnqV2u/8Vx82jpXuMYC19ybCSCIiLCziEcDm9k
    F1Nii6maGfsDsyygfSehxhkFM80n1yXTKt4rvrpGFJ3QtLrKcgOLeYC2vJlZIMENf2NuPq
    8+Nv7Y8wg6ltI4BZsXjZkVYE69Mxyw1SmIZP217QwtkGgrowNeZplndTU/+EU8u5wDO/gd
    sX4hSrJ2DTBcRHl6BlUZEL3y4b72r/ucUQuXSKmhmwMrg94x+2IoWZavipKOHx79Wb+gHI
    /+vqkjkhnwtlzBdh2PINLsdxxxm+lrLaKObnnajiY/DWIDIv/ViZ0M4r6XtUhaAuSXlY1L
    IVd7iog5l1I7tKKSo7j782hno2lvdDhpHITcjefWqPQrECdnH6ExcG0+pSj1zfPn9TtQFG
    RM+QzP4WsfB2kQNDchQxU/a1c5l6tOpdt3lDUErnQtJAJWSAw/gsZ0o5UPlA
X-ME-Proxy: <xmx:BTPWajkM2yXkoNDOlkXVohp7VLOO0IRDS2p_m7BmK-KUfm7TNVcbDQ>
    <xmx:BTPWaji2datVtOjxAR-tztLvjwdzQm3q6OXOVnvDdsa6Utz1KnsRhQ>
    <xmx:BTPWatjIYshkhfl0v24T1uHewzRD79SQC28aD8Zr256Am4up6GANpA>
    <xmx:BTPWaluHZyc_M3ZoHttFCsMWcyEmJ-6W0D0ZewYDbSteiMb3Yk860A>
    <xmx:BTPWaluxC0T1Ld3oR9OsJX7cMbnj-7Q16hmldBLApB9_KpWmcAbutiS_>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3ED1C78273D; Mon, 19 Oct 2026 11:11:01 -0400 (EDT)
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
X-ThreadId: A4NGtdkzv69R
Date: Mon, 19 Oct 2026 11:10:41 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <145fa607-0fb4-4acc-a983-8699d6a35169@slotpi15m67>
In-Reply-To: <179235137784.3135.3581519897998654848@kernel.org>
References: <20261014-tls-follow-on-v5-4-e76c301d4f05@kernel.org>
 <179235137784.3135.3581519897998654848@kernel.org>
Subject: Re: [PATCH net-next v5 04/10] tls: Consume empty data records in
 tls_sw_splice_read()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026, at 3:23 PM, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] tls_sw_splice_read() (net/tls/tls_sw.c) now returns -EAGAIN
>   from a blocking splice(2) or sendfile(2) once TLS_RX_NODATA_LIMIT (1=
6)=E2=80=A6

Agreed. v6 will drop the cap and the selftest variant that reached
it, keeping the signal check. tls_sw_splice_read() then reads empty
records for as long as they arrive, as tls_sw_recvmsg() does, and
the description will state that.


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
