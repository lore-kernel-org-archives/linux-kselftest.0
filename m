Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF36E38A71F
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Jul 2026 04:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785127027; cv=none; b=XxTlMHe9fYC10aCAof/D35OYOE3sfpZ+wGiPr4v2Cabjbcp7fOKgOncCn0Q9yvcQ1hJdBxIbWWt6QbQdpeT4zOO0ns7EtuohyY0hyys5GYSYVTOa4y/Ymeq+ElVqkBBjdQI3oCOF+g+wAg5irCB/3+Im2AddZEdyRuBRSTiKtHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785127027; c=relaxed/simple;
	bh=o2L55v358rIT3INtYNxYhyQawGIIA8Ywa04Obix1ZjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=geZhLNVbXRPXvokZEskYHcNGamVbkKqhRsdSxzvsJaEtDPdTUjoMaWzA8Z73Kl7Lpo+1XL1T0qFErKbr5OXxO1wwtIZ1lavOYci1Vh382PxWnQEBbrCPiNF9Has4/pGLtSTByRVAg3YH5Q5P6AoUlMdGh3PlY2qpKO1dyoXAWbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UU+OpDm8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UU+OpDm8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceae1ed204so22816185ad.0
        for <linux-kselftest@vger.kernel.org>; Sun, 26 Jul 2026 21:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785127025; x=1785731825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNY/fNs+wPIg22L+p1H1+k7UHMNsxwsajJR2lgOhHzU=;
        b=UU+OpDm8TWpys0gHLRHEINMsv6VtWDc9U7KUeygsg6qjyfm7bmQtpP2FNNReIZq1Rl
         9kGggcTFckhYociScMuo4xeXCInZKLYsFTSj7jSAW+6Sf3YBZhBwuJSIpLEeo6JsK5Fv
         Tzykpain459REGywh2Zr2v2EkZ1adJOix4EsLShKkxi+iiiprzvR7wKmLWfX9O1joAvp
         FuxI79Pvhg6qwrz3XQfdpClNl4aQu0rqqUhLwFX3s7Fo7tSBmEzspzBdwGA6ysycSthq
         KriF0sVkKecirPFiUqMxolbDy31mK0G0gChOItMDy9brCGFNTGdUoQG88FUTJg7e4G4s
         u5QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785127025; x=1785731825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNY/fNs+wPIg22L+p1H1+k7UHMNsxwsajJR2lgOhHzU=;
        b=pztRzVyyT/qJmG8d5Id6Er+mWHM4SbFCeZ5snHLHuY/AcrKHQL2kgD1EDGOSRFO/rK
         xnicaifFr8o534KDmfmmq3g3pU8Q1ib7rwrOoV9WKGbWyoQRyuVbJ/YNbDu+Pp7mWmUJ
         b50AAGKOqhQEI27RrwcFz36Fwhg6E9mnvsPzDrXpmY3VYz/V6af9XWo7nbwBwLO9ErST
         Zw8zS1qZuIY73WozxwQ3I8OVYwZ/9g4QjTHbh3xitQBMTM97M4pe7EXeKMINzyxeypJo
         MxWwx6LCGDl+ahk9f25Au7ayfIV/mxOLXlbyyNiHsgCx5ccT0o1BuS8unZMnKvpeWkP2
         rGxA==
X-Gm-Message-State: AOJu0Yxpwq+a7P26E0OrRfPZUbt9Y2Bze2rAfVo9X2P/lxw+5ZUqhQU7
	4grSCJpl9IX7IVysYvqeaHZPMPp/QsQiDeJklQeugN+96zawHO92QTLQ0Kxe5A==
X-Gm-Gg: AR+sD13GkUh3I2mOjmFTrxDy+dDL0urXLkDegvhtudLjaqwKWESfeMRiOOyCE7LJxQA
	Ks0e5VMWP2lvW9nYYxdW3EeVnL9LjaqGLRG+cug7NLAEwnH9289b0c3uJLs+r7D/Uopgz2pQcsj
	xLfilSSOo6dwaPU+eNu6oQvZAP/xvOYnwFQkN3XHebx+lecBWHUy/O0qa4LmbChdLu1LrwRVGYo
	uFqRWWl90bGnZ3YfTG+V0iQ7AWCfr5O0X9oi7RC+cIPHqe6WVXcFkQT52/alx7//P1IqSO4pPtR
	WGn4sIlI2XZEVyO0ahNO1iFbnb3FOgQZI/OG4wTthv332wqQXKYWVtu5ITkHxysIah02eJwYGP/
	Z6Qn8Jl8SnmTIFN0mAwHFS/by4PUvnKe2XPCK3HmWqgzClktLguteVjJnWIj2HASTmgbpq3At9B
	5d4+YTVYzMhz+88A==
X-Received: by 2002:a05:6a21:1f8d:b0:3b3:fc6:622d with SMTP id adf61e73a8af0-3c67df10c33mr7008207637.38.1785127025195;
        Sun, 26 Jul 2026 21:37:05 -0700 (PDT)
Received: from marceloPC ([2804:1b3:a8c2:99cf:6381:2414:ebe3:a179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc4164ddsm26249985eec.9.2026.07.26.21.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 21:37:04 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
X-Google-Original-From: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
To: netdev@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
Subject: [PATCH net-next 1/4] selftests: net: test IPV6_FL_A_RENEW
Date: Mon, 27 Jul 2026 01:25:07 -0300
Message-ID: <20260727043516.93101-2-marcelospe@proton.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727043516.93101-1-marcelospe@proton.me>
References: <20260727043516.93101-1-marcelospe@proton.me>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RENEW was the only flow label action without selftests coverage.

Based on the previously implemented EXCL share test, that demonstrates
that a new flow label with same label can be created after the linger
period, use renew to show that the flow label can last longer and
block a new flow label creation after the previous linger time.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelospe@proton.me>
---
 .../selftests/net/ipv6_flowlabel_mgr.c        | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index af95b48acea9..cfa7e6270994 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -71,6 +71,17 @@ static int flowlabel_put(int fd, uint32_t label)
 	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
 }
 
+static int flowlabel_renew(int fd, uint32_t label, uint16_t linger)
+{
+	struct in6_flowlabel_req req = {
+		.flr_action = IPV6_FL_A_RENEW,
+		.flr_label = htonl(label),
+		.flr_linger = linger,
+	};
+
+	return setsockopt(fd, SOL_IPV6, IPV6_FLOWLABEL_MGR, &req, sizeof(req));
+}
+
 static void run_tests(int fd)
 {
 	int wstatus;
@@ -160,6 +171,18 @@ static void run_tests(int fd)
 		error(1, errno, "wait");
 	if (!WIFEXITED(wstatus) || WEXITSTATUS(wstatus) != 0)
 		error(1, errno, "wait: unexpected child result");
+
+	if (cfg_long_running) {
+		explain("create a new label with FL_MIN_LINGER linger time");
+		expect_pass(flowlabel_get(fd, 5, IPV6_FL_S_EXCL, IPV6_FL_F_CREATE));
+		explain("renew the label to increase its linger time and put it");
+		expect_pass(flowlabel_renew(fd, 5, 2 * (FL_MIN_LINGER * 2 + 1)));
+		expect_pass(flowlabel_put(fd, 5));
+		sleep(FL_MIN_LINGER * 2 + 1);
+		explain("The label cannot be created because the new linger time is not over yet");
+		expect_fail(flowlabel_get(fd, 5, IPV6_FL_S_ANY, IPV6_FL_F_CREATE));
+	}
+
 }
 
 static void parse_opts(int argc, char **argv)
-- 
2.55.0

