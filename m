Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792422764;
	b=BPNntBaDc/6CqlgPwRVFG2pi4kyeWNy4FKFeriMnDz4c+R3SRDfrlbdvn7CNFh1b+sxL
	 AJ4jc7ylKbXqygbtLXK5Xouq58Kob0smdy+ebdMkVGmUt1yqPTi37HjjG995cL0CtebR4
	 yUhWjD6vXj77X61q3vOumg+N1+mh61zZ0VOsVmctLfjLn6lsK0bAcK9pWfvJpZnFJEAVV
	 bVgDD9wNnflE+bXsDu2Wuj7tQZw8SKbqHjhe6WQGfL3XwWAXuJ4NDm6SKoH7vJHdK8+df
	 7RJkSJ/QTieFpOsVc361U1zln8jpa33HqoIx9SlzA+kos8RzVgk+E4QRfmq3qi/u1NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422764;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=6PQ7rJFQ1MjXdxCdNwWjzLkv9kPmh/e2gKaO15xc1ZE=;
	b=v6HdAPeC8SOjODWCEF0JA6XXYYwOBQC1WA3Vh4PFKK0NTxGGMGEYxodqXydeBZojriAJ
	 wr/qHI1alIeK+ZM6jr5jd3gmkRIx2EeHbg7vZvu3AWd+LaVXl3VOvIVgU93bTbNLAPmj7
	 OZVKgImda9JCB/rIobPu/aJeYeMIzJRg9AON4oQ6gLeuvDeYRSXnyn4rvAbIvb82xpmxz
	 odKFL8Be6p7zMHMj47gAQTdD+fUvuBBo7E9ZlhX4LXCnqaIE7YUrU8/8s7O5b5buZ7lH7
	 hkQqa06Q6eV3JtMjExQ0uZSErQdL6Op0WD7ytX8bE/6Tg54F6P5s3JG2CxLW6QkSbGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JEWhMUW8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEADB6098A29
	for <linux-kselftest@vger.kernel.org>; Mon, 19 Oct 2026 15:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JEWhMUW8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6941F000C5;
	Mon, 19 Oct 2026 15:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792422763;
	bh=6PQ7rJFQ1MjXdxCdNwWjzLkv9kPmh/e2gKaO15xc1ZE=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=JEWhMUW8oI+9/GwWFrIGfwVWH6rWcYGRdsOFtMZ/YdkwEZZ/vc5v9tl5Qc9DCGcRB
	 gw2vKip7n19rc7WgINdlIL0Sb6XnhigjlPYFhfXByLcgK0xgG8+adFbk89OzfIjKci
	 qv0As2BoEEfdGSh6yKlMmMfT7R7I+59gv7NuQWdXVFzpCExNod1rv/ZDtNLVdy7eFG
	 6xQAsu1yuCLSFe8jSh+vmLX5iNExLCW6SXLfDNa42T+gv9EyhHFEEBb8Nw9XKBTCuh
	 wlyFe0TeqGVc/i0dliRW7N1ZOILc2wxAGV/CuHoQQ0imCQtNqUsDKldLmSPHdZWEk3
	 f4vjXmpsRU53A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id A510BF40068;
	Mon, 19 Oct 2026 11:12:42 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Mon, 19 Oct 2026 11:12:42 -0400
X-ME-Sender: <xms:ajPWah7lJlVBNX4JpysFXHksOTTaKF6xNsORa997_9RMuSfIasKeoA>
    <xme:ajPWaptVn0rz6GstUpqbiqUjmrBdW0P4kVSosYfjfCyg6kjFbuTPHTlImXHyjSJuq
    vg1XC1UHZI6Box35Rnl9YGHobOBrCyQ8zO3HnxzahmmRCAfKUGcq0GE>
X-ME-Proxy-Cause: dmFkZTGqjfOSmA3Aau4J8Ozzk8oOartWuKRv+z7G5P9pRafGgeYlsmM8zHgSUOTvWrHV+J
    XLlA4sbRRk+um29mck8d5VO3yoAthdviqjyiHvDUo9ZvOMzjNmkmUdndpUFF9rcSwYbeST
    ZZSJWnEuMDa00CvtSxY5MKc5kQSLl5FhDiqzG24oThSuF7g3V0fhKn17P5mQgcWQuxNWZO
    2Nh92hlCXu4njSKlocubaYPOPMSqEGJcWBarekOLgFiAFsDyn7JnDPVuCVkpW/SRPDxrlP
    j3u6+R1dgh3qO/9RZGA27RSR4Agep0cG7DBWgi6kE16F/GL5mGz5GNQVBGL/WxsMZsCONo
    rcByMia5bBc3WDYcl2ZLxjh1pH/v5qp+5IN9d9Ri+vsOC8TU6tyhPqi/w+LQFKeJHTmPvy
    7toXEw2jG5QT1wpvNMWGBaS+HHEp7TndCrw7WIit8yFEXH1rUYh6iy8SprYBHp3DCdNiNE
    wAQM6kE1b1wDk8bOT1oktle7cDYUie/FMqyRoFxqycwF59FvbgPxjvKHkAR5q2YqFS6LGm
    t9TVX8mo8XEFACgdqOsVzdqO84tHidkSNoFZYyvlfsmkSTW1nllIWhI9jk367sozpFL9KD
    CXM3/nJ91LqFPROQI4utSRbP66M05n/+2RcotnhvtlytdXFWEA4hzR5rgmvw
X-ME-Proxy: <xmx:ajPWaos8_IcneFswrilFzhh4Eh5gXQkcNE8Zwjn25ohnyc73rVtY3Q>
    <xmx:ajPWaiL1mOx_XgYj3N1q5Slu-x6ZaklhAcSpJcWZks13iAMRhFRgmg>
    <xmx:ajPWanrOohoXKPdb8zZ-hc9bU_wryruLH3_XcuYu2niEw8Z3iH_3mg>
    <xmx:ajPWalV5EV-q0Ae0aws0mhW_SR-kjbmeYHbAqSYnkEx3u9ACxgKMYA>
    <xmx:ajPWas1URoVwWf7tl3CXE232jZAZnXQJAahUVpMGMSPDF2j0gs6UFoYv>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 862E7782738; Mon, 19 Oct 2026 11:12:42 -0400 (EDT)
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
X-ThreadId: AOepKXJOuym3
Date: Mon, 19 Oct 2026 11:12:22 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <d5f50a80-6c90-4266-bd31-c9ab5ad6f5a5@slotpi15m67>
In-Reply-To: <179235138070.3135.12865177018877469954@kernel.org>
References: <20261014-tls-follow-on-v5-6-e76c301d4f05@kernel.org>
 <179235138070.3135.12865177018877469954@kernel.org>
Subject: Re: [PATCH net-next v5 06/10] tls: Return copied data ahead of a run of empty
 records
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026, at 3:23 PM, netdev-bot+sashiko@kernel.org wrote:
> - [High] The new early exit in tls_sw_recvmsg() (net/tls/tls_sw.c:1946,
>   `if (decrypted + copied >=3D target) break;`) only fires once the lo=
w-=E2=80=A6

See my reply on patch 2. This patch returns data already copied. A
reader below target, or one that has copied nothing, keeps reading
until a signal is pending, as the description says. v6 will keep
that behavior.


--=20
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
