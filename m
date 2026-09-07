Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF544470E
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 10:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775598; cv=none; b=XFGEM5xjc2MceC309Sp1awMOf2sftVpGkINbYxW0k4YD7Ub/IGjRgOehWEyrlSuMs4fd5Xl2axVmDN+FHMLQS813OhBCguMXqaa1RGblNDe9fFg9j/eJZHDrRklzSy+wKcJg2PVSnsDiUO4Z3FUgSyUYhQgfOg6+phX2yZ77mms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775598; c=relaxed/simple;
	bh=cfZlsUNL1tYXf3StIFp8xyHHzkshbzsXgfZAOQaTPHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5HPV7NrdTA4sacB8kq0hO+4p5mikW1JOkK3uUVo+JkJjzfJjqkRY4p8TkC0VmF1wrc/pK5G9d2sIISHcYa1vXUCknn9SOaMNFVO9s6y4kxngXsC5tAKuCF24m8SebSUaWkizYQxDNZQ3QKb5Pcy5Y+pMZm2Hvi2iR4bGJDvkn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=EsWx4Qy7; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="EsWx4Qy7"
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CD4C73F28A
	for <linux-kselftest@vger.kernel.org>; Mon,  7 Sep 2026 10:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788775593;
	bh=dRV5mMHnpzRbNcgwfhh0JIyTTCV6Vk7ZoBlXJcHwHHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EsWx4Qy7wLOIpR+FOd1YtEeCeqv2cICHe0YuX/q5Met9vFX/E2H0WQI8dCqdMoWqg
	 izUzfZ6I9j4DGTlLh7Bze2SENnnGhT089ABN3g12J4eFZJxBq/T0Exr3GiiaYC1mep
	 th8I6jHgVTHUWFcWSp0xKhQjQA+uLoNepCT2k+48ZYgPuoozjG0RPb+2pRJ0vfm7l2
	 V1U1kLww1ZxC/1mBWZFrJXnDsso1y8ZMgb/WnCEOjU62CEXFe8/lvlGhOtS6gyKkmO
	 gHr/Hy7PV8SoAN2+S54SryVG1cUcQD0CEoq7WzxLAuN29reB5NACcXOFgqQAdTCvCB
	 djH7r8IFWjf5WYm4fqx4YgdBKuS4hh/BeGEraja2IXgb1OqF6Nt05uHXkjCvp0AvOJ
	 T0AMIuHYgI6oQ46wNgW+497EHZaDBq8ANpvxk5BokOy4sphc6kQGqJKgSf3YDJzhKR
	 NOh1m7M1rxhubcz3upYoZKKAOwMzG5QPp5UZJ9/HItN1pI8oV9c3L+srKpDu/TdDRc
	 MYko0zdlbnsARwCKvrwk4CwTLN3b97AfGK7d5w/Cee1mRB6ruSsDu50vDyKweIcRsz
	 T2CNnNoS3OJpKm5kHpjj653eIx3jKs6dpUZj9LInsj0l8Gvu5v5Xra7FWmf4RXc4KN
	 uqlNbGmjcmJsURhK3Rx4AWyQ=
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4858e4b3e92so1239393f8f.3
        for <linux-kselftest@vger.kernel.org>; Mon, 07 Sep 2026 03:06:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775593; x=1789380393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRV5mMHnpzRbNcgwfhh0JIyTTCV6Vk7ZoBlXJcHwHHk=;
        b=fiEJvtt/0sHGsMFnE+pTvF8oDg912zEXtZeuF5XM1BHWjcNFQyeSDBZjp4flSr4Cf3
         Y5A33Fzr6T7MBqrHSkCRw0zc1J/+dpcrYJ9e1tzrRGJ0Y8L/cSSD0kDc4BOO6/V9tXOg
         9A/vVYqvDuJzKwsUZ6uxZ15XqsMH76E17d8wLUtltz/JdPHFHpfDUcrrohGqhNaYDE4Q
         4OqGFailB3aka4NqgkKJg4E/f/pk+4R3fWP7MYSqxUC9dbs/mGCSajazDwAk50OR87dB
         Y9tjXRVldB80mb7CwUCdZTpoYDAfEAlvmxqSm6lwGsO9XnZGl2byfb/NKdghOaBd985P
         sc1A==
X-Forwarded-Encrypted: i=1; AKwUvByGBDKfkT7SskEF2am5fSi7dtdBljcsp2kvwfmY7rMJpmbQ8RX2+BQzqt4id2q2D5f+wWnEuPpx2+ajprBtsuY=@vger.kernel.org
X-Gm-Message-State: AFuF++nmWb0YZeoOjds9QTiFYrPZ81z1Mumlz4XayI4i7HZ+wXMeK1/T
	mMNAtMH81r7yRG17pz1j+nzQkME4KpVAM6sHzgcZT1hqjf6lHXhOaX404s7g9egnAGnJ6MhhD4c
	/AEttCtUpsR5XNwyuV50xS4BgWxCplfO9/TQcEai2iMQgmo35MTm0cEUhNVng2NfF4Z4VviFrir
	KhGjG5dm9eVQ==
