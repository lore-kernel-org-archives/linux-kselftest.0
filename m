Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801345;
	b=Y8E2FoVZYx2WpByMvZzIaK02pu8tk75RNi+F9bNM4TPxANGDH70x63EQIaNtsa+81QZ5
	 h6Uy3liHMFVhsrL+Kt67dAiIuvp9/210k3kTDOfGVBZl/G9pB2otYVF1fq5cu54k6qis7
	 2BBOmGotmjVNRA0rs8edydX67XPxhxg6+lCjPxnPeidEDalshGOm2vAJeNokJxz/ezZB7
	 3bLZPWbxCYOA/j7Zbc0DsMqKApb39DOhA3fdfIb9ZcoeOCUxNhmt8HwcM0RCqTZEWJVW3
	 JvqgUUVqLAHs9dY0YRik/pT5Lc/CC30R/nyme6k+5zrR98+f3wt4ZXs537f2lPiy6pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801345;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
	b=MpF9QHTk08Th7H4FxkcDg+QmXMnkgsmyCcny73j8nfigCgqb4a4cmDJENiF3BYijjzQw
	 1Ha1AbzPi6128Zfds6QMtqSPwjIWAYSGrCqJX0TQ9j9y9ecFejKu+ApTjSF1MQO7ZTOUw
	 SDfve5TIavfQw4QUdQgBROoZ8bLYquxrNuQpdTFbEbBIqRCOB9F0n6Xvq93bTQdg+mccF
	 FCbHKbdR5J/fsJtkGK8+0LFuaXckODD7hMO4sv0Bgr4RiC7I5/o08Fx7XTa7wUyMDOCTN
	 BdGwnKC6zuqFLTlFgdvI+xoO8HsnnbzjsA1N40MWj8YjUUFHZ6PJybVWP4ywJFkAEJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=XloESbbi;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50258606A321
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 03:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50258606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=XloESbbi
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1098977b3a.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794801344; x=1795406144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
        b=XloESbbiyA1sWYOnXj9ixs/llQ3B2Q/8hWm/wMQfm1gIt/oHhCgMeNqwamBFahNkuD
         ie8M3VAhhEt6lAuEXjud0jC6LUzy2WxQcydWAKcMc9ke3uvuYeWMM4FKTWCQxBIOAyjS
         qFVhBzDreZ/94uY0+yEvRePqAA6B0as4NQdMW10xFCFdSQ8JHzDrdEzlg4HL6QGDYYz1
         nzB0tY763kk5SoTfgqnMqwIA07FwlnHLmImsYXgfZ3yHGMltZcagXJWrXAXyilJnoRTO
         KtW70orQI+PM+JOghTMbLHtu0CxKiT0mYWDjWYZEfjl6psGngfmDhR5gnNqaUx5veNFK
         K6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801344; x=1795406144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPLYXRtdUzVxRMFi5L98tPD8dNCrei+9JW0B4GyCjnE=;
        b=Rcu44r6dP7UalX/VwpaYxdit35vOvAvyXYfgAxUEWX9v0dpzvW06gJNWI402FDcjtd
         asrcIs9lu8inipyTw9zAYEXinWgGYnosqB1owQn2phj9FJ/9OoCOwLR/0UmBqcx7FLn1
         S/61y76PoGVOoqpozyoyRuI1YM9Uz2oJ5L5pqNTkwxJ8HQerg15e/zCPlh6/IayaJvUV
         iTGlVdSbgKb2cm1Im6dVKbY6o88iyPdQHd2gwSFCz0WoavVbCcWX4Vlsf4OVkWmFRooE
         81Wfr5MM1QjtQNYJ+Po9eL4mbcKvl1CBXKLGjSqkj+I3LUTadxhWN0YmrvPJdxl2Fr9E
         no2Q==
X-Forwarded-Encrypted: i=1; AL+hErE6v1t+lZfYMBDNZb1rI0B05UhKfOSAcSUtm7UXhy2M0hQLwv17Y7DsJEXqgkfL5oA++wHYUmI+kkbDVfvgaeQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z97vR8YEb+lkx5gF6xjBEkX12/cGsvvgvUaib7nkyMsrlmFg4Gw
	JQQi+xcrkH6C2JE997Sk6aYbs8znkhNlGqseDtzw9hqA1xp74VsAgruVIPhKC3JB5UFQ
