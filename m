Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330C6242D9D
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524472; cv=none; b=hl6R0hzD09V8EvbmGIfVnQGFEZtX6gADJGE/cQrAVxmmX7YDOTEI0FHxMRw6GgBsulgenBpa2DLsSSV2xE03hfGilgArAC9SD6Fya72T+Mf+8J5cWMbNUIwDaOq5xrVeo20Yj+vN5o655yaUsKHphAMFZSOknLX2kdlnv0YKEd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524472; c=relaxed/simple;
	bh=6jHqdZXH2o25X4C8Qo1lrHLPG4nFtCmtPQ4a4mwT6EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YPEfKUeByxl8qqHs2NdNYiP+38zHtysE28LAPPm062iM7KjYawyRGFDglLqI/m1P9VLLaehu5IO0jyhntZ9x1VYoPct+NS+spDvaHBYT5h35vOtn3Q3DphEngz3b6AgPXikk7M48A0DULSlO8VX+tblP7Da623fMeb0W5BBvVeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=LVH2xcyX; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="LVH2xcyX"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4B8F93F581
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 15:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783524467;
	bh=zlcM7dYOWNF3Lzm/T73XtTla6vOUEX6Hfc1lNEV//wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=LVH2xcyX0NZCOQz406/bopsTwmweFHcKRlCgzuDnV+fDEIJzWnY/r7DMtgTBdLnZX
	 x6wbOWp5OFBllBbFlyVEmkbHqUZvy8D332B/0yiWnsvqKaAaYvZw+7cqj9cjOPK8V0
	 6OgL1yq06hSULyhSiOveD51KJu+mbLYygPuE7lPEFzOTpXoWCqz941QtAW2XUrcpk9
	 0SdnVBbhsIPWJ897KLcP0mkARLmFr2OVjej1wrOU58561QZpbHeO9LrgS512UQh8QH
	 ys+6Sk7sQbYL6onCdPhS/CoNu4Wv18wrsu57MYKTf6t1lByIU9/+J9MRjuwsi8Q78i
	 UzPMFK0yuAARy9Y4nAn/+IxSwuUYdKRqQXvS3+1I84afMwqntnQgtmAVSVAUXCXs8x
	 R9W5W6VOKnn6GuhOMwzWpxJPP1iWJQl2M4HgwV9YBaAVrwimbNu0l9hOm6j/ScD0U3
	 U3Obp7wbCpVPPJ+T7r5FJJx5VhkijtcpHWeluh7s6N+AuqzJ05WLIKFZo2dViPimGF
	 F1UvPJ4skidwdRwo4+RvC4U0tziPLlNEZ/K/uGyH31wZuxPADVxY66oWTUjis2Qcsm
	 Ww0XDOL2cB65+FSllWHKKTjm3x0ToxrCTg0J/3fzthnk+Nu233964Jn24CKBtS5FzE
	 ck8YRfojoU6l/lMHXHnN3m1g=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493ae2a6a72so7929145e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 08:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524467; x=1784129267;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zlcM7dYOWNF3Lzm/T73XtTla6vOUEX6Hfc1lNEV//wM=;
        b=ehD3eG+ZTtE8Ecru7BZ7bLGz8wZz2HB8lj0f6YVmeeZ1XdqCMXMAOOVPHNQY79Kwce
         OiYoY19QjDMlLWmyY8wkoBjfW4ls9e0onJxwmbiCvaZSogkbz5ARKtCxEnYtMAfhg0fx
         ZcHApvaTJ87CvTNbuJYVMmHeCCVOADOfHT5rukq/I3Wqh3P52pGk90cZwmK8vTcKNMtT
         QUmt8rrZoO2nLZk1JO2cAfjj8J492ysbA+dgGpjknbpENocOaVSd1kQgG8Soj3dWA+xs
         Eol0xmpIm+MTh57VAv8zXUO4ZRwRqFmaFJkVlau1FRmFN6vddV423+Q0QVSrI0xKN99M
         WSDg==
