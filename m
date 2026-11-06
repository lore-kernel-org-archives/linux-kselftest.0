Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934730;
	b=AUuXt2D6ehNRHRlBOjrRmfTnEjYX1TLnkGqjwjoF57YDTyVkVihoT6IOBnLyHV8X5nYl
	 2Y81ad4aebD3gGW59CdLazdC18L2tyj6PKtBMYsS8pZgEE7qM20iDKRPGmhecxpFZ79oJ
	 ZrCFysbWK7j6zFuRH5m67UZr0BJgn1JEepMEpxbmPuqu68iPW/QpHhrYiAa/55qfLv849
	 kcraxSdv3q/PzQgr+Ewl+DWHKEJnlTxxLMcn8mF5mBOJ6LdAHieU3K5GGXRWxH/aKT52/
	 MCSrMQ0xLBfv9NAfbiWy/nM+JnbHPlulZr7gkjmVNjnubI8/RENhOQFje8rqQTbeWhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IRcXjez6Wcmci2QU6oft8mh4ZWWaV+Xd9hzzpugK6UY=;
	b=vF2M8eK2buJfhANXYuMlMBPvRucoYEMKeKfT8u47HBjtp4XeEwdR4PpBxHDBvIfquGOu
	 Gug4Low8I0S6ddOGya7YLkgCcHiWT5RIT53YkuW7yvVNEHKHxdGmKbW6NV9r6+eoymNgO
	 1Mfkw8BwlxPOxgoo4JLOPU032Dz/a9uBELBVZ+94WnKNHYR7K9znocGsQ8cTHNR8Syc6j
	 WJt8BZra7u98siCkGAiQX1J563M/+Yrvs4V8UGR+bueav7Z2mWXw4alDEXIMuqg9Q4cmk
	 9Fr4hXnnwvSQHy+vXRUMOuadufyq9aPJ+ItcJ5xc6UC7v0FR9Lxuij59e3J+FmD3vWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5p8VSaO;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79C1606A326
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 03:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79C1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w5p8VSaO
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b09c07b3d2so117269a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 19:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793934729; x=1794539529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IRcXjez6Wcmci2QU6oft8mh4ZWWaV+Xd9hzzpugK6UY=;
        b=w5p8VSaO5NEXEHlMuy5YV0Adw7eaOIfNMTTD5WPQbBt0Jpl97k/9RuWnVZzgWFb3u3
         tytDIAj3BVHIjFNgLASr9EUORh7VRMgihNGPWYH2eR3GlsF9gJGir9e63nUNhVbEIDvz
         UaSQLNSGN+GXWnTiV/WAlKHGm73PqvMyP/LzEk8x0ABDTa1jspgAeuNVWvc6vY+wuttV
         Py7iqhQbZERiqhOkq8Pe3YZxSk6WsPChIc3gpnLgUvjARq79RCTFbkmQhGgHGWbWG5q7
         aG62HiiOq/MKGAoPbfdCXtkpbYZNVZinZHVXCzcTZNppJ5FxZE5mmPjPKZ7sQRSF6iXi
         Jxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934729; x=1794539529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRcXjez6Wcmci2QU6oft8mh4ZWWaV+Xd9hzzpugK6UY=;
        b=cHBcF1tmvV6B9g4Lor+fC1Yj4C0P22j4mFHivyjyfvI9uCEK15rmRjP/abZyqLZc1J
         DsaZAyKMvrBuQ8z80jBLJgIbCalejHL2VMQzSiR+I38PZ9q8zbUw2GwyONM+MxjTOPo9
         nIWs32+qEa0mgqlo6TbGqo+kTYzQ91ktYoNDW+jRdVhYg7waphWeqf7kqkMayT6b1J9b
         rKzjR2xM2ClBGLqJqAjF7GfIf2Th7eI9WMm0yvMf1w0qn2GfWZvNTpGqU0mox8vQIOKb
         0G8jONFBLMvu+gvs/qOxaJYe+4LkC7poWOPAGmRniE0CtfzM/lSSlS5LH3tu9oI1Qum4
         9CQA==
X-Forwarded-Encrypted: i=1; AL+hErHrl5/x5kywkn3vp0MzimK2d+DE86D/thxkYZkvh3ZLse1OGnjiLRksLnlvFULnFrGZVxRHGqX5qVRaKae4YqM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rqo7waeg6rHYtQ6CSSw8Ia0lYcLSmCj4fL5vPLY6bYYAV1rlp
	eoQVu51DMx/gJ6LQ72XonV9C4lVQc6yrm2j6hOhyrFfu20DRhBoWNIJT
X-Gm-Gg: AYBFou3NZjwOB3dc0y7WVOXHTr0xyYzLY/j1GHRIanlnRvWM9Xpcadlw45Y32AX+8bx
	4wgAyvuRVvNtHzJAQGHoamJ2IEQXCdTpKG9SIW+HoeTFCrcVjL/vnYKSoi7bi7CRt93CdsImbbQ
	4tjkvHeQnvhUxQMbjOhiK4tK+uMUU8NY7CI9+q1ASj7UgRoL6irgNToZ6VYwtBPvJCaHrIra9H0
	LmtPzkoPPVVkJv9O/lXa+X5yL3HSs9Gr8yZVe1dH5pDMQoLR8mh7GhN4PeKIdlsK2mB9OMDIJNH
	RFup2P827JducC9XgWcPn1g2GMDP7emFrlAyF3vjxnrkvUN33OlLE+4VGBwkgmX+gRlbjgeO2pN
	9ZpSBc7/sKC7dK0Zp192EqtdQvlT9+nJpvcb4Mvab8NLEuyLaVmEPG0BRQ/b93Smw3tcJFG+OLC
	30za1ZPJiyUnZkhzkGlXEexbl9rHeEelCn5QOnNLy9mKDEsa7Pb7zge1oU8TyH7YPuPGd1DjR3T
	ch5TXB0RbqNbkUi2Q3mIQ7zCnqd2sg8rYD1E60r3+rIW5Cq4JG06FYZU/1YVVgKZ1xMRwsoS525
	SM4wYMbJzFtPwRAVgEqTJXlPrGJn0sVSKA==
X-Received: by 2002:a17:90b:554d:b0:3ac:aa8d:19e0 with SMTP id 98e67ed59e1d1-3b0db5efbcbmr1246139a91.9.1793934729247;
        Thu, 05 Nov 2026 19:12:09 -0800 (PST)
Received: from localhost ([2a03:2880:7ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c66fe1sm1386784a91.7.2026.11.05.19.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:12:08 -0800 (PST)
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
Subject: [PATCH net-next 0/3] selftests: drv-net: hds: fix state leaks and ioctl tests
Date: Thu,  5 Nov 2026 19:12:05 -0800
Message-ID: <20261106031208.465456-1-dimitri.daskalakis1@gmail.com>
X-Mailer: git-send-email 2.52.0
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

From: Dimitri Daskalakis <daskald@meta.com>

Fix hds.py leaving tcp-data-split in a non-default state on drivers
that report HDS state rather than config, and fix the ioctl XDP tests.

Dimitri Daskalakis (3):
  selftests: drv-net: hds: always restore tcp-data-split to auto
  selftests: drv-net: hds: perturb settings via ioctl in
    ioctl_enabled_set_xdp
  selftests: drv-net: hds: restore HDS settings in ioctl_set_xdp

 tools/testing/selftests/drivers/net/hds.py | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.52.0

