Received: from mail-oo2-f37.google.com (mail-oo2-f37.google.com [74.125.231.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E793264D8
	for <linux-kselftest@vger.kernel.org>; Sat, 26 Sep 2026 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386088; cv=none; b=GvBGfbYRip3m7BnJ8n14/Kl3PeSsGAzElU99E8HSqCC9U+qDiVpj6vLB2UAQoJa4Y96cJbY8RSvQDjUrtyVPJ3A2x7P/4FHcaO5NSj9lEenaslCswarqNZzDje6uCM2H6Xspp7w+jMeD1UMYwoB2DnPy2he7g1vYsC36qFcAsEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386088; c=relaxed/simple;
	bh=wShX0zpAC5r5PRHtNSvfpXC3czdmPPUwjX2QIAvqv8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Q/nLCvl4pXVfu5TNDXLGsxWeTVapWYrE+U+g4iAzDQjE+8zTNsJoV74mkXWyByrjcVKXDwl34YXpfrchBOlkEmWgMj0khXSjI/kPQa51XOGHeAMFkPzRwPKJ0+FxBfzqjoh7l5xsMBVysNlKcLx9n41m+bZVLgZiXrFRCNnn5dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL0i4Nxi; arc=none smtp.client-ip=74.125.231.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL0i4Nxi"
Received: by mail-oo2-f37.google.com with SMTP id 46e09a7af769-7f4f0d37f93so1107543a34.2
        for <linux-kselftest@vger.kernel.org>; Fri, 25 Sep 2026 18:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386085; x=1790990885; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+toha6VrbQkrcl6KomMLuldwsTi2oI7Ju95Oeokb+VE=;
        b=EL0i4NxiTAFGlcMeQh07a9PuDhNsdze5MImumDh/R8emeZQ6KOWVgcb9ZVUF+M01iA
         zPX4EOd+9TFemjgGT+qC9wQ89W7PgeKRaCLqEKexP4SFvq4g5lzhKTUruLuaz6eRPefL
         CCaUPxAdGmnQ0VfNMThTrb5Ta/zM79RRCmTpI9NITB2UctjLDcW57Iuc1qrvhjjDpfrR
         9rKw8oyHYqslvP2VVuBc1ljqrzeA4DtU66idtxJeNExvRSNYkf5hs/vyPFLt6bi8q+5b
         LNVtZ+6g3g/AXoS1ZbVf6+RNrbHRwdhioAtgdjpa4emmMjU0867SgRPhRT6je3Nc01Ae
         qevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386085; x=1790990885;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+toha6VrbQkrcl6KomMLuldwsTi2oI7Ju95Oeokb+VE=;
        b=IRNpeo/l+5xSfwbuiaTWxpDfvMlXq7Nlxgo8jx8NH10J2/HaZP5sZsD8gpK4zbuPl1
         H1h2ECdbcW/p0Kp7liBPiXjgeVI4vKu/gnQVYrl6880h1KYmsYPWAiUYv9bQOYmOgW1n
         kPgmAD87oZ8Kvan5aI8uhgiUhm4KAkuVKMmm+J90RCLrm9V7WCjl70bbAuMxv9X49wqG
         vq9fOFyS1TiFNMPt2IOkvJnHSOAlClx4yHE+jYBganTFq5Q4SQukMZuPxdAFuV74crv2
         5itex4lBE/l+zGVQP7Z3A6iJAjY2A6N7Ja9gLsJAsgv/mB1xgVuXzq3uX/CVcJDaaI/n
         u4+Q==
X-Forwarded-Encrypted: i=1; AKwUvByUJwdpmO2P5LqUtFCRcRnw1yWl8YTzAjnv2U0mAPB9mJIKMzUGB15Gn3+Zpmk+Q50OE6C/C9X2OduAvR1P4Pw=@vger.kernel.org
X-Gm-Message-State: AFuF++mygS2UvWGqAD3ds7rQYfESCqgSXW1jdhgS3qne4iooYQre4rOp
	ozmR/NYGAdH/9KtUkR9i/RT87Fm1AaNmkRO2LFboMZLjMc7Mthq8JNOk
X-Gm-Gg: AYBFou1lw9Q6PtsfWgX9/cozNVeZLw93AgCswGDaAKaWaA01BP+RhEVBrr7L2ovkcWO
	Kpk0dK9X0/mpU3YAPv5CJgEdTElvSxuqHSHNjwpA/yqyNO3oSLcRnu1opLCBe+qOtw88dP5DSpW
	tZSAPtiI+aIOuH9sAK9vUxUbV1qoJyA+yiYK92i/uSHeamFg090OLYOE++PlgSTL3jpqms/8Odp
	pVWfKvVc8lt8mxfg0vmRWDXsr6Rnrf8+nD+rKKgZNDChxbBDCHpT7v8tPQ7ZHIRPiHnnuKgzi9j
	JCWNqeEW6W+yoURrvzuXxy/w99V9YcyfDXgs+eb7m6rOtj2d0m1+z3v+uonPLYmKhDd3LHAP4Ac
	y6qKrFeiz79Jnf5EyDBjGaCaim8S+0uA5hB0ZqKrT/W7CTUCcLSGTUe8EGV7BkYn+6mrNn1HGhX
	5pem/0NsJz+MNvtQ7jGLgYKFE2WY8GId1K0yORoGj6QS3u1cuDW65e6Ye3DxlCo7zKeXv4
X-Received: by 2002:a05:6820:221c:b0:6d3:54a4:4dce with SMTP id 006d021491bc7-6d43fe71fa7mr8043748eaf.37.1790386085363;
        Fri, 25 Sep 2026 18:28:05 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:72::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d581dc77b5sm4858172eaf.3.2026.09.25.18.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 18:28:04 -0700 (PDT)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next 0/4] net: psp: require an established connection
 for association setup
Date: Fri, 25 Sep 2026 18:27:55 -0700
Message-Id: <20260925-psp-defeat-v1-0-9f0b430107aa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJsft2oC/x3MQQqAIBBG4avErBtICcOuEi0s/2o2JioRRHdPW
 n6L9x7KSIJMY/NQwiVZzlCh2obWw4UdLL6adKdNZ5XhmCN7bHCFnR6U6e0C61eqQUzY5P5nEwU
 UDrgLze/7ASTZC9JmAAAA
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
 Willem de Bruijn <willemb@google.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.13.0

This series removes support for using PSP's assoc uapi on TCP sockets
not in established state.

The PSP uapi and connection upgrade described in psp.rst is only fleshed
out for established TCP connections. Installing PSP assoc state on a
listen socket, or closed socket ahead of connect() is possible, but not
something that results in useful outcomes.

With commit 8cc3aef0cb19 ("tcp: Do not allow buggy transitions between
ehash and lhash2.") in place, this series makes it impossible to have
PSP assoc state on a listen socket. It is still possible to have a
closed socket with assoc state that connect() can be used on due to
tcp_disconnect() not clearing PSP state. Patch two updates psp.rst to
discuss what this means for users.

The first patch converts some tests that used TCP_CLOSE sockets for
basic uapi tests with connected sockets, so that the subsequent commit
doesn't break them.

The second patch introduces the actual checks on sk->sk_state during the
rx and tx assoc handlers. The commit message contains my argument for
why removing these "features" is appropriate and doesn't constitute a
fix.

The third patch unwinds commit 1d2929d0850f ("net: psp: do not inherit
the Rx association on clone"), which was introduced to workaround assoc
state not being handled correctly from listen sockets.

The fourth patch has some tests for the new checks introduced.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Daniel Zahka (4):
      selftests: drv-net: psp: swap closed for connected sockets in assoc tests
      net: psp: require an established connection for association setup
      net: psp: drop psp assoc clear in sk_clone()
      selftests: drv-net: psp: test that assocs require an established socket

 Documentation/networking/psp.rst           | 13 ++++++
 net/core/sock.c                            |  2 +-
 net/psp/psp_sock.c                         | 12 +++++
 tools/testing/selftests/drivers/net/psp.py | 73 +++++++++++++++++++++++++-----
 4 files changed, 88 insertions(+), 12 deletions(-)
---
base-commit: 4a0f98a164f7d049f337a1a17579f402707a460e
change-id: 20260916-psp-defeat-a271649be9dc

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

