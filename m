Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793746916;
	b=B7+F9LDU9ESGAG7ml1UiQKCfq4U2tvtPNLW8tvCVtrYf1kKIbyTRMI8DCRVC98XgVwWN
	 22ooQiOVQNS/n3QO8Ct62axYG+oW2O4JesOibkT7+B+saSDwclZe147erJXLdY4XSOdTY
	 o0N2jDnCSv0vQQx1Yy34ALT9pyxnk2+Y7NnqkmZ3isYazEDAhDZ8JV6Dfqf+JOVKA9zg7
	 4J3CPDpxF9+8PerphlbJjsQTpOOzKHZ4YQ60p+kwayPtlpWYQSfz4swIiVN8RGpzy59TC
	 MaH0xj5qKZ0/SwA1MUVh5iBaAtu+YTCq2J60fIrOQvEoQYo8MvMpiytKwT0Ikw5lBFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793746916;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
	b=uI2WA/64sqKfrGpeoSZ6cYSFsxLldOXN79vjWEpp1Ie/6UBFF7VqM8Wts+8ggqgjmCdz
	 mfu2t1N7WU9DsxLz/Kxl5Sf46YVFhPhMnditnnPDu9mNhFGicsYmn9DfRPHCt/7BnVyT6
	 l35hBtko4Oun46J/R3dBA7M4l5ZrvxaZrRdEYFsAEiQx40/3mth1J5ZJg3m0nLUfAMm1H
	 S1vSz4ewYBAUaGpMPqiNFThTboonNjpHO856Zezz+Y5ogVjPL8PFgaz33L7tcKVFnoQ64
	 dHuYhfqZHPbvPTdBSCyqwhg4kFH+ARyPyLdsjZoBH1XL4+3HnnCFrDjruSd67Y1RgcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ejRuknpl;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EE9606A31B
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 23:01:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62EE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ejRuknpl
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a07078200fso58027b3a.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 15:01:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793746915; x=1794351715; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
        b=ejRuknplcXcfwh/9Pm+1q3vC/nC31j0L2g1hQblwJK5OkYf5XMNQaLwX98fSc4sKPS
         GlGaL7l6UB1isKdH4qlooC+Q7NTE/7R/+LK7iPuKGYZKvFhIFGKvch7/tJ9JAthzMqQL
         iaLieomJSBX4PqAFcgGvzCkJXF+dreeEghrYzYAGGxv1MsYwsMuDtVSR82SSyBtnpJeG
         8yasj4Bk3K207rozuo4ZDf4DHexrvySyZbWMt2T9enCtAByHAXrniLsAkIwHMYqNx6Jq
         nh98owGBBQTmXS16EiJEm2MuE8QXnSZGqCoqXCdtVja63JIZ+TQsOqu7RBjmdqK4JRkF
         PNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793746915; x=1794351715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1y+XljbojQ8RmFRrqF3tIyG5Meo4CmUH1v4mswRS22o=;
        b=R2uZqRgjUKs5dbu7IHLX8xjmsraQv6FIlOaKeaqrpa95Yefz6baSNsgJzr1aY/mf93
         MntccF6JwFC2AqHkMzlzUEum55TrvEZZ1+9B1Uy86hjKExKHDW8ptuO+GqLq0pHT2+I5
         FGq3Hj3D2s1h1vID7uwUcbpl+spx0I1vBY1Wj+UAJZajAQNisEOyWFzk06Jn0GdGxJHP
         vf8R+PMXGeWyQvi5XKZtewD6p7avcCNox/PEp1Pe3eW4hl+VTqy3zzDBeaF+crRAtCZo
         0a8o4vfSuWcE6wdMmYzeieKL48DxwGDuJ2Ftjqju+TCeXCPXRzjuMHZU9rdw8SY7VI5i
         SijQ==
X-Forwarded-Encrypted: i=1; AKwUvBzw+NV+43tfi8+0tY7ir3e5JHrEXzz+OtuIewZjUZyutWdZb0EHj75I6tays8PrmBGp+zieMUqF85mZGq9UKXE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ugN5HfLgGyrjoSJk4e55JwyajQ0eq2zV/Dt4JWuOEujcBKluo
	6shjsbtzAtqt6l7Z80GHtvFDwe22t9WLqisaurG+tMq43/Ihp/TxdZ0CxChLWzrjUAk=
