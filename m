Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B18EDF59
	for <linux-kselftest@vger.kernel.org>; Fri,  2 Oct 2026 03:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790911271; cv=none; b=GJ4ccVEPLMfpEyr0PtddPJg6CI06zDNkxQsgBcolbmJI1aOahW+8i2LyJKPjnRKm64flh7LVTwvRCc1T8iOY3vkds7Be2Z/Q7nS1qQ26sSxS0RJSiSCBtTFR6XJDq2u+EXdSDPsMwdwd5a2xyt0vGS1tvS/FvlVlufCM7WtaF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790911271; c=relaxed/simple;
	bh=9e/CIFXE1hRvmmBtn81dZMs2PO0YXmm+YvcEIQTBoeM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnRaecOIzQJssLkACpSXSasSSTXnrRCBp3YxdYyOij4sHjg8vpd+AvDAhFDnrTyYCzykkVuMx4fpoPeU5MYeFhLmonE9DDPST3p0xj0hqpr+DNssE51TCGLfZaInl6E/+CglIKhzhxCS20/vMkoV2lMPwYrMCgnCTvhJyevo5QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=G3/K8+F7; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="G3/K8+F7"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93cb9310676so146081685a.0
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 20:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1790911269; x=1791516069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9azLLJ0/w2SLdlZw13OtPeIgu3MHaV6UePQJr1K1VpA=;
        b=G3/K8+F71Mu2gcVcmNmfX6/T0m4YK5IngvZctDFZpfXuH37EGn4ONxXLR1kbHMTTCs
         imUM4a9H7D7YJuz0NAFTDbr5C2Hsj2HfiIgu3gq1wvXXihuNCYQponLgwoe4Mdl54Vpe
         bbGjH3CgSYzbAcOuB88MfqLeGoyCC2f34j9FQfIaLoUnwoItRDzigIC45EKoW42jA9qj
         fleey2Hj/+V9P65bGvPU3orw4OYfnuJfyyKo9UknMYaGqeGeuriurT763umfhfVfUrOC
         w8I3EF+H1bmeZW7S83RNhuW+f0VtOGGizIBZsw3lCmO599y4oIRuZfIW9z4CYXuWJsJ/
         5ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790911269; x=1791516069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9azLLJ0/w2SLdlZw13OtPeIgu3MHaV6UePQJr1K1VpA=;
        b=qavrZY92Ix+A2N/gGIbaJ7ZC2/7XWZYnfNb8F3pg4ZWRL9dsFRRXBjeOgaIUFTxvLJ
         0j5CecTcd+FKU0vLcYiO6yL10gFjBX5g5Hm71Rsow/wI3QtJdtVALJ67R8yDw4S3ltPc
         /ZOWknZL9p6OKTcMwON7Ei94yQ8gKD2/v6JYjN0g/w6Q4dvCRwukW8COvNTYCZeb7fKA
         xyFAhJc0xCIy8WogEDtGySRd9Hp+v8HpQuVYNbm+fk7J6jNh+RkZyh5Kc4XRDOCgykdi
         gLMkxKYmRFO23AujUfJFcKcQ12fBSry4uXwyi5ig59oS0WB5Wv0KbM3qUZ5DpyHW54fi
         J2DA==
X-Forwarded-Encrypted: i=1; AKwUvBxfsBEDADSmIr3jVmfaOtFlOYbZ/Xge730sKL45sHQtF/IfoUbmrsaHbvcEOtxe/V9TIi7dAQw2N6Q9VEFpJYo=@vger.kernel.org
X-Gm-Message-State: AFuF++lryLSjs8d2ydcY/HxrNQqRF34+BpZ+/Epn1/AB0jvfzFyxHy7b
	QUyGyWDoanvezKdbZZXV5Fro0MQHD5vSvchAiMq/HIL/zln2z1Tvj9Ivr/6TQqLS9DwSJL1Rw0M
	Wsi4UHg==
X-Gm-Gg: AYBFou0W0m5vTkE1aDuIrXdMxVfX5LFtG8T0D0A9dCmECWPH0LZfPF+cCei/uU9vlbS
	DNmOsJVomhmUF+CW95fxp5+Lq+xaZsjEtTPzvQGJOId7gqPGlS/8QdWKf3kw0a18chx11U5bUXl
	jIIsbi1zd6F28dPv5T1VegadVr4asUxZbemyxWeUW/SV3YGY6UN3Gi5Got48oAvW92b+HelQqGJ
	5HUzlcemZ+BLmCULWqw+463oE7EGlQqRx4GzWpUuaulamYTTzwmo3FkD2z9O/B+W8DgHbH0lBu1
	R93Bl4N2bQH1591c9LLKvlNCxEHyMG7lwErTORal5t5oYjSowunvpmpAH1HZXTUTnxJTiCdX9yR
	MXCF7zA4ILVarJrcCmmUKWveFfn+Uq4KoajPIT7gUa8Go+s83cOQRQKF+lurPFe8lAGIFlmVvw+
	ypTGHBEYcc+V0Q90qVUolkhXCd5g6Y/UHHr6QgWQUna1Eyq0qEcuMVVWoTUYTDh+6Eb3DAkRq8h
	e/aJ4uoTmOlLS/cQRXkQA==
X-Received: by 2002:a05:620a:4713:b0:939:fce5:f6d2 with SMTP id af79cd13be357-93cf16de7femr243905585a.27.1790911268791;
        Thu, 01 Oct 2026 20:21:08 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm115242285a.45.2026.10.01.20.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 20:21:08 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: idosch@nvidia.com
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	jiayuan.chen@shopee.com,
	jiayuan.chen@linux.dev,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH net 1/2] ipv6: route: do not validate nexthop of routes promoted to reject routes
Date: Thu,  1 Oct 2026 23:21:07 -0400
Message-ID: <20261002032107.3289370-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001154629.GA1611116@shredder>
References: <20261001154629.GA1611116@shredder>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 01, 2026 at 06:46:29PM +0300, Ido Schimmel wrote:
> On Wed, Sep 30, 2026 at 11:22:28AM -0400, hengyul@cs.unc.edu wrote:

[...]

> >   # ip link set dev lo down
> >   # ip -6 route add 2001:db8::/32 dev lo
> >   Error: Nexthop device is not up.
>
> Consistent with IPv4 and expected:

[...]

> I don't understand what motivated this series.

Thanks for the review, and sorry that the motivation was not clear.

I found this while comparing the behavior of different kernel versions.
It does not come from a user report and I am not aware of anything that
depends on the old behavior. These commands succeeded before
21ec92774d15, and its changelog describes the
"ip -6 route add 2001:db8::/32 dev lo" case as unchanged apart from the
unused nhc_pcpu_rth_output allocation. As the commit also went to the
stable trees, I took the new errors for an unintended side effect and
tried to restore the old results.

I agree that the current behavior is consistent with IPv4. The syzbot ci
report on this series also shows that the old behavior was wrong for
multipath routes. With patch 1 applied, as before 21ec92774d15,

  # ip -6 route add 2001:db8:100::/64 \
        nexthop via fe80::1 dev eth1 nexthop via fe80::1 dev lo

is accepted and installs two separate routes: the loopback nexthop
becomes a reject route that does not qualify for ECMP, while
ip6_route_multipath_add() still notifies the first route with nhn - 1
siblings. With a netdevsim device, I can reproduce the WARN_ON_ONCE()
in nsim_fib6_event_init() with this command on the patched kernel, and
it is followed by a NULL pointer dereference in nsim_fib_event_work().
The current code rejects the loopback nexthop instead.

So please drop this series. Sorry for the noise.
