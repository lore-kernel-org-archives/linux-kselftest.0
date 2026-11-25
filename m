Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617924;
	b=fxf5x4xqtnXq95tZLPa/LH/xxDSUutH5dWQqv1iedbNHHfH9pfs2+t90cuN5FJPei+Kp
	 Mr1cjXJS/JMjC2iEzC0xxvS31SKxUgH7dF0uL/06qOY3kdd/s+NXlccIlsJO2izI0h9Sl
	 qSdUhp2RZPuGYudB5fm6IzBgTL1zXaOeqQn+VBlxmrYxvhA1NBzjdrNyH8SgfNW+Z5Pkg
	 Ea1Y+Tqz9hhEt+e6ocb4mpakqXNLZ3Is8KcUAg5DK+LVxWpE7ohBOVsLeZN+bojv4TZz5
	 qVJvJWJz0XngzPQufxSD5ty53DrlXWRu84g2tOtBJakO+HStH9FPp/p3jWHmp9kkBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
	b=ndEe/AnVaIdO843UUSngxpUuIfDsQRk42azzOL5SXNrkGwRR1Ko3TsCawyzw6Q9aJTzc
	 OrMtSXUkKkUlYvukDq7HjUM/8ksGdtlzbazA3zmbu0jITxzc/Atv2DZaXTv9w5g6M7OnV
	 gQNGF/1RTv5DpJnCn9nXJG8N3w3e6G/z63o9mev0p2LnPmHfaRU7JEOGK7Wbdqc8Ruc0n
	 gbzAUstWBEdDzgFJ/CW9jJXX3SU47p6rIzd7902jaV1g3AlkiFiSRXq18FDJN6oCwitMM
	 ZkFzl4SaHAkfuOiWn9L2X2Z4yNyXf7b11I+7PkvFalioZEUkYiFOAKt8mgxPrkHFFRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCB6606A332
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 14:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FCB6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMmwuHsQ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38644aedba1so8886995eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 06:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795617923; x=1796222723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=mMmwuHsQTz9kmNflAogL29vlIOmuNtu8dbedOUK2++NCoCfHO/vByKQkLx8ikeA9go
         fnH8zjdx9zlapJlv2iSns8wdZx1jqOIejPtOPia0Kptnj2nBI2D3wuVLZPj0pnbgQpYH
         vZFb9H+Fo2BfMY7kPYh3bDridF5wqwVs+8wccnHIabthKG1dDR01qm4MJGt9IaDBiDOH
         POE7EuO6lGXK5NgGPYbxjOG/fuQaGP6vpNPjBX4bFm8JkBXfWRnEtzEIlV8yQ6kfT+tH
         N8/xtSsAZnJIhUK2AvaOKbWEbozf80IwTrF7//wr4wYPLVG2kn7p8XqVyO/0ueqdL+75
         oeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617923; x=1796222723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZZGnQrheCo8IwMaTwJvzugJ+PAdxbUJ+yLbatzIT1U=;
        b=LY5cCemKz0c0VCJlE/g9ZcMKSYME6O8wSvGno0olzua6+mqOND549FHgcwPeARqFqE
         uZYa/v4l90kLi3qiz6CCxJbFMqRvne2+9yD1jSBq6OltJMiZucppKFH2lvmXNPPzt2zK
         ewR/TDTc44lqZeFtQSowG8y4lBFv/vTq/g8dMr34QX69G80I5hlqvMH893HDT84+g5Z8
         x7Wpqkxergy68wgUrfFyDFcmX8s1b6HbptVQiUpNLH+b6LEN5Vke8ibXxPhNahQyyPAH
         bzT9o3jE4TPLIKA+ubFgJ+TwS4UAJJYh02nrRpFC7GSVhMpzZkq/AfHOVvbuT/vrJhve
         Je6w==
X-Forwarded-Encrypted: i=1; AL+hErF1sfo5g7G5eL4l8MWvghCVuEyqLKybRPO4112cQxIKNRK6rZy/EktSlNSnlcKG3zBlwJhUqBYbIXbZm1dUTaU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pQbblTGIwOJrzOJhZbZkO89Kc5MHnYcXb1bg6gDeNAH95zc9i
	SZ5USqAyTzMnAO+T3tki3fvLsh/nfu1rT0NsWHVZrN4EOAw0myiYvPwS
