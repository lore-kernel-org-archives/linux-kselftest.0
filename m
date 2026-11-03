Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748773;
	b=RwS/2OMbtCdyDQOjmaXQWnKz6dSoSYdQXnQZfdpm3e4+Z6gtjpO4XPFOipfG80LDFfbG
	 TCaGr9CzLjlq7DHKw64fDOXnfG3j2J5ECK4/s/ynJBvIMMNP2LSl4suYHAQPUnb9LI3Sb
	 Nv6lA9zq2X3gW+d5dUebm/FyKFRPFVLlsfRjRpbJIkxFY8SuYhs2yiG4mBHz6u9lBDA1T
	 YysXtV974ZVOi3GjCzeMzcwBQpaajFxjLXv3igZWQfvQAuy87pXCUQY6d1K3KSA1ARqrq
	 RNRaZNsK1S7K6fV5l2YXsZBABrUITpSYKDh1El7d+wmvG7UV97Fa1e+Dwuj0hpqHKdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
	b=tun8TqvFR1xV93aJRLzmoDdnrXPId9gAZlulu5oQYxTPaYgVSBg8+PfitGZ/+MnXrtHT
	 gnQmejMMm0ZSfa7hSig7tPTHSa6cn8V0fQ/4PXcPJTZJPlSEnmgSKYn4JRzY2ZdvwuKMx
	 RpeRlRxlw+ACKzwrEb5vY1KsFynzytTBDwdLVd74AD86eBJnVm6bvNMuzPLYOawTU047t
	 0Zixa2+qzTw8Rlpm02RNDTdow9RK6e08kxDOUKIWHfTfyFQvNHxzHr5HQTblnwv6DBsNh
	 f5I5uJwdqDFeQoxRgjo0WC6d3FtrWImm6Qu4Mvivkbk1c6yfx/12PNSxSBixv9cvGpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAm9GhIv;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1EC606A326
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB1EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=KAm9GhIv
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ab41538192so152630a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793748772; x=1794353572; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
        b=KAm9GhIvM1i3lQ09CP6GFl7b6KUngZUbIdfMCDVP8Wf6Dy63FBDa9vkG+6GSxV9tUI
         WoVuXlmyuu8mTEXG4dXlKdpE88vjFBSLFbYd7ddyTXWEnX5Row7dRvJ0IcIEs8QprX1n
         R0kYIwLZaqpi6zAySJPBGlDz6r3AnRwd5tt9I9Nx4nzobpA8PuifSRThpiGEdtritx8O
         x+2pPBOxnJkXR2G/YTun8ZoZC45aYX1aJi92PUgdu4DgvPSwhADCeqo2pYPiSZ6OFGGH
         VcsyWyoUFWBz7pGQ3H3gfJ3jTl439DsVVTAQzseRUNXoL03a8TyJyc40KM6t2Z1ThQ7d
         6P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793748772; x=1794353572;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zku5BWLrJRdzbWUuQu8yNcvLZ9kOnl/61VOfHmMJqfU=;
        b=Xj2c7KczW/c7FUw+Vb3KtsNj/Oj1URAzMK55VwIE6Pgqr7v9+W1hNxOg9VbT+3PIm/
         GKZb4YrqjsL07WxejIo/6leGj6Jy88T0Zo5MrVRntO1gmnQu7477UXugBJCPFqBuYvM8
         7f68rD4Qb/Vi4J7Zs0P7u776gB+klzhN1uhP8Ge32bO04EhLY/maQGY/pptiSfx+qZfI
         CwKjjo2Lfv5X2g+0Oyfr3NZgOKwu/h0qa+e13zTr3X0u/3P0ePCYyXaDbdCNweu1ir8X
         d1xesp/PaDQo6+FmOThgJCKO6ddTMFANIwGxealfIVhsUFWYSVU73/k+LhWf08oIbHiL
         kimA==
X-Forwarded-Encrypted: i=1; AKwUvBxzePa2GDtCzRs+XnfPT8d8ufzM2xopvfTVoifN69f1vbel7uvx9E76aTgys9s98zZHKT8sX6p1dt1a1I2lTHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z//5Ow7vGlLHXuZnsaURv9hGGmKanPudTA9JEw8NbeIhognRp4E
	+dkjLGtLDrE5tGWTQBTOtKNVcdlhnfrlrAOe1+s6JqV6B2YlglHN2hT8yVbCpkZ78p4=
