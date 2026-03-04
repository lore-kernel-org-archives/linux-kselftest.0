Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5427537EFF4
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 23:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772665621; cv=none; b=lwixN05UZlqWQQCjlmXHhUj9UQhBNFtgFKfqPby9u8hTSkhEibsBUDU+FDY4SsLIThhM1fBS5jjYd7KiSttk/KZnN6QXktLbIn97gKptzITUkdOi2X0sH7f0O44t/jgthG+66llLv1f8lw6W14mEMaTVAbqYM+vXD0KreGRdi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772665621; c=relaxed/simple;
	bh=b1elnpjfkBu0JtZAehyeYhD042b+cAawq85lNBLyT3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITY+PjPTRF73jxoDbu2nUDQJY5K3rs3IoRPLB1mnYuXyjj/w6/r7ZKqqEU9YyId0/CYFNrWV5SUi2DeIEDnvIVvNpFkpmBhd6J7QpRDapWNyAxexy4UGSozfC/ROkB1XolAsSoGHL/V3zksJb0LiDJ50Bh93/P8F2HhU8hha4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=TZ0KtWAO; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="TZ0KtWAO"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48373a4bca3so46009355e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 04 Mar 2026 15:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1772665619; x=1773270419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t44rK9xj38qm5oEm33J69u0Wi1Wb9BeJbAg95YLqBNo=;
        b=TZ0KtWAOKH3JRvmgaYhg2VA7d6viZ+iycsKIgseKOoY36ZW/6zLNsyLBRW/6Ge92P9
         vmeC59gom+aSJ0VB4/OzFcEvrDQ8BdvZ3hlDQrdgnZ+5IxPU9hcGeF1K6p5wESt5tfLa
         Bwj9D/Z2Qmm2EdhVEY33nU8jlTsVbskMouOlEdLXqrqTJCWaUTOCvf6tGbvpRPFREImP
         eSqmJBAHmLWW5Ss9LsijQ3hvLIBSCWq1zaaJlP9JGxI5Tqbo9XsVXcKPZR/4KGlLfaE0
         Btlos0BOHmLQ9eYENvoRnDGUn2IUGoU8mWoRCLRcRoUc2rnd4QPbq5/NgjLxECCZ7I2p
         mU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772665619; x=1773270419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t44rK9xj38qm5oEm33J69u0Wi1Wb9BeJbAg95YLqBNo=;
        b=MLCLAV3ni03e81IOweNkkL09FUVvnUSlmIfBeBIXdS3WE2QsqjZIVPZkA5FZYRorQl
         xsuVvA5uDswn6X9FABkEZRb7KG9Oir77zMIgrXApNZTRhUeViDJ3Qvny8gtZushTT75Z
         VWsJ++yeNdN6/m+Uqg/LGk3N+5h1aMoQXhuI3qE8xCBu6ntJgib9L9eUYwsDfoz/y2X8
         7Orp0/HVfrUetbKtc4ED0mhEKjObr7Jx0CplAyY4yYZPBminHcr6soS2IRMZI1hGEStb
         FLUfKsyrk37mkeTSyz+JPjhvFoQ+cjSMHcMIm3KHye/tgjJcwF120O41kWiMHq2T/Sq+
         jWrw==
X-Forwarded-Encrypted: i=1; AJvYcCVblXaOR6/eO8drno3/+lZCVjBc21X9c2ZIyyF5LY5oDBmulDvCIgblfIZ0a7k7xIbGDBfjAtiFpxy73X+Jm44=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLKmSrktMVWG2ClY1mBBY+xMC0BO37rCMTCeHgS8EbVWVHc5X8
	csVKLvLMxTGMEb5aveSA6QCNx97HcKv7O7DY/fyQKhPJhKWoHE4djrnFa81uCNYOOWmQHTe2FvE
	6/n8qGu/LhPo9FTlCHw/go9+TPBt2oLAVC6HlrU6NCjDdWptIhK9dyGWgl9+kJ9o=
X-Gm-Gg: ATEYQzx/It45lH3Mg4PgYSYVDSrS1J5g+1KJpStpGOeIhy2rLrnb31qkWVf2II0zJx2
	nltsDe2pXA2sfWfN4pcipMPeAdTiBYsfPHSCF1ykZ7YI++TRIM8wMlO6KaGWSFcvCgOIftGAnF/
	69MrJxL3XxMaN63GyZZs8RLDoMrH1PyAL1GEzG5PJGL6ap2mMQ73h83qwyrp3WkWibPBgoCmLMD
	t7lYM4sHzMLPdj4nlThI/CPt/pStWGoRjuleUi3bnMkUIFwsvwE2yEsmgSdxCMF8A295Ejz42tp
	wvDy2d2lb8LM7kSg6AfKlrPyDafysQx/JCb6BWORO/CkmXRrJhsI6y/uQ61lT6pzflMSwQ5nUjg
	8NmB/uxsVEDKZQA0dDqz87IY3fM7iYGO9ZN2LlL8ddW47mpTHMe8FRGPIRHNJbf6sSSVS4+eBMJ
	XJAZgu+cle61B3oaiUyTWhA2jGv00qIk0wT8o=
