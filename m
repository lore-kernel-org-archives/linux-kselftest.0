Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0F836655D
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 09:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563470; cv=none; b=bFQxgQAnj4viPJcIjQU82UtBBOPSQrjD1xqDbnCTHX42QyDqd1bl4N81ynHe7K/aWniQOK98lOHmHpKX/CGb0fC0SXknTGX7CTHtRT0McpEvpKuqbZYN645OMHgsULKvMrbxxhlVLjhd8seoJtCsj3SWo9YE78zaqWaglN14hgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563470; c=relaxed/simple;
	bh=glIC1ZxSgnporKEqk0P9X3+qnWnniHR0mNk8u32ZWuo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+lV6Nn3Dwv/mZ0r1UacHUlSijxX7lM3oHo7E6JVTmOzG4lIhi7V4zuCmw2h+CLIHXpifc2llR5jfymJiGcTDFWOWpgP7E/ooNdrQ5TiSAWYbJoCbOEE5fHl7o/35FVbpUGI64hXcpES6yUpeg2p2rHSa1H5222xb8PiyckpDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=ow4ynSHF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="ow4ynSHF"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 96FF13F527
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 09:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1787562939;
	bh=WQ+aRLKtwY9E9tSqjzNnQJgEiQ6M2utL7hS1aThd0J0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ow4ynSHFHA01cku76veJZQpT2p8niTmov0Ll2KmpaZCeyx1JmMinev0Fa76l0tV/v
	 jD0YZcOAd8+j0ERvRMfCP8kHoksVIm4mSmxEuNPrWy6lkpsrHtk9fIzaJeRdxDgGoo
	 nJYcTuof3iWXzl/TDpfjKCd49uZ8iywSqCaByHw4Sb4WCm5+EmfxCyUwtEc5AuM9Pp
	 8yrW3lL46f4qpCXfmiTTXPIWfn730Omeb3jy5Y9ZeZgg+M4z/VYhVncSx9S0zEgqGG
	 6BBZBoUT85YE4JLMDxtXiksaxCbK/iG1RpfcU9wSR9D86GNIFyS6cWWKD95KQU/70Y
	 BctdSeswsLWImMjhJR/I8QZHa/CkNyu3fJspu8sgl/+d5/1Lq7y08siv9O2wKuD4Uu
	 NwU4wJ5LW4NqUQy+lbtBHRrHgJ4sDzvojWNAksXDx3nksnVJSpZU0qZULLNqJhi2/k
	 7HBH0PiVjiiJFnXXRyMj/TUOIMO+PYXbJ14IMERjmMyHk8f0rrGvYyFNgu9XBEYzFS
	 /h2ZJyyQV9o+DBzJc+y/gxSHhW/z0PbcCjk+ALufCFDmkSfIXTnfuGyurWaaa2/HnR
	 eTEnnVQWhLKyiSnPPdZ5ooHdDpGi0LyG//kB+HqCN4d6ckJFQ9XvegqDk3ZV5h2I41
	 v32MWCCu3oEGMD9bpyExhYJQ=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c2192261d79so373647066b.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 02:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562939; x=1788167739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WQ+aRLKtwY9E9tSqjzNnQJgEiQ6M2utL7hS1aThd0J0=;
        b=aWS6slVWZWhIhw07aWcaprMRAeG54SfQCEM5gVFf9YqLJClQDQ6uj2VH1zSW5olCEr
         sYpRrcbyuVfrCgmI9zOiXiXsPHAc62K1n2Vb1pJTMd9I6XZ99BKzTRgr1dp0rJyN53V6
         wCpm48yZsSH9iMxWl+fhXw97e8tH/DOITgO5xfVxK352/ozewxFndK0kUGkWbAN8pAf6
         Zn7YOKv0Lsn2ZIwshY8RApkqQABC7k+bQngruy5PCdwrwjMgrtF4D4Ml6f7y28PXEdPh
         +B6/68HKUuNtZ8OBU6Pi3Br1HanCQEM11mgjJeXAvgvWG4+L9cBxclPcIzobCEi6kf7X
         NHdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr1pljFfLJouHWKRgvUEqYqmRp3ons1t22CKkpkBtFAwJuLyg9kJHLwP6azlDcGbeqfRKNlMmuAS01iTlG9Dvc=@vger.kernel.org
X-Gm-Message-State: AFuF++kc+q9oZ1+mG3LaI+zH6cbztd7lQ942C4VKv2v1cA60h483JD7R
	Fy6cOfzSpNGS0wd2axRlkiiIMDE+l/12A1cKaXEmdDwjUOo8QRQH2iZ6RiIzmIGO3DR1e4acOwo
	nRziFHbKglL0I5vlUmCTQGR0q1s72ZfwhPagxqZjMBzkVl9mRA0OKOo958njSeJrWeaOc0bkdJ5
	AzOqHIaKS+UA==
X-Gm-Gg: AR+sD12SjLR3AL1rTKN8HR0TaVHUrGN7xZU83jd3qLmQahpuVP02Z8jcVN3Od2R8FDK
	IfKK3DQ9wpEn4z9fQj9iNk8Z3lcJp/THdpyazOJH5L+Z/WSm9DFpatoV47+cHj6XKRfQO7F2KeX
	hhpxeVmmcUG4Azbk2s5ep4kYWiF9SaHW7r0m05FJeAOI+kF69QEiQhXyi/9bCcwxAIL+WRrQwhy
	tt8Qw9nL1C7oMncgpvQBEjmfWdmselcKsRhreTsTGQgffQHB/0MlvQVLOZQdp5TrFgaIO78GIvd
	ywpof2NIMCzU1THjH0X4Aw03/WDYHYKla240+dspDsNEabZyFt3bSECe9FA0Y6djXn1x2eM6CB1
	M4fu7r2iO70pp4GI/WGVIjnOsTwvawkLk+gv44rV7HN2AY+zxvcAg1HXyMbOo38cuyLtTozQ=
