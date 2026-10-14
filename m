Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C58371041
	for <linux-kselftest@vger.kernel.org>; Wed, 14 Oct 2026 18:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001385; cv=none; b=BscsYkmAPwyhxc39H0QeYAoXegnSAyoYEuudwQMRBtClNT8TdvITJaap657rkTAG32IzfP/CczzNgwlKCcwV7PCYlN8i51ltraZI1ol/o/4fTCZPWsW8AOBLJ6Z/sg6aX7M9Ha5vtzOthFx8s84YvCQRopPE0EM1RDoVuskBr94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001385; c=relaxed/simple;
	bh=+E4SNLZzzmpuLFOZDy8cnjloDNw7+PquL5oc6E98XVw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ic8AjGTniC+dh1qHUKkHe3H2xdGbUr/5pby3bXQ9i7zo2yy8XJWc8fS0cVdz/xIsM2tahlzOHxFSJicnVtIL2IGRCW/ih3saAvVZ2b612kyBIkIdYR3pExDfnlEKdzkE/TKbjERk8pPTsG4jiyrLvzTKky+VzzkA3/4cvgiSY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaqtxN/4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaqtxN/4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D6271F000C6;
	Wed, 14 Oct 2026 18:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792001384;
	bh=9FHaUR5PPKPknzOw6YLLCPqbW+ux2FWkwpo+fhzVYGA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=WaqtxN/47bg5nNRq+DqQuaKH5kElWOIWIBlrUUneygqfSc/gAo+SOIpIOX3sT3Vta
	 guP5tF5L0RHP7/RwpfRdkzXE6KIofUO3AuVaExBjgPnA2jS1OsZ4N81G1Tc6r6AOlJ
	 lJqXNg1eRaHqhaWiQT+oVRM625ht+W7fCa6SIc2k24SXPiiUpNMxkU9eS938P7VkPm
	 luF9wzD2fKo/3VhKMcAmenQZdsgc3JxktOoAiHaoZT3okWVno9h5MEcht7DA3MsF2B
	 jlAo8/uhY18W/HsFOzj15T9DLN35hVTw6J3bHgN1WBapV0xotniqVn9fCGe3pZPXKF
	 eae9i7d3V4fBA==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5C42AF40066;
	Wed, 14 Oct 2026 14:09:43 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Wed, 14 Oct 2026 14:09:43 -0400
X-ME-Sender: <xms:Z8XPaiWhMWRIKX3jXmK4mMM5_FzkvtxoWn8lQpgoWf3T3XmQdMMydA>
    <xme:Z8XPapauk78U2CDIAZXFw9BkdJoZWM1GJRtI5qG85iL26gW7sulKvoHlLvuN4uwW1
    kG7d4IMTDXpmvoE0DLsoqgJSutQRXd6XGQ0KGWMdvdlMyuNfFAChwI>
X-ME-Proxy-Cause: dmFkZTFPFQLzI43chX/V0l63iJh8EOoemOfmzHiMdblm/Z9yx6tb+oZHTVtdbgYO2o1n8o
    WIwQvUoegZlzNlS8A8u5Iyo+0JsF7BIdH5T4gDawcx3TKN721eq4WQ8TcinS5pdMafKOLc
    t2f89pZz/6dnqq4i6ikic2ZUw+F/JeHUZtLooeKz6/k2zgWgZIn1MDXPMoLCxHyRRepjji
    j9JwaOBZR+xSYK7Eg9XoIzRUV4a1lLaA8k9ASC4ohpC48U6EMAysRQRNHGPl+YHsVNmYxu
    UrjqIE8OOj44I66seYmXj7cZJyHnai+f/leMyW4/FZteU8PQwA1Isp+v9HTTQmzvmK5hja
    UAoea8T5wBEN9cwPsWYqXjG3xcGkfO5J4hBBlHNcfDnhQyUwOu/MD35bG6BDqZcXFzwpnb
    WV1D+VQ0WptAvuswfRgFj5S7l9QFVul+Glx3PcMqW+6Zwt1utQJoCm3AxHO/Adh4ZmQ7dz
    lMim1JjNLXednZjB0PFOIhrVF/TxXGS5E/H88e4aW6q7SxY2wmPCA4j8IFNuBoD2Krp9Wg
    E/XhJPXDoKOioJrzx6gqA7YkscOjIkH9X866mc4lBw0inLFGgaQ517MXFchomNgNyH7yai
    w1Us2hR1a82ODUJJn/SC+FDTmHrlAqQap4Cay18ZgmFXgEM/+ghKzAxI8G3Q
X-ME-Proxy: <xmx:Z8XPasIs-6eYwxc75vCPgU5gQGFd-Xh8AWO-wEo-M7JH2l1T4fZO2g>
    <xmx:Z8XPao2mqrypX69LDr2QPPiWDAItseuWAWxDQWUJUftkR03I2aB0Zw>
    <xmx:Z8XPagl7NfD-CGj0T8OqMKPy13x76iSiimpg3yHaxBQC_fO4pScTWQ>
    <xmx:Z8XPajhsYSud8fdwBtYxWmMwzP55ZPuciOQ84qSE4zsikxWyZE6N6g>
    <xmx:Z8XPanSxzBpLs9iTY2NaOFg1o_BefcVUUpnL4D1Wn1SgJEa0bt3d3fz7>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3111878273C; Wed, 14 Oct 2026 14:09:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AAhgNaIq9zTN
Date: Wed, 14 Oct 2026 14:09:23 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <07c2718c-8889-43f8-8eb8-296517300f7a@slotpi15m67>
In-Reply-To: <179190789686.434549.3175866622034449660@kernel.org>
References: <20261012-tls-follow-on-v4-1-8cea429565da@kernel.org>
 <179190789686.434549.3175866622034449660@kernel.org>
Subject: Re: [PATCH net-next v4 1/9] tls: Bound consecutive no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 13, 2026, netdev-bot+sashiko@kernel.org wrote:
>
> [Severity: High]
> Can this break stall the nvme-tcp receive path?

It can. nvme-tcp sets up TLS_RX in nvme_tcp_alloc_queue() and installs
nvme_tcp_data_ready() later, in nvme_tcp_start_queue(), so the
callback tls_rx_reader_release() wakes is sock_def_readable(). A
zero return then leaves the parsed record waiting for unrelated TCP
data. I have not reproduced the stall, though.

v5 will restore the work item from v3 to address this, with
corrections to address later review findings in this area.

pw-bot: cr

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
