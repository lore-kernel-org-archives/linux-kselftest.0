Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794672720;
	b=4khWJf1CIxAvUryqwz9QMkVWSzfRoGx8hjpB0YhDWfnV3hFI0dT143PPSh+uawGhmUhU
	 c69MY6kq0FsEZNDmDbAf7N/LSBKcwUGry0SQ5WEhbRIW44TGbo3tdYb/DX4XB5xaAzTbC
	 FatG5uC0jT0TfQl5DUkDdWK6faSmEOlu6VWRtFka42CW9AVqUHabBja+wfI4Xoa7TW2Ox
	 hAtCCPTxjDiE8vP14kESSq/dogFkyX9+JDE7vimwBRbC4MupQHfUy9cwgBfJB6GuZ2WKr
	 sFaEudY/AcuSIrU+F2CoBftbwFR0Hvjg/c9JUqpsrBxuspkkLyjEje+/PM7hR+qnCng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672720;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
	b=NQhAjOAxqfG4+v1kLkzgNwtoQWXF9cQOqsFZOXHJjJ4JzuPXfI/in3y/GnKm/bgx9vP0
	 ktCxn47h5msBnl7im6o5BkD85sDBi/zMC0oIt3qncZ9qWSVXr1RD5o22jjgkck9wEgLKp
	 30dlQGAM5iIaTnuO77V+hbYO4gWIkWo0D+hGkdqXurmK3hkYzkhsUfllZ1st/mjiYXgQ0
	 ofMcGsg3YpJhYnsHIvEUOtXbecj2ipGeDT4vlprYU5Mnhd+fuY8pombPl0RC4OlU5fkwa
	 VhScGxC1uuKoKsGwZzvstsTffSL6OE198YAYS6YBZ1QmLuHXpTdb+sFoiSzqFMO8+iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0A606A331
	for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 16:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85B0A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=bCmLBMrs
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55c7445cf85so114601cf.1
        for <linux-kselftest@vger.kernel.org>; Sat, 14 Nov 2026 08:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794672718; cv=none;
        d=google.com; s=arc-20260327;
        b=mTOjZ9eUsRG1PRxY64Q7fK8YT2O5odC14C9EKGH2kSBlDe441swJuFqeSl5Vt7iNtA
         R2iw9gRB3AIV2sL+7FvJUDkR7aMHgIGSYudX4V1UNZ96uGFEeUQN1DOtbO+729gLNWsg
         F2lB5pVqoILTkYvwbDneJagv0nUUvQSyunUNxOtR/hi6jzvpgjvX9VF2jHXxowjodUAr
         oNFqzkQak9GlYebbkJcZqO9bU7Nb3XO04aYdNHqzkHRv8WaUYLMNAHkS7sVFAb1yGsYJ
         PCuBReRAQRZQd9sWJLbyOr6BfrM2MivRH9oykc3ZMOl7I+5WN1Z57hMMrRqo3VO2nYVe
         Gs5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        fh=qpaUlJoYsrd6HTiw6HHuRnm3wfp1HZZzg54RG7E/ROQ=;
        b=Nr7XJ2ebIzrqZHBCGW9S1VSsiQjOSg8u1J/7J5rtjUeQPObbnFumdAp+q9WcNEDSng
         nTyotqsmtmqvVTEqnUsCBYoPDLKwlX+bqSlwevDaJGKTEEkspY5Alw3p+r1yGc/PVgCM
         XcqI90fz8Jh40/t3tceQq5igdkct2R0ffoXjg2qJx7ZKDrDSwqgu/MCHQnKgNqbcdgK3
         L0zlF6OxBJ8SYDqxYWP0CKHbXiR6MdqboF6cahZ6VeYYyPooHoyQHBMi85W917uKJ70g
         vcDKbrEjf7fTcrSQTjWfzv2VA3xeAOVtUeLUXWMZ4aOuynbBJM3AWiOni0reBkyB2mkJ
         +Beg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794672718; x=1795277518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=bCmLBMrsoS+E3FJJS14wew7hWIzp/cpZA9aiKnclbK84765KkPFQee3u3wA/T/u+/e
         Bo+/LU+J7yY8R5ef1Nk0gTxuxnjUT3vuIwzINP7WEWgIvcBUSnN3GuU9dvzsUq2dGtks
         jfWz63UG9DdqOtOTHwd6lGqOm4Z6zzPdtdOY8pJtf3Knv3LM3yUHrl2mjfZ0HAlH83Hn
         iQt9L5+xs99sc4ist1nJ0zfTFqgYoaM/OBm4uKtKqkM3oKRhTX8oc3YgJ2p7w/TYVTBy
         FjZ+qy2L1c+ZWy9ooKdoCo7qlx3z2rkDAbdEeK+OYnBqX4vOqo7PRBjSocymbAgDnw0R
         B07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672718; x=1795277518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rAXOsiY7dgF8E9nvWQfWLqo1mF0hHpyBG3jPK7/IHMQ=;
        b=RQxOCKCuFJ/QN5TBFNMf5Ki/QOuLF+LEE4gYL2ew0bxLR38WWXWEG7i9ZnDX/2TVxH
         QOi1w2310vMdDBSWKHRYB3YQOsMnVDkg8UzlC1yGHGQQMjP9BubSKCVRdtIXkkdP2UG3
         CyJsy/DwRZohUNWpnmrKXIz8hPo8p5Qrx/Tswqd/Wl4H04Bk9oXbNZ63MIfe/aVbrqmz
         vjZGIUm818JrvpRDu6He9ObIy0eLPd0cuQHINrcKSk+mvcsxTvSliKKfvFq/zZw+F3co
         FdAX9T5U/ia15im6wbecFgZ+2WjaRHLganiKSAJp2cWfJN7IpkqkihU6bDgcU6P2Bb5q
         Z2CA==