X-Gm-Gg: AYBFou3CD8rs0uBlSkNAXTpmK1Jm29Ik1KtjAD7rFHB4wTeQp992+vHSrvF7psBSgL4
	ADyLSaaTmcWF/agQl07AHHnBHB4jDKDBaLn03AQBf4+TAL8C0GIgzoNbJVvuPp0abA6z13qcDcH
	8vZH5+j3gG/ktZ2hb3szEgW7tMq3PuZwgm6fuqGQVO84nKJI7LhLb4KZtTQVcgPOTRS7h7E2pFg
	VlhwsLeT4QLUhgfA8urRCgPmy3SKShh72C1hCDRebfXM3NarJC2QFJBKPS/iR9b+0gkJ8s+ej73
	PGPyYEBCImPJuAipIsaHTnIaz2F4V163NBWKf7t6DyDtpqVjdnQj2rcyU9iqjBZHrVzzeBK0aJm
	2DKLO8NecdD4N+/Sd4wcX3GjSmXIBYH3KpNrF1zL1CevQjuLfoctbGqs78J28tblYHpsxMgaaNy
	vs68SnAp4tl8A8h56bCrT5UXxgmuntwr8gEhtocm8sUIEdQ5eI38t3WSarsMV/RgXr8BEKq8j9F
	xh6zfJziUV57BhlwwuuACTs7h4iXrGOyEFm0VESSIRbf7kb4re88VerwLAx+TNZZk57axX34276
	btMg34SJtJWN/ydXHBJOzlPfhFAZwy/oQJoagcXRMlSR86tRTJP1PkbD4GWVDoexzPjz13TRx2F
	p9F5lzO2wtzOPUKSp2KWi
X-Received: by 2002:a05:6a21:7187:b0:3fb:5fb2:a4f7 with SMTP id adf61e73a8af0-3fb5fb2aa96mr1341727637.34.1794801344555;
        Sun, 15 Nov 2026 19:55:44 -0800 (PST)
Received: from 24c857d0c3be.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc1886b12sm3463176a12.11.2026.11.15.19.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:55:44 -0800 (PST)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	benh@amazon.com,
	kuniyu@google.com,
	shuah@kernel.org,
	vega@nebusec.ai,
	zihanx@nebusec.ai
Subject: [PATCH net 1/2] udp: fix reuseport rescore fallback
Date: Mon, 16 Nov 2026 03:55:32 +0000
Message-ID: <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1794759652.git.zihanx@nebusec.ai>
References: <cover.1794759652.git.zihanx@nebusec.ai>
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

When a reuseport group contains connected sockets, UDP lookup rescored the
socket selected by the reuseport program. If that socket did not match the
packet, lookup retained the stale selection while continuing the scan. This
could deliver a packet to a socket connected to a different peer.

Restore the candidate that established the current score when the rescored
socket is not a better match. Keep the selected socket only when its score
is higher, and apply the same logic to IPv4 and IPv6 lookups.

Fixes: efc6b6f6c311 ("udp: Improve load balancing for SO_REUSEPORT.")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2||socket-hijack||m7q
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
 net/ipv4/udp.c | 11 ++++++++---
 net/ipv6/udp.c | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
index 2e5562f353f8..23a8c951559c 100644
--- a/net/ipv4/udp.c
+++ b/net/ipv4/udp.c
@@ -475,12 +475,17 @@ static struct sock *udp4_lib_lookup2(const struct net *net,
 rescore:
 		score = compute_score(need_rescore ? result : sk, net, saddr,
 				      sport, daddr, hnum, dif, sdif);
+		if (need_rescore) {
+			if (score > badness)
+				badness = score;
+			else
+				result = sk;
+			continue;
+		}
+
 		if (score > badness) {
 			badness = score;
 
-			if (need_rescore)
-				continue;
-
 			if (sk->sk_state == TCP_ESTABLISHED) {
 				result = sk;
 				continue;
diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
index 9dcefa162522..c5adeaaf5b42 100644
--- a/net/ipv6/udp.c
+++ b/net/ipv6/udp.c
@@ -234,12 +234,17 @@ static struct sock *udp6_lib_lookup2(const struct net *net,
 rescore:
 		score = compute_score(need_rescore ? result : sk, net, saddr,
 				      sport, daddr, hnum, dif, sdif);
+		if (need_rescore) {
+			if (score > badness)
+				badness = score;
+			else
+				result = sk;
+			continue;
+		}
+
 		if (score > badness) {
 			badness = score;
 
-			if (need_rescore)
-				continue;
-
 			if (sk->sk_state == TCP_ESTABLISHED) {
 				result = sk;
 				continue;
-- 
2.43.0

