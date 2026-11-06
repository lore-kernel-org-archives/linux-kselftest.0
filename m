Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793961283;
	b=ra6YwGGQPoAl+rRAvguBnUdpTGCOy+0dGIEBje5IKE2TuwrgiaEDBZhfVsUl2NhoI5UP
	 91Tsvg9q7kQDzeAeNp2FQ0USpaQTHZdVXgVvYjh0WDKCxsgPe4PUH2hxXwbj8+tT/2gOB
	 rzSY8F/yNUhLWjVjp3f3BzgvzA8I0DadSdu/EjrbNHSy8eYq/Kdusfdury+iO0O2DEgxr
	 4UlvBNBNxciqjZCkmRwMulXyNzwAFIgudF+AY0YNKQ52+HsxrW0DdwsuDr0fw7LclvWJC
	 lXfZli3fynSSebRrycGFuslDuOlwCix/XHnxB1l7N7RcioU7IYIAPlGS5HswUx9kA7w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793961283;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Received:From:In-Reply-To:References:
	 X-Clacks-Overhead:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:
	 To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yijtZQeMS2T2vulJllEh08u8WzAHH7tCqzIkmdxxHRc=;
	b=u+VQaeoINIvr2chbmd8yJ/4rvXa32MSBiNpXIvwa9L72/ZF+vk67vAEVD0EOqxX6TVVW
	 q0RpDJmBCqov6/fOaPS6XmKrNUIhj8WRYa1Q0TuZus/pnxtHVQFMsuakiD/IPeDClfj0l
	 sc/nzMkmWxGgDvD8w2dMmXDM9t/hB2S1mQi7/uptIbV0nPBKez+PEhOulKV9V57Hi1urP
	 FMtPXHmbfow86/kEgbFUyf4g8AxanTz1toih7JUCllWB+b9FjRAiR8akEmYdXMQVRrtKg
	 /Zarq/4F+Kk8GwOdFwxgc1Jl/Tl2wUpnjUrLTvwT1EqOsdb/Tta5cSFXgpEPr73v2rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxVhr6U8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nY+13RRz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0C606A326
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 10:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE0C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VxVhr6U8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=nY+13RRz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793961279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yijtZQeMS2T2vulJllEh08u8WzAHH7tCqzIkmdxxHRc=;
	b=VxVhr6U8jqZ8O2hfP4Xk6lXxddeOziBNArDHip9oFy5frY4tDtxSFE/yASnGd4TFz2dV/u
	wn+8h8Df0NeTjQM0pcxIExxEHjpkTd7gPX9XAxG+E37AIs4hCYatefe0HNDgJOejgDTjXd
	a2vQzPmE/GUk4hP0qZcYcmW6ZhUxGkc=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-yyXRfkHRMqG0w4FNpXXFFA-1; Fri, 06 Nov 2026 05:34:35 -0500
X-MC-Unique: yyXRfkHRMqG0w4FNpXXFFA-1
X-Mimecast-MFC-AGG-ID: yyXRfkHRMqG0w4FNpXXFFA_1793961274
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-86c3a053d9bso5670337b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 02:34:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793961274; cv=none;
        d=google.com; s=arc-20260327;
        b=f9pM+BK0sLWhEI6exF8PY2lTSgLlawrZ5xgkhB8IVHbUaaW55oW+O4/xCk6himx6ml
         LAiRA14OrOQ/7g86cseaFo3kGFWAKxYN44xXeucgQjnoKdjKVZTqbHTIqjzCs5W0haf0
         QyYCYbCalp8UULb7VtrUYmv2FGm0pC1f6klxzwgcQtMV552qXzhFHnrB2j9ufS04X1pv
         woS6+AmnQUc4zOMr0t1bv6qx4k7hmMYupIB44jSgUB0CubkJJcTODc0MxRscLImMLR1m
         iEwEWlqQbJjBv8k6hnl1jM+9b88yjmtuQSpmaniY4EcPmP47QU1yLx3Yz76tStwGPsSb
         iFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=yijtZQeMS2T2vulJllEh08u8WzAHH7tCqzIkmdxxHRc=;
        fh=VflCiIF3jOr+Rl5IzqBvIPOAZ9ZzSsqmPrx0ZEM+Mh0=;
        b=PcpWckAVjo+u4Nb/t0iItqXN5tYfQ5T2vCW4j0UWoQvUjnDqlOGMEZjX/hESsqpeV8
         vnASfOEg5oMTmrDES4enpBEHJDz8FR07UlqRvwbHzVPVTumxfD02Qk41JtbFa36rXN6M
         jkJijbZsrxnMSCeqXciu3M+SQCr57ZSoSKkTY9iDkC57j9ZwM+uakgcLCB4f4uz45S9q
         aL135xWUpSX5CPd2H5bIG+nr3+84RoAFOaUjeb3Fljbe4xrl+FI4hyGghOBpNT+jSPPM
         O3BF9OqZeTsWOGlXVF/v4f5YRX5/zEfkYowyN7VuRalUgL2At/y71W+Lc+6vb7zf7ucD
         VsvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793961274; x=1794566074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yijtZQeMS2T2vulJllEh08u8WzAHH7tCqzIkmdxxHRc=;
        b=nY+13RRzMwW3aHEjVnE2AsXfVQ2cosgeOK1nSC+J6/dPqHoB16kmOM1tBd8jLBwchc
         65LPvURhWz6Be2rIHIg1WTsFR1wFoKLmvgEIoW+5NduYGcrZ/8iXkJJvzrfw6LNzfGaX
         Y9ur7+V1zBqvmTiySWFZFCwupNGTikm+lhyrlffEazn+O8efytCnksLxPuxMX+o2WJvH
         RTGhZAKeqcyPm9Td8gHt0hqx9NJ4fp1zrS0TJSivtys7qxBhsLzLDkG0S6ku6QgD5gTa
         sfN4ccFzdab5vG8nS2V0lhRMtMEqq7fDU/acatAmWSMnKbUmQWVg2KWErDlgUFgk5T5d
         1pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793961274; x=1794566074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:mime-version:references:in-reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yijtZQeMS2T2vulJllEh08u8WzAHH7tCqzIkmdxxHRc=;
        b=yMfa2JkBMDZqK2XaHkO8fMdRV+AolQloNWW8fcbyMeqbN3AsSdNc+f6gILgunfW8k3
         3ZVzQEUNKgWSMbokYOivS8t4j98RWptwTGze1GA07xKIENnZ9+uzUGrp8k9ARTmcgx2R
         eP+HIilV5u6AirX0d0G7f9Bw29Wl2M38DLOKMN+W8uuGnV5FA6tRRN86bHIzv81ee17i
         95wDjficUWt7J3R0HZYOvuDv8M8WFb4W/sMbXthv+YOLJuHk+B/HI6oNPaPG/mAYIk8i
         Iyx/E3o7l6BMWOTHRQIdBmEF3dYOjYW8wEYeEmyO77n/akPymqfTLnuUun09SDFgtBOb
         bdNA==
