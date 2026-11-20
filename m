Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795196626;
	b=y4Xc7dqhMbammWBV2JLr9wp06lmsz4X3iIO45PWC+TqwExF5wAHM4gR//omrG3OhW1h/
	 fz1eWAsf4yBAh8G036IBlf2vvU5Hgd834JyHfsxer0e8j1alKQq+9oDHpHZ276O/9Kz4P
	 I2mPXzrhQoesAcQz/Z5ktC1r8EHc7WLYfEX189PyR9LlcG64IAGO0GUGeYqXfLRoW9Syh
	 7aNk6rMwo51TH9CkEbR+gJXc/NxS0alo4ibNuxMhgIOcJBTastfSH6tydbmiTeGrFAHg2
	 0d+G65wO2EVQdu4HzoGrlXCl1DTVTQKYFWxLM3/l88W0FLGusu0sO9S6phyJS3it7Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795196626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
	b=Ora+HyXMvvkpp9GxfoS+txZMkylrzlMCy2zhp6cIq3a7nlo/fD9uRndas9Nx9vVNhnHj
	 w/PiM4S+BF3yJei+YFbtIziprBMDrsBXMU0xlJdwBrgbid1PUlLCo7QV3Pk/zh8oNc5+2
	 9dqJu4VT5SQ1E4iigqxHODikX0QiGjhDwTS94R3ZuMsJr53V44J5UnBDywXQNalvOvns3
	 F63DCNntjF4tIGuDMqhaxNTjhOsDrd1pEbZrhpQOytFQjmJfsNyuHqyYRSWF7tAoQc+Jz
	 1I2mLdv2Xy1Cc5/nlMrqjVwNLjd4yHJDrwQNmnb393DatFXKVp0Kfr1nz/5Nrs55bpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="znst8q/z";
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580F606A7C7
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 17:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0580F606A7C7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znst8q/z
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99e1b352df9so372465241.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 09:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795196624; x=1795801424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=znst8q/zgI1dTcSh+97WdgRu1/7fSZ/YVcxApvB9sqUs7XECM7vkrHOqnlyTsAkq4m
         Keo2PN2Fle/zyfoibUcwc/l3XWkZFvnbQN9Riw2C+YFt8webA6Ld7xML3JuFTVmKaz9K
         0tLV+w0Z5Cd4lD0CWM8pIZepoDQEuFQrTZrYy7lRgzsaFboJiL9ieGwleMa01Au81/yR
         sJnXpsssLc6Cun8Aj7JFPkxio/r6ebHLYTLvyXy+3LSRNou1x8M4nVl2vA9Xpa3Q61M9
         vE7cicjhqH02ympWsnYRYQn6gk1P7buW0QYksCRuPOCf0vkn3lXeN3EPjoxdyXW/Xiii
         kpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795196624; x=1795801424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5z1EgR65emUydSCqho9zKh6KfG5YB5vPm248oYuEGq0=;
        b=BMhahMofe91OaEYJLgCEX196grIQo7h2OgcCugJVwxubOAs6XHX4oFKkctG9eSmsC8
         vBl9YmYTrP/RG3aVrxU37h6jX09oaKA63qqPGRI0hcE3rXTVOTpD/Zo3lV1dMNgXy82u
         kyg/xkPdGca5lbM6E0Gpl2f0ZWAhUPYgwnZUF5S6oKyAkVK6tXg85xPnOu40MEzljP+X
         5yexpD3SDfo4iWiOyYDEtOkw+3zYT3dVZWQywxGfuBPUeNMPcAlWzLTaCHfmzfttbTE9
         +pp6JtmFfdAkc7eZbswe1lCxX+VEpJd1bwho+3tIkPcSBjlVxjxnoTmBAOj6N21T0C7X
         ztDw==
