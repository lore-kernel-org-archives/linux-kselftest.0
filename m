Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB4637CD4C
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 20:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435112; cv=none; b=g9XLwtpvGLN1pbixX0dpNBHlbTQ3OaT2aCexajp0aYeyYeTOsEmoa96vE+GAYoXgZDxvNe3NmUCEkJWWcf/A+tZRauoLnJtu4Qnso23cyjdbo8cjcyXW+Op+ON9UeFZE+GpqqPIFmNMIJUQ0f4Wl3IgHyaTd7dTo/7isIjnMv6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435112; c=relaxed/simple;
	bh=ORVIj64W7VWD/p2asQ9JCzIMDvSQTNmZHqK+BXBHmx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=meNzevUuAZI80qV2ugo9da1V/DIHCxV/VnqR432hmJMZI5MtAC01V246UIy5sBTn4YvOoxvitK0C5nnDIIUvK/yvHt8A5DjadlME5YiLrkllNKo524BYNVYrq9igQtyC67Jce9nx7J1x8wNuueBWJhrHdao1gF1OVOgg78fJ6hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=PIRtgLFT; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="PIRtgLFT"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b94a19fdso2410592f8f.0
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Mar 2026 13:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773435109; x=1774039909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=PIRtgLFT8xsKmThkDrnvqbIMUCzxHmpOnO+onLMloJfPB84kYcVz4hX9SzEoVJQkmY
         lBatNlqeshOqsTgwLIvKHC+9Id5kCUMY+YYjpMm3kK0eRhLC5wfm7b7q/uP1mJgbezT3
         YZOMH2CrVbUyo7oUPs8YnGS4gfvWwqRlo/k1CJ/8iTvhjNyH5Nbu9KX+OBt0TKKZ/I0Z
         cLQdXjrAKKlqzP3J3Ikn9zpjK0BLucIObb3DmrZqdGMmqHvHuqE9zShClAX4TBbXh4XS
         Cm1LapYnNplb5RzbwNgXUxy9jm08s99BDfXKP4L7U1gvzIcPUcCe3103yvTuk3Z9JPFn
         Pyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435109; x=1774039909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=Pl2GwG1X/xCZNghjQozi9vVPlEvTqFbwRL1QvGMnRjvUoJo/liArjYA0GUXO2197fN
         hbcUfKQlS3jvqk1qFUMTfj7XqytRc9YFTPf8GjsQgvme2ComWQLe5jatoaKnnYI3Obyz
         Hy8PxvmdIwybh7QDvn8/t/D+yiVC5F2oijSVMm3lIkooZM2lo9FlNjEc8FATqbP3dteH
         9rD9xvgnUmukZYv4o/35BFM+OgqXqgxdd5ZfloT+9oayEBFs2H+iRZ5CAg1MLZK7+JEd
         IWp9U+6dNEZ74itj18Fce8ZVFSsVyAh0STUlx9zZjK7xfxC3gY/CHnLt6W4yiCRtnOVk
         Yq5g==
X-Forwarded-Encrypted: i=1; AJvYcCX//DGE19tJttZgHVyP59jB2cWEx2lceoSyqbYTh5hu+pu6ATDdIAm1u7OHC0g+3NJZlI1drSAQVe6f/DhXxSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3byeCkA8TZfhX2pYQ+qoct1hQgCT3gDB051qhIAmGf2k/Woey
	j74TohI1P11vrxB1uReUkEAO0JxKmPPSh34T0oi7y2LCG+yEgy93JDUt8r0K4t0YJe4QAv/SpID
	gOjgTdK1NyOTVzLsIUuEhHct8vbvkdOvZ0OhtJgHWzzWkCCfUedW9uVmDho43iuU=
X-Gm-Gg: ATEYQzz2Yx9ef1ifBTbdsp4JJxy0j/QXDTNK+9584Q4Xzu7ACr1aijy/kVcFvnS2KJ6
	nrXCVxrv+wLy9pLfees5kPvIur0tyjAJc6CDeGVjf9UUxB2aE/Nqumbz0SXYb/D3oAT1OmplakV
	zBNL0AZXZkLGqv780hpRe6oQJQKe3ZYhU1nR6vlxTm4GGVATSzDqRfAsaNgDr15DWAf7IMg2HVT
	a4KrsmiIaPzpsUGsP9/zPHDhe+2+K5g2PVsZhZXp9yNqL3JbMTT3rGWvS3W41aBmDwW2TGd/X5i
	4Bzf7Ssjv7IHz8323axXqOCd5BmUVf+sZ6GM4wb0BNhfp7EBblTC6wkwwVE1K2qnVBcfWjT7CWe
	7sM5thoJh55O0Rz9GtZofNArS8mgCght9XOQZDz66z3aswobXsYkLF/tevJJ06TdCZp0RDZoFJg
	0lZ7c58hs+IDb1MSfOnVysdGhVEw5swa4swBPIOTsbnn8Bua4=
X-Received: by 2002:a05:6000:2c06:b0:439:ac6b:dd56 with SMTP id ffacd0b85a97d-43a04dcbad8mr9274022f8f.53.1773435108927;
        Fri, 13 Mar 2026 13:51:48 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:9684:4355:e76d:6ae9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe2273d9sm23120468f8f.34.2026.03.13.13.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 13:51:48 -0700 (PDT)
From: Antonio Quartulli <antonio@openvpn.net>
To: netdev@vger.kernel.org
Cc: ralf@mandelbit.com,
	Antonio Quartulli <antonio@openvpn.net>,
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
Date: Fri, 13 Mar 2026 21:51:31 +0100
Message-ID: <20260313205139.2950-2-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313205139.2950-1-antonio@openvpn.net>
References: <20260313205139.2950-1-antonio@openvpn.net>
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
 tools/testing/selftests/net/ovpn/Makefile   | 16 +++++++++++-----
 tools/testing/selftests/net/ovpn/data64.key |  6 +-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/net/ovpn/Makefile b/tools/testing/selftests/net/ovpn/Makefile
index dbe0388c8512..e59271a25d76 100644
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
-ifeq ($(VAR_LDLIBS),)
-VAR_LDLIBS = -lnl-genl-3 -lnl-3
+NL_LDLIBS = $(shell pkg-config --libs libnl-3.0 libnl-genl-3.0 2>/dev/null)
+ifeq ($(NL_LDLIBS),)
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

