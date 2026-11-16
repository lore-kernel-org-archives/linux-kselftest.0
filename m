Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832841;
	b=A/+/aN02XMORrUS6P/GiV8qhpzlRIYx4uJNF44DSG39NkxTAPW+iQQ7fkUNKEjfzPk6t
	 9mPWi3Dr7Gp/I9WCVXqD7WMx1Uy/zwuOIapdYnUwTrP+oJoYLZJo0ENCemAdHMTlcHMdR
	 Fq5BPzv54UOWuWngxHJEvfeL00o9DQ9vHhRyeiOe43lK4ZRLBHspyLKndCYEszNnaPvNC
	 4WaCjjS54raCkcJIkDB9U4teW3tJZxxWntjGAqUfGwQpwTj817x1RyhpfIL39ohHR5GF9
	 IxhjJE+WU1KAfExxNY10Rm4k77+yQOuB2sE1O+0d5mkP0p2qo43U5rvjGfBy1PtoH/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
	b=Sp2YJOOxGJg5jj5mFYAn163ayFf9+0QXdoIFOmx4y4aHHqS46MLgQxH+YybTYgSxOi7Y
	 UnpOSh0QTenlTQfltd/mdpQYc4lMx0bMhq79bwf/nK61J4oNzVPZyCWkk0WWQAak+1KeS
	 fDJ8g3lOzWHd0nXkRhWRApwzWh8GrgeNPommriZwGwC35TYK8DLAY6fajbN17VKbyUwl6
	 6QRtNYAImPJpDVxKysDg/QJ6dePgg7+gubemvMtYOqD5RzEyAgrt7407bxpNo4gkdpuxg
	 kI4uW1OS/3UIyGR6vPiFgr1DlMli3YNMn1BXXHkmAYAyJnXCZot/U/63BKOQjSQaAqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZlH4qsy;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F45606A323
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:40:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F45606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tZlH4qsy
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7f84a55cc06so2664931a34.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 04:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832840; x=1795437640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
        b=tZlH4qsyeVyp85D/7jfuml2Bo9iSsV9/vvMVPvLbOjuqa9ZzlFCuWOOMPLFa4lcyhz
         +XgH3VuEcWu/sJbcLqS1Aebt7m3+vqAToTw8VySUA/AnsTzsqb7Uh27tE9K4RImxd4ri
         uHf2EdZKQlA70FqigwldTyC+ox1IImIoUe83gInR24PllyxytHuJ0D1zETZDRBvAH/Pe
         xTs6BNuHqVyh/utWQjtSdoZ3jVFi2KXCQFuu6SQiAE+jEwfSdjAZH5SZrHIUwPuDAqsW
         zne0aXtsjD1G7Eq0/thFuqndNXzCIOkCav79MIoClzJnr2b2a5MzAvMb51XiApQTxdj2
         u8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832840; x=1795437640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ofU1FQthecJu2OVRI80kc6txKndxQX32EBE9heySnKk=;
        b=yPclS+IYXtdJhxeWcomfrsLRX1x6Glh2GObMZxUh5AUTT8bfBv1MXVaZU5tADOjGkO
         E3ZQqUncYKQ1Cha7qdFA1l/oTb0aYtVemToWyd9xbClh6mU4zn9zWhFJi91mF3MDoOjw
         RwFmmHHWwnG7F+KdhzxQRS3BF/Oii2i8F1LGtLSHGDRGejEstu1erjF21nUlGvt1c6li
         OsX6ZgaWavp5K7LdZR89hfPeMAQ9FCl/jX5j78VyZO8NsUPdZpTT2DUNtf+dRh/yTa6K
         YX7KlqrLAkgmGFIt0umiOFD7cLQYyZ1kqZzLjanWoqjMj+o9aC4onYJoGiqy6QcHIorX
         E2BQ==
X-Forwarded-Encrypted: i=1; AL+hErHa0ziD1IBcOY/4ZYGjPM5tVGdGkLPS4UdwxxZwr9a+noMBvuI4BwjvGQT3EATcmMb4gZQcmqo6UN/6UkMLyOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dyTwQmqunoibkuUjWBvJawj6+pxMmzaqRn2d5xgeTMOrRug/W
	mm5hsgaQ4jftqJR6SRm4HQv2q/Tmy+yJy441zsI1rj8XzwL48mAQKJe8
X-Gm-Gg: AYBFou2QTgWgPipwqnuXYKr1ojQB3sw/yz9lVYisyKdorXluY/ij6w1CPgejvI7eka1
	4krKXhR50s1QSiGTZrBM0jmPl6H3qNzPNMu+DwwnoeP4eleufewVq0dE0ktJYf+TtB6toFlY+5L
	kaGdpN8Y4NCZTdRd0V+ySqFUGeK7ijp711jii3YY8V2vKeuLa5GvC5/dKdpXworcHJN4Laj9HND
	TWXKze+ShNbjd60ckTXAqrZI77tb0CJpqUrV2DyXL9zfgTe0EVt69DzK3LXrqM2UjSM/E9BBpx3
	i7+z0qkijP/Wa/PgP70Ze7rCwLUzWUSTbxoOvky6xQhUkZ5uNBRCBnp+RUU2onjBXZopF6T9Zyi
	Z/n+r2daTqqCFth8JhZsrlvutIvmr/w/cKZDJ5HWvUZecFBiLnWIe++FmvjhQIRLsvqbGOxI1ZW
	pQ4tljdKWxZA7dc4T6gCrkq1oYZt7ppt1895POLWEfikS7ZuQ0L1+tAj3ohNitxzuHDjndlUEL6
	Uo4vH2puToC+wBtQN6+2CZcJ9j9MS2d2ZxmtTzH4Zq4zqyNg9kH1MYqb4yw6rhCwLwKxil5HtiQ
	h6PCr9BzaEo5ZtT+fJOUryonJQmMbKzHJJoOJ4FglotIsr/+os0/dJTQgl9tJTDK14iEEFgpXh2
	lJKZeGk6xvpIQXeMGNyzCD1Te584Ju+l4kcQRNbDMfvXWCvY2zti2uyOF1yx5fGRZmajvgNuKYQ
	==
X-Received: by 2002:a05:6830:4113:b0:862:cae6:db3d with SMTP id 46e09a7af769-862cae6e439mr1975678a34.11.1794832839406;
        Mon, 16 Nov 2026 04:40:39 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862c4dd9abesm2830937a34.20.2026.11.16.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:40:38 -0800 (PST)
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
Subject: [PATCH net v7 0/2] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 12:40:28 +0000
Message-Id: <20261116124030.1595567-1-anilkaushikwireless@gmail.com>
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

v7:
- Add a selftest as patch 2, as Nicolas asked.
- Say in the comments on the static IDs, and on NET_DM_GRP_ALERT, that
  they can be joined only after the family is registered (Sashiko).
- Say in the commit message that the unregister window was already
  there for the capability check.

v6: https://lore.kernel.org/netdev/20261112094205.1120090-1-anilkaushikwireless@gmail.com/

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
 tools/testing/selftests/net/nl_genl_mcast.py | 109 +++++++++++++++++++
 6 files changed, 125 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/net/nl_genl_mcast.py


base-commit: 070411c1590c8172eb4d86f045d99c372f22fe23
-- 
2.25.1