X-Forwarded-Encrypted: i=1; AL+hErESLyKzbjuJDKnRFs+/xxx922kO7fNbi4GZh8fYs7UQwP3I+opsoqOdhlHfI09dGyHWAXPFqZgAnUr9BGvzRVY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xG+XFT41QrOrxRSBSqoD2fXQegjIRLRGJgfrI1DNOzAGjxOiO
	1+DN1XQ3AjE+VJCkD3q+3exVovilK5PDaqLN25h2JGIWYRELcNSG6QomOVBqIJt2QW1C9OxTteD
	9NVQeULwzrAExQTXIyu1zf3OHpmylhN45oPPxASPmtGaC6Fo79mpG+KfM3cNpycxFMjRYxR64UZ
	TB9cZOIzBp/rTcPSkJCCn8s4dror6tROexpWcOfYpAyvaC
X-Gm-Gg: AYBFou0mF48tcC8cXUHRUwK25/ZyWedTQqmP4YdIggeX18g+hEFHEK/HZ/I5OZOeuM0
	LcTdBgK+0/2DeLGmWMbqpJRVhUHPufSwIyCoWOlhijujFucpSz4YXatjxvv/nBXkMlXF/nCTcb+
	O3htu1nBHHrW0Zrxz1e/1qKXxJAr+gGw0FIGW4iNuOzo/ozuixSCWZPbkNyy/smmgtcEON6626h
	ympKsrmNMczwRHG
X-Received: by 2002:a05:690c:e3ea:b0:8b3:5037:5023 with SMTP id 00721157ae682-8b350375381mr15907b3.15.1793961269461;
        Fri, 06 Nov 2026 02:34:29 -0800 (PST)
X-Received: by 2002:a05:690c:e3ea:b0:8b3:5037:5023 with SMTP id
 00721157ae682-8b350375381mr15717b3.15.1793961269050; Fri, 06 Nov 2026
 02:34:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Nov 2026 04:34:24 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 6 Nov 2026 04:34:24 -0600
From: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
In-Reply-To: <20261103200036.65764-3-tianyi@cloudflare.com>
References: <20261103200036.65764-2-tianyi@cloudflare.com> <20261103200036.65764-3-tianyi@cloudflare.com>
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 6 Nov 2026 04:34:24 -0600
X-Gm-Features: AclHuK-sJ3dqIJeSdHUNf0o0AjI3dtm9DPHkP7CfN-2qlw2BH-a46hIByak0TW4
Message-ID: <CAPB2EArNk4KzPSGD8DXjb0o=pUZ8RFUm=U3ZVU9GRNMzj0OVkg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] net: fix mac_len of skbs copied by generic XDP
To: Tianyi Gao <tianyi@cloudflare.com>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, kernel-team@cloudflare.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tianyi Gao <tianyi@cloudflare.com> writes:

> skb_pp_cow_data() copies the header fields of the old skb with
> skb_copy_header(). skb_copy_header() does not copy mac_len.
>
> Generic XDP uses skb_pp_cow_data() for programs with frags support.
> After such a program, the skb can have mac_len 0.
> cpu_map_generic_redirect() and tc ingress then get the position of the
> Ethernet header wrong.
>
> Copy mac_len in skb_pp_cow_data(), as dev_map_generic_redirect() does
> after skb_copy().
>
> Fixes: e6d5dbdd20aa ("xdp: add multi-buff support for xdp running in gene=
ric mode")
> Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>

