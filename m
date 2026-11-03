Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742308;
	b=qeaTxnHcpyLOr5bHjRaftHjGOTHajQ6JewANJ6/s3aIuLepWGBq21lRE5BmtTmYKYM3Z
	 zNeP4lbOuEG4in0xucTDcZkTKs6tFdFu/Y0qy6S9+qDeOnqOpp5moEjv2y4eJRGXl+oUw
	 ZSgwKBl++/aASTIqz2RspbLiEZHKaaSAXjnQR/+rcfSrhMPx5Vc0n/1MvSUezcUvA4JVD
	 pX0gTlRm95o1a8hMFQyU3QFnR3ci3X9o9WymGgr6d+lEnEOKxqjTHSYdRLzedUv7GyKTV
	 6LP+DE62bZojOmduoFtr8VD3il0gxMCh7/LGbSZigR0tm+nqJV0yiAQdscRnh9sJqhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
	b=v0bCpsaNSKu06r482FIo1l6HRf1XieEbNIszwrHd2rS9ApM0jtSt3Nv5Ahrrbj9cpxLg
	 1YvVhJJTj4LyU8H0Wb/ydr+t6RpwPaeCZKFd6V0lNV5mu8+dn62hcJEAlDfryreLJArrQ
	 ITG1rfI3e0o2BNt/Zz3600B9B0vNDsDXkkCfRmyz5yeegJBShZzFnRtORC/msvPbkw4V1
	 0U3iqJindV0ZGLM3imtyxon5T5hHFuLF5zXcjv8bSLnlkzp0d1GLmg99z7drJaI2XqAuo
	 MkHQv2CYs2E2I64+z17/46tevnZvrSGXH69TbWa3OHYMRfznHWhY9UVfUaHJ6pqgkOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pta7O0Fb;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A6606D805
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 21:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 495A6606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Pta7O0Fb
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso852852a12.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 13:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793742306; x=1794347106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
        b=Pta7O0Fbv8w0e8LBRL1im8Q6uNXDtuEJIxVyW5IqEevEXa+Q1M2ZkaaA8t6UYpT/uw
         j6upPM7yggUu5MMTieBus01I0J/3rgB+FvADMK/lys9TM3/oMUmJU0EoE1M/YKS9bAkP
         ISauA7l/y2UUh8NGwfoNpwt2LAfyPUKaeujslHc8RY0xU69v+vhnbiUbOiYjJA7z8kJB
         wPOYTLpIiabkHMcH178CcxVm/XgnaP0yc0zA2r6+gCN79DmEYq3UmNCnPyPFxYy+Zgx9
         ifVZos1Aj3UFvx+jEGhuuiMiMiCbX0jbubaUh4+J+qQrc6launIT8JRbUYdte1xVv5Rp
         vOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742306; x=1794347106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=O+avdGunSth2prLtklqUzo2JveavBUeum6ierbVZfg4=;
        b=OLmlO3eCnr6W5YaXvJT637IzuqVaSv+NPsVMIAea86aHB4fjnXh6ynInYgw105LFVk
         3jEzPHyy7nOWmiIfnAQxyPedxq0pFxXtVNYgx0/WGM42pVE+vRtYNTEoph1/bWmThOmk
         Q0YyCwanOkNubjFPkdrNcw+9LUwAipvY3ZWrO8I9k7IB2LyaY1K7FSxNUeSQB/9RFPXl
         bHTz5rY75MwnjGecHLkhdQMcwS40+owU7+5VPSCXD/ipcnMtyzs3Yf00Du67hDS9Sqrl
         w81OzpiJNNCVNwzeK+2qbU5Tt44l7tjhByPp/xYNLK2s6LR7cJHL2qWC2DONiKtw8hP2
         UHFA==
X-Forwarded-Encrypted: i=1; AKwUvBz7TtQDQj1lI6iVrn/fYhTJjhGR75T1UkvePVDyT7euMU7dAEMRhhhyswBzZXZG/gev4CpDP80Z7tclrQqAufo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F/AbpBi8CsDpuQnnMGKsWhKYNgA3W/+aZNaOjzfUjEEVHNAvn
	4nBfr5vrz0tgOIObtibJhZGJYCEmFvSrwTk0juAOQlk+rYQ2umx9fuTdq9zU2uzMnDU=
