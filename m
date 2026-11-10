Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321035;
	b=JsHKg/qjSygovnMNtSHM5UDLvhM1bbqy/o1Jz0j5xCMrKykZktqsQaPsgkQ+p+D5vymH
	 0NF9c45rxHoBExC55/OOUNdn7YqT20HH0xd1etfIVRWDb0lcONreMrVUkyQRotszmb1Ka
	 ZkBRj2bX0I1f2ZWq+soV8JdYayNH+NR9MbLeGeQxtGbowxabHzRCMO1z1JfuUq6R24qmJ
	 y+5JuqEEjvmhgWoieYtxHWWCoMcWdmlR6QSluLguf1axck14PLx2jTcg0LXDVS2B43jPl
	 XoVws2J0iiqBHx3+jjYvXh5pV6ldjqZkDKRwKS/M5Am8XdH5N65k1xwkr3DTIweZI0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6/CXb4XAs6m7Y388P2LyinUrq14d6Ww5jL1xjGTpGAA=;
	b=ZyNGiv913iXXKuTCcf2TfTyQxYWpA4KoYbk9UyxIPSgjguDScusXMQtV1mlybPcLsDMO
	 VeEAyrF3toJwjAoY05f2ehD2l0tMGKKaaap+ozTPFhKS9ladOcBZwY+buRBm3NSjzXOU/
	 /h4Poh5qGVRbKxYE9++kdF1oSz4pi1x310YhWOFFc1/qyRknqqvVPz3IFGU0Sj8Lh8pR0
	 uY0vj7N/sYRKgWQpkaYbugPIahEksxY4laKMzKxGK0bwSHxEmr4da3C9MDJ6frO/XuCum
	 FSnowaANZcq+2EvXpnT4T/Z5JmyTfzSjGwK6DrtmUanBU7tSpxKu9/AreJDWKVxH+0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JhzTb3yk;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642B4606A326
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 14:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 642B4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=JhzTb3yk
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b10d24345dso20802867b3.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794321033; x=1794925833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/CXb4XAs6m7Y388P2LyinUrq14d6Ww5jL1xjGTpGAA=;
        b=JhzTb3ykbX11lJSAIZbVscW5EaGa/+mr7Y7zxwC7ObWFtP/W1xxUi7zSpH9YZtyJiE
         LrhPv1r4xwBer2rGx5z0wRcVQBw1mk3HJdUMN0eJOleaj/lU2qM+dhBnOekKKZuPudx7
         0w72nEnKT3jf84Z0LtzKPC0VcjLzjEiNrN9JM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321033; x=1794925833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/CXb4XAs6m7Y388P2LyinUrq14d6Ww5jL1xjGTpGAA=;
        b=eQROCV461ciWARP6EiXLSKYF/L3saYQzfy29bAjy7ppeQnKu31sVDpleGqeDgn89Db
         m3f3Kk11lS49bWcF2k/1oe42KPhaiiZ5ry/juwKm2aD+Wnpq+SadU7glKH4DsZxPfaXP
         /pnHhobHgUN6Zk2nSponQ5dj6Owbp066i/Gv9boyozIAcp9QV+x+9qop1YiHZ3rmNnFR
         Fwsb2Uc6YCPZPDWNmfE1Vju5gr4Wv1NTLXMu46NS5vxYlJLcBTwoSQeOv1VFaxRnHmOo
         7eoG3I4c5bksMfjtXLFMOCJllrPJM+x/WZusVtWB23HkI2zJkze90fkEEf7dqPI254e9
         6d1Q==
X-Forwarded-Encrypted: i=1; AL+hErHwUizVhNzToBclzPygnVPrTdTqqHDFhusIxe43335WiZS48V1NHzBWCpjW5TVtoxEyah2rd7xP1HVBJGUO5oI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nNYJLbtPkEnAwvjzACe4DnOBJwR456aphBsLe/YR9ickHIEEd
	FZNWMEznoeGKWUpN4S/YlP9/Prb6mzFaelI4IvOrYggdR9txUBMdCskwpdYXFBNi1Q==
