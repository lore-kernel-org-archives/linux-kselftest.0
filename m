Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A40145B27
	for <linux-kselftest@vger.kernel.org>; Sun, 18 Oct 2026 02:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290334; cv=none; b=esZh7tE7KQwlg+G1QVSNX3giOGTOElPo2HrrDeh4C7Z251uKHrPo8En84wTiHA79zFdCqAdyjiG5KHrWxzl88/sMHXKtBACJT5nYscqNfR8G5doHAsK5mhs6EPr8TgevmwCD65GfgsUmD7N4Hj9b/X83p25Lr1EQ4/L0aTmf3jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290334; c=relaxed/simple;
	bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IghhErVbBmJ8FnRGa9VbMxfb0dDI63rkmtEO4vTdDiuxrv0u0gJJBMoBc+AJycUrER3QszMOVisS1cVlsBFmpwNpE8MsVhFL/dzjAg50xnANBSAsyKCK3AAjiB5kHMESvLoNPJMBqck3gJogZtVNQQZaRxnP7NVQek53OV5eOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=sJbwSk21; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="sJbwSk21"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4301e334ceso12878566b.1
        for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 19:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792290332; x=1792895132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=sJbwSk2180ZFZkpasPbMUs+VnMuDmisi/Ml/uMIqWgJu+Wy2c8tk0IPP8f1gNewA+9
         7j4qFEMLErx/AMNezdDNt1ya079p74pP1J2G07FVj4DcMBu3XwhRcP/KVRuQY9N/X8zI
         g3QUPlvDmAud0UDDID/3PKF3hyiMlNaFURBHy6HaQCah7yvngWZbyE8FWAZOz2EIZ6im
         4Ztw1lG2LyAbP/lJW1CMRQa/j1l0sWkuM+ufTN7wTzXQoxvLfe7no1E6s+oAoor7hb48
         dwwcD7adG3cEge0Ghw7bGupo+mxFmjjgLJHC5r5QdV9kGaSUvM0u0sObg0arJdHDXXcD
         VfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290332; x=1792895132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOWgL4Y5aOSoL3opS9VqD9bwE2Ik8UunaS8+RLwbmv0=;
        b=C0VBwZIA1tWBLALou0W5qB1Sxomsoj0EoHYIb/brNkoCwE0KgNLpa6+vGi6c4Dm78+
         0x7iF9q3GMlwCY7CrPYcuSsbaQ/RJveowP7Hyk3JNKYA3J8V5WQBdm35uPpbTH8Y4Tqo
         xKn725HjfYcj0mW4Dp1F44wcX+9bDMDfArfYG9B+Fj+FuG8DTKgaI7dV7brEcTypWLeP
         g/k1xFhT2WeQT4oI2qx3CKHGecFCMrQLSmkc9lprU6LBOaiYdBRbcMx3QK+rjeY2ROjB
         WxJdn8dqIl88g1jCwnQTLgtgLxQA5pgD/xLrrDBx94LZTcXOdQj28sdZjYMtQyUJ5liw
         cKmA==
X-Forwarded-Encrypted: i=1; AKwUvBw/kzunV2wWOjKgOejrQPygYr4dwkQIRCgPfXQRSUmc+r5Ewg5FVrT/j2XFYPmYpZumK8pPg1sTCRC/wt2RuA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxShmv5ejkz7uZGxckh3nxMiYgKBYCVDBgjflQ76vRF70KH42z
	pgwn9hmx2Mz/M/f59Dl3GytINoowAMlVEywYTwjlcbKTOkdDMQVHEBj2vcllRQFIkw==
X-Gm-Gg: AYBFou1QonkIKJW83XhfEUoWaF9m33ZAZ1uGXd1MRQ7XECOITjfT07E3hK0XTosjeTK
	3XvsIYgK7iVXdwdPuSHMS+G3VhtACPQXZZQAhkNyPk7AiKOJ1/GMfw1gjP9f/Ek1hNsS71myAzT
	jG3vfO8+I9O3dYBeIFup+dIOxqY16ncV5qSsEUncg9/xfEqHEQ1l5XnhEToLEYygApB4TDmPPrJ
	GsE1A6G3em0e+jpdASoFssVkMvpGeYEkK+tgrCmLPK+jmMjdTgVmveLZnfYjoha3YiKS9UFcNep
	qZ8wgfHqdMOUd0/2BwiDv1vs0wzy/6OzjBTOjhsBEHzW2YPIO1YGpUBgACFqRUZtcIjNa8j1gPr
	v+YarRzqfnUmZO2GmtqB14DHnMmLmzQASK8NldI1LVD+y8+xkS5MiUAeDuxox/2HahhUWezhnez
	9W2w3nq4QlDe2wCbF9egoqMGj02b+IrkyOL3MLM2899JrfMRt/OZGQc9YFrDg9buJ2g/yG/3ror
	KwaTnwWHocSbSPFTHcSZP7Dt3rr5PGs8FMtZPSkVlRa3we/cK/yore4cDTuLvfSaErHCx2kjylM
	ZiATuvfDGFtOSL4tCb5+v+nvWJI3Z14m37r2YvqUCmjdx0PDJ5U5WCrogxzOMBfMv+QhlYuIJkO
	l7yfp11HQJVhGO1U+dsw9BGY+uklaGU4Av1O543fO+iUzAmfCiqus6dDRPZt0Q72pA4okIqyV07
	JXFwo5UMfDOwTSqUlviX1dFiXncx19Li/kZ9K8VVeAsoPNnD2lnp5LpXYF6TV3Lg==
X-Received: by 2002:a17:907:e849:b0:c40:4320:de2c with SMTP id a640c23a62f3a-c419e73e2a1mr277700866b.15.1792290331870;
        Sat, 17 Oct 2026 19:25:31 -0700 (PDT)
Received: from Desktop.fritz.box (p200300f247429d100000000000000a27.dip0.t-ipconnect.de. [2003:f2:4742:9d10::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm222994366b.39.2026.10.17.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:25:30 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: jianbol@nvidia.com
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 1/3] net/mlx5e: Ignore FLOW_ACTION_PRIORITY on flowtable offload
Date: Sun, 18 Oct 2026 04:25:27 +0200
Message-ID: <20261018022527.4065122-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
References: <CAC1t37K0tEMzxmRhLeHnH-TPx61pZmCHt0xxTJ5Wq2Wxvzv8Jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Jianbo,

v4 is ready with your Reviewed-by on 1/3, the rename to
skbedit_prio.c and the consequence line. Pablo asked to handle one
series at a time, so I will post it once the fdb roaming series is
merged.

Thanks,
Julius
