Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795817667;
	b=SaSsYFlV79kn5IX67KoGVoVbEbxdPpo30kZCVEQGI57sjzH9R/kMxT6FkJtcQQOmNMKd
	 eY4C78V9QSxG93poRRacIA/V7yjblcIdMMrfHTE6/xC6sLaUQ0eg6jDqmCIfPku8bRjRt
	 qLLxLb5Ad3dMm49fgAQMPGe87OpvfcV8cA6kaJ31SHr3+kjck+6cgc/C1hFael62atD1n
	 5has/Rzv2E61nJKuMU71aU2+7NpIwL7RISHINsfOh0dEg6LAEOsQY47PEWhyAvbigfHFG
	 r5Kr+XhNflAWafdKQwPtDevSwNfi84P3ZsCoxBSJlYlxTHspOxfziSvn/EXG8J1nuRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
	b=fhO+gO9XBLEUpRCCb/e+AudqJhpjeoB31QjdBS7gHtR9tngG2EgYQLFxQWIenJ2JAmGX
	 7SFbRBBjlD4kG4VrQgIzlO88kics8o8UomwfjBIxu4ZWH9Q/kP50NVF5+aFpFIj5IgbkB
	 R+930r9mlYkMmCPDZ8W18T7cG0aKXif5DN2GqD7JJWDp987YGP4a/ZMgaaJHYNF3RBa6e
	 EpcCBJVrIIltqj0GrQUCf0Ntqhqw1BEyBDZzZeDHSXfPBYdXh6BdW9xt1GDiRa+8QR9uQ
	 WoewOPkwmuBfPovaBYiVgd1MWm4CIErtE1uxSq12xuYEwVed9cYHEFxAR5ZqcpekLNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63830606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 22:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63830606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JwXKkOiA
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b4d07494b0so92599207b3.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 14:14:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795817666; cv=none;
        d=google.com; s=arc-20260327;
        b=TJ0QrMBDs/nSmQ3906a4Q0B/PFWU0B7Bs7mShK89b8XimN+wQD+q/kW3l+cHehUphN
         Pz3bVewQH/WELdKsAtrQe8w4p+iK7YA241fbl47r/cwz0u5fYhBkxOBq9Pyh+9y+Cggo
         V3nOST/ct0jlSYYAPh/QIfnMBNS+abHo8RjSvIyFmorLm6tpCWLx0Eyryt+c5K66zfku
         LnWKOTfS0VrI0bC2YOFQcE7GLuBmxnZ/H6F/B7IpT/0mKLe/VB/Jnq05JkIUNBfl9oaL
         M2FBQqYp/IYqeGTeZI6UmpKaPG01m7nwHQ1jDI/Tq0NgLnKENu38qubhxxAw8YRGCENp
         JUIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        fh=ZHwtvK+6TT7ViNT8hLxMmzlk6cIQxNi9WPtBsyQk39s=;
        b=gM0N5tiNMqWnNuYwwQ+t/8+03YlOVx00xpLriimkg3dwbpJI89EvZTgQphof1T1AzJ
         DIhZRta8+OlCKi7J+gnbUHN1aodZP8Sv24XCm2h0hM0ak6wnMkeHjiYb2YNHVcxhe3fM
         kVydSBceS2S7/WEoXXlDDo8wtxu7k37I5duqY315A78Z4E1f1DvA6IHLObpAiq0/5/Oi
         L95nFg27rg34F4ODXxSi+3NkP5eBqExxNvnzjqc476zmM31ToNFvNeT19ZPQ8Az9+WOv
         MRAGleTZnowEc4N5AIgUHFHvfNvT6qakFFExDxe8yQZFz0s7Q7w6FwaxNGC8RfWn+dln
         MugQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1795817666; x=1796422466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=JwXKkOiA1hHPevvY6KlGz0H49ngjn7RSbuIh1YPq3ZNFaYUe1nazCmKX2br5ZXNy4J
         lrV768348Q3U79vKmJySW2rQ/MkbDivy3dmUMfBNwTYOAPAbhoTrWGG85bRhMU+mxDin
         Q4jcdvzBp30jHmZqt0LjihCvbPF3x7iSxL4xEcataneXHFNDE2OARzMZQw8C/x/OLs4E
         LSe4CdBiFOxtxXIA6bELFzV2YiTbFfJtbz1i4xQtMCPC5/g7joS4/uxbvwPx90zjmTTM
         CE36Ip4C4zEdmHSCsHw+iyU9lpY7XuHS3y/YQZpYEZUXtfn6/OBY8NePBmmoQXkwJn72
         L+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795817666; x=1796422466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R+GWEKhj5g2p+5aZiSD1FIPN8G34y6oXiGP97Svh0ns=;
        b=ZSZxPHs2BKkDL7vciNQZWkJtUQFuMKhuuCLevUfeURJfkXAe2RaPbaHPqwxV+AfQRK
         M5go0WzE8yKM8c1Gt1fA/QDFoUTeXNzZK+/iAd4v8YSzrYm5xUdtro/I+cn2bYsC51yi
         ObL2LwyikK9e5WenMqyrcWVzl2PAFX/ECEk85QdX/1OGJ4zkw5bxKzhCiza6cDD4HsZj
         XDacl/im8TxSlr334mR2kNL8ZrhoV9X/QzBbU/vyqxD0gcpQ7vuKy+2YsqgkeaP3+aXJ
         UZsCN91tLetgUcL3T1DE2oany95VjUZPuYliEICr2ryb7cTzeDweQHz2XPbgWu9lp1QQ
         eNxQ==