X-Gm-Gg: AZFdTZfJwSwbKPmb0RgRgrntId8T1hmeIZzPQj6bLy6cQ7vhhHd8kz9ms3YbCGvSVHZ
	hoAy7wQ0Y8sODiErc92os9P+EeeLvIDx8Hws2/HJt/fXt1Cm+ZGXyfW8CHnQmVRfD2aIAGROSFm
	g3nLzCIL+6als9HVRgoCZOBjxZ8SjfelOOQWlBjc1JCx8MTWEjNntgowg5qosnY8Ldo7kcF8cyE
	tzJDzRlZPgxfKaGDb8mJYTANbExpYmIe36b7mWhBxN76jenNPzvbuOr0jhsc/fy7em9A7LwrDH+
	hCXJ9Hc2UWEKg4mXcz+URbXQezE2jtPvX7usXpdZQjwla2CXq2d+gf8a8/PbyLkPbkCuJIDLDDd
	I7ZOQhmuyYQJIl+bMhMKGDO9g6Zm/5QfgZONEjM8hQl8NFpW+Vl1clw/zz3IjOQXRuXPHTNijuz
	aeplixlbmLpXZ+W+nxS0ZxTAPkAXBzd7fqB08nlPtTozaIa1q81erkBHEs0ywlZ3RpT3dY3iE5B
	ZADq7/Xe0bZRJ2XAee5bu0N5TOgMk3YRxcAAH7aMdl8ZdcmV9uw1y62nsmQq3lDzjEAps7h3Tu+
	dnz4YYJbuJXcuNg60ofKaTblPAhFyUOyH3Dy69zKo1APbX1LeK2uVXHSb1E3HpXzbfzN349wr3r
	1fRDbV/lIhkAgtO3kV6pPFqbgztVSD3okb1fUvl+VB3iZj79JhQNESeTOS3n0PQW77wqYbK/XHQ
	==
X-Received: by 2002:a05:693c:88d4:20b0:386:a8de:2bfc with SMTP id 5a478bee46e88-386a8de2f67mr11085085eec.6.1795617922809;
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567daaf70sm57121181eec.28.2026.11.25.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:45:22 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	nhorman@tuxdriver.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: [PATCH net v9 0/2] genetlink: Reject joining multicast groups no family owns
Date: Wed, 25 Nov 2026 14:45:12 +0000
Message-Id: <20261125144514.2717012-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
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

genl_bind() lets any user join a multicast group ID that no family owns.
A family registered later can get that ID, and the socket stays a member
without a capability check. Patch 1 makes genl_bind() return -ENOENT for
such an ID. Patch 2 adds a selftest for it.

v9:
- In the selftest, find the initial network namespace with its fixed
  nsfs inode number, not by comparing with PID 1, which is in the same
  namespace as the test in a container (Sashiko).
- Unload drop_monitor at the end of the selftest, so that the next run
  does not skip that check (Sashiko).
- Patch 1 is unchanged. The Sashiko point on it in v8, a family
  unregistered during the join, is the window the commit message
  describes. The fix for it was patch 2 of v5, which was not accepted.

v8: https://lore.kernel.org/netdev/20261123155503.2497063-1-anilkaushikwireless@gmail.com/
- In the selftest, read the group memberships in host byte order, so it
  also works on big-endian (Sashiko).
- Skip the selftest outside the initial network namespace: the family
  dump there does not list the families that are not netnsok, so it
  could take one of their groups as free (Sashiko).
- Close the selftest sockets, also when a check is skipped (Sashiko).
- Skip the drop_monitor check when NET_DM gets no group ID that was
  free, so it cannot pass without testing anything (Sashiko).
- Rebase on net.

v7: https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/

I used an LLM to help write and review the code, the tests and the
commit messages of this series. I checked and tested every change
myself.

Anil Kaushik (2):
  genetlink: Reject joining multicast groups no family owns
  selftests: net: test joining genetlink groups no family owns

 include/linux/netlink.h                      |   3 +
 include/uapi/linux/net_dropmon.h             |   2 +
 net/netlink/af_netlink.c                     |   6 +
 net/netlink/genetlink.c                      |   5 +-
 tools/testing/selftests/net/Makefile         |   1 +
 tools/testing/selftests/net/nl_genl_mcast.py | 128 +++++++++++++++++++
 6 files changed, 144 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 7b0c5f0c757cb61e28dc4128633877aaa8f6f9bd
-- 
2.25.1

