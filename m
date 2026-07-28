Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB6D33D503
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 16:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254997; cv=none; b=B8mw+vQ+CZBfBnKA+Gdx3CtJv2KeULquvIiLrixmTpd3f7Zk2SC8Y0tmN+hXav5+PxvTMCbyTxwEvR4qq6EcpLHVZV1fvgpias2hd16a1tKUjJTmqzZGyvKcg4qcdDggFbBzzjY1ciQRHrP9e8t7rtrulcX1tBgyemWF6FH67gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254997; c=relaxed/simple;
	bh=VEtKYItgvF6GpuwE9OlSTJxtu0/qIWoEYNaHdcweSj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKJGT0Q2Sdpj8AXqnPosbGScn/zBGZVE639p1/+Fvq/PRKnzf3jX0YEo2P0QrDCyJ5sRy9iEyg40Y+wwUZ+N5A2MtAjx/eyVE1dzIlHCn/+LYa69K/0EXTYFKYB5GT+okItkV/mbFUKVXGMmlL1eJsVUEJD5ilGnVI7Y1NNFSMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=exmQZhYL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="exmQZhYL"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so19346a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Jul 2026 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1785254995; x=1785859795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKlkS10WHow2oZrmc6sXzbA1EKchkKNr9Oo/Gx0jkgY=;
        b=exmQZhYLEswmqDMMmoiLhDwZXpTOM1V/y/W5EbqXHIVCO2zq1Fou/QkLJSdm2D1B0i
         Ugo4o4PUdMQ5yhaanFzhgLmIegFV95DWaWNPNPTmfJ3pmvZN2bM+7m0/4j25vyc+tQXP
         94I6dPTacvNA9OKpHQp5DulUdHlBFhBvmaWuBH7HEZjsEb4oHZmdbZ5GNHB9Ub5rquJL
         0tAzIYRwjYMOW0ssRgFNbJkEiMK5/06pCV8wFGtdRE4h/fFU9Dz07JWCQgtXqbOSXm66
         8fs+p9PkiTV3Ddr8kMwF3R2FCjQsG34VS8P/aSWI0dgudq5zftF0jFtt4sFe9jicfTcr
         s9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785254995; x=1785859795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKlkS10WHow2oZrmc6sXzbA1EKchkKNr9Oo/Gx0jkgY=;
        b=L8rQkv6acZtOehMgeD7dJRny8b0RBkpXVwxgmaTWEzO9AbXFAF44GuCpOUsW97p/fL
         h3tRWenVrIAmx74W1B+r48j/80woM7K5ZSgXoi8mq8+oQlOs3Wp6nX7iUzCgUYkgDZ5S
         PPXIwybt1V45rkY5cTQ+u9s25dwb/74sm3lkZDbRGSWHIUhuf8TG+Cy6rBcZG2/YeN3K
         EUDMXMPwdBQ0w9A/ffkkK8J+HLVMYi4PT0jZ0wCv3uUnxm0/0QoEJoOXIYoTfYfqCfuW
         J4npsyk7Jtden7CtEPe7UHI3NuROwPAHKP3fUDH2s+JD0GJin4ctHfl/Gopd46qPDoqr
         sd4w==
X-Forwarded-Encrypted: i=1; AHgh+RpyMusg9W0R5LcO7ur7D/6H/jj4lH05mrvntViPT4mqAGMC6rKoO64dOKsf12knKf+3bbAifYhJ2nOUkoJt++4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+e6AfXJrtH30277pWNOxna1RlzdfIzA5psdFiv543vJy/K+ZL
	K3T6OotST8yhfdC7FT5fAo4sqnNbDjkeUQoIrKhqBJb4DL1GeQW1wOuOwiODTbb/y/o=
X-Gm-Gg: AR+sD11zXJ46tMy4FY4xnkv127mljuiwN5HbjHveXdkOeWo/HUtY9nCdu2AKJ70k9qD
	LoC0LFFK3gk1AUEel3VfRedNyL4RtLh7rc7WMxXY3yhQckYWO4xo/dC/SZu9tHNBOhh+4Plg+8y
	A0eBAF0a1W5ehAWVQipGq6HZtwB/5JDbrEAhLRWuDVHvfAynDBVYJIrX4v14R+kzvR6ksQjFk6w
	Mo3SK4IARGKmnFoOAtZJ11e4zZcLzvotbWogaIkAUPQ3BgnZYbPEFEIj6PEFcL/ovGKALqQpvKU
	Ia6POhKSBvsZ+wC9PY03OCibB3KHBrCKrwqR+IcmXyST0IGtMjIdG2NnOKxZVIEsMQNtlbMtxcI
	6vhvzef6q9O49PIzaWOeq4v1/hdiNYwotpDV9jP1F14hoFeSLFnfU8ks4CdigKVw7c3oZHeFD8e
	FoY+t1aotdtSuXRqkKe5RCMmmMioKk0CSRobiB4/Cw
X-Received: by 2002:a17:90b:1d43:b0:381:20b:a9ee with SMTP id 98e67ed59e1d1-38f6a40f374mr3165066a91.14.1785254994697;
        Tue, 28 Jul 2026 09:09:54 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:6::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6d730072sm635826a91.2.2026.07.28.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 09:09:54 -0700 (PDT)
From: Joe Damato <joe@dama.to>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	willemb@google.com,
	linux-kselftest@vger.kernel.org,
	shuah@kernel.org,
	Joe Damato <joe@dama.to>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/5] Add PACKET_IGNORE_OUTGOING selftest for packet sockets
Date: Tue, 28 Jul 2026 09:09:25 -0700
Message-ID: <20260728160935.4128982-1-joe@dama.to>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greetings:

Following up on my previous series [1] and further extending the selftests
for packet sockets to test PACKET_IGNORE_OUTGOING.

I re-ran the tests and the existing and new tests all pass.

Thanks,
Joe

[1]: https://lore.kernel.org/netdev/20260720122714.759175-1-joe@dama.to/
Joe Damato (5):
  selftests/net: psock: Generalize psock bind
  selftests/net: psock: Generalize stats check
  selftests/net: psock_snd: unify on recvmsg()
  selftests/net: psock_snd: Verify sll_pkttype
  selftests/net: test PACKET_IGNORE_OUTGOING

 tools/testing/selftests/net/psock_snd.c  | 147 ++++++++++++++++++-----
 tools/testing/selftests/net/psock_snd.sh |   5 +
 2 files changed, 124 insertions(+), 28 deletions(-)


base-commit: b515dc54795ef370be3cb396e7c12ad91686b6d1
-- 
2.53.0-Meta