X-Forwarded-Encrypted: i=1; AL+hErGHV3DMWUsS4ARda+q6wxCLl6tSrHYgYYxwu2Rapt7xy5TClX6ATvD93Jka0SsrM7uHnSJZfnsweB9mtxAGRyg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+g0Wc+kaWSMHqnPLRKE8E+WpWhT/n2WzWYRFR65L3RQk9+CgS1
	0yinFPsDR+whzBPo6hNGyngyK1oql+MaQXdbg/4LEnbdv2MZc88Ea8extEykPFCyhlO6PHroqsj
	1G7Jt9RvWWoYMTjofPK8KFBf8kX55bZDI3waR7hZskg==
X-Gm-Gg: AZFdTZeTyvni+XHhhsBhVICosJf+68bwJjhBoStu27BblwYm1oAs3fDUi3Nt0dSK2jH
	jgclLHM6/FFF63FHEn4CSEXuXSuVLQFZATTBctvXNoP6bFK3Lt3TfPlaZIiTSHLeFwlOkTf+3WL
	pCt2Qsg32D249wG5fqz3fIQtn5dK3vqP8srfOCRzsZyHlY4V7yso0BwHViBVbj97D53Rz+8DtUM
	W7wC8DvF12C7C2fS6csbhiKiUYbY01sKrt1fF0HVbPtokfNvEorqmbvo4zxeKufRa3Gl0H2Sez2
	Sc04g7toXdT8E4IEVHZFFDaD4u0QmRFfo5VYtKS2XjeZ/21vADDDIlFKhvn9ituSivYTv/L4uZx
	SyoMqQTU8JUeWVLNEvVifzRHkPg8XZOxYzYT/qddvN0LBbpamKussR8ymsZ3L4hoeEEXY
X-Received: by 2002:a05:690c:290:b0:895:8474:3c6f with SMTP id
 00721157ae682-8b5201eff64mr106815777b3.0.1795817666463; Fri, 27 Nov 2026
 14:14:26 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-tcp-l3mdev-exempt-ports-v2-1-b920f3ff8f5e@nexthop.ai> <179572802536.3135.6305865608768923950@kernel.org>
In-Reply-To: <179572802536.3135.6305865608768923950@kernel.org>
From: Kalash Nainwal <kalash@nexthop.ai>
Date: Fri, 27 Nov 2026 15:14:14 -0700
X-Gm-Features: Aa3M54oqRaxMY7_UWPQgj5lUHHUmW8MGZPBMkR5eyixxsYNc4OEEliipG1r_sDM
Message-ID: <CAAv61uQA=z5i7OB3O55jvcZP+wVt5907oPUnhuO-zyjn2-P-SA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] tcp: add net.ipv4.tcp_l3mdev_exempt_ports sysctl
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, dsahern@kernel.org, 
	idosch@nvidia.com, ncardwell@google.com, kuniyu@google.com, shuah@kernel.org, 
	joel.granados@kernel.org, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> [Severity: Medium]
> Could the commit message explain why a new UAPI knob was chosen instead
> of fixing the selection order in inet_lhash2_lookup() and
> inet6_lhash2_lookup()?

Yes, v3 adds that to the commit message. With both listeners present,
existing setups get a stable result that depends on creation order and
address family, and making the bound listener always win would change
that for every tcp_l3mdev_accept user. So the new behavior is opt-in
per port.

The SO_BINDTODEVICE case without a VRF is a fair point. The same
early return applies there, and this sysctl does not cover it, since
it is scoped to l3mdev traffic. A change to the lookup itself would
cover both cases.

Maintainers: if you would rather fix the selection order in
inet_lhash2_lookup() and inet6_lhash2_lookup() so that a matching
device-bound listener always wins, I am happy to rework the series that
way and drop the sysctl.

> [Severity: Low]
> Should the document leave the fast path columns empty for this field?

Yes, fixed in v3.
