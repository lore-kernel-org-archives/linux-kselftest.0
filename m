Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C6468C28
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786140609; cv=none; b=hAy+NxJ8AxRXxS8Q/2P8StNwi66GwxcT2UvhZMyAbIGcP0IsJPts+dyqKoPxXoL8sJ16nMBc8TSgotelKxPbEU/snLoVLvttX76QxUpZFzkuu08Aym9jGlPvckBSKTyCGXhg6QGaCBXdwgCK9I7KmU9y5r/CG2Rpuvw8V8mveYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786140609; c=relaxed/simple;
	bh=yrKxam1mAG3nYRnHckVi5zYwUOS6b+SZe0OPFHhASsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P120PcW9F00y9YTgkHYH1h75SegPqeYTDIth87ZLkXOpRjsKYwK2p1OVGEhoxzMboFBkIIbWtCCbTTXfoLIWjqpNEmqZSxYP2EWyTOiPs198zAjcqlDelVW86XwhLnssxn3TrNKltprGdARv0FKJFlx1mQnb/XWnsN5eZDHFc/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOCrL47+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOCrL47+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cab973140bso1199995ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 15:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786140606; x=1786745406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VyWHUTu1TvU3eL62Q6jwzEcXDxMtIPq0Po9Uu+hdpt8=;
        b=hOCrL47+IIu1e36eWx3T+TwxitHvaTaSJAIbMMTcoZmkU50btaHR7FSFjNyjOvbVkw
         gtRck0M6kwES4P1S978uXxaYu4ZtPgVY7DLhSatFymjptZTb9Ayrbi9VddhF2DRAmzJN
         EN+KowU8zTkeASDREGB9KuH5Th2vloWC1gkOsloqdmz2NmYGGX5dQyp4vQVo7i0B7yF5
         uK0plgyEv5AjZ7vTuu56O1z/tjTjnEYHZ/NhRkALGKE/mHlPpspOJiwfX2CILgmmhrIv
         Z9g/9YkIlv3mo6phdH/y4q+J8K6xfHKBOR5niA450kFmvql9vM7OLZ9eGLXDRm/Nbe3y
         22OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786140606; x=1786745406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VyWHUTu1TvU3eL62Q6jwzEcXDxMtIPq0Po9Uu+hdpt8=;
        b=AqRE60nx0OwR2caUc7qdR15vS8xHb3LAjb35p2qBV7kvMw42txe+6/UhTrMozZDWrp
         UfhztwK++hH8XSoQIcgntZIiA3HNPza4mo2CtxOa2eoDJryidU76xiMr1jkJ4IwLkXSN
         NIY7X/Vjzdr8M/xKFJONiTKb/nVHv4lojAuF9Px8zbeYZgFOA3EthuRT88uBhHyxP/mV
         y5KuGnIUz24X4ZczEOPqkh9DGHI8+wFh91CKEGaZYKCrKG0AUDRVdOHNALIZUnXYy9jv
         FksjvqalLCAuRoVfh+SBmgkcC/qORlxjgTr5UGe/XYWDFTbOaZtIXv6C7LHpOaoCgQm3
         Zm+w==
X-Forwarded-Encrypted: i=1; AHgh+RqKxIVUviQ2qVhbCTol2mg7Mp0FJBRY84JnEIrR4SzTb+PuihK6vmG1cWAh3in3XNtmIm1nw/rrA8Km08T1wLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/61mYhdiJzxfUkxhZcUfaqr09s4Jp8u27oZP+XAVbDZ6LTm91
	aQj6VFVeCWdPhoQj+8afokkT2mPrBY2LaOwMw0tt9rZkHnd9wB/LYEbY
X-Gm-Gg: AR+sD13IfS5BB4thIb6sSbVGSfboTp7lPdnHcDmu5UOcCoOhWw506IkhSd3PpQCIRKb
	P/GFS/LqwfONLp2b6NnC90vlNu+RH8NDfVlxEQArwsdSbW7GAuH/z/VumJOkCm22W1cGOXhWHyO
	0lwIml4NuRphztzpheoMvMsrPkN0I3vAsagNEgoZVvyRAQlsczXP9nPBqz1cKM0ZqoEU29/lI0n
	NIAQdm+1iQrkdmARLRPSN0PJM4EH97MEihQxzJ4cXDS14l4tovSa2sv1fiJhDqeOp8Vpho4Z1Ex
	q3qd3krUCeHDIgZp3h8uCVKJiPVcPU2DK1MUK5WtI9y0F6uGScM7JSW3a75UmsCDQYeyqgAsnRf
	GKkoYMlJ9MYP2O0FCDwBG6mtAq9ujCv0GOdQeKxUkSP/0vY4pj5JaPdALsLi3tcQXjLe2o+XUB5
	hWsxJgx4/057eeczPXx8JaMR7+wwEcWkI/eVln5Vynn6aFpXpyOb6K4dnxP9wXEvXNhA==
