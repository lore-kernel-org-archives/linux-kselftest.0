Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7D37268C
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791301486; cv=none; b=iGXfedNz/1ZxR9i01n0T+alT/N/OxA3FEjx7F5veOJpyFUf68cC+OWL3yuDsXwTBquVU4ZXDixsr8lBSQqsqsHm3JTFzjtUe2/40FUdYpZdnkA6avoSS94JzBODBGz7GEUnVyartMKplE6pbYl4nhX9Wv4KSt+L52sMrSiTCigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791301486; c=relaxed/simple;
	bh=XsvQjfDkVZa+LETavErrBgkiCBsGQ9uatGPn3tSCDoU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IvLCOZ56SLpThXHu9VO9AybE/bSBTAEIjd6BRBXC/Cia/lwUdy6ooXjFtrW0Oi2UDXtmkkNhG/oyVO/R9RgBSa+UXXkt4AqHlaEtah59r42uoIFmv9D4jt8ps1QYGy36ko3V/8JWndpNR6rXQyMWcJpXsXZeTBVPuuGlT9N4ckU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBAkUAn/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBAkUAn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C084A1F008A4;
	Tue,  6 Oct 2026 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301484;
	bh=L23Vnl8jFLMACTm1GD6UtjrUX08Zj7ysjYWT62ALUeg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=JBAkUAn/XE+XVbeybgMEKOywnOp74S2weAgNM4ALb/yq5E+HYfwf6HF4rkUmseYOh
	 BXMs9B7LkUX/s9/x2l6zfpc31a8wa3QjJ8Y1puSb/XdPOGANSwRCD3K37Hu+WYUerv
	 2109Aurgb7UmtPwh+oNMNNWSawmh9mOeCPLNj16TWZO31L4ZsfClJwQG7C7LQzAoiQ
	 GCGeqTsUJlWsPpfZDQFOjrEAHCxEV0XV0o6gduv0t4YdOURqhsB2nVyQ9VZgYWi9j6
	 HrdpJxK+MZmjjPR8u2Cy0uxV8WAE9+dzIy5zQJlWD0VspkAMuyBkyAaEWeAQkmw+rA
	 JwXA37cNrC64A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.phl.internal (Postfix) with ESMTP id 10CF4F40068;
	Tue,  6 Oct 2026 11:44:43 -0400 (EDT)
Received: from phl-imap-15 ([10.202.2.104])
  by phl-compute-10.internal (MEProxy); Tue, 06 Oct 2026 11:44:43 -0400
X-ME-Sender: <xms:ahfFagfQmMF4H1-HEtLPol9CMTdJ8DvqIxQf03cXT31d_UUD5Aphzg>
    <xme:ahfFatCw-Wz96rA9knuFo-uKgvk_RhJ4I67olK0cBvUvhZoPa14OZ_tqOXZANUTw7
    vJ9zw_7DstdCSZo9nyMQuzEcSq780Dt4PPRCppegaeGzZzeRGJS9N0f>
X-ME-Proxy-Cause: dmFkZTEQPix+upUBUnkRw+jiByjdrgRuJerb+Qyqre2eOJ3UDtIGwvK7dZMWf329ahx7AK
    y/gu69v4enEx44P34NuDkM2gbSJo2kq24v2kHk4bIn2SaR4h2tE9KFQFUYk6uqrlUo3tHF
    J75i5McnUJ9C3sr2E48Ag76i1Q2z0RyS8JuNA1aEJMW0GFsrfBPUixkBdUGpfdQjgVT1wP
    RzKLLPsVt5qFYWBhMhMwNVCuW8N9KCJ8xmWC067MEfkhdRPNd+vmO49EOOpTOaBI0kwZqF
    ajEn5ffyuXK3vngGCMwEcdSuw16oUexXVfsF+twFHAhPeqJWqoI5GbphCNMazAd4uIEVnk
    sRNVYy4AcPoP/q7OtTr5qZUtLBoe3yITgzF+OvX9MvHajEezEbrDAyRc87hBiZ3F7IGktL
    FSrjZdvyh5m7ykRKRB7rGYsMQCfbOnqD2ZlaH1cuOQ+xY13+5dNlivcFFImE5KRVmOkTBU
    9xDtiA8FCMGKuXnsUDQn6fI65OhW8i0PBzHsVdAfgjihH5gaWo/kmTyFjeOwa+mOt7LNR6
    VXM7MNWLnH30OLdxnkn71ukOg4u2FfrZDBGG6R/nWHMDI89PWq+vhSeWS04tpykYNRAHQD
    BA9YBQdPIa5Tq5VlwOfZ2z85s7QDdR8GTOSfFOq5tYjSkDdS82HqjPeHMfqQ
