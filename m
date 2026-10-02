Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A8A47DD4D
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 10:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935963; cv=pass; b=Nh+9+rQ7hri5cyQgKraBbRDQhZjVj8VktHFk9BvMw3LaJPH47/jFa9xrrLgwKsAofZNw0DMJnm4LKFH2VoOlVtj/HsPNPn/fFn3c5cA3zOpZKmixj96oLWn3qYDRzGShHf7Aq19RS5SaR7Biqs6/sHaagjtX1h239+yw0mVb9UY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935963; c=relaxed/simple;
	bh=KfWkAC7ciIkbo6PDaSl0uLznVmfVh3leTBBxkpyFSjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tvb6rjVrOxkHM6FJF4eBKVvme12ApisnSwE96zjcgnj8yDWJ35En78LHAfR6yEb4CGC3GaIJgvsL0G0zWGCFEHLFs1yt4bvSxmP/F3EY1mqTAtIQEK1EmRxHVvnsW2cf6zws4Jv7oOTilRLpcdzekstcghvvqz5Rrz8o4m7RDl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCzZsjB8; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCzZsjB8"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba330dbd67so3364200e87.0
        for <linux-kselftest@vger.kernel.org>; Fri, 02 Oct 2026 03:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935959; cv=none;
        d=google.com; s=arc-20260327;
        b=Ad0+bTJ20fOAAgamPlREvalEMzsAoAdGBXfoEc269r1Z7N69a3MtL4IEgEtnnouenJ
         9SdHuwevymcZIFBGFGJBCuLQ3McGajvo9Q0kC5Djm71ye2eW7S+sOqYy+pjcvyhN8zjD
         W8JvZWH2gVP9zyD4TLG3wHlcrIFXctEgerserv1ENRFrb0WnYly5cJt8TZPPqp3WxtPX
         NufN5Ofs7bHiPY0cBoJvb9L1Hs1GyiburQs6DnyvguqUnGsLG2KsakfrtsECC7i3G+F2
         Mu6KaXsZkXBoPqzoWksXFaZSwq/K5dS/9BQVDc436vke75RepW4RendIIoEkQFWPndly
         PGdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        fh=OB1ZImQr+ucJe+qSLVoUj3S+3RqLbXDFYVpc4X5XIb8=;
        b=d02OpCCgDaUCIDM+/7y6iltEYKynmNFe0xd9xHpvivRc6dCHVzg2zkWsHvluNy2iZ4
         m1YkuB+7DIfMkHhYIxx37BkhUAAnmfy7kl9GdV3v7BzPU9Wic4TdxwbuwutHNZ9AeaSX
         y7XIFUJZu4Zn2dBZrSC+hf5+RsOli9qMwExy+3IbVCTjaz/pisrA3WBMb3Z/6au+HpvS
         iSVgWc/kMacloiTZnSrb+++rxZzG+cMlInewrei7fosJyqPskDHeyCSmOtcbdjkGDBT2
         SMJEEGJvayy1KqsxWyfbOmxb3nsq9aRZVWdX7UWj5Zg/G72FrKFTE67wjzDVvd9ANCmo
         x4Uw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935959; x=1791540759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        b=hCzZsjB8PgyB5anSul08lit+C1jRucuP28QGt8obp7RKjLP8LTCmMQN7N8uYA6LyGP
         rHcOew3mJhljYm+OMCgcahnkIEwcg1w0QTn8UmVlLhTpYFYJFjDXkYc/s0lbmdrrZ+AH
         MEXwLHnbm2mh1+AaNIjvnuCoLRGsMC2mLt2ECGOU6PpnyjTspPYC4+PQh5IKjCrydNoV
         0jhYE57svlhfk5jVj0gipUf672VTSgB1hUeso49UWBxeaOEUX3d5yZ4Tn4RBFl45mC2l
         zTI0OzHvT5fiX3XeurrHIqGBJifGxJTRUjg34XfOJwOy3Adg3c/t+20j7euNiDNq+ads
         sQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935959; x=1791540759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nul3VjPP6p4uv61w9bRbyY3s7TwhdtmKvGkMiKjUI8c=;
        b=KmlN3qSDlv4hZOtxdVmLQRuP7Hg0qTekpaFd2Ry2EK53HmeBAeg8AtlGE1tovl0xcd
         LvueDmBPz4hya4B/gf0ZiTlyfw9r6G/wnQFW6MEQ85lwTsOi3kzc7G49hjFCzMVNgn02
         PLAzOLKS3T5h+xJv3AcLYpzjkfq21pXdPtuCsSgnlvc6CcKE52hQYipG/Y5R7VGbqhcj
         r7Bh89Lw5pRTWiofVH/dH3y5xPOw5WjGUst4LChN9Fv0Mq5aQNbi8Nsvalef+K5CFcUV
         tN82X9Zo5O3o9eZ6WYGwDorkMpkwdPTsvq/lha7I1qcw2MiPXRQ51TfooOSR0yx6dLIs
         0LGw==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZGrWkQKoBMQGbgO/U4JVy7QTIPDdumAGgwTNpdYPyilnxP6wk2ZcZtJqIwhrRGdXmPODrFY6fI0VS3JwGU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVM0Np2oJWfwIbY9llahThaW6nqcLrGhYt4qmH69dFD07LZn8D
	c5vfPWct2NTuUeGJyNukPRn/ws2Gs8WUcGuyGb07u6ZZFB8qiTgExXIPJNe8l1OhAapnGR0SR3S
	FHmld8Yl4wMATgzmd/JNrcfAgsL83+4M=