X-Received: by 2002:a17:902:ced0:b0:2c9:cb1b:64d6 with SMTP id d9443c01a7336-2d2a8e9ded1mr49060655ad.19.1786140606491;
        Fri, 07 Aug 2026 15:10:06 -0700 (PDT)
Received: from fedora ([2804:1b3:a8c3:8ee5:1c39:64d9:e257:73dc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be568bd3sm11182762eec.0.2026.08.07.15.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 15:10:06 -0700 (PDT)
From: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
Subject: [PATCH net-next v3 3/5] selftests: net: create own netns in ipv6_flowlabel_mgr
Date: Fri,  7 Aug 2026 19:09:40 -0300
Message-ID: <20260807220942.421382-4-marcelomspessoto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807220942.421382-1-marcelomspessoto@gmail.com>
References: <20260807220942.421382-1-marcelomspessoto@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Have ipv6_flowlabel_mgr create and configure its own network
namespace (unshare(CLONE_NEWNET) + bring up lo), the same way
ipv6_fragmentation.c and icmp_rfc4884.c already do, instead of
relying on the in_netns.sh wrapper script.

The setup can then be reused across tests through fixtures and
provide isolated network environments for each test in the case
of a future adoption of kselftest_harness.

It also avoids the leak of modifications to the netns in case the
user runs the test file directly, outside the wrapper and without
the in_netns.sh file.

Signed-off-by: Marcelo Mendes Spessoto Junior <marcelomspessoto@gmail.com>
---
 tools/testing/selftests/net/ipv6_flowlabel.sh |  2 +-
 .../selftests/net/ipv6_flowlabel_mgr.c        | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/ipv6_flowlabel.sh b/tools/testing/selftests/net/ipv6_flowlabel.sh
index cee95e252bee..2eeda39bf64c 100755
--- a/tools/testing/selftests/net/ipv6_flowlabel.sh
+++ b/tools/testing/selftests/net/ipv6_flowlabel.sh
@@ -8,7 +8,7 @@
 set -e
 
 echo "TEST management"
-./in_netns.sh ./ipv6_flowlabel_mgr
+./ipv6_flowlabel_mgr
 
 echo "TEST datapath"
 ./in_netns.sh \
diff --git a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
index 51541e792257..f8d8b09b9d86 100644
--- a/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
+++ b/tools/testing/selftests/net/ipv6_flowlabel_mgr.c
@@ -8,11 +8,14 @@
 #include <errno.h>
 #include <limits.h>
 #include <linux/in6.h>
+#include <net/if.h>
+#include <sched.h>
 #include <stdbool.h>
 #include <stdio.h>
 #include <stdint.h>
 #include <stdlib.h>
 #include <string.h>
+#include <sys/ioctl.h>
 #include <sys/socket.h>
 #include <sys/stat.h>
 #include <sys/time.h>
@@ -306,6 +309,30 @@ static void run_tests(int fd)
 	}
 }
 
+static void setup(void)
+{
+	struct ifreq ifr = {
+		.ifr_name = "lo"
+	};
+	int ctl;
+
+	if (unshare(CLONE_NEWNET))
+		error(1, errno, "unshare");
+
+	ctl = socket(AF_LOCAL, SOCK_STREAM, 0);
+	if (ctl == -1)
+		error(1, errno, "socket");
+
+	if (ioctl(ctl, SIOCGIFFLAGS, &ifr))
+		error(1, errno, "ioctl SIOCGIFFLAGS");
+	ifr.ifr_flags |= IFF_UP;
+	if (ioctl(ctl, SIOCSIFFLAGS, &ifr))
+		error(1, errno, "ioctl: bring lo up");
+
+	if (close(ctl))
+		error(1, errno, "close");
+}
+
 static void parse_opts(int argc, char **argv)
 {
 	int c;
@@ -329,6 +356,7 @@ int main(int argc, char **argv)
 	int fd;
 
 	parse_opts(argc, argv);
+	setup();
 
 	fd = socket(PF_INET6, SOCK_DGRAM, 0);
 	if (fd == -1)
-- 
2.55.0