X-Received: by 2002:a05:600c:35d4:b0:483:1403:c47f with SMTP id 5b1f17b1804b1-48519826fb8mr57114595e9.6.1772665618750;
        Wed, 04 Mar 2026 15:06:58 -0800 (PST)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:880:4d86:fc53:5d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187caf9fsm87713475e9.7.2026.03.04.15.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:06:58 -0800 (PST)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: Antonio Quartulli <antonio@openvpn.net>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	horms@kernel.org
Subject: [PATCH net-next 1/9] selftests: ovpn: allow compiling ovpn-cli.c with mbedtls3
Date: Thu,  5 Mar 2026 00:06:19 +0100
Message-ID: <20260304230643.1014-2-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260304230643.1014-1-antonio@openvpn.net>
References: <20260304230643.1014-1-antonio@openvpn.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mbedtls 3 installs headers and calls the shared object
differently than version 2, therefore we must now rely
on pkgconfig to fill the right C/LDFLAGS.

Moreover the mbedtls3 library expects any base64 file to
have their content on one line.
Since this change does no break older versions,
let's change the sample key file format and make mbedtls3
happy.

Cc: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org
Cc: horms@kernel.org
Signed-off-by: Antonio Quartulli <antonio@openvpn.net>
---
 tools/testing/selftests/net/ovpn/Makefile   | 14 ++++++++++----
 tools/testing/selftests/net/ovpn/data64.key |  6 +-----
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/net/ovpn/Makefile b/tools/testing/selftests/net/ovpn/Makefile
index dbe0388c8512..d3a070db0bb5 100644
--- a/tools/testing/selftests/net/ovpn/Makefile
+++ b/tools/testing/selftests/net/ovpn/Makefile
@@ -2,19 +2,25 @@
 # Copyright (C) 2020-2025 OpenVPN, Inc.
 #
 CFLAGS = -pedantic -Wextra -Wall -Wl,--no-as-needed -g -O0 -ggdb $(KHDR_INCLUDES)
+CFLAGS += $(shell pkg-config --cflags mbedcrypto-3 mbedtls-3 2>/dev/null)
+
 VAR_CFLAGS = $(shell pkg-config --cflags libnl-3.0 libnl-genl-3.0 2>/dev/null)
 ifeq ($(VAR_CFLAGS),)
 VAR_CFLAGS = -I/usr/include/libnl3
 endif
 CFLAGS += $(VAR_CFLAGS)
 
+MTLS_LDLIBS= $(shell pkg-config --libs mbedcrypto-3 mbedtls-3 2>/dev/null)
+ifeq ($(MTLS_LDLIBS),)
+MTLS_LDLIBS = -lmbedtls -lmbedcrypto
+endif
+LDLIBS += $(MTLS_LDLIBS)
 
-LDLIBS = -lmbedtls -lmbedcrypto
-VAR_LDLIBS = $(shell pkg-config --libs libnl-3.0 libnl-genl-3.0 2>/dev/null)
+NL_LDLIBS = $(shell pkg-config --libs libnl-3.0 libnl-genl-3.0 2>/dev/null)
 ifeq ($(VAR_LDLIBS),)
-VAR_LDLIBS = -lnl-genl-3 -lnl-3
+NL_LDLIBS = -lnl-genl-3 -lnl-3
 endif
-LDLIBS += $(VAR_LDLIBS)
+LDLIBS += $(NL_LDLIBS)
 
 
 TEST_FILES = common.sh
diff --git a/tools/testing/selftests/net/ovpn/data64.key b/tools/testing/selftests/net/ovpn/data64.key
index a99e88c4e290..d04febcdf5a2 100644
--- a/tools/testing/selftests/net/ovpn/data64.key
+++ b/tools/testing/selftests/net/ovpn/data64.key
@@ -1,5 +1 @@
-jRqMACN7d7/aFQNT8S7jkrBD8uwrgHbG5OQZP2eu4R1Y7tfpS2bf5RHv06Vi163CGoaIiTX99R3B
-ia9ycAH8Wz1+9PWv51dnBLur9jbShlgZ2QHLtUc4a/gfT7zZwULXuuxdLnvR21DDeMBaTbkgbai9
-uvAa7ne1liIgGFzbv+Bas4HDVrygxIxuAnP5Qgc3648IJkZ0QEXPF+O9f0n5+QIvGCxkAUVx+5K6
-KIs+SoeWXnAopELmoGSjUpFtJbagXK82HfdqpuUxT2Tnuef0/14SzVE/vNleBNu2ZbyrSAaah8tE
-BofkPJUBFY+YQcfZNM5Dgrw3i+Bpmpq/gpdg5w==
+jRqMACN7d7/aFQNT8S7jkrBD8uwrgHbG5OQZP2eu4R1Y7tfpS2bf5RHv06Vi163CGoaIiTX99R3Bia9ycAH8Wz1+9PWv51dnBLur9jbShlgZ2QHLtUc4a/gfT7zZwULXuuxdLnvR21DDeMBaTbkgbai9uvAa7ne1liIgGFzbv+Bas4HDVrygxIxuAnP5Qgc3648IJkZ0QEXPF+O9f0n5+QIvGCxkAUVx+5K6KIs+SoeWXnAopELmoGSjUpFtJbagXK82HfdqpuUxT2Tnuef0/14SzVE/vNleBNu2ZbyrSAaah8tEBofkPJUBFY+YQcfZNM5Dgrw3i+Bpmpq/gpdg5w==
-- 
2.52.0