X-Gm-Gg: AYBFou1mG2YHJRGX0W8PiTtW8kuLWPqkQsJfDCUbL6BOF/8/pZwDN42JzSzLK7q0jMn
	OzFW7kMH5Z9z2MAzfisVSC8RBrtxMoNHV5MqcJlmTDnM6ctvGBu/t6Wl0vAok05TSp+oyb95TrN
	rI8Y2SZwhFqFpIz1D7EwGcN2RGLGRIhlh0tyVRy54hTWEDJUbtIrgVy9Wu2Ozm1Tq5Of31dNMs7
	Z93Ys25or886gZXAp928uB0Kp8zQKfRP84BbOb2sn7PbL1CfFWazjNagy2vhfjhBmTMPMdkcPR2
	9BVOkPp1fneJFiQMIyjuLCEkhqE1HP/v9/y7jjOo1henSPhJctRxeTp4FeyBC54JIft7fNOb7c/
	NyFVYsoM7QtLMo9vD8lEOtZAlDUl6JWQTRkVfRY5bL1VLa+Cd1woql/cqaYKQ97peH5d3KIg1vW
	V3oNLv0L6BFK33ILqLj2XVyCo+ZTGtN8SwAC7A1PAPBX2Hb4cY4nTKgR7pFvYpc64l5SnPYljBn
	18udcFdP5+exdVQLNcBLLz4US+hDdhTqGJCj14NLpw41uUXoW8C0Qp31cqLseqe3Fke+H3L65ra
	R3piWTE8x9PNKmfUBJXHDFNxadNcC4qFayMgfTcG9MHMi7hIsBWJKTfHBx8Z7oY=
X-Received: by 2002:a05:6a21:3991:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e928634704mr8781404637.1.1793742306503;
        Tue, 03 Nov 2026 13:45:06 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:56::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b65fcf5sm120759b3a.41.2026.11.03.13.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:45:05 -0800 (PST)
Date: Tue, 3 Nov 2026 13:45:05 -0800
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
Subject: Re: [PATCH net-next v4 1/7] ipv6: treat a negative optlen as 4 in
 do_ipv6_getsockopt()
Message-ID: <aupV4R2eAVlgupXZ@devvm20253.cco0.facebook.com>
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
 <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>
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
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-1-2d36da923578@debian.org>

On Tue, Nov 03, 2026 at 03:01:00AM -0800, Breno Leitao wrote:
> do_ipv6_getsockopt() reads optlen into an int and never checks its
> sign. Most of what consumes len compares it as unsigned, so a negative
> optlen reads as a huge buffer, and the reply depends on the option.
> 
> The int options clamp it to their own size:
> 
> 	len = min_t(unsigned int, sizeof(int), len);
> 
> so getsockopt(fd, SOL_IPV6, IPV6_TCLASS, buf, &len) with len set to -1
> answers 4 bytes and reports 4, rather than failing.
> 
> The other options see a huge buffer. The sticky options reply with
> their whole header, IPV6_2292PKTOPTIONS writes every pending control
> message without a limit, and IPV6_PATHMTU and IPV6_FLOWLABEL_MGR pass
> their length check.
> 
> do_ip_getsockopt() rejects a negative optlen, but doing that here would
> turn a call that works today into an error for a caller that passes an
> uninitialized length. Answer it as 4, as the int options do, for every
> option this function handles itself.
> 
> That leaves the int options as they are. The sticky headers are cut to
> 4 bytes, IPV6_2292PKTOPTIONS gets a 4 byte control buffer, and
> IPV6_PATHMTU and IPV6_FLOWLABEL_MGR fail with -EINVAL, as they do for
> any other undersized buffer.
> 
> MRT6_* is dispatched earlier and keeps rejecting a negative optlen, and
> the netfilter fallback still sees the caller's value.
> 
> This changes what callers that pass a negative length see. It is a
> behaviour change, not a fix, so there is no Fixes: tag.
> 
> The conversion of this function to sockopt_t builds its buffers from
> optlen, which the standard helpers reject when negative, so the answer
> has to be settled before that.
> 
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Acked-by: Stanislav Fomichev <sdf@fomichev.me>
> Acked-by: Ido Schimmel <idosch@nvidia.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  net/ipv6/ipv6_sockglue.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Joe Damato <joe@dama.to>
