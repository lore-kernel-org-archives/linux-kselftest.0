Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A80D372B2D
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773744035; cv=none; b=B9T91+EuBWeTTduTZerA5I3hcGr7l+0sGQyeheemXCwRonEoPeW/Nvcs445f9ZzPKW6luyoVxqb0Yfs6cdypv6IKBmJgxTlBmu0hN82e5cjXbm/QdHy7P6QRN0B5AvVZLgpvNjbY6Tj9E6tSmBMyCUg6bScYjUsgVY7XLjeEcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773744035; c=relaxed/simple;
	bh=ORVIj64W7VWD/p2asQ9JCzIMDvSQTNmZHqK+BXBHmx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MtQsmY556RTS5mambHQigUaJBr/kUxICIxczPCftNv4MzdHZackOQkaWYi1fA+ICWj3479wLtsAEoJKq8kwlGkTW4Xh1RL7x97QVSg2/J3Snjee8TiCdj5pH9oJ+V7/5a3uvof4PL6HEyf5kGyO9o7iPOyVNI5PISM0JFkaxvZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=dQvsFc0O; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="dQvsFc0O"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48540355459so53519875e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 03:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1773744032; x=1774348832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=dQvsFc0OAhzSAznJ3mXUTR2qotQvKKKAX5ry1lYeRHkT5zC7f8tG0SBMTYig+Wx3JO
         5l2DzKm/W7TJ+SV81JwnQDyxKfR0sJcLpEAMENqnJn6pPKDzikujxJChDbH3zYTUAK/t
         ddCYlMLSxhB0iHAFY8pEUWFDszBs8VV9HXvId+qbmIB25pBiay4bI3OP/7U7wtFv6/YV
         EfixbfEWQcNvZEmi6bvbVoIOYqfyC+l+3ccT89Ff6KQxdjKX0qlxcC0zM4tF5q4ToqP6
         SqNHGe9aqrlihkEWZWSJFOSgLONAdE71J0Vogw7oC3VEdyF0R0OHgU65TrUCGVGzJ68/
         JzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773744032; x=1774348832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iU21nHtfc0uUOnrIqrZQvQlu0yPBD1nd/T9GGkWWTvg=;
        b=MBwi73dyMJgS8pMd3j7Pr2sYwZ7E0LgrJYnD9GIR60XVanQX1JcBxIPj6Nk4vGB0aZ
         3W11Nnm080xIwSCxk/JYcuN19V0fghIHVH3tYr02FBvy9RLumx4UmAxgqaWlJ31lBxDd
         MeM5BRlyeF8Bd6+/2uBMsDO0Mz8v+Ce70s5GcWEwSdgrgPAEpPIFQ4pDT6FSaB+DvofR
         wgeIvNQ9mNtSpe8+/DYFCdWXzzI17qpF7HU1iRY7Rs5IBxnCdtVXoLXxceOjsLrwcy4a
         fEG/LFvUYvVmVDQR7k3b5jz26qVLaMxeFYH2pspvyygWgZz6Q2F7zrkKIsXvPx8dUTKv
         87Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW0bWGDL3dypOQsy1NHodquNWOW6VO1tZ58e3HfT0J7x2DJ9rLQrqCRDlYOnTBFNFLjj/ma9cWvMrtjn/LFi5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGc7uBvG9GdJJU+AWweMNUhR4O/u2aj9ByGNcEy+nUytDL39Ib
	OMw8guGnr8rfp38nj46pdwBi9h3lbg3xHOQO9P14WLdQdhCjXVj6IKLAeHXP6Fj9T+au/k4AZoi
	3gIGimjf4atmcMgFc0H9NTfNWZNX574Gk6xYFm0rgqTeVdDhNqlR2Fu9w2DAWbEQ=
X-Gm-Gg: ATEYQzxmTqmbnZP149JTCvdUX9i5Lw/V/yGaBsVoAwb7VtKmUzRyt11GYmq7YZy62mH
	S/WFvAOI3LtZOah3Tz6m+fWX3BIrLXJ4MQx02nj/AqRr8+X1dPCanwAnqkJej5QHyzlsnU/PYW5
	uuH5tmVILoFqUu2za70s5TuISV6gHfb19rdBBR08dKJ+lPhoNx+4k0s1L1EL40nBa7R9L7Z/s5A
	vYy1qIyz86IE1ZoLkq+hSYXHTcES9vCd1C0bC85Kc82N7af08rP7T6AnXOsoTiUJVkZAzQewlzr
	kUe8xe8ou3mFTLntdIIL3tCZKUyaykhsUo7zrYjx78xHj8FEjiPKR/eidOcyjHF0n/U68/FlFcf
	CAvXx56oVpBFq8MWTi2fLirTDi4x2Ye9pcmy3Cpo1HTaQ/lDBtkreWnKbj4VZmr0vS/X9L6oQHI
	av36w6SWh8SgJ65JVoJQCD8YUDd3V0LTyKKbQ=
X-Received: by 2002:a05:6000:2c0e:b0:43b:50bd:bca3 with SMTP id ffacd0b85a97d-43b50bdbf28mr326844f8f.1.1773744029306;
        Tue, 17 Mar 2026 03:40:29 -0700 (PDT)
Received: from inifinity.mandelbit.com ([2001:67c:2fbc:1:4f22:3f9:13dd:cf23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe22529csm49948215f8f.31.2026.03.17.03.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 03:40:28 -0700 (PDT)
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
Date: Tue, 17 Mar 2026 11:40:15 +0100
Message-ID: <20260317104023.192548-2-antonio@openvpn.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317104023.192548-1-antonio@openvpn.net>
References: <20260317104023.192548-1-antonio@openvpn.net>
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