X-Gm-Gg: AYBFou2yQuLd1vkcE0hDgjBcarSYT48/mcm7VHhWiuSCpKeWsmF0HzFZRbHr1OAhKot
	r/D90iNH4NtBJU8Rhs0K7+oAvjoiDPY9T75uP0BMA+zWkSalzuKOzc9XjUWpb+NPPtyUJmYZQ3b
	CtTJtriwtDtLMehodes2Oj15ywncRcUhcrIuwqxNlR4zldXGJkIJGqxIuVMHVhD19rSCieIl8uW
	mFwf2vOhFHowAD4X/OlSUx05MyyfmzwFwf5T8yrVA1X8ZfxGcNp7JY/qO49bWmzb9zKURj0Sfqa
	FhpQr7EbsvtFr04dl6rW2qIDfeCr5bV80WteANH2QGSfPg1/QLCr/f8HiaN/3/g2UVVewOken7o
	Ou3d1Ae69kV47j/D7InOaugJDg2dRsX1OXGy+NVMtd3WOoD/pVH6zz+aNwDgLkNuL4Wqm6Td+FK
	sB7UYpQBA2rqMiVLJCYhy85u/WjIfr4hxCatPz28qZuHn7rJ0d33kLyCNqLKrFQDHMz8jfuuDdW
	aT+thnop9gqglBlci+QGWe0bNLauL0g09pFIW3Qun0dmVrCqFjyvtwgkPEXz1FiZFmLh05rxIpQ
	XUb9p21BZHUy
X-Received: by 2002:a05:690c:113:b0:8b3:34b6:4bb6 with SMTP id 00721157ae682-8b39290d62amr19146297b3.5.1794321033236;
        Tue, 10 Nov 2026 06:30:33 -0800 (PST)
Received: from exu-caveira ([2804:14d:5c54:4d67::1c9d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393479120sm20091647b3.45.2026.11.10.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:30:32 -0800 (PST)
From: Victor Nogueira <victor@mojatatu.com>
To: netdev@vger.kernel.org
Cc: Jiri Pirko <jiri@resnulli.us>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	sashiko-bot <sashiko-bot@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v3 0/3] net/sched: bound the deficit-refill dequeue loops
Date: Tue, 10 Nov 2026 11:30:22 -0300
Message-ID: <QDISC-TIAE.v3.r0.20261109173518@mojatatu.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DRR, ETS, sfq, fq, fq_codel and fq_pie refill the head entity one
quantum at a time until it can send. With a size table that inflates
packets to 1 MiB and a quantum of 256, one dequeue can loop thousands of
times under the qdisc lock. This series skips the rounds in which
nothing can send, so a stalled round costs O(N).

1/3 fixes drr, ets and sfq.
2/3 fixes fq, fq_codel and fq_pie. There a flow can still fail to send
after the skip (throttled, or dropped by the AQM), so a setup built to
change state on every refill is still slow.
3/3 adds DRR and ETS tests for the refill result and service order.

v2 -> v3:
- drr, ets: a class quantum change takes the tree lock, so the round
  count and the refill use one snapshot.
- drr, ets, fq, fq_codel, fq_pie: the skip is repeated after a bulk
  refill, so a child that exposes a longer head or changes state leaves
  the fast path after one more pass instead of falling back to the
  one-quantum loop for the rest of the dequeue.
- 3/3 is unchanged.

About the request to fold the loops together: the three dequeue loops
read different data structures with different eligibility rules (DRR/ETS
classes, fq bands and flows, fq_codel/fq_pie flow lists), so a shared
helper would add an indirect call to the dequeue path without removing
any of that logic. The common shape is described in the commit logs
instead. cake_dequeue() has the same one-quantum refill, but its
dithered quantum makes the right fix a different one; it is not part of
this series.

v2: https://lore.kernel.org/netdev/QDISC-TIAE.v2.r0.20261015163454@mojatatu.com/
v1: https://lore.kernel.org/netdev/QDISC-TIAE.v1.20261008110502@mojatatu.com/

Victor Nogueira (3):
  net/sched: drr, ets, sfq: skip empty rounds in the deficit-refill
    dequeue loop
  net/sched: fq, fq_codel, fq_pie: skip empty rounds in the
    deficit-refill dequeue loop
  selftests: tc-testing: pin DRR and ETS deficit refill semantics

 net/sched/sch_drr.c                           | 57 +++++++++++-
 net/sched/sch_ets.c                           | 53 ++++++++++-
 net/sched/sch_fq.c                            | 87 ++++++++++++++++++-
 net/sched/sch_fq_codel.c                      | 80 ++++++++++++++++-
 net/sched/sch_fq_pie.c                        | 74 +++++++++++++++-
 net/sched/sch_sfq.c                           | 41 ++++++++-
 .../tc-testing/tc-tests/qdiscs/drr.json       | 82 +++++++++++++++++
 .../tc-testing/tc-tests/qdiscs/ets.json       | 54 ++++++++++++
 8 files changed, 519 insertions(+), 9 deletions(-)

-- 
2.43.0

