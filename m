Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772843;
	b=XAthgH4/MEqfkxwdNwUeCe4nXb/FWAfJV/hxPxJdEIpQ78TwB/Cl6f+i+9VbOLG9wmXf
	 qY0CzxoE0KgcxPcgAI7CrTnUsGM8o2AheDqh5sX9Yjyf3TTK3+0eFmNntZ5Ls/uD9Yozk
	 BHIIS2IldQ32cKghPQpUBfivGxGvcuAtEpa7g1jHZYRd2z3IMw9lZDGkNN8ssofS+dXxI
	 s+41BjIqPTZrh5/iHnHUhAk0b/fQ893Ago1LrzczK7PpTQ0gLelZEee0Vh9Mj36iKcOu2
	 PJGZ0OXRm2GvJJ4AsQS99tqosPfCQTcTmXyBjBB1wgMoDgPJeTqBrOnr755uNIepclQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
	b=o/EC6LJRPFRtwfux3ycWfly7SYk/V4+on991357Kx8Azcq+lhpuRLlnmNjyZ7J1fFCN8
	 B7sUdciBJN1gNXJyyBqm9kf0/0qKUh3xKPYqpYoDkH6Z18sMZSxipsE096Pw3pq4OBIc2
	 gG0flPIF3ayfk0e8kF4rNOVrLs82sMe9mBJ2FZVVoUx7G6d+EK0SaC3hfqjA2Q74oki99
	 5YUnCUrMj8/xm1kwACTRTSL33IKgLNlJN4gaLEVODaHvCMok+j/ULfSauJXvA+uu6lT3h
	 hTj6g33aBUUTHPc5F8AUUAZ/9TieX/XZM4/BI2Yux95+jB89e8TsWfw3i6uLIQbNDBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAA160A263B
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BAA160A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=xLLkkSHM
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so12275790c88.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Nov 2026 01:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772842; x=1796377642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=xLLkkSHMIjsxo3tmJs2E53upygYq78g9IH1QETQPWh2bjMSQM1MOp37S4UzbNnuDbM
         DQu02ZiAACzWIY6NCWo9keIZiH46RWMUcuQossac6Fc/jrBCNg1dARONlmvANKAK/ZsQ
         nBshyuLatavYVtEn5THROfQOguVnS0MpiqU/LnXNkqNqFn7kVf/HcSohlaCwTh1qgp56
         iWwWE4OeHL9Rqq0PPSlnXLPCKI1Mtj5ch29gGhQ/chzLdsa4ot0IldIl0KvPKyYGVej0
         cSISEcsM0yKFqNA1ibnKNQbpW1vd9+gaW58pPrvRC7RQoSdi5N8dGhGeSdPNcAz2QnGF
         mmHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772842; x=1796377642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XFFohzMJhqNYhaiOqAvHi+nHcxA5zUB6iP9YCFg8aRY=;
        b=UMkUAoiBEICFQ22xahaJ0CnsnNgVOeZWAl+SU0BW4RUSRXAo6VfmhGOa+Xalx6viT0
         NWu/PZf83iReivUdLJ1CIdJb1jQYF9A0Vl6Plb1BrVCHAzg1kSIZ6AMo6BOvJItin18x
         por7kj6Xrqkw/OsPnFBzVUkqvwr9pfK/HF+ZQuMjd7ihOLmHft1mbyKyrNYx9ul9irlH
         BjNc6q4AW7rY8Zw0ndEdQmeHA6AjF5vgUwbvcfufmAFf7lDlNYcgLGf06UnXydkDQFza
         gyFMalVEbZc/pGVH6mvPvBL+yfCeO+hAUCbmjNiYY9rcQElmBrU3dL25BQ19NxVaiPSy
         xw9g==
X-Forwarded-Encrypted: i=1; AL+hErEH4fRVw80wQ9Fh6Hd01+zO5BYOxuxX5lWJAyftJX8qfp/wV/+P9ndvoxeJdGqPr2DoZI4DpwIgq9LF1L8JVyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z94Mw/Cwq7Hfnzz5nRyr0mU3aReoORaat1K84Fi/XzPl0WvTl/s
	Y/NT2sTE2UlSCXf2pOPDxT+GlivkJvfOY8h1N1iXso1YlF3KEE9dNcVk32CD+BRS6Mc=
X-Gm-Gg: AZFdTZfb4dKNG5VLe76zHVQWUGoRNmM4mLuZwiVzxswfs0fDFPlNf/P/vb4PHdj7hsX
	3Je0GoEj8ZmX4tOVEVeOtSITfGdLoKYJqsqOreOMVYJwgwMFRPLudYeMHNzXpWcOgBiFXicVhfd
	6F1XnmwnuWA2Zted0tdbvtLgrrU3hVuNjQCbhcFb2UlsWgs+HEeF1OxdA0biJDrYeEACZ2FxMx9
	G4ontqut7MLWf+hDHXkNtzWmTwKCwFor1bc3caKSjCLagLlVeT8p0ixtBRpwdeEN+a0DaXq6bPs
	0RwZHgdLRBhgsUl/nEHJdAXyaYsTCvS+otWv/Gd0Mpz8RxnoNiurthWcFBOAXhRWSMMIUXl49ts
	DxfDPJ/DHzwAkGM/WRKmwyy78CCfEZMxI4NHbNyBjgg48Vh/YqYnvdzUdVfmcDkNR++6/AVZpR3
	OuXqPmrYe5VOLZGMT8y8x3yLqMa/qDGldfogs2WXQ3N79dsJELYxNtbih5lDfoJTP7WckRNbca7
	7qu6okpT1An+HcDxNey5aONeu6CIq+8wmaWaPPeuekfFmCzFcL7A+x3+mCsJzhNW/qBzQNif4Pd
	wqpEMFiUlUa2MdEfDChAvUvsN8JmdGREytbIT4ro/1zdfSf0uRpa1tJ1iVJ7woqNn8P1umee6l2
	n3OhQj15bV9tj5QGDYgtwRyirmMsPXPFIbS6Lvv69o6Plx32R
X-Received: by 2002:a05:701b:418c:20b0:1b5:39a3:75e5 with SMTP id a92af1059eb24-1b556901fccmr24321772c88.33.1795772842312;
        Fri, 27 Nov 2026 01:47:22 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c3052sm55115194c88.1.2026.11.27.01.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:47:21 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Willem de Bruijn <willemb@google.com>
Subject: [PATCH net-next v3 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Fri, 27 Nov 2026 09:47:01 +0000
Message-ID: <20261127094703.3025517-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127094703.3025517-1-omar@blockcast.net>
References: <20261127094703.3025517-1-omar@blockcast.net>
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

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05b2d9e36..067271943 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1506,6 +1506,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
