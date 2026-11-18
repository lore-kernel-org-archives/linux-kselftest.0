Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794989456;
	b=DzxIBBsR0cDWUrmUMmq3+f9Y0Rt8dG+PKvALPQIn3o7HSSkJnLerFJlzOiNUPpagHxPQ
	 Tu2gvNPxyQyQDwHUQZGNFkcAIEX25QIcgZcDMQeEFsdx434YJzRddh16uGEXvjFP3e9yF
	 wAQ/YO3SRVLEvcSJ7P9WC/ZTBKIXGC+X6MArgW70e0Le6izwjt0bYYtc1QjNmzXULAi9e
	 J9f39cjZJVjSbPBPc/Js3wvWxAZQque8gDMe8uhbD547AqzzvC1sZZVShzYZcXkFQRERK
	 MSb0O7MYRhXcMVw1RuogBOrc7wYYU2CgirIKX3Vywd1O+CPixuIc17z4pcLoVCD+S4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794989456;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=WjRCvpylkJK6ubCIeqhIOD2VpSvo5+yRc+89UpVAXK4=;
	b=t4IDwd2NL+QGaO200AvN8HK2uzuScAnD1cPaHXjj34whFoJwsiRZYOIIITkMiIwvy790
	 03cqWZKr6Bqi/36rjWDvZ+48RuvqeHk34RL2oTShpICvnWno4KkxJqSgWkHN09d6hER8s
	 QIdoduFsOMaxDlOgT2YGp9iYtbuRDJ1O7xOWalvbawwDNhMUm4TOZf7cfMk4BXBeO+y4R
	 Y8HzXF/CjhGLNujGqGvXzSHlcRh6CYm+cgoacqDpkGfIXqq4FaqVr9y8ketCLeNxoQHC1
	 gPXLTVkpsDl5PH+/r3Eep7sK3y6loY2bqvEH9HxOxyUgsy7KIqnfIy80ZxTbdnq2mWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Y/R9e5tL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558E606A325;
	Wed, 18 Nov 2026 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y/R9e5tL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794989456;
	b=NReE5RUPHpGMKeTHfV5DKfyKA7fsrmRWnq1l228x2QLmc1Ll4nq4rKBv46LRRYtDvBLF
	 6UK+VoMdjDIe58lEPj2Ztr0YsK+KXv7id3xEPlIXPWYo9tu/JtutJ9MsjC3XwyP+q4kkl
	 PSYyPoUly1asizhM2Yt/6JaDZUiWZ9qxId2qy9PC1U0Dzn17iKxd6gPGwjAEZxvC/j291
	 rdgTRuGclbrskG0cvXNUtYRIszleDASQCbQC1JVuATvPMan8+HGU3BM0T90Tvmx7n+7BJ
	 bOSl2APrA0/ODH8t/3A7fkbnMxBd5bF9ZwUrE7PxBdwuA4aAjqAKrfNvaAKNLXriztg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794989456;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=WjRCvpylkJK6ubCIeqhIOD2VpSvo5+yRc+89UpVAXK4=;
	b=1HyfVcFQtutLsDvpJWDtaX0ohCc3vnvKYGUXYG5psNmJ36KP6dqI6pxhvF3RY/JkUFIM
	 AYfx7es3n83xu9NqTNTqBJdmyOqLp9IC5W5/PaTcKBNPn9dkgVkSOfwIj5S0AdxNyELS+
	 xQRxJ4eSoB6Kp2FLQK7J5euxT0Yj/xOjexz2qfq+u6u4SwFT+M6q3dA7NHlruP4/0r4XQ
	 ZjYiDN5q9isn+oeG3hI/S3Xcu0QPqDQKswjeKqJ0CI3g3QroVWRFzCkC6qqF88b/mCKCB
	 GhDYuUqcGLQZeQAhXB2lq+YXZqde8eNmAhpKwEhBPegcvUuhc93pj8jFUQHcGQKOTBA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FAFA1F000C4;
	Wed, 18 Nov 2026 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794989456;
	bh=WjRCvpylkJK6ubCIeqhIOD2VpSvo5+yRc+89UpVAXK4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=Y/R9e5tLRlyJRqUvrw8/Utbe/enmWXp7z+1dNin+anXrkP7lscaFvj1uhuGhYyikY
	 Obb94d4wdAn228qro2ANxWf4v8P1Mu/MRjAEIdw4HnIn/pFMN5+sDvi+Q0gYsxOski
	 wYh5XO3my67sfEZfcdNfFwJ5tODWgtfhsN/3U0YIL1VsrW0Dco3R//7BAQcczQZvLu
	 OyDk4lODmcoyjzM3YSPRbEOaXJRlKcxm9PxfhCuafepPVE8vRfzuPCMbsezwdPpzYb
	 RGJS5nXHS+UEdUHrW1gQBc4haPJDb/eLlJajptRUKCPNOvYe4l57wFKM5cMSl+c0VW
	 9v2+WxaTMzovA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A37554AC82;
	Wed, 18 Nov 2026 08:10:54 +0000 (UTC)
