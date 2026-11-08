Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141341;
	b=UyjZMPr8/qPSUNsiYusCnMU+6dqHnnEqtN/ooQfgkcjivnExPskdQoXdQT80QPxMnU1I
	 +v+t5+97OCucQ9HwzR6pYPhuGBwXegbTs3omn842QEpr8Z7+oenAM/MCcxYc9NwD8F7yc
	 y/D7XaoMSO7Pban0+hdgeE2LVIU0t5Ecwq0/oRhdnqn8KnoFb5CSyCZdXzy5VXbgxPWku
	 I9cOompQWm/EohGkRQgv9du48VsgkRWdbPybeAufYzxgbfaKVUbdkztwDOq/dchkt/+ex
	 zIj0SmHnT+3BMQKdgOm+JqRGXe+JhQNxoXy8oVNyq325gDDiM0Uqn8w3P9zIg1LGv+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=BsIqDH2uBIw07srR7JvSFFgacKj9qHr7Bysu5dj2LaQ=;
	b=gg8PJS+P4ZSFM6XYw8j1xBLrtl5Nen0TRvS29sRtCKqfqdPEascmkx2Yy1fFJz10IWzU
	 BWpAKFkIGRRKvLAx3iECZqb35lGxv48h7z7PHK7Wu4vXYWZ7GoFwoe4KuFQDh21hs0bXO
	 KwmKsAcKDmPLd4a1uC1MOcD+lhuCIZdvNf122hPkOjgZnm3LGL/cQJMjiUP0YJkSZse3E
	 QfGwF+b/pR3bKCVQxAkDdSksWYjv0CWx6BMqwUJ6g7/FN9hcBxV7283zWQqYXWTxEzRK6
	 dpFcXaIoyWfOBA6s5SsIXxABRnB0SjSdaa6qUs0stM+kqNHoae8v786HMtu6fV7v44A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+8q2x3i;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB51606A320
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 12:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB51606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c+8q2x3i
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67990a45e02so27540d50.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 04:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794141340; x=1794746140; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BsIqDH2uBIw07srR7JvSFFgacKj9qHr7Bysu5dj2LaQ=;
        b=c+8q2x3ibzX3DXzv36nytcJfoaxql7mkrXSZ1ykHvC2IhuVHo6W/fsqeB0shu9wl7a
         6W4w/kP17+wKfkTqjwt3F+MERyu7So4fAsTAwuk50DnjtjfXZQVRsmEhlJ521I3KrC9p
         3ZO9RCIjfd10csfppZND2Bhg0pXH4pUWhxPCHX7OSLiNex+WjU7anHQ+N5RzVUyRGxRy
         hFn2vRdGbo/AO+WxA9IQeFHcKLAEI/TBjdj63deXHdOpI59bnMLep0KJxxR3QjXznRf0
         I7vMuoqnmfbwLRK0hDoNrtOCLd0nPU021BlLLlC+5aWDP29xDEtDAUEiGWVSIPVAUjPl
         nnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794141340; x=1794746140;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsIqDH2uBIw07srR7JvSFFgacKj9qHr7Bysu5dj2LaQ=;
        b=HUeJKECjq2br3wbp3JCj9NME6f/AOwEo4Qmlf0cx6TRSFKiOgmkyXpn2SSx9twTNte
         Yo8zhc3w0qlFWNqEL9oeG9jso3eQwlF5ljGZE3qFx79qh7Fzq28Nyp0yPRSxh8pXqaF0
         DEKDCzYEgyHPLfy+pJjoTo6oMDgqMfZ/0mE8T5zX46+bX1vHG/BN1I6MQkSA4AsdsZAA
         uQGtWVTV4gTsaZVgYL+0lisUWbabwwlombBncmdB1x+m/tDyinL0/rUvbpf+N9eZoASl
         DKho1CMiUzPAB+S7+101NxvUDT51bSV7Z7SnJqb0s1SSkLZ0lXekAUajU/Sjq7u9U/5D
         N49w==
