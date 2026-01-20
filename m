Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781E63B8D70
	for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 10:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768904733; cv=pass; b=RAcn4HornxXUK6Yya6f6drvdAwk3gW11VmUJuy3ity/ifq/p1mp8Uoagx5KQdnMfbQtmG4pXSlBwSNOla5l78LgjtY1djL9g5YcHNMc3Zt7rfJ7h2cE4T7KM+W/xpYIwjqCdIS74JnzWM+jl+98+ehQ30dEJh7FeBjefqvqMcbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768904733; c=relaxed/simple;
	bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FApRU4MToaxSBa5m612SDjJms1x0cD5b6d7dcVv3JRMvlG4zkwi6ASUnxogfSNpc275nV6WX4gTaoN+j+blp9ugz4gXsl0yx/vyMHSWK97Z4nYcX26tv78Ypde1CHfhQHk2X25+plbRQKTjOI0sjZbQwx5I8p7S/9ovpQnxhXxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0MLoa5g2; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0MLoa5g2"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8c2c36c10dbso597789085a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 02:25:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768904730; cv=none;
        d=google.com; s=arc-20240605;
        b=D4lmtLBG3JaVcbe7cQ9PcGbRDLYi2hitZcckW5uHKl+80XEKmniwwFbGbNGOsOHftD
         JPupknffb7htaBMKCo5mys/klFSZl3hlEcgtbIY+7zob/gNmHUdIzXDh+QhKXyPAMplx
         WrlF6U3e6rqcyNAxnEmw//N6lgNLEttfAMavNPsjAI7kFtQwFKSLOoy9+T6tlJbpD7xv
         IsFRE4jvUsM6EuRMjHyTccO1t7rQmxXIFU6kbzbDzTPXyKtOJa0p89RK2lGRy/KkPQDx
         Fn8ZEGkUcorQvw3Xedy/IsT0hTMQ4eIeIcFNYA/dNeuGNhYBJkSmopggMCMWiY1RAzcS
         zZFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        fh=JQfuVaFZd1KLMAD+VB0HGNjusz9jVsZd9cOkwCMR1Cc=;
        b=bmlSa1H1NFwqWuJp8zdBs50qGpOnMLCZ2yOxgavsNiuMCMCHcfD4cuJto7TxIMN35W
         fgWoDddQyDEo8tnzZ7oqnfcLgIvXs6hg4yDobpBeyb5u6WLjsGrHpXuAfU4agXYs7kzH
         1kHsxMXxVVzLUluvS9ULjoWpcU/qk/evJ7ZzeTLZE4+tqHoJ2PmWZrpnz3E3ztnroL6F
         tRLy44luqCWoRVzI5Psl7VspUPrcHZRg3GmMly9mnHpfFk3g/gMBcL7ATexevRieaPei
         NZuMYTNA1zZyMBALR8NBw2KDhHIFdiQnOPsNlHUJruAKAzBMXB19zGcUyJ8NKR8EcyGo
         1hDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768904730; x=1769509530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        b=0MLoa5g2PfCyeo+1/vEDpd8wWDjQmTPWqQUdJjSPPpiq7qmcmGeDLKE/WzgLwrpKAQ
         3ymVQTGSykLqPZ6elyTjQFZO0QMIK5Xyd259NJ8hEgd4CPlKptQHqihhy/L3sEkKQ3pP
         fBoA7vUHQi9bE3vArS9v/adTBoCvpwPN0OPuQyehyEEumx/mmDbYCoIeEn0EsmTTLTMX
         bOZGsy/sR94ywAORlTNcYl0C1ZNMTqrulnEney6DmlSEo6auplShGYvW3x091LJS1S2R
         11IWC8b7mArisAW38h4Db0zJfR7fPWguUT+qkHzJ+/f63kuyDkqxkaNFJWGJxJZtI7rU
         Uqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768904730; x=1769509530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wjJ+Nws351Qs1zaYiW8MF562GhG0txIVy0NZYF2vpvo=;
        b=RtlrtjA8Q4G/pGjDvTpPownrBFmcqpDg+vlgVe0lhGzFAGLvwZBIsoZ3pkWpKyZWKd
         JkrYeG+nRcLoa68/Sz0FpEo2S0HUMj10GQ6S8oPTQ2NHP8efjyLX3Np/sR7bXz7WfjSZ
         NnVmM4ItikPs/I48TQ22EgPInzxzzaTQkVEN4iWo/qiX643BwMOSAFL0BB2ChfJh6YPJ
         R9p4JZ7rLhNNzX9h5Cvesd/EnmxL+CvyRX6QOi92zLFGsaPzCiu3l6g/JaJzrRWF+n51
         t9iAyOd9Amd/ZtTGrqDWj+BOQz5+JaIlT5QiDKq6GYh3rgy2D3lwp4KC0sKMOWNkUhf1
         8I5A==
