Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69492FD1CA
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773154231; cv=none; b=mw6+a7GdnHxVcySxMehiI5r1ZQBgiwI3qXTrpKv5cctUOD3W8POb7YXatKdsQis1ktuKJhROWfIsRgfEG1v69vPWEXGQpGL3js9bsB+uOhA4u3ThMj5NkoQqCPEhSBLkQctgwcnx6+EMPiKbWhTjvu0Pby4LwUQQ/elI3aRqBbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773154231; c=relaxed/simple;
	bh=ORVIj64W7VWD/p2asQ9JCzIMDvSQTNmZHqK+BXBHmx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ogd5QZ3gl/rlmRkEWQJMY0SECfHNugok4x3w3XA/vh+kHBYwfyYGnJr6RMp2KNHD68xXSffAxcnfSODLVFidkvaPZJBDppkKZXSwrRG4pW6Id8BDy7yWQ+6xQ/BKXsLZybVdaGd2DJpj0Lq0p3HhgL8KOMAUhpY+fhgDEXKnfLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=ZAa9pQQe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="ZAa9pQQe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c56e822eso7503684f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 07:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773154228; x=1773759028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=ZAa9pQQe5Kivh7tmtbEAL3boM2fb9qH8oZTXvZUV6WUyMGkx9Ztg2Lg0VVco4T7bgt
         kSO4+SYZ5rYRFUkppSx3p9i/OLv/YBwMxtSDqb4ZvgOfBmVgfV1VcGRDA15Njy/el49O
         2paHpYB+PBnFv4qqYC4spxA/hd6qG5/uwm3QUYh8znzmDV+4R4ZyXfnxk8TgW7w8SiCE
         xFZ042ag01viwHtis5tGU59n3oF5i+sC7LStWNADTfHEp4QAM/IZ0ge4ByfePP3xvRat
         qwND1NljyIyCNUE5UiSy5pp8ZhbrKN1qnldPWqebmKihaQt/oVb0NmK+KvDUePpP/eeV
         4qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773154228; x=1773759028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=Os9SJm1ljySmJCKUArWgdOFN8x+lZV1XnPu4LX8v9VIxWwHGAI82dkBUPEosVEpAMO
         33LccRqKmeZSbNCDABewKnLShb2SPAwsLx5A76e5uhW6v/C6/qOAMIJ32vq4/m3UMHks
         8Pt7r2VrNRE4FnK+y05H+BJogn9ezX1b967sv1YZlMhIbth0XJS+OiXtaUllXkmbSgV+
         FUwi/m5RhXs6NBaRoEIPKSFiRnpHdRJ5+wi4ef0zR8C05q8pTuhcYwqcOD31sN8O3rn5
         bchy/TjYgFpiaTYF8GvXbbBNdJSUgaVj3zbZ1vUqCloaEPgSFgnHmp/PrA7bsvQbuptI
         +wuw==
X-Forwarded-Encrypted: i=1; AJvYcCVDXAd2Uvx1lJNvgcD4cEJ20+DgrKirf9uERsuqaNEbSNVdxoprPHPS2mZ+JbLgHuo15yOjqM3x2ZQaTI7YOnY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DOD0sArfdodJPsd0qxCKzSb9HpyYKytDvSUlTEIp8+govEtj
	swvXWAomfhxSmljKoFtkiVmk7e60wUF47q7Sbzz+JB/haUgrHtnJPPyWV4ApDWesPC61sjN0lPd
	XLkSrLPYfi9FuvA36Wg9SMn+wdtCd6F4ul6v7y/CsbEMDekN9tTCQfv38VFIV+6o=
X-Gm-Gg: ATEYQzxMVVqGBqyoSUt37lVwVirJBVgxWvnTt7ljQVt4AxMnzbnjMd3YfQQKIH6QRo1
	i6PcHetRbroqeh2JNEONa8HM20N5sEorQyoerPGYraWkVv5d3wwwVLxExnK+MTIa58vtbmHaPkI
	Iw+qGsUfY8OYm8MtnBoo8aRHn61qWsGW8CFsM02EjvHe1tzuJBSMCys9nPf1pg5sLWf/bIUeEe0
	wOimk+tAPpJ/S5dhryNM1ni7a7yMfTHdmsCjtW50S3N3NfHZ5NSgccq8aWb6KivNBMwP0UEhatb
	TEiPZfm69oF3TY5fZxB9OXLqZAk/XzpmRraeLcUG2cL9aFGxyYKKq582PUYiKlaxlPS5Ybh7bTC
	Sj44NrDcHTqqKLUIveiDjbSm8ei8Io0YowmL0OFDM0Tol3RDLkLgto+TQ6L3Db427Dt9Dbq+ucx
	+Mnne2tswJBOCn7jztST1DiQlC8wS7/3ELpYxD
X-Received: by 2002:a05:6000:26cf:b0:439:c2b6:d5d8 with SMTP id ffacd0b85a97d-439da880b53mr27710812f8f.36.1773154227914;
        Tue, 10 Mar 2026 07:50:27 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:5594:94ef:1bd6:89e8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35586700f8f.6.2026.03.10.07.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 07:50:27 -0700 (PDT)
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
Date: Tue, 10 Mar 2026 15:49:58 +0100
Message-ID: <20260310145006.30858-2-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260310145006.30858-1-antonio@openvpn.net>
References: <20260310145006.30858-1-antonio@openvpn.net>
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