X-Forwarded-Encrypted: i=1; AL+hErGRcV59y6ZJbagJBP7SCuFZVQK8fTb9BZ75lwgoUqFu48tG77byvHarZNXRwODp68HsdILoPJEwac5zj2E5Bg4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QiJrzjusqc5omEMsP/PNRz7IeKGmaY5rGs2gy2mUtVnhWLvBI
	EV34Trq72oL69veG5UtWM6yK3yunZO2uzKQBDrZ47PSh3nj+mGjATYXb
X-Gm-Gg: AYBFou1e+yrM8E3On2X3ykEN//5XxDdeUpjhtn+7fP8OFEnEhr8OkSFF0aCc9PBeLw5
	Jkj314YqFOT3mIPrkoH2VM1M25XOuFkYB+lQ4TLxVkN0FvJ7QLSqrtREVMsq+PSVMl0GdtIeYjj
	6KvxCw4wIN9tX7l3Odwi8VscMhRoaccmWZgivC/mrhIzM/7qJMviRTxNe15nsEaY7SB1ACfjDft
	KmR76CBeWI0CngpJVMnUbnmGp6ob6BdqCBICG1kC3KTA+8De7D2oUlkWRi/r3+NggY1sA2F7pLF
	6OGhYVzhUaXnViKm8dv4f/WHndh15dD1ZWloXzgm94MKVos03MVozbIS+DVdXPViyCBXtItskNZ
	FUWtMhQk3r5r1YRmg/mMfwKZI4il4kEvCLuujDyGgTO+vyydpAJpQh24P+4h13rv2XPnRDXx+9o
	S6AEOyQcMUAHl86JP9V+Unqh/SceOkKK10ro9zYfQT9lZ03h6/RNNm/zLyf743oVf0paGr92ZYv
	MV02GT2IMbSQ5Fs42JI1s7z9IgbaI3dhQ0hgjMMkrZzFXbQ3KfpB/s53aQ2qtc4lj8gHtIf5O1D
	X1ImdNIsul7J3i5MXxhDajTVAq8PgD9u0UA=
X-Received: by 2002:a05:690e:441c:b0:67c:608:b375 with SMTP id 956f58d0204a3-67c3da7825dmr655795d50.101.1794141340146;
        Sun, 08 Nov 2026 04:35:40 -0800 (PST)
Received: from [192.168.100.12] ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c3b959615sm1680270d50.14.2026.11.08.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:35:39 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org, Aaron Conole <aconole@redhat.com>,
 Eelco Chaudron <echaudro@redhat.com>, Ilya Maximets <i.maximets@ovn.org>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Paul Blakey <paulb@nvidia.com>,
 dev@openvswitch.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v1 2/2] selftests/net/openvswitch: check that a failed
 set keeps the features
Date: Sun, 08 Nov 2026 07:35:34 -0500
Message-ID: <179414133477.2826493.3370183031916994716@gmail.com>
In-Reply-To: <20261107113403.797779-3-houminxi@gmail.com>
References: <20261107113403.797779-1-houminxi@gmail.com>
 <20261107113403.797779-3-houminxi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Both are real, and v2 fixes them.

The Medium one: the else branch treated any failure as "the key is not
there". v2 reads the exit status of the recirc set, takes EOPNOTSUPP
(95, what set-dp returns when ovs_dp_change() rejects the recirc bit
under !IS_ENABLED(CONFIG_NET_TC_SKB_EXT)) as the reason to return
$ksft_skip, and fails the test on any other status.

You are also right about the fragment. tools/testing/selftests/net/
openvswitch/config selected neither CONFIG_NET_CLS_ACT nor
CONFIG_NET_TC_SKB_EXT, so a kernel built from it could never run that
round, and the claim that both rounds fail without the fix did not hold
for such a build. v2 adds both symbols. I built a kernel from the
fragment before the change and one from the fragment after it: the first
reports the skip with the test harness marking it SKIP, the second has
both symbols set and runs the round.

The Low one: ovs_dp_change() starts user_features at 0, so a set-dp
without --features cleared every bit, and a pid list sent without the
dispatch bit was ignored while the command still printed "updated". v2
reads the current features from the GET reply and sends those when
--features is left out, and the help text says so.
