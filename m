Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793734406;
	b=XcxV3vk59mW29+ZA0v23mnz+omE8FjgCiPUWE97OokCxROTy9LBuxIn8gEss438OJhav
	 2inGUxBwBLrNmXHBPV7W4Lhg45KP+qM+e5td6iyfNd9Eo11Kutt1Unc+FFN+y7irwVtXH
	 Dq1XJNSotPTKF3B2OGSSZjCRLg5Wzo0PW1qhTujycLBMrS4OK+Rm0Gn12QjMnWP6h2Ewz
	 Qif1GKMHkdXcDfqO3f5s9v84BnblWVbgG9Lzt02iwTCtO/8PvpFSpTAfV6qkyFqrzT1uk
	 O175Po3xgjmtyFqABlnG3owB15ztBCthM3ZrQ05AxxYoOHoTt9TgGOGAc770Qxoi/tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793734406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
	b=V0Mh/r+nQXLLO8L+3cvcEMP/Ob+NlAdHYekDxwRgCGeIyJMIyARine8SjNpyT5+EfuUp
	 5sF9HwUr3JDPCDmibfgPhqvcxzyENoChXhJm5N4kbGENuaqbBL9O9a0GHQCyR9VfIyFYy
	 KWVK0bN3X5bW0lMsI31Oiyy+CWz+r/Ed6aNHkOhwSbYRxTjXUBnr+xfEOl3qnXx2uWJza
	 pIvQTiSKGO46LpAAWVK7xbzR5vh1dHA2LrumUzsJgZ3RPeOWxM/1naAwO9XE29k8MEw9I
	 dnd0R4aK8ksrn9DsM0eMeDStqPRrqwSNg9mGCC9yc5Mjf5J0a4s/R7Tcj/7cry+BXLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J61wv2ex;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F28D606D823
	for <linux-kselftest@vger.kernel.org>; Tue,  3 Nov 2026 19:33:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F28D606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J61wv2ex
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so1762526eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Nov 2026 11:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793734405; x=1794339205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
        b=J61wv2exN8htNK9lYuklAxCur6wcv0gV5hEC4LTnv0vsbzjE6WiHCt7vWZjwAitqGZ
         Z7QJGrGIyNMASgr4gdZuZj1Pu4FrPDgNq7pR64TF8oxW2MfIBxs8YSw804DfE+kcoqFa
         Z+DARbn0OIX1wVOExotXpAuNN6Bq0mUytJTfXlWwhCDJKVjg6shwf838sdNKtiGXZtNA
         kTL3VZ2irXkBCgWt7lgX730fCFRMNjbgrM8zlymS/OyKDhqfczbPlbUjQgX4NgsTN56b
         nnhnk4sJ4BnyPDMipav7BMCwKwX0BrEMBZAwBM+9E1xFpuf2BeG33U/EQifOTZyox99s
         xi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793734405; x=1794339205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WLkZnlYTPQB9u5XkBC13rSiJ7ZjBn3AlusJ3/Izfois=;
        b=s0BPaUCMXI9M3ZB0RL3P3eMitY7ulPwfoFbio1CuuzWw+VLT0pIWY4uVoPQ1lGUBUh
         2v1IBDlPlLxNwFRjgg8KgH2hVIU50q2chA0YjJLBPN8YoITYXZg4SoyGSOqhTJFnOJ3p
         h7t0VuZtNr4LwOym1h1bJEIAOtfnyeIFLyZGFs34zpeBF/482Gd8zc5oeAj17u5zE4AK
         VmhGwuSEpKsdz6nDTcydJNmIPZrLzi08AaamVPwoXVUrXJ6tv59gPinj/G/d34BfFL76
         zNRrLjuaUSkWv/nBHhQ1eJSW8HRYjWbwWpeTCIDUNq+E3VFyBWTLjF1aTEdz8zJN/Ylb
         VhEg==
X-Forwarded-Encrypted: i=1; AKwUvBwHX802AO9rim/zp09CIqrkqF7zvPRlKRKp2E9zXbp13dMEh2eFQyFU1CW0EcennEI6j+z6HoUDjhfjYYhAR0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IGgaO4/yIkIpOznlrxTuOmdUVQrdek5Z/n0Q66qzLx7g5cdk0
	+nNyxTx/H29BRot4LCOmDC5pBQVUNiaPVfC2od3Pstppe6bRo/GwdJ8D
X-Gm-Gg: AYBFou3WEWJaJh25oWNR+/HYBjl2XU6FOSa7uHm95rXBOSkzpSa/xIDgJvbDTBSd4hD
	qiWjQillOeHOJTa7iKNy3y5BGFHT/O5pXekoSqPclW0OKKU3r8KgBPeX2JtlV/F77rrUuWlVQlF
	Hkh+Szsz9wb9gCr0bEnlSE7A3frvuEmSSZ3uWxg06h4TH2kONEmhs3aRVW7NdhbuumDorJ1atw8
	5g40QeXw28HEom2iWD94SXvDE/+V4sBL4fZ4gv1ibQTurUdyoBfwm+GPWTzlngFBEaQb620plA4
	VMxozmdbF2N3uAzOdwZ2hP59AocoKfiFH84U00di9clAFl1CQpqkfvIUYI7CIUB17fbKQV7Fi92
	6fgCHVlcvL8Q6FnvpSzT+9sNfLxGynbJqBteh184O90iPKkNOLhzhMyl6mxKJU10cAKiDoefCHr
	ENRwsd1v7vvFV2f7dMSQg/7s/a8URbovCpwYfxK47okKMlhrp5LNZhuqbFMrmb6JOyOkOW33UAe
	He6I0GQonpE6NfwLIORg4jg5PAVCBLtaVHYrCenIoYL7t7fbID2zHQipxpp+OYKaaTwB/BCSvp9
	E0fhvkALMvEDhz3i6jkHZg==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr23017109eec.18.1793734404871;
        Tue, 03 Nov 2026 11:33:24 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a54ccsm285396eec.4.2026.11.03.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:33:24 -0800 (PST)
Date: Tue, 3 Nov 2026 11:32:55 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Shuah Khan <shuah@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, david.laight.linux@gmail.com, 
	kernel-team@meta.com
Subject: Re: [PATCH net-next v4 7/7] selftests: net: getsockopt_iter: cover
 ip and ipv6
Message-ID: <auo24Z7c121m91VZ@devvm16445.scu0.facebook.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-sockopt_expand_out_v2-v4-7-2d36da923578@debian.org>

On 11/03, Breno Leitao wrote:
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

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