X-Forwarded-Encrypted: i=1; AL+hErGyHrTQCCELuKSK++U+wkZDRKdumMMORgQkt8kvsjIfWQVQKUD8slVwN+hOmMPthLPo77ykXmDX+N2V9D3tI9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SLPoSTen+JQQLmdVJDniobLV3wTdqp8I/TFUR2uT5cbKELAJ9
	7+WEsXNli5V01i/y2ZiVesJnye0+NL7nTkSOuW7sYPssMlZqlkUJdWZD
X-Gm-Gg: AZFdTZeN8vmnLXbA1uUlFqh0zsMc1GNG/SOp2/SBvJIRQd9aZ36om37cXnWzQO/2XaG
	xYb/z/KOd73zpU3b4EGDE69S4BhuRWR2o4bxQYrvr1mS1fs1+zY0ersSwb8KlJcfrobeVdEPYpG
	tQCwj6wUfPnQGUTkZOUpKO1vxDkt3Lov36smJ7SY5c0XibxI5pHH1Y8x+1g4CRw7AmhMI8/DyqG
	Rsi5lFmAqJtooEtr4G1fBngik/c7xk6nuduNs94Ai6BTdLl6SbgGhYC4+xKAjOsyIfOmDXwU+0V
	xgWjosChR/T9JlHmrBfxrWhm0JgpFtdsEusgUd5Ldac8rQIh9g6xT4y/KY0b1O+9irA7hXP6L3b
	navc4Ol7il+UOwlT2SmyDI1m6KPrJnsaAQW3/rAcnIK1w9/lcRLVDKp4rxT/hwkBLL+JD6Fwidm
	eXbLhsC84P+ujebyvz7aNVr+/7EgwZ174TWDE0fGayQMF/uCI9MEFOHH6iU6QdhxdIbsWS/Pawf
	tn0/7/q/VTFLWCbI+qyThtCP2skiLSDcHSqcF8tpCtwKjtjYVHONsJT9Hib1r9IQ+vYXTlkbSBr
	BujA6IWWHiPhRBf6/MHa6TL5sYhJp6TrWH40Otpsi49WmfvfTIywkBuEOPj6wAY2pZUVQw==
X-Received: by 2002:a05:6102:3f13:b0:7c3:9a36:bbda with SMTP id ada2fe7eead31-7d72b368b75mr1845474137.5.1795196622985;
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:a9cf:4432:7fb7:e8])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e7d784b3sm3571363137.2.2026.11.20.09.43.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Nov 2026 09:43:42 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	Eric Garver <e@erig.me>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 0/4] udp: Fix bind conflict check bypasses
Date: Fri, 20 Nov 2026 12:43:37 -0500
Message-ID: <20261120174341.35873-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
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

An unprivileged user can get a UDP socket bound to an address and port
that another user's socket holds, in a state bind() would have refused,
and receive that socket's datagrams. This series fixes three bugs that
allow that and adds a selftest.

These are sibling vulnerabilities of the TCP one fixed by my
commit f675070191f2 ("tcp: Fix the SO_REUSEPORT bind cache admitting a
conflicting socket"). The one in patch 1 has the same kind of cause: a
SO_REUSEPORT shortcut that lets one matching socket stand for every
socket on the port. The other two predate git. All were discovered
during an LLM-based audit.

Juan Agustin Niccolini (4):
  udp: Fix bind conflict check stopping at the first reuseport socket
  udp: Keep the bound device on disconnect unless connect() set it
  udp: Ignore a connect()-set device in the bind conflict check
  selftests: net: Add UDP bind conflict tests

 include/net/sock.h                            |   4 +
 net/core/sock.c                               |   3 +
 net/ipv4/udp.c                                |  69 +++++-
 net/ipv6/datagram.c                           |  25 +-
 tools/testing/selftests/net/.gitignore        |   1 +
 tools/testing/selftests/net/Makefile          |   1 +
 .../testing/selftests/net/udp_bind_conflict.c | 228 ++++++++++++++++++
 7 files changed, 317 insertions(+), 14 deletions(-)


base-commit: 19a227903e65c7a9c179156485660a4e017575fe
-- 
2.43.0