X-Forwarded-Encrypted: i=1; AJvYcCWo6xUkI8jkGfEq4Ef10JrJfk4GTkqLxlr0D8NqFMSWmnfh7NKds43NOinOrSovwKJmu9pZL+Bbh28AbuZ9w68=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkDUyFi3AEdtO325xZhNrrn1fE0pZCGsQIE7A2Hdq+uoHq5VJ
	ZYfx+KSdc0hVwqo3EbNdDjY9eE3K6x4SmGV2cQkHUl13pnvu+aq8EpXcRbRwRBmAq5Qwc+wZepo
	u6aEw6u1XfYzR6HM0OMxHg1ABacfAdrx7HPZUW6jN
X-Gm-Gg: AY/fxX56b+GjCLiYyfVkO5ByW6sJwbZaJmQnJGrVzlybPB5dySVFWBjvdl6x2e96Eot
	8eHiY+oVwX5il8fssDUn9It8l29IqrwfAfKTRcxL6INgW6uLUV42Wq78puowhl5p8ZnpLAeseHd
	b8tUd/WyMSb/hZripXwaNxS0wabKQJB5+UEQkxm2jD/eAuE5R5uIQk/Kodexsef9boYuh/jWmzw
	PFIop0Tqhmwk+1fnGJGhmaEC87HWS42nTHydlixPChnWNCCkylhMPyckdgTcJx/vZ89gu5liUWK
	T96dpg==
X-Received: by 2002:ac8:5d4e:0:b0:4ee:1c81:b1d1 with SMTP id
 d75a77b69052e-502d84d36e8mr12347611cf.22.1768904730033; Tue, 20 Jan 2026
 02:25:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260119185852.11168-1-chia-yu.chang@nokia-bell-labs.com> <20260119185852.11168-9-chia-yu.chang@nokia-bell-labs.com>
In-Reply-To: <20260119185852.11168-9-chia-yu.chang@nokia-bell-labs.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 20 Jan 2026 11:25:18 +0100
X-Gm-Features: AZwV_QhXZCQk1XE-q39P2gd1Nz-BCTJZ9hlSkcwUiVU-61knB_BOINgx5AQZsrs
Message-ID: <CANn89i+6KjPh916bSTJ96=mDtR8d4kQ4LNs5eqfJHZnRGMx1bQ@mail.gmail.com>
Subject: Re: [PATCH v9 net-next 08/15] tcp: add TCP_SYNACK_RETRANS synack_type
To: chia-yu.chang@nokia-bell-labs.com
Cc: pabeni@redhat.com, parav@nvidia.com, linux-doc@vger.kernel.org, 
	corbet@lwn.net, horms@kernel.org, dsahern@kernel.org, kuniyu@google.com, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, dave.taht@gmail.com, 
	jhs@mojatatu.com, kuba@kernel.org, stephen@networkplumber.org, 
	xiyou.wangcong@gmail.com, jiri@resnulli.us, davem@davemloft.net, 
	andrew+netdev@lunn.ch, donald.hunter@gmail.com, ast@fiberby.net, 
	liuhangbin@gmail.com, shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	ij@kernel.org, ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com, 
	g.white@cablelabs.com, ingemar.s.johansson@ericsson.com, 
	mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at, 
	Jason_Livingood@comcast.com, vidhi_goel@apple.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 7:59=E2=80=AFPM <chia-yu.chang@nokia-bell-labs.com>=
 wrote:
>
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
>
> Before this patch, retransmitted SYN/ACK did not have a specific synack_t=
ype;
> however, the upcoming patch needs to distinguish between retransmitted an=
d
> non-retransmitted SYN/ACK for AccECN negotiation to transmit the fallback
> SYN/ACK during AccECN negotiation. Therefore, this patch introduces a new
> synack_type (TCP_SYNACK_RETRANS).
>
> Signed-off-by: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> Acked-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