X-Gm-Gg: AYBFou2j++OVYAARu3TnUHtt7hM8qUCEhqfxspmBl3abgUPB4q40Do1m7O1gmJ5Od0K
	VAfnLaQqEEP4LS8tqf8skc3SnhdeUyxP9lHZ8Lmn9D20e7H9MbVASv+bB5cJ5s8qmyAEOD1g90B
	P2cZ9bmI5twHsAWT12aOVvMo+Zy5wmCfxyaHFYTHRfLAdquM9ZWn3qDCsibDmYFEcG89Nvo0rCz
	CEEjPPYijqP7Gwad+Ym3TYnVdUho67MSH4ok7MNl7mYnbi7+N7ODEHASuILvFdtabWaA7stLCln
	chDcD851f/zXel9WtAUo96Gc1OKUedF/IlOJv0dh4/IFvIXlvksQRmszsejqV2V6hNR5BavqoMU
	V3zwVLUX5PAGQKzJkWz2F7Q==
X-Received: by 2002:a05:6512:a93:b0:5b6:1a7c:aa12 with SMTP id
 2adb3069b0e04-5bb9bb1da91mr722330e87.42.1790935958794; Fri, 02 Oct 2026
 03:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-5-sigefriedhyy@gmail.com> <179089748154.434549.15968186317991628500@kernel.org>
In-Reply-To: <179089748154.434549.15968186317991628500@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:12:28 +0900
X-Gm-Features: AclHuK85FbqNwq-ELq8SKnyUcRuKjUZjdyqLDZaraiuSRJzWpMMsnKZCTynBQIc
Message-ID: <CA+7S2vKEVD5HUnotmTZ764iJXEWbPXY6bDp9i6p3uzm7ZFJkCQ@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/6] net: add AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Medium] Concurrent device removal can end an unfiltered AF_PACKET
>   RTM_GETMULTICAST dump early without setting NLM_F_DUMP_INTR.

This window is in unlist_netdevice(), the device leaves the index
before dev_base_seq is bumped. Moreover, it seems it affects the IPv4
and IPv6 address
dumps the same way. If it should be fixed, it seems it needs to be
fixed seapartely, not a new issue introduced in this patchset.

> - [Low] The commit message gives a false reason for not extending the FDB
>   dump.
> - [Low] dev_mc_genid is only bumped through the __hw_addr_count_*
>   helpers, i.e. when a dev->mc entry is added or removed.

Agreed on both, but they are nits, will adjust if there is a v10.

> - [Low] At this commit, Documentation/netlink/specs/rt-addr.yaml does not
>   describe the new AF_PACKET multicast dump: - The ifa-flags enum stops=
=E2=80=A6

The spec update is the next patch.