From: Yongjian Wang via B4 Relay <devnull+echoowall.gmail.com@kernel.org>
Subject: [PATCH net-next v2 0/2] tcp: document and test MTU probing black
 hole fallback
Date: Wed, 18 Nov 2026 16:10:51 +0800
Message-Id: <20261118-tcp-mtu-probing-doc-v1-v2-0-e795f20b8cfe@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxd/WoC/4VOSw6CMBC9ipm1Y2ilkrjyHoZFWwYYIy1pC8EQ7
 m7BA5i8zcv7rhApMEW4n1YINHNk7zKR5xPYXruOkJvMQRbyJoSoMNkRhzThGLxh12HjLc4Cr0p
 YU6my1ZWBHB4DtbwcxU9wlNDRkqD+KXEyL7Jp7929Pcfkw+f4MIsj8W8uQ6BSUlNRNlRS++gGz
 e+L9QPU27Z9AUw1Z33YAAAA
X-Change-ID: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b
To: corbet@lwn.net, edumazet@kernel.org, davem@davemloft.net, 
 kuba@kernel.org, shuah@kernel.org, pabeni@redhat.com
Cc: Yongjian Wang <echoowall@gmail.com>, rdunlap@infradead.org, 
 linux-doc@vger.kernel.org, horms@kernel.org, ncardwell@google.com, 
 kuniyu@google.com, skhan@linuxfoundation.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794989453; l=1424;
 i=echoowall@gmail.com; s=20261026; h=from:subject:message-id;
 bh=R90V3zCpNbOGid8F8EJLRVPdRZBvDvePiD/4QNvUdOg=;
 b=1RQoLj5sSHdElWMgrjWu4kIuFt4WblQTKyPQYOfdgzePK7C9mF9vV1oJIfljMwF6mR2HMo91z
 iS3JD8s57CEB0QIjnCLIq8x3dmcjBEU9kif8JkpXOe64Wotoi57Pi6s
X-Developer-Key: i=echoowall@gmail.com; a=ed25519;
 pk=9XP6JhqjjPsHCF6UZZZTeqTRnXIa4+ufggnxXtTJ+no=
X-Endpoint-Received: by B4 Relay for echoowall@gmail.com/20261026 with
 auth_id=1323
X-Original-From: Yongjian Wang <echoowall@gmail.com>
Reply-To: echoowall@gmail.com

ip-sysctl.rst does not say when TCP detects a black hole with
tcp_mtu_probing=1 or how the MSS drops afterwards. Patch 1 documents
both. Patch 2 adds a packetdrill test for the part that had no
coverage: each further retransmission timeout halves the MSS, down to
tcp_mtu_probe_floor.

On x86_64 KVM, the new test passed in IPv4, IPv6 and IPv4-mapped IPv6.
Variants expecting no floor or no halving failed in all three modes.

Changes in v2:
- Spell out the 200 ms RTO, say when the time starts and when it is
  checked, and give the resulting detection time (Eric, patch 1).
- Say that the MSS is only lowered, and that each further
  retransmission timeout lowers it again (Eric, patch 1).
- Add a test for tcp_mtu_probe_floor (patch 2).
- Link to v1: https://lore.kernel.org/r/20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com

Signed-off-by: Yongjian Wang <echoowall@gmail.com>
---
Yongjian Wang (2):
      tcp: document black hole detection for tcp_mtu_probing
      selftests/net: packetdrill: test tcp_mtu_probe_floor

 Documentation/networking/ip-sysctl.rst             | 21 ++++++++++++
 .../tcp_mtu_probing_blackhole_floor.pkt            | 37 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
---
base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
change-id: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b

Best regards,
--  
Yongjian Wang <echoowall@gmail.com>