X-ME-Proxy: <xmx:axfFaufmfTEVbUFz3LLGqM-1YAiq59dTz1VdvcGED66pDxg7id9QBQ>
    <xmx:axfFalu98NjIrWnaCrLhpzcOxxR77c6RsCKteHfSUlZ8yzkf1d0eTQ>
    <xmx:axfFaiJVSsBD89UFb1DRBRBbeJ81DYVSRrBIM0gT9rx3FHpf8BXP6w>
    <xmx:axfFahYZ8maP9mXCpkpmd4Rfu0RoJ-bNt0esG2hY7qk0JD61kWpsfg>
    <xmx:axfFatm5ZrwT2b-_RSvlQ0hueLJymQz926bo8CLGGN8I-nRtvCBUok4s>
Feedback-ID: ifa6e4810:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E7376780075; Tue,  6 Oct 2026 11:44:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Argu_m54Pkc-
Date: Tue, 06 Oct 2026 11:44:22 -0400
From: "Chuck Lever" <cel@kernel.org>
To: netdev-bot+sashiko@kernel.org
Cc: john.fastabend@gmail.com, kuba@kernel.org, sd@queasysnail.net,
 davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, davejwatson@fb.com,
 shuah@kernel.org, qingfang.deng@linux.dev, edumazet@kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <8cb468b1-0eea-446e-8d22-fa67442f5749@slotpi15m67>
In-Reply-To: <179124254155.434549.7182507019185765398@kernel.org>
References: <20261001-tls-follow-on-v2-1-2dd1947bb642@kernel.org>
 <179124254155.434549.7182507019185765398@kernel.org>
Subject: Re: [PATCH net-next v2 1/8] tls: bound consecutive no-data records in
 tls_sw_read_sock()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Oct 05, 2026, netdev-bot+sashiko@kernel.org wrote:
> > +			if (++nodata >= TLS_RX_NODATA_LIMIT) {
> > +				/* tls_rx_reader_release() calls
> > +				 * saved_data_ready(), not the callback a
> > +				 * consumer installs after the handshake.
> > +				 */
> > +				sk->sk_data_ready(sk);
>
> [Severity: High]
> Can this direct call to sk->sk_data_ready() re-enter tls_sw_read_sock()
> and deadlock on sk_lock.slock?

Yes. kcm_attach() accepts a TCP socket that already has TLS_RX set
up, and strp_data_ready() calls strp_read_sock() directly when the
socket is not owned by user. From softirq, the nested
tls_sw_read_sock() finds reader_present set, and sk_wait_event()
calls release_sock() before it looks at the zero timeout. I have
not reproduced the deadlock.

Making the call after tls_rx_reader_release() does not fix it. The
nested call then acquires the reader, consumes its own 16 empty
records, and recurses again, so the depth is set by the peer.

The notification has to leave the reader's call chain. I'll rework
it for v3.


> [Severity: Low]
> Should this be READ_ONCE(sk->sk_data_ready)(sk), as the TCP call sites
> use?

The direct call goes away with the rework above.

pw-bot: cr

-- 
Chuck Lever (Come to NFS bake-a-thon! https://nfsv4bat.org)