X-Gm-Gg: AYBFou0sAveIoHeJe11WlbPycSwlYwyVFCttOHNZnUm/fMSfZ+On3OrxqF4FgFUUkts
	AMVVmYPneMRcDpRiF2wm3fYG0O+HMVLIh47Oh78oynmgb4HEpMEA4mo5LE3y3Cc+WRBWxFlgc1/
	W7plJWlIiRMaQoOS3WOeLt7BN+gWB+qMEurKooNGJGYI4JbznceYzbCk6+IBKWKQ11Wnaxje/YQ
	6FspDIth2/0UV+JMLbYXkV9ROJDmQLJaLKr+Qw+HbZ71AVgFBn2ISvSS9CV0BeG02iocCwFqhcv
	UKruqz1FczwzT+41pPo4PVy5Xku/zvQKLASNY7aaWEPG02z15W0nJmlDajyNO8Yt0D9X79QhboP
	+g4icFRHM3zSCymz97w/NOIDqTVOZuT+nPhWrRNJVGFbwP6MLDXU0Cv2y1pVhYtGqJnVSJA==
X-Received: by 2002:a05:6000:388:b0:485:8c75:48fb with SMTP id ffacd0b85a97d-4858c75598cmr17163971f8f.50.1788775593443;
        Mon, 07 Sep 2026 03:06:33 -0700 (PDT)
X-Received: by 2002:a05:6000:388:b0:485:8c75:48fb with SMTP id ffacd0b85a97d-4858c75598cmr17163935f8f.50.1788775592991;
        Mon, 07 Sep 2026 03:06:32 -0700 (PDT)
Received: from localhost (93-40-94-241.ip38.fastwebnet.it. [93.40.94.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm27574871f8f.1.2026.09.07.03.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:06:32 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] selftests/net: skip srv6_end_dt[4/6]_l3vpn_test.sh if vrftable not available
Date: Mon,  7 Sep 2026 12:06:31 +0200
Message-ID: <20260907100631.1923148-1-alessio.faina@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case iproute2 is older than version 5.11.0, released ~Feb 23, 2021,
the vrftable support is not available and the tests
contained in the following 2 test files
 - srv6_end_dt4_l3vpn_test.sh
 - srv6_end_dt6_l3vpn_test.sh
are failing in some kernel backports.
This is the result of one of those tests in an unsupported environment:

 ##########################################################################
 TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
 ##########################################################################

    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)    [FAIL]

    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)    [FAIL]

    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)    [FAIL]

    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)    [FAIL]

The test installs a route with the vrftable feature; if this feature is
not available, the approach taken is to skip the test rather than
failing it.

Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
---
v3: - Fix Commit message and mail subject
v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260903103545.1325276-1-alessio.faina@canonical.com/
    - remove dx[4/6] tests
    - test if vrftable is available in the installed iproute2
      application
v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260824091537.2305107-1-alessio.faina@canonical.com/
    - initial approach by testing DT[4/6] and DX[4/6]
    - test if DT4/DT6 are available in iproute2

 ./tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh  | 21 +++++++++++++++++++
 ./tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh  | 21 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
index a649dba3cb77..037e5fe1da2a 100755
--- a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
@@ -469,12 +469,33 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip()
+{
+	local nsname
+
+	setup_ns nsname
+	ip netns exec "${nsname}" sh -c "echo 1 > /proc/sys/net/vrf/strict_mode"
+	ip -netns "${nsname}" link add vrf-100 type vrf table 100
+	ip -netns "${nsname}" link set vrf-100 up
+
+	if ! ip -netns "${nsname}" -6 route add fc00::1/128 \
+			encap seg6local action End.DT4 vrftable 100 dev vrf-100 2>/dev/null; then
+		cleanup_ns "${nsname}"
+		echo "SKIP: SRv6 End.DT4 vrftable not supported"
+		exit "${ksft_skip}"
+	fi
+
+	cleanup_ns "${nsname}"
+}
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
         exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
diff --git a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
index e408406d8489..9a29e0d6c912 100755
--- a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
@@ -479,12 +479,33 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip()
+{
+	local nsname
+
+	setup_ns nsname
+	ip netns exec "${nsname}" sh -c "echo 1 > /proc/sys/net/vrf/strict_mode"
+	ip -netns "${nsname}" link add vrf-100 type vrf table 100
+	ip -netns "${nsname}" link set vrf-100 up
+
+	if ! ip -netns "${nsname}" -6 route add fc00::1/128 \
+			encap seg6local action End.DT6 vrftable 100 dev vrf-100 2>/dev/null; then
+		cleanup_ns "${nsname}"
+		echo "SKIP: SRv6 End.DT6 vrftable not supported"
+		exit "${ksft_skip}"
+	fi
+
+	cleanup_ns "${nsname}"
+}
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
         exit $ksft_skip
 fi
 
+test_vrftable_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
-- 
2.43.0

