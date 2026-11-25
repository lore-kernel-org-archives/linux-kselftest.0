Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634109;
	b=C6MDC1ewm+UarbEpUoEMa26V4tlG+MVg59HMACEIXhcxQAayEt2BJ5QZdkQQJw9MM2Of
	 X9aGUINNKIAzWaGP1Pmako5WaAUvYjMCgW8lByNfvalXES87RSck5zgLLrFOv0hSCJa2x
	 cu9cCqXnwPxzpceMVTJj7pvWGuH/7n8A8sNifJsRgVTT2xz5a2E+y8I61FYGAJBozSXOg
	 H2ivx6OLkNS3RTPTY9Kbh6rDxzgdhj3Pbs+1tA0EEyJ7pGoElw01o7UENhZv4ZfnQ48qe
	 hpc/VS+yvAzw/ZwLy3hcyyNKgapYW/uAP0tBfqr7Jw/ocMxcZjTeSdtguwv7zyQ4EvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
	b=IT/Ug0I8zCSUGNA/RN4k/iCMVMCiXOAfcP8QJ+XvWQVdmgzYP+gj0m3P3rZEPwSNbV4k
	 kLLAaJyDnrRWb801AvAYnHDTVMFqyRTdHIUTRQPDL87wGCBmiU9A+S4GwGlTB05LiVI7V
	 7QS0vCS8r26pjM9KtDLDAz+1oK15nUnfQKsJ82EemdxgkxwxJih6KgaisqO0VFvNFFzBY
	 XdrrW3vhvM1aVPjwebXNc8+D1FfnN4NqkFVulxXeVr7NHNspusuclqpC3NtRqIxPkqFzI
	 7WdQ5vpFNsP59+bzbaP0hdcUC6UyZDUR8QwnnksmvwEiyQYvvNQpispLDKB7SMlvTpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA48606A6B8
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 19:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA48606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2f0481b35c9so36632755ad.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Nov 2026 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634107; x=1796238907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=nEC4fdqeLFuOx7pZ9gejzfft5pb20bd4XKtV7usvGd31fLlqVxuebaVdG/h4js03Jx
         fV8cM/XuasDvTzoIqa73NH/HbsT5AClRxqtCuZMbit0xqFlMP0WiFQEnp6rVIl9Y+bSd
         1aqjxSMfppqr6shrFEfjey6aC6bvF53GxCKDl7nz4K7Iyzv+SJ3Gdsg+p1F8n7Zx8G29
         /MY2nIUJKMzWPT4cfvwySr7oyBFqun+KRqB9OchapP6GKDm0FljKD3RtXNZYOx8h9wdq
         b8ChyynDuYMPSfp7sn8+CY89SXRzL+Yqs4tApEJw0DpqlAQpa0KkdJfvzz0gVHR1Qjpe
         tlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634107; x=1796238907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=WEvCX6PIqp/5vSPULzvrX/mxhzglNzhoQCuiP05aB5T/u20V94riAhhVr01D5A4kE+
         pT2QAQI3+kW9yQbUWVEIGBAhmHn0g7iGvx8E6KG0ZKkoSsM/eSMEyE9qDalXY72iB0k6
         e3LDEbjySXH5nrpH1gnTXqF67sR7DvdRsazAxDRQjBx4JY/bYfu7tTkt6Qx/tbfgpBSk
         nZkYlBzTmQ1GvADpRheASfdAlKcc8SOBVLCJ7l1KYvSTaVWXQ7kjsH8zqlDBzNowLKhq
         M/GtpA8CQ7DBvZ6Im2bsI6wH3VRir2iY+sGJ5t4Edx/XwTLc6Wz5AiEpa88CJv6kjScL
         EzwA==
X-Forwarded-Encrypted: i=1; AL+hErG8JmJHXB0tgFD5Eerfq1Im11XG3e+4LzYm3La0bkx7NQ7nVcCjjbTHuagY30hQm0JmkVmdfAy9f+XYGNaawR8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LTw2BRXvSzhW+E6j6sAdwJGiXj+R/d7ooryUPVbLy5tlbrixg
	9ZtYrRJoxfSSbI9BBYmgUMBkI1ffEbQ41Bjx2m39LzyBi0Fu2cExyVHlaVrAe4ZeZa4=
X-Gm-Gg: AZFdTZdpV8uF4YBxYrPgQcBH3JgSbYLe/BSoWPi8+UoFlrROr9zNXKahus/4Q17Mi/I
	1zc2kVGO4Q/3u4vRhwtiHQuTPa5dcQPB7zsY2W+ha5LMN48PVXkFHCcjyAEBCU4KKJGV04QHspC
	wV7O+6giMVJzcbsFmnLeupELb6jr0yI8MucQxu9r9LPc+v6wrSQMAhjUBoCO5JtrQrLf0UEZSgg
	xTQj73DJfpsMygOTZpU+PleJJkZzdhjoSnXhpDHrhCX+lCFta1hN/AbGFBcwcweL3Goose45nbJ
	V4G6tiD9BCELzKMqm6Wk3y+8JlUK7qEiYxZNlOWikG6CBpTR+vjj5MrIGxei4y0BTPwxOw8EkHS
	6X0ghG2TDSideC6f2Lmv54gvewLjav4d3trmUtWb8u399AZcdQ6QVq8mZQd9I/yRVDrV4Ce4vvN
	VL7HSswoiDtP43bwOarMq27cUhtAkmh9llfgeQRq2kta7aN3p9hA0egJYMLcjAWTXoS3PD8mTzY
	Gm+Qfyz4DoFoQ43NJL6SiDwk/5MI3V7+k8RxPxk0ndgytnPBEhebI0pkCVy+o1M7jzMO59BHts7
	/jTutpT2pM7jMPOmE6WouKgYWSOf21iG5JAHSzjCs4GrSNCLHp3MCIq238U0gk0xbRZuzxztQVK
	xuqhDUykEbLhc1U+jSoB7X0t0KpsJZoaJSZzanQRSrKZB33fJGm8=
X-Received: by 2002:a17:902:e5c5:b0:2e8:4f3f:60dd with SMTP id d9443c01a7336-2f03f215a7amr145555155ad.37.1795634107510;
        Wed, 25 Nov 2026 11:15:07 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:06 -0800 (PST)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Wed, 25 Nov 2026 19:14:48 +0000
Message-ID: <20261125191450.2497936-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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
index 9f1a6024f..6a028cdba 100644
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
-- 
2.47.3