X-Forwarded-Encrypted: i=1; AHgh+RqaTX8eELFBvvRbo3g8uTnQPeqDO0XamUd231Ur+cHYwsTj05EfMkY+h3DhmOl6Ar+/+s53/Nv03NLJhRsBBBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbPhkHszg+JXZY56nrU2Wh9tRC7j9RMvsIlqJqy91Q2iNMyYLm
	/NnpigpGTPE1X3ClhmUn6hHHLIujfIxFI3fu87RWRtIwwqKKkuxSuVrsWWw5p5FrJ1ETel3hiYD
	ACugUao8krIQDeSCYK855CQNottEMgFR5GG6FI/roU75e9L1K63Dh42/jtoZGOiPfaPZd4IpEG1
	stCmVpjLF2BQ==
X-Gm-Gg: AfdE7clJkN/Gs0zrzy/rykCyPIB8k4aqLWcoCIOU/B3+ij/r9627oJYqEhOsIcwJNk/
	hlSCixeG2Vh0Kpf3SS7vM5AMLicJHOHz7X7MKC46QHqUvwbbZ18gnzE5/Rtl5FTV4EDchCb3wO7
	cx3EutElOTHgm0GxP2kvjL2KQ0CA/0Jb47HIIBMmVIG580DfPUg+x3F2ByE9lQgz+PA8kgh64zt
	p8SKhEDTOM00p5Q0Vc1jkaDZnjcVziv/+w4eGnD8d9OE7i/H+x7sfTW6tnCTewiYM1Lq4ua1cK3
	Ck/NNfQwGd/wJGAev6cGV2yElMB1YGUVSaKtHeQupni3jnlZHpksxnffGktuHD3L0UmfrDLQY9r
	tpc5hWsg3SSaLE1HQLSrzVjjXvYHUmSsV8mBHHOoBY9UBvVpMxT5h/XQBan0ORd2sFaYm9hDVYf
	i88C1b/Q==
X-Received: by 2002:a05:600c:204c:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493e68eff16mr19928285e9.35.1783524466882;
        Wed, 08 Jul 2026 08:27:46 -0700 (PDT)
X-Received: by 2002:a05:600c:204c:b0:493:c453:6002 with SMTP id 5b1f17b1804b1-493e68eff16mr19927945e9.35.1783524466471;
        Wed, 08 Jul 2026 08:27:46 -0700 (PDT)
Received: from localhost (93-40-86-183.ip38.fastwebnet.it. [93.40.86.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faee30sm125274565e9.10.2026.07.08.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:27:46 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: Alessio Faina <alessio.faina@canonical.com>,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next] selftests/net: Skip srv6_end_dt46_l3vpn_test::host_vpn_tests if iproute2 too old
Date: Wed,  8 Jul 2026 17:27:45 +0200
Message-ID: <20260708152745.2430714-1-alessio.faina@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
the End.DT46 support is not available and the host_vpn_tests test contained
in the srv6_end_dt46_l3vpn_test.sh file is failing in some kernel backports.
This is the result of those tests:

################################################################################
TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
################################################################################

    TEST: IPv6 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]

    TEST: IPv4 Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)  [ FAIL ]

    TEST: IPv6 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]

    TEST: IPv4 Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)  [ FAIL ]

    TEST: IPv6 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]

    TEST: IPv4 Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)  [ FAIL ]

    TEST: IPv6 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]

    TEST: IPv4 Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)  [ FAIL ]

To amend this, check the current running iproute2 supports the required
feature and, if not, just skip the test to avoid a failure.


Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
---
 .../selftests/net/srv6_end_dt46_l3vpn_test.sh       | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
index a5e959a080bb..406c6a3d253e 100755
--- a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
@@ -510,12 +510,15 @@ host2gateway_tests()
 host_vpn_tests()
 {
 	log_section "SRv6 VPN connectivity test among hosts in the same tenant"
+	if ip route add help 2>&1 | grep -q -i End.DT46; then
+		check_and_log_hs_connectivity 1 2 100
+		check_and_log_hs_connectivity 2 1 100
 
-	check_and_log_hs_connectivity 1 2 100
-	check_and_log_hs_connectivity 2 1 100
-
-	check_and_log_hs_connectivity 3 4 200
-	check_and_log_hs_connectivity 4 3 200
+		check_and_log_hs_connectivity 3 4 200
+		check_and_log_hs_connectivity 4 3 200
+	else
+		echo "SKIP: SRv6 End.DT46 is unsupported by the installed iproute2 version"
+	fi
 }
 
 host_vpn_isolation_tests()
-- 
2.43.0

