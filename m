Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794166030;
	b=sVowyMkSz5Enx0Jc34kqHdN0IVeqGG0gT5yMQjoDTTVqdmwM7/cRtcWMgfkyVnPUaLbL
	 PS9he7ia3yOYSfTkmifktE2P3JbhfC+SziSpAGI2PWW9G2mDuvBkMI/AiqC20bwCsWyK2
	 p5SxrtGEPjAeF0XZyegamCxljDck1EKDnRkJBt1p4VnoAW17ilrk0ZZrr8vnUGFtLHui2
	 VN42zpS7tW0t+vc0hI62h9T02C679gXcPZFXOWx9eGcqhUqpxp+rl3EiAipEqKTtJw4g7
	 l/noeV6Gscp4Rx69drnmuVJgdF/sMIac4fFDd4RStI/jr1uQOvqyWorxLAxnJtziOkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794166030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
	b=aFF9H8GIY/aPrC4RLepTy3YldiJLImxCHbpRUBUQTwVIAiMfQD3l24spDS7EcLfn5REb
	 Jr2yUMPqluvSKiqDmiGiGWKcKYcZqgL8lcuPyvk/ad6D9C0o06PoTzhL3DldEcYiUHgKD
	 QVQ2bce4u2F0SeElJz6C1gSEPfzJzqgci/93n8oOflPRrtClXy8OkE4wsq2c/643CcqXM
	 PPXmzvfDuhw+EWmnnnRKUGMsXy4EH4TtxKzgwP1S55pnJ4YZ3sg16OVS9JvsuiQOfchWp
	 w2WzLS+fLpLx4wpWVI8/czkJBD6/0j8Co4X9mv55oP4yDNbe3lZZWC0pH5mJBeP5AEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="czutAw/j";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A98606A326
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 19:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1A98606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=czutAw/j
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-54492d8a988so46851cf.0
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 11:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794166029; cv=none;
        d=google.com; s=arc-20260327;
        b=dlz71HrE7jgqdemKsJa+Myyc+CNz01GYRKVigc5hWysDzg4Wi7bg5L2yYj0f/icgV3
         ajWUL5VLRJIUDGIyqwsQP4Lcn+SO/9Z9npCA9R7N2699JRfy7MrQm9DtSpjWCc1GaQ5K
         DbYqG95mR6pL63BjEchzEDMp3NX28ivt4gLvLgJaAfeJ4wtIsAUrBz+cNPd7VbCUFUd0
         EacAuH4ZzW3v4QBiMHRX+PVcNQUdWyUigWNq9W/M+7orzjLbEsdae6FNWwpSLBFRimFg
         mdreNvuLkoeiJQkIP3Am1X2SgpeWdO4o4dkkzySygPkM+fD07RQweiOXafbiVt/uAybe
         57RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        fh=hDW/jjtVbhXgU4hI/Nq/UTnRUFPHzjbue31Ct8oVZuQ=;
        b=CWy2dkvzoIVb/DOfa/FLNheuK7fyT7G4noAIemm30DXcJBGmXK5Bcn2R/BwM0UaE8c
         OzBbqfDSHjOOHr0PVQkdJPwFvlLP8qjDS+F280MbyezckLb9bbo1cms0hwouHOrPN9TV
         Cc05CnKAgJOd+PIW5Gzm7Ptu7Jjsf9J9ii5pP7DyX0uXnM97sP3Eb8PoPH7nQ1V7CLPO
         O6zcrdPuRtFOBsOxDh9RDFdBFGuhYsY8amvOJTIqeVmStBduNtxQzJgb5022uILs3SeH
         6ARym+G3yyAuzKi/J5IC0aD2NM5X5MTwRWU8eqZ4hxXkoHfHy1TyBuhlyYfVYyL3jYIJ
         QiQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794166029; x=1794770829; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        b=czutAw/jdxttlNeAE5hjzfXJT8dJ0d3urmQJnKzcfRWAZR2oa9LY5teW/l9LiV+5zp
         iGm/vKnvU5qbpNbkDdDMfyiwuwBO9nSK+xNSNQhqcg1ACm3PLri0AtSCurgN/awEoVBg
         z5uj+II6zPHXH9ub9Unwa8ZMPEcpvuT1WmrJaxEoPk3MJ1GI3X/wy8JX6Y0FctFzRTpf
         dzg3KqZnmzLlkTSaM6HYMBQSczmEgITk4eq9lUSsPrjDG8TGbgZGi9zBgPQaeU1mWxsv
         hyHu3Xr1zxy+YZGMFFP8jBmBpSvyzT2WfIOMtXxuEtE6N5WV73zUdRCvT+8BKfGJs2+E
         86WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794166029; x=1794770829;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BO37IMunpFsRap9NM4xeqnXFrjMV86qXDOv6LcF5YHA=;
        b=JrQdm1gulxPqMqjxzAdVfxyxv3eD2MvEj7ytJ4LvtxNXnI7kceeniXmqljf4DMOcgZ
         oiRAIloGqivM8AFgvXpD27eG83XskAVWrAikVCW9Ps+HqHVdJibKr4vH/wUkkF+z8xL3
         74VbWDXViLu+EWHyjcATbUwnPBpNYvYLYZVyew3tVs6Nx3BPI6ZJ+6upYhbMOVtmrynV
         msifXcDvwE71nktxLDDYTLstH13SDfe8MfV6jXz3H37iZB5Z8lZ+2gL9mLwPuMNwbkwA
         KHLVWWIg3jZASgj5DfAQvLN/dme6QaY7PJ6dK8D9D6ht+WTmmQf1x3DlgC8P+Be8J8O0
         pHEg==
