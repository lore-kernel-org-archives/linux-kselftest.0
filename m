Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822659;
	b=WQsaG27+SuWDKZZdOtHXSwnUq7YT6RBuaXX2owkPFEor7DcyWWZ7baV5SWarp4CWH4YW
	 4w8DB6DLSsxwIgK1NjJClam+yi5ofQGeOhe8EHFp0YkrnJXVN2OLu1U8mQ6J1XMj4MIu4
	 VbpY6XX+yz1Navb6L4jTQJm8ekL5vHQmSL65SIKL+J6whHWxJKouU6JnVBW513cOmjSQw
	 L19EXQ8PFKUc/iWbBL6glyDvWVarfKXtq2Q8kdrCZrsJGwO86MrGPzpTi8NL1WI3z8KdN
	 2Xc1BO4NiDyhG3WHYNPLI92Y1QZEZRhFWVajhO4QFUAL6bBRjYtz+pZNabP5FnFDhfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
	b=dwnzYa7KENoJtq17I1dPa5xowKsT9CJb/wNBNzeTmITZhJV6Y9tHb8jgsjS9vViM5kF9
	 sb6r3rp9p4d/qDDSbWuI4BouDoaQe3LwegWGnliQe/BBK5ZiwSYBMN4Z5MjvFTKL+MS9J
	 nLRz/8qF+IWZuSX6pMDdwfxeqR39/DcpQvXyy04yCDiTMYufYGCJP8c73xNWhCvKxYiSj
	 HEgVGxB/09NHxAwKwFkE9H+Ncr9WQHRiASvJ6kmDmee4mjvoJi/XfYW0843OUvAxyOTJ/
	 7cImL+PR6ZnPaSOdnnDS52iUIeHPDr0Vs0CV6kJ6YK/uiH0O0u9OYgVRFuSELlBUy9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ITkVV/lq";
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F8606D834
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Nov 2026 20:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328F8606D834
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ITkVV/lq
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so10024771fa.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Nov 2026 12:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793822657; x=1794427457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
        b=ITkVV/lqV3pmRjprq/RI736OUujqbhkGPmsQfyiQLZrfwsRY/8ho0oOyTqoTndSHXz
         qf/PkwR5GDPJgRmLi5Ap15hdlxt7OVssd6+O/HtTvkghiLb4iFWNv9JxCZPHWCNfA+BB
         n+4fgtOJK/xQoaR61Eb0LhldN3+2NLnDLj3d39VPL8yq8D1sDPT6zQ84Y4yG5x9a50c+
         GDBsx83ygq/olVCl0znBqVnhKr0P4K/4nx+AklKHfEspCebf9M4K1g6Je6a5hU8G5ZGA
         43f2Ou0F+Yi2qY8Np5LHn/C3S+NTxB1V37k/p8khAyDUv5cNvV+hNGRcue6fdb7uJBER
         iSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822657; x=1794427457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r9/eIU+FnAWdLR0w69M05r/29MzcUR3vux4EI6BM8TQ=;
        b=jZS1kDHrTsWhYSluyGGAGvf2bWI9mvKYQ78aVliSIGXf4AiYbFpoqhqCw2x0Ynwgwz
         iJIySOyJRjU1oSohZBGHdA/qRaKfpKgjfSlIYHQr+RcXRLgs65co8YN7hCv+K1d51V63
         GKFacg37zCpO4XhzcR6tG9Jsjr8Iz1e1S8Ndvt02yxheP1+Dj0wl4W38tGEU01JI0NxO
         P5IW+Ac4FzeiscId8Ley0c20lShX6jYv40grtnuaYQWgS28GncyZOGRAAqgdfVUunbE4
         RwVfQUgJXGbccOo2jR5yqXqz0LoZOgtyzu88YgZ7Y8fIO2eMRKMaU7btXi+rORMbbUla
         NpOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKAsdNY4S3dM8hKbvWqZAJkEs0vmQ+02kyRa47xLnr7qGyUwiCIbq/Hdk53EPtiTRGUCMqbYgsB84V1459+2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pOB2AuuGKnzJd4XXD30ka9+awphQ0ZoL0ThEEktzi6INDP7lb
	zD5lLhz6Zn6VJR/gNnHVq17ky8A/u1IP1uyGilSl83mPQKdZT/XzjX0l
X-Gm-Gg: AYBFou3pzYQCPxYI5MRVJmBfjfxT6uXX1SndWGo4hyiduur526x4Yo4KlrtyJpuL29P
	NiEUDC2X3fop/DEfWCMq6iSNyhh/Euk07sfV19Jm9gLllwA28HHraNGgw4TkCklzoTDQyKvvDNI
	e4ut0Bkxnf2nXeT0NFC2eZrhqWL0OtuM0JM3DkUavZi6skUUFGsThYHWgdZqxtkZyQxxO3vqjqV
	KO/+KEXoOK2HjrtFz5iFASx+kRHhLsxE+p4AO3A4A2ZtKxf1JfqgTmqTgQ6QHSfLkoCs8QyEnzl
	bgRQee+BLn12IHaA5IaH5wKsDyZ2LNPjnVnpTUDlHB0ASjlvFD/vW8DzMJt7hu+ayCPYBLkVPnq
	AitK7df98rUeKcTjf5O9PYuQd6M09CiyDyP4aN5fgABQIopnmdvsKzYn8fi/+w3Q8nPH+BjWGNT
	3rLHd195ewOLqKhQZIDSY9Vs04RGt62p4+vmGTWdfN9qTgWKe8Hcswbf0CSF9mZMqvcGfZW9eXO
	mDH2cNMV2YHowj1xO/3deFwn/xbyXTlcAdO0Y9wU7YGm5ISflYBgrVJPGTTpBY+uwDQASg5CffR
	mO94JeBlf/Z9MShX27FMPj6mIeANrg==
X-Received: by 2002:a05:651c:150f:b0:3ab:3af4:c2d8 with SMTP id 38308e7fff4ca-3acb7ac0035mr41427011fa.28.1793822657073;
        Wed, 04 Nov 2026 12:04:17 -0800 (PST)
Received: from gentoo ([95.55.209.127])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acdc6e9b60sm5848021fa.35.2026.11.04.12.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:04:16 -0800 (PST)
From: Yaroslav Dudkov <aroslavdudkov622@gmail.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	weiwan@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yaroslav Dudkov <aroslavdudkov622@gmail.com>
Subject: [PATCH net v2 0/2] ipv6: ignore link state in gateway check
Date: Wed,  4 Nov 2026 19:56:53 +0000
Message-ID: <20261104195655.1406837-1-aroslavdudkov622@gmail.com>
X-Mailer: git-send-email 2.54.0
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

IPv6 gateway validation can reject routes in non-main tables when
ignore_routes_with_linkdown is enabled and the nexthop device has
no carrier, even though these routes should be added.

Fix this by ignoring link state during gateway validation and add a
regression selftest covering IPv4 and IPv6 route installation.

Changes in v2:
- Fix variable ordering.
- Add a regression selftest.

v1: https://lore.kernel.org/netdev/20261028152634.3355852-1-aroslavdudkov622@gmail.com/

Yaroslav Dudkov (2):
  ipv6: ignore link state in gateway check
  selftests: fib_tests: Add carrier gateway test

 net/ipv6/route.c                         |  2 +-
 tools/testing/selftests/net/fib_tests.sh | 40 ++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)

-- 
2.54.0

