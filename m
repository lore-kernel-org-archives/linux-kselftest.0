Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422718;
	b=05ub5uRIuOOezla7U1aGCu7oT83sCK23V/fYMfB0yMH/iHAfUZjnWrDiWGmw4Gz3oY5J
	 lx5IbBnyUdxvKKa2RSy7SI0/d6wGl+1kgl8Ofm2eVESG2RHlvvYbt4W7ar3TyfcWY+02u
	 uoeGgPwt7nL8dbXzRUlVw2JUDITV8bFansKUkVGFNi6Q6QRRhyDYFi3ZlTDynm/DA5X/v
	 I8KrSi4aZEoK8hGa4Hrlrfy0KY+EgxH3YIhrYHcsRirR66MC0Mlue2T+85gnrpLjpSQqs
	 F05CG+kZ45BLLRSEqpyHyeGQ21jR61LqwqtsYDlVGlkU+TcGgfE1GQPjQjluZNqSFCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422718;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=IOr8tP9WaxFdfAOo39mHK4RggF7GLTDIwC8oUe4sANI=;
	b=3kLu227NagnSV+1lFMKatmqekx1outgB8aYEP6/0seHHuf/X7z1CK7UgZILN65yQ0Rut
	 ybQqCvGPMH6m4k22ihp9SQq6inRYUzu/lMdvMlQ3Wn2SVq55b33qj3njmZVGMnNO0pYMn
	 K88nspY7mW8M9LunzV/TK3NYlwTKxmo5b91f5wnjczS7PcuvrlJNP+0skqeGW42L+MZk4
	 4fNDTOP24hEPuOLbDD9pRq5qKotmiR6ofU4qyiMF4+Bb8TTIVTfMBKz0+HYWCgHjJrrro
	 WjzTcsEEPZC8ebtxE9cP14uPo7MIRv6uaOojTgtBtxSd/l3PTbBIDcBsrP8+ByyBc8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBrdbamH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3B0607D353;
	Mon, 19 Oct 2026 15:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aBrdbamH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D10F1F000C5;
	Mon, 19 Oct 2026 15:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422718;
	bh=IOr8tP9WaxFdfAOo39mHK4RggF7GLTDIwC8oUe4sANI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=aBrdbamHwaFtp/In5WXudMm4Vq5z8FHialV2pOinYC3AYuPTgDGJzKbzIFkt1UqPq
	 tF9bZxY6F7F9Onc+riLsDK2mHJWJ+nkqTCSJWXyzYOUImS4PBziAuBEqEeM8GpqZA2
	 GOHDzay0H1dn3qWAAQjmEmlak11sy930d65MoXEnmS3qucNmfwezrM+CY9T9GhcRnz
	 FcAueTLGw4RGHkoGMPgke1SdcPnMAxGsCOE83seRdtxzY8Mwx4B1lDXueHaafu30s8
	 azAq9XkFMg8E8XMeraZTUHP4P6NuD7Svj4slMHiIWdfCi3VZ33YZBHV58TtNsYMFzG
	 UOw1a6UD5gx4Q==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 83CA7F40066;
	Mon, 19 Oct 2026 11:11:57 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 11:11:57 -0400
X-ME-Sender: <xms:PTPWapeOmsBnwwUL7qrLpFI7arNc1Cu1ST-sGo-e49qsi5jCmMB3CA>
    <xme:PTPWaiA0rR4vwhUaqsSV2ZIVzINIAygntESl9KCWa2uspnme5a26Hk8zFaN1vhiTu
    gPJmrxdUuUzBPMHqeNH3TQBEE5u_jNwHLPV95U8V_shv0w3aKCbETC5>