X-Forwarded-Encrypted: i=1; AL+hErHhjoN1RHArcbBaWTnEpWuKzaTQ4dC0c9rgb1KPnVG4RSS6neiPPthBbprnHMA/R2FVgr/jaecr+VkSPv+jb/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BZWxANQuaLfmSz96wBuZfugLuU6xZMgeZLfoOXSG0jkOAJjXL
	7deqgztFWMBqHdmoIRhbkywGbLua/4aXfr7ZsI16K1YiPpb8pt1Px+ZMm476byVdMlOSnkicUYb
	G5o6/4PaMkdiFn76zog9XseaD6lXTABqWgLy/H70P
X-Gm-Gg: AYBFou0dka7+PosckUGCjpxwzBn0GwVIYFxjx36yYj7n//0zSCHTd9fXbvx6Dvdy02c
	gpTMPmR8DAeXOJqVN7dYWnTifpLgnuViMTJXiDnQCbPKvdh05zkCtNq8jM5RsHSeiKOM8o7nk3H
	TYZ0/eerTGlQhpdXy1WdnYsqcNdUknx5F/JI4qiH8UD/96/NILOiLiWVdU68Z2l7FNtqY1sV4jY
	R7m1MZ1ib7+zbhUpFUEIKUMJ9e4VuxUVClv73GgAD0zIsbAB2XMNzY1KDJQRen03NKJrvobFTs6
	7adkYsP/y8IfCwm/NWL6++zG/qXG4FItdihZ5betOG+9hLA93YSsKacU5thTW+dq5Bb8+21hFvd
	AzvGSxgXSnzhqFPdEXf/up7yGP3Xq2rg8w4uyxfC9/ttfC7ivg6uz/CpkB3bau0iG4eJPvHOe3s
	xC01orGJCe8ctv5l1N+ySbneDNvw==
X-Received: by 2002:a05:622a:4a8a:b0:542:fc60:fe23 with SMTP id
 d75a77b69052e-54fa22f2df9mr26125631cf.3.1794166028049; Sun, 08 Nov 2026
 11:27:08 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-mtu-probing-series-v2-0-355d6490c3db@gmail.com> <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
In-Reply-To: <20261108-mtu-probing-series-v2-4-355d6490c3db@gmail.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sun, 8 Nov 2026 14:26:48 -0500
X-Gm-Features: AclHuK8zDFeFkG1trZEMSppYXF-uzQmF3qY-1kqhwEX4JZnkZedZbD6YsibKJOI
Message-ID: <CADVnQykAX6Fw8_86emqtTUDWgFzRd_jXTZKdDJLb0s8AUmfUaw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 4/4] selftests/net: packetdrill: add TCP MTU
 probing test
To: echoowall@gmail.com
Cc: davem@davemloft.net, pabeni@redhat.com, horms@kernel.org, kuba@kernel.org, 
	kuniyu@google.com, shuah@kernel.org, edumazet@kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	panweiping3@gmail.com, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 9:39=E2=80=AFAM Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> wrote:
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> Packetization layer path MTU discovery (net.ipv4.tcp_mtu_probing=3D2) has
> no selftest coverage.
>
> Add a test for an active connection. Check that it starts at
> tcp_base_mss, that it sends the first probe half way between
> tcp_base_mss and the peer's MSS once cwnd allows it, and that an
> acknowledged probe raises the MSS and leads to a larger probe.
>
> Disable TCP timestamps since the MTU search range is computed before the
> timestamp option is negotiated, which would otherwise make the MSS
> depend on the header length at connect time.

AFAICT with patch 1/4 of this v2 applied, that is no longer true:
active connections now call tcp_mtup_init() in
tcp_rcv_synsent_state_process() after the timestamp option has been
negotiated.

So I would suggest removing this paragraph from the commit description.

> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
>  .../net/packetdrill/tcp_mtu_probing_search.pkt     | 43 ++++++++++++++++=
++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_sear=
ch.pkt b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
> new file mode 100644
> index 000000000..65e466fbf
> --- /dev/null
> +++ b/tools/testing/selftests/net/packetdrill/tcp_mtu_probing_search.pkt
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Test packetization layer path MTU discovery with tcp_mtu_probing=3D2:=
 an
> +// active connection starts at tcp_base_mss and raises its MSS by binary=
 search
> +// as probes are acknowledged.
> +
> +`./defaults.sh
> +sysctl -q net.ipv4.tcp_mtu_probing=3D2
> +sysctl -q net.ipv4.tcp_base_mss=3D1024
> +sysctl -q net.ipv4.tcp_timestamps=3D0`

AFAICT if we drop the tcp_timestamps=3D0 line here (so our SYN offers
timestamps and the scripted SYN-ACK declines them), the script should
pass unchanged with patch 1/4, and fail without it (2072-byte rather
than 2048-byte TSO packets, i.e. 2 x 1036 bytes). So I'd suggest
dropping that tcp_timestamps=3D0 line. That way this test also covers
the active-side part of patch 1/4.

neal