X-Gm-Gg: AYBFou0jyDhKrew49uZVJeaRWLY9P/khFMXx0aUoSH2F2qFrpbgarIFh2jM3TzMhh86
	rqGMPM2v+OETXS7bWYYRIt+Fd/zMsomY5Z8rwy1Uz9xai8zXd6ltwsGipEEOsYXyKg7o9JocSSN
	dmMAgYkEDZMe+EPlB+fIKyGJzFKXh8flVfDHSTPMB2TcwiwT04ppgMNxxUIBnp7xNMCratlAw5m
	yltHYw9F2EaYeWyM3A5aBpfp+RRY7s2TMOPAmdd+hAuppg3BahMT2BBZQt5ONcMjFi1yaAnDe0c
	4VO+g6f/cy25wajlEzL99v7CXk7XdibhvjFJJp7dgbVmSJdTDHTUCw4PShWJ9vDW/w4ZkZcW4yp
	sXdamrFeivlN8fHUiIbD7c+hb79gpVGX2fmzt4FrgQmLcZBNcgzE6CoHJvYUTwcrcePd8sgY7/S
	LltH3wID1RWeBkakCPQyiifaPukabNdkeEh3ZxFie8VzVICcllKTaAjR3grvyYh3vpGl/SyYWMv
	6ZgPHJ08+CXbE1jmrvTKVA+qOpMz5r+AaNpf896DEITySy7Gnq/k1rI9Lvz/XtPMULBtXqvH/iL
	Anw6JWyaQIeQJ+oP6nSyEWI2luuc6s6WOsSeZeW34Q==
X-Received: by 2002:a17:90b:3b85:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3ae897e4182mr12303028a91.56.1793748772265;
        Tue, 03 Nov 2026 15:32:52 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:54::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c8329afsm6343342a91.8.2026.11.03.15.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:32:51 -0800 (PST)
Date: Tue, 3 Nov 2026 15:32:50 -0800
From: Joe Damato <joe@dama.to>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 7/7] selftests: net: getsockopt_iter: cover
 ip and ipv6
Message-ID: <aupvIuOSQpv8nJ5F@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Breno Leitao <leitao@debian.org>, David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com,
	kernel-team@meta.com
References: <20261103-sockopt_expand_out_v2-v4-0-2d36da923578@debian.org>
 <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:06AM -0800, Breno Leitao wrote:
> Add an ip and an ipv6 fixture, pinning the returned length and errno
> across buffer sizes, the branches that answer empty, an unknown
> optname and the options dispatched before the switch. The clamp tests
> also compare the bytes copied back, not just the length.
> 
> SOL_IP answers a sub-int buffer with one byte where SOL_IPV6 clamps the
> int. IP_PKTOPTIONS and IPV6_2292PKTOPTIONS want a stream socket;
> MRT_*/MRT6_* want a raw one.
> 
> ipv6.pathmtu_negative_optlen pins the clamp of a negative optlen: taken
> as 4, it is too short for IPV6_PATHMTU and fails with -EINVAL, where it
> used to pass the length check and fail with -ENOTCONN.
> 
> Only the two hop-by-hop tests set IPV6_HOPOPTS, which needs
> CAP_NET_RAW, so the other ipv6 tests run unprivileged.
> 
> The MRT_*/MRT6_* tests skip on a missing /proc/net/ip_mr_vif or
> ip6_mr_vif, rather than on the ENOPROTOOPT the switch also answers for
> an unrelated regression. A kernel with CONFIG_IP_MROUTE or
> CONFIG_IPV6_MROUTE built in no longer hides that regression behind a
> skip.
> 
> The config fragment only had CONFIG_IPV6_MROUTE=y, so add
> CONFIG_IP_MROUTE=y for the ip test, and CONFIG_IP_MULTICAST=y, which
> IP_MROUTE depends on.
> 
> MRT_VERSION and MRT6_VERSION are spelled out; linux/mroute.h does not
> coexist with netinet/in.h here.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  tools/testing/selftests/net/config            |   2 +
>  tools/testing/selftests/net/getsockopt_iter.c | 372 ++++++++++++++++++++++++++
>  2 files changed, 374 insertions(+)
>

Reviewed-by: Joe Damato <joe@dama.to>