X-Forwarded-Encrypted: i=1; AL+hErHX5QUrYwAduKwHc8JO7bQFEdm33UhJjXyoOmuJJHlcPVrmJ5bX06bA7hN2bzUhfTATYtqMkw3xnIn+aPDtjQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lcuriM0SNPTOn5rf6Nbtd9NMdZrGhJX8m0b9VgCAOGELtcrTv
	KUzc1Z+QTBn/u4ld99VqXW4lzpev7JHj5z7fQHyZ5EUW0ohvOpw1Zx7Ey95cBBECYpFMvQIQCoN
	zY7/bjVS0yquz+Y77TEoDBNKMMYfXuh2mljQjZ6mG
X-Gm-Gg: AYBFou2ath/Z9g5KR+baGfuMUBnFr2tPg5ftQxSvvJKxmO5SU1CBUaE9wGHmv73/Bqh
	ohu3+WhD0ykW3zGUy5MqDsZurs4uMVoCjr9KlHIl85gLe4yJbVrfQFWOaQxya5Lfbrzh/PcaCxp
	wHzsoXjBprVAeXgsAJ5YGX0xrBDV/69Abq0xn1rV0wySGlphmEzjM/FA+c6duRIsLiXJO3D1sLA
	VrN88fDSUiHUthZskvtfKg6POB2I9vvy2M/twed4JyqN840VSEcPeI67zNlfSRdu3xKqgc9p5YJ
	XFyvtHI/TPvcyr42Lik9LCCl2W4OitSaG1dUGN5Y+o+na148RtFttCC/4V4RdL/Rr9eZ/Ciw825
	9Hm4FdokuqEcBSCE8tIvH3v7Cp0aIbSTynOgchjoUeULNXdrOSnjNOwEDIg5odQ0LETOap8byJ2
	gaAxNOqskRwTWesnn4+/FfkbrKIUY=
X-Received: by 2002:a05:622a:1f13:b0:536:353e:8d2a with SMTP id
 d75a77b69052e-55c420acbb5mr16403621cf.1.1794672717702; Sat, 14 Nov 2026
 08:11:57 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-mtu-probing-series-v4-0-6f2e484ca8ea@gmail.com> <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
In-Reply-To: <20261111-mtu-probing-series-v4-1-6f2e484ca8ea@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 14 Nov 2026 11:11:39 -0500
X-Gm-Features: AclHuK_-nV7pf1PB8PO4ykYtxVbAD9myD3UdJz53eZ7VZY4ZOzGRrnnpG944peE
Message-ID: <CADVnQymNTE-Etw4hhAgCAz9B86qzpFye9vZPkE_W62c2hY4Q8A@mail.gmail.com>
Subject: Re: [PATCH net-next v4 1/4] tcp: initialize MTU probing before
 syncing MSS at connection setup
To: echoowall@gmail.com
Cc: pabeni@redhat.com, kuba@kernel.org, shuah@kernel.org, edumazet@kernel.org, 
	horms@kernel.org, kuniyu@google.com, davem@davemloft.net, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, panweiping3@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:46=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> With tcp_mtu_probing=3D2, a passive connection starts at the full MSS
> rather than tcp_base_mss. The IPv4 and IPv6 syn_recv_sock() paths
> call tcp_sync_mss() before tcp_init_transfer() enables MTU probing.
> With tcp_base_mss=3D1024, the first successful probe can therefore lower
> the MSS from 1460 to 1242. On a black hole path, the first reduction
> skips 1024 and goes straight to 512.
>
> The issue surfaced while developing packetdrill coverage for MTU
> probing and comparing the initial send MSS on active and passive
> IPv4 connections.
>
> Commit 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> removed tcp_mtup_init() from the passive setup paths.
> Commit 27204aaa9dc6
> ("tcp: uniform the set up of sockets after successful connection")
> later moved MTU probing initialization into tcp_init_transfer(),
> away from tcp_sync_mss().
>
> Initialize MTU probing immediately before the existing tcp_sync_mss()
> calls in the IPv4 and IPv6 passive setup paths and when processing
> a SYN-ACK for an active connection. Remove the late initialization
> from tcp_init_transfer(). This lets tcp_sync_mss() apply tcp_base_mss
> without adding another MSS calculation to connection setup. The
> crossed-SYN path already uses this order.
>
> Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()")
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Suggested-by: Neal Cardwell <ncardwell@google.com>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> ---

Reviewed-by: Neal Cardwell <ncardwell@google.com>

Thanks!
neal