X-ME-Proxy-Cause: dmFkZTEiFjWiUgOfIOMQ4EUMDdZLzvVgNNGnEgNHif7VXc9gPvezXknPkPZlst3zI6EuIC
    hH61iiN8zp+X8xZLntXKBl5Ogl6RusltAHWU8VS4CbCGRthZP+zkKJCp8xynNLqCxDN+Qm
    Olwbz5OEsbkmEMCHf619qD7bCR+iXTbyErrvuh0x9j6RLNPZt1OZP3XTEGVP6OVuF3Z4z3
    5ciLOE8V3HgCwYvSXYUsYVWzl645p94HOqjV9xubvaK7NaLcBTcNSq9CokFuBjF4mIe8Ly
    wloCm8bCCtk7CSNQvC8frMSC9tigY8VJkF/90vWYzIHi5xcDKUu82zQQ3CseLVIcmqEjWi
    97gvaNg3IjnS+nbnAv4o4vCfRrX+LDa+C7xRGhp9RcHX8Zkgv4MP0AGQPREJJRSNW5vFj6
    UjcWBzu+3FkL9d61iWTIoaDg5qDzpBqkgz4iStQ5lYnZeaveN3qVZyDWyydxaBNREO8rDQ
    ZZhem6/95wwdNmsPv1mPXF/GhIzg7mCNzZXRSfErGMChor9pDxHs7IEDjHe0wfd1ihVVz/
    5/LyiZeehxIXmr9/p47opxSTMZ/5i5AY+5DYHPot7tKd/UNv1w3XabvLAtBBv/tkVbyn1z
    FojnVkwUn5ZbkionCj6JJV/Qp035oaOQP58CVFISXcPlrkhtZ/Ii4f59VDQg
X-ME-Proxy: <xmx:PTPWatRp8Kp7eR8_IX2J7Ir9hAbvk1l3fx6DHuUfFRxmvoj-Tl9uyQ>
    <xmx:PTPWajfTizz2ijEevews1SwqfS33IXbneEdQY8gEvwemJoDNBbjRnQ>
    <xmx:PTPWams77km-I79pqW3zVj_iN49hfb_zeod_se1AvYCZwbbfnh3w3w>
    <xmx:PTPWavJhO7JwRkR5S_KU-FXVkr1MQCW6Rt7Ezou1BcktDytPQfx7rg>
    <xmx:PTPWaqZt1ysR_yHElxkgrhyFLGhlBzyvJTLvRdnkEjgEQoFb_qS1h8TX>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 638F5782738; Mon, 19 Oct 2026 11:11:57 -0400 (EDT)
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
X-ThreadId: AX_0bg9EglMV
Date: Mon, 19 Oct 2026 11:11:37 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <55df0a71-5ceb-49d8-9b7d-d9e584aec6a6@slotpi15m67>
In-Reply-To: <179235137916.3135.16553916944020990232@kernel.org>
References: <20261014-tls-follow-on-v5-5-e76c301d4f05@kernel.org>
 <179235137916.3135.16553916944020990232@kernel.org>
Subject: Re: [PATCH net-next v5 05/10] tls: Consume empty data records in
 tls_sw_recvmsg()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026, at 3:23 PM, netdev-bot+sashiko@kernel.org wrote:
> - [Low] The commit message gives a reason for the new MSG_EOR: "The new
>   branch sets MSG_EOR itself, because the record no longer reaches the=
=E2=80=A6

v6 will note that a MSG_PEEK receive now reports MSG_EOR at an
empty record where it did not before.


> - [High] This problem wasn't introduced by this patch, but
>   tls_sw_recvmsg() still has no limit on how many consecutive empty=E2=
=80=A6

See my reply on patch 2. v6 keeps recvmsg() unbounded, and the
description says so.


> - [Medium] This problem wasn't introduced by this patch, but
>   tls_sw_recvmsg() still returns 0 (read as EOF) when empty data recor=
ds=E2=80=A6

AFAICT, pre-existing. tls_record_content_type() latches the record
type before the empty record is consumed, and the existing
0data_0data_ctrl variant encodes the zero return. Changing that is
out-of-scope for this series.


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