X-Received: by 2002:a17:907:d12:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c2482b93766mr2664074966b.17.1787562939177;
        Mon, 24 Aug 2026 02:15:39 -0700 (PDT)
X-Received: by 2002:a17:907:d12:b0:c24:82b9:361c with SMTP id a640c23a62f3a-c2482b93766mr2664070766b.17.1787562938790;
        Mon, 24 Aug 2026 02:15:38 -0700 (PDT)
Received: from localhost (93-40-83-165.ip37.fastwebnet.it. [93.40.83.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm1198078766b.0.2026.08.24.02.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:15:38 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: andrea.mayer@uniroma2.it
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] selftest/net: skip srv6_end_d[t/x][4/6]_*_test.sh if iproute2 too old
Date: Mon, 24 Aug 2026 11:15:37 +0200
Message-ID: <20260824091537.2305107-1-alessio.faina@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In case iproute2 is older than version 5.14.0, released ~Sept 1, 2021,
the End.DT4/DT6/DX4/DX6 support are not available and the tests
contained in the following 4 test files
 - srv6_end_dt4_l3vpn_test.sh
 - srv6_end_dt6_l3vpn_test.sh
 - srv6_end_dx4_netfilter_test.sh
 - srv6_end_dx6_netfilter_test.sh
are failing in some kernel backports.
This is the result of one those tests in an unsupported environment:

\################################################################################
\TEST SECTION: SRv6 VPN connectivity test among hosts in the same tenant
\################################################################################
\
\    TEST: Hosts connectivity: hs-t100-1 -> hs-t100-2 (tenant 100)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t100-2 -> hs-t100-1 (tenant 100)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t200-3 -> hs-t200-4 (tenant 200)       [FAIL]
\
\    TEST: Hosts connectivity: hs-t200-4 -> hs-t200-3 (tenant 200)       [FAIL]
\

To amend this, check the current running iproute2 supports the required
feature and, if not, just skip the entire test to avoid a failure.

This is similar to what have been done for srv6_end_dt46_l3vpn_test.sh in
https://patchwork.kernel.org/project/netdevbpf/patch/20260715122859.36177-1-alessio.faina@canonical.com/

Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
---
 tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh      | 10 ++++++++++
 tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh      | 10 ++++++++++
 tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh  | 10 ++++++++++
 tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh  | 10 ++++++++++
 4 files changed, 40 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
index a649dba3cb77..50e8c733cf9f 100755
--- a/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt4_l3vpn_test.sh
@@ -459,6 +459,14 @@ host_vpn_isolation_tests()
 	done
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+	if ! ip route help 2>&1 | grep -qo "End.DT4"; then
+		echo "SKIP: Missing SRv6 End.DT4 support in iproute2"
+		exit "${ksft_skip}"
+	fi
+}
+
 if [ "$(id -u)" -ne 0 ];then
 	echo "SKIP: Need root privileges"
 	exit $ksft_skip
@@ -469,6 +477,8 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_iproute2_supp_or_ksft_skip
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
diff --git a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
index e408406d8489..9ed985559c6b 100755
--- a/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt6_l3vpn_test.sh
@@ -469,6 +469,14 @@ host_vpn_isolation_tests()
 	done
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+	if ! ip route help 2>&1 | grep -qo "End.DT6"; then
+		echo "SKIP: Missing SRv6 End.DT6 support in iproute2"
+		exit "${ksft_skip}"
+	fi
+}
+
 if [ "$(id -u)" -ne 0 ];then
 	echo "SKIP: Need root privileges"
 	exit $ksft_skip
@@ -479,6 +487,8 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_iproute2_supp_or_ksft_skip
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
diff --git a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
index e23210aa547f..b0bc85db8353 100755
--- a/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dx4_netfilter_test.sh
@@ -311,6 +311,14 @@ router_netfilter_tests()
 	check_and_log_hs_connectivity 2 1 100
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+	if ! ip route help 2>&1 | grep -qo "End.DX4"; then
+		echo "SKIP: Missing SRv6 End.DX4 support in iproute2"
+		exit "${ksft_skip}"
+	fi
+}
+
 if [ "$(id -u)" -ne 0 ];then
 	echo "SKIP: Need root privileges"
 	exit $ksft_skip
@@ -321,6 +329,8 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_iproute2_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
diff --git a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
index 9e69a2ed5bc3..9bfbc5bbbdeb 100755
--- a/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dx6_netfilter_test.sh
@@ -316,6 +316,14 @@ router_netfilter_tests()
 	check_and_log_hs_connectivity 2 1 100
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+	if ! ip route help 2>&1 | grep -qo "End.DX6"; then
+		echo "SKIP: Missing SRv6 End.DX6 support in iproute2"
+		exit "${ksft_skip}"
+	fi
+}
+
 if [ "$(id -u)" -ne 0 ];then
 	echo "SKIP: Need root privileges"
 	exit $ksft_skip
@@ -326,6 +334,8 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_iproute2_supp_or_ksft_skip
+
 cleanup &>/dev/null
 
 setup
-- 
2.43.0