X-Gm-Gg: AYBFou1hrayYymXMHWBtzfo0WWhYjU4jArqaHNF+dPNoteiVonz6vcVyzMIC2K+i3oQ
	pKZE51DKXR/ErvFvqbNAGxKZ4llDqe7MoN1G1X5T8S74jk2QSQ0JtN2uNXIR61oIcNN1ra0TXK+
	tD93gAgQ/CPviZPuMVqzZbavpNVHMN76tvXYSYoNSMLvgFndOks4UfbpnNuWhNXhIrdaPbQCvWt
	EcPvAAvXwhZwx9yEGxT29Im2W3A6e1wlKaZvGOxhMqKX6/JCTVNbBm1X04Qt5vO3zpu92VEMltD
	pEYSnpBW0ImRYd4DN2+5az2TCI1uP3LlcvDC8jW6o+b/S586zcHxlPk9gt50NeS4VdkpDMB/o6I
	fLBMimzfM0HP+KS0xbCnj8hGm/CryOoKdlRs0ajnGNCxRN8JJctDyq0Zv2SmMPtxXWUUMMEj0HE
	BQvHMK9CcTd9QEC/GJG8H3q4cT5TpE3fHJ/aM5GvAGS8l11zaQ3no7JIs2WSCf5BIBMyTiH81b+
	0RFUoJdoLZfRdTYKPIEOypesaP5XbPmiEld2v/8dGtq6y+NbIF0Aukef3lZ2qVsNM/+U37eMMcd
	DA3e0wKfdybRh1EJmw+HCpLmK5xXCcEuQRaSoBUA
X-Received: by 2002:a05:6a00:28cd:b0:8a0:4032:af85 with SMTP id d2e1a72fcca58-8a9b7916fcdmr12491838b3a.0.1793746914675;
        Tue, 03 Nov 2026 15:01:54 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:3::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe108dsm161105b3a.6.2026.11.03.15.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:01:52 -0800 (PST)
Date: Tue, 3 Nov 2026 15:01:50 -0800
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
Subject: Re: [PATCH net-next v4 3/7] ipv6: mcast: convert ip6_mc_msfget() to
 sockopt_t
Message-ID: <aupn3m8q2oAKeQ59@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-3-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-3-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:02AM -0800, Breno Leitao wrote:
> MCAST_MSFILTER reads its reply through ip6_mc_msfget(), reached from
> do_ipv6_getsockopt() and from nowhere else. Convert it, and build the
> sockopt_t at the call site for as long as the caller still carries a
> sockptr_t pair.
> 
> optlen only has to cover the fixed part, and the real reply size comes
> from the gf_numsrc field inside it. Userspace relies on that, so
> sockopt_expand_out() grows optval past optlen, for a user address only
> and only far enough for the sources the socket has.
> 
> ip6_mc_msfget() now advances over the fixed part and writes the source
> list through iter_out. Its callers rewind by the reply length they
> already compute, which is exactly what the callee consumed, and land
> back where they used to write: offset 0 for the native reply, gf_fmode
> for the compat one.
> 
> ipv6_get_msfilter() and compat_ipv6_get_msfilter() only store *optlen
> after their own copy succeeds, so a copy failure can't report a
> changed length: -EINVAL, -EADDRNOTAVAIL and -EFAULT all leave the
> caller's optlen word unchanged.
> 
> The old code stored *optlen before writing the fixed part, so an
> unwritable optlen word stopped the fixed part from being written. Now
> the fixed part is written first.
> 
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/net/ipv6.h       |  2 +-
>  net/ipv6/ipv6_sockglue.c | 64 ++++++++++++++++++++++++++++++++----------------
>  net/ipv6/mcast.c         | 19 +++++++++++---
>  3 files changed, 59 insertions(+), 26 deletions(-)
>

Reviewed-by: Joe Damato <joe@dama.to>
