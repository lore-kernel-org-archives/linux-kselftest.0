Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742435;
	b=esxdNzur9Ap3eMSaKfPovckogE5FlpD/5ANjhZqieG6RB8s7gZcZh/8RvWe9cKnX/WTx
	 Yp5isC3oXDPrBYKZKpjE4eCsJnqU2KGdUBmFjlJ4sLQwOXS3X3MMM6kNe3eYUmCI00/DO
	 NIrNKBkbX2iRlRGqKnabY2vJBdqi9I7h4N3/tTiauftvdz2fVJKvkWigCs7MYdJwMNM6F
	 XtNP+DpJPsLLbHkqMOR99W/RWpp+18wSe0XqxwX/VrbIPBjhHgRkST+hf7WqRloHTwWV1
	 E52FpAHh+d5KcVX4KEszPYj7fFnZvn+IuQnZisX7MFd1OeU28d2xGpvoA6eQNyvmYPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
	b=K0plC7SwHBnehybKr4v7oHN/8akUPtG2O9bfI3iIFXilLZaYHhv+N5hOP0qcpOEZRYn2
	 AoldvT01cmdmu5RJrnomQ30I/tjebH40B2R6+zdZr6LcEjUzGMEos/GeN5uMpLrRAomJC
	 bWSfk0GWOXp4aWAgvot477M7kJvI/OJ3dkGUGHqjq4L2NovpDdnggneo5FMfTf/zjcfVm
	 BPmpWakHlMbN/mxXrPf10QiFlwM3r1x6ISaHc5uWj7FBYETvPykvub0aedwqYkfXvMRZk
	 ZGLTqrJg266KrFX2g1pBuGV0t9v3pzTCfYKWUD7B5Ce8q3ogmFx3HBZK6vHoXUyr3oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rz9zp9i3;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDC5606A329
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 21:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDC5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rz9zp9i3
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso65417a91.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 13:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793742434; x=1794347234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
        b=Rz9zp9i32GrLsqYq1Wv4k+MOEXRHkge1QpJ7C6/aNofnyPzJwsED2mBJ+BO36t2Hut
         U/X3EX/P4yEQJBoeXN5o24QnyrjGOEkzSU+wtx5SH/xuFKBlH+Cty7/2p2y+FTtjgmls
         7I7QCjDZfxEAhev/iKP3MQSpbIsLV8Ph/6Q+DPR/n0huTq4GXHNbcfILEA1X4NPlfLj2
         ND391PjSxTHj0exOiD1aylibkcBR08bsztmT24DXhejY8LZmDn5tUiL/cjmU17IMgXiy
         Yh3kpGdUO96yk7UD5JPAXXx4ItoLfJNwcyTu4xlyq02RpXu59D1Buwn7SqITNQ1GbrHI
         y5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742434; x=1794347234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Gslbebf1LMvPLM8Q5E/+GJDx3HzrVAFeNFBvrSeRD3A=;
        b=PJ3zsZT6+uFWWO/c6ovJsfhBMDGyg48qXD1uibcUEsKGc5qL5eWCi21qx946tBgIdP
         eGg8ykrnErYokXPFptCmzvFEyEpD0XtTbwUXM8tpB76rOOpIDRRbPkndnFxl+EWaWgwh
         BvS0KK6B1Wr0us/yXnxv8vgrqnAs6ISGEEvjiuEqXP2s2fajNo7ZAAGTSE46VUf4py84
         qJjXC9+IW/ZFkH4m8QEKdekopTw78q6DU9oF36zLBAUzgV2/I7gV8bzbjtAi8K/ps+g0
         jImUW+iI6GPY7PbjVq+pY5xMRqyb6aJwNRqdrd42FS6Lesal8DydkSj1R8benFaaQslv
         2Xzw==
X-Forwarded-Encrypted: i=1; AKwUvBwKKWPyN3GYMVz5VtzOq4Fz8+dYiK2UnF5NZACprq0m/iuxDYd1znVy6h8hfjMRuFosYzRZPjkqUPzXhguZ4o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8N0vrc3ZCiRjJfQ+Hu1toyMZum7rUdRgmJ7zHJBNfb04qdfO9H
	Zvets95KCh2DuWSxgLoYTLIaeaRdBDpN6LBosDIQLq76kQ1h30eWr5eKDNcZw7Zf/J0=
X-Gm-Gg: AYBFou0U+BSmpxX/lgr7t0JVih4JgzotvjITC2hZ0icmEHioNVaSI4/EeHH/JwVJkXd
	DF5JD+FlqLw4oBfylURkKICOWXc5dr2pHtNt0KzTVZXeV/wEjFIY1VtC8G6eBUUIDFlXWiBkoeq
	xwpSqZv3W+ARH3BEusbV7Vy/q+ZbA30Plk1tCcyczJuympgLWGfdlgusCh2bJlPcdxbsW8P3Q1r
	wL0QQAwHfpoN2T+UoHoXv5pa2CTZvjsUDxlXw350bZfmf0phlpjHQLqxRiL5c9Qng/YpP+9oAdi
	bjQ0jG6YAEvx6QxkDcsR8I7I/rXl5l4HLAQoQ/8/fx5KufSrh0rtmWjLZl1Ja7jo6G8Kb/y0EPd
	ItgPXqlR+Te7f4h20zO9yZczW7kKZR9G8ZmDXXXNGv5z87731OJUMxC+BfzN2P4yCW2XyM0L5MG
	pwsInJ3dOnK9VDvhEeQsm8Tcl8Xl0YgKFwyJP5vsoQK198zkUjkMkXnsNTg1YKPXRKB/hfW4ECp
	n8Q7JGNXgY5q1vfVpm8g9JAmnJJhavN22TSCEPKaXMvQF3aZQXo0kK+gU79Dab9mzOhTqTSoZDF
	LQbD4LAFKVeFtZmzZelZ3TvBtH3fyqu0qqWKVNj3v4oRZBahLzSZvhWbi6L6I8I=
X-Received: by 2002:a17:90b:584c:b0:3ac:fe93:a731 with SMTP id 98e67ed59e1d1-3ae8981e640mr10608128a91.56.1793742434015;
        Tue, 03 Nov 2026 13:47:14 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4d::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae87fc548fsm12790312a91.4.2026.11.03.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:47:12 -0800 (PST)
Date: Tue, 3 Nov 2026 13:47:11 -0800
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
Subject: Re: [PATCH net-next v4 2/7] net: cap sockopt_expand_out() at
 MAX_RW_COUNT
Message-ID: <aupWXwkFZIQi7Mae@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-2-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:01AM -0800, Breno Leitao wrote:
> sockopt_expand_out() grows the output iterator up to INT_MAX, but the
> MCAST_MSFILTER getters converted by the next two patches rewind it with
> iov_iter_revert() once they know the real reply size. iov_iter_revert()
> refuses to unroll past MAX_RW_COUNT:
> 
> 	if (WARN_ON(unroll > MAX_RW_COUNT))
> 		return;
> 
> MAX_RW_COUNT is INT_MAX rounded down to a page boundary, so a caller
> that expands into the (MAX_RW_COUNT, INT_MAX] range and then reverts
> hits that WARN_ON, and the iterator is left where it was instead of
> rewound. So does a caller whose optlen already covers such a size.
> 
> Cap the size at MAX_RW_COUNT instead, before the early return for an
> optlen that already covers it, so a size that could never be reverted
> later is rejected up front.
> 
> Sashiko found this while reviewing the conversions.
> 
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/net.h | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
