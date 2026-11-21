Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795302186;
	b=OEze73s2Iao3gF8Ryvel5YcLHbq6f5KGhcBvOryUlsvwxF3KQJLAQl9mdF+BJAwIEvsg
	 zWacZQYkPoyKxnK/F8B2fenoApIIZwdF1gzmjvXIBff2ns0dN9YHl3/P2S3yAW5g8DcH2
	 hRYP9YCdiLhcpdmW2n1fGzvXL9DOkDgzB4wxSkflHl/iF9vCZJP1j5Z3dsCkW92Gw4cYq
	 BPcXt0moFVVG9Ygnewgj5dHaG6mpsNsgnZnT3Ydd1jLCt/k8hE0B5u7lLMJjMKYTNHkGI
	 KJ6zPl07v3P2fx5VX5kCyTkZbj5KQLteReyNLnJMroQzx7gnN71x0+VQNXC+YKt2S8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795302186;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Jl+r+6kZfTpxnCZB911RrcPgGJQ08OsuvMyIkII25KA=;
	b=HdkQpIabw+U4SZwDsD8JB5tCpVqkgxhqWz9L3y4/cMc5eQkJw6ZZtrxK7W7VxNBAz7Mh
	 r8DO1oIjndLjQBSt70/HPxWFKfJIjlcqcAT5g4zCh98lfCC0YAInY7K4zjqAkpD5rrLKn
	 Kton4l6DKjbEomukhae4YzbP808tzxDG0X+g3e5Ua55DSK46wDyrKSHvX5jZRR42eRdHl
	 DmXIFByGFRyw2sGOI3TfM1lIeTXhXylHN/JaLr2nDnDeJbZ7XIsyHy2relr8IRDqTpd96
	 J7ZW1uh3HIrXQ/wFdc+g8zJwNs0o73ptcRavLmSIaCKkZw8z80WXbKb902bUkN92ArA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmGPnFJs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 215EE60A2611;
	Sat, 21 Nov 2026 23:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DmGPnFJs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFFDF1F000D8;
	Sat, 21 Nov 2026 23:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795302185;
	bh=Jl+r+6kZfTpxnCZB911RrcPgGJQ08OsuvMyIkII25KA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=DmGPnFJsw10BeW2uJzzVnfFW/v4MXN8PkhXj2unGjv0TuDIGOKZEEhm8ciQopEC8h
	 gfzIIooQjV6bvME68xoN6Aqp0GEdw7Qytdtmix1wlt2u2uj7AasbFkGQdpjwcVFcjI
	 DddNcAHKLCH2eZZPHMAtr0wxsidGMu3Raf5EalFozl0gN0MclB6mLHRpZhhInHKqT4
	 hW+k1i6jXp7ZbNomLX2aQBctooNEKuGppvfU/Z1OGQI/9PQRFqh/uuAkiKgZfMEVrG
	 Mkq5ROC/orSr12ZsS5018+8cwLHgsyTZBiOt8EI875V8aD3jyLXR7FobGzbf6NBLfc
	 9XLUkE0+qgPKQ==
Subject: Re: [PATCH net-next v5 6/6] selftests: drv-net: psp: add rekey tests
From: netdev-bot+sashiko@kernel.org
To: daniel.zahka@gmail.com
Cc: kuba@kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, donald.hunter@gmail.com,
 andrew+netdev@lunn.ch, shuah@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kselftest@vger.kernel.org, willemb@google.com
Date: Sat, 21 Nov 2026 23:03:04 +0000
Message-ID: <179530218434.3135.4343666486290603431@kernel.org>
In-Reply-To: <20261118-psp-v5-6-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-6-b9ec840e0296@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] selftests: drv-net: psp: stale length n in run_session() after
  tx assoc

--

> diff --git a/tools/testing/selftests/drivers/net/psp_responder.c b/tools/testing/selftests/drivers/net/psp_responder.c
> --- a/tools/testing/selftests/drivers/net/psp_responder.c
> +++ b/tools/testing/selftests/drivers/net/psp_responder.c
> @@ -247,6 +354,16 @@ run_session(struct ynl_sock *ys, struct opts *opts,
>  						fprintf(stderr, "WARN: echo but no data sock\n");
>  					send_ack(comm_sock);
>  				}
> +				if (cmd("rx assoc"))
> +					handle_rx_assoc(ys, data_sock,
> +							comm_sock);
> +				if (cmd_w_msg("tx assoc", struct assoc_msg)) {
> +					handle_tx_assoc(ys, buf, data_sock,
> +							comm_sock);
> +					__consume(sizeof(struct assoc_msg));
> +				}
> +				if (cmd("key rotate"))
> +					handle_key_rotate(ys, opts, comm_sock);
>  				if (cmd("data close")) {
>  					if (data_sock >= 0) {
>  						close(data_sock);

[Severity: Medium]
In run_session(), n is set from off once, before the do/while loop,
and is never updated. cmd() still tests n >= sz and __consume() tests
n == sz. For a single tx assoc message n is 49.

cmd("tx assoc") consumes the 9 byte string and moves the struct
assoc_msg to buf[0]. __consume(sizeof(struct assoc_msg)) then takes
the else branch. That leaves off == 0, but the 40 byte assoc_msg is
still in buf[0..39].

The checks that follow in the same iteration (key rotate, data close,
conn psp, conn clr, exit) still see n == 49. They memcmp() buf against
the SPI, version and key bytes of a message that was already handled.
Suppose those bytes match a command string. For example, an SPI of
0x65786974 with version 0 reads as "exit\0". The matching __consume()
then does off -= sz starting from zero, and memmove() gets a negative
length converted to a huge size_t, which crashes the responder.

The conn psp handler already has the same stale-n pattern, but it
only leaves the two version bytes behind. tx assoc is the first
command that leaves an arbitrary binary payload at the front of buf.

Would it make sense to have cmd() and __consume() check off rather
than n, perhaps as a small fix ahead of this patch? Then a command
could only match bytes that have not been consumed yet.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261118-psp-v5-0-b9ec840e0296%40gmail.com
