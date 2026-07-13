Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466153E3163
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783936678; cv=none; b=G2O39UiR30gXKCZWqwbX0zYfTEKKpS9xBGFfeV8vYKhXNVoIadz4hSuf6381k14JgqPJgwXSSSoVmNxninOaEeaLMQDpKRZjEHNntoWMWSETCWSz6AaVNwej2UCFgPivguBKXl9lWDCpO4kFUKWPzoPKd3Q9xnORzUmNccGElSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783936678; c=relaxed/simple;
	bh=l3UTbUymYlRN5imGRu4IpkEBSuVXCR++q+L9zDNJTN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TEQkhHSEo9y6IxS8dZtSMLic0a1+2NyALRw1hd52uUqHGXZyCx/U/R60FK5d5g91jVu+iI9ctReEM4rCN9cT265eCBYgTwY2j6kllnuTZzzrTKf+dvGHT2QLaMbX4/bH356AeBDvm2dodrAbiko++A2qqrHgx95I2kyIZmWG6Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=CIJHWb9f; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="CIJHWb9f"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E981C3F286
	for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783936672;
	bh=APSxiqpB9sfMOUfH2IGy4ikKFokKYtX5pknrKsKxMHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=CIJHWb9ffc6zxCJxAfa7Vg3jzwQ5rDGFbTA87yaMc3oRXEwT7lhFZ6i5PRdDEMfWS
	 a2kLkFWIftrAstway2E93YV/o6xq8WumsfPGSxAcfOIhQsDvHcRl+QYnd0FHsuXG/C
	 E1yVIuvyP11nLWeJQPeNVi6+7ju9yymbFEzbNjQ8tNcvdtl+JgQ4r8uzycIU3qU+sq
	 QxJqrml4j6WSJ73PF2GuXOFOTQ0eQHZp97NMkLlZlx8l8IhoZ120h01QbWoJXGaHTY
	 hj0LkngzGZqpm4c2cOtGFQRgxLLfU0OdSR0aF3BYm1Prd4Kw+I8/HB2W8PzWG4Rv0l
	 wxkcLvzoVdQl0Y6mYNUuMt7TKS4TQSQkJnZuGiwnOoug+h5Y7aM6jrkHLZ47KURTmr
	 kbWHHzQrSVfDXCwbwFtfzhQgJPfk0qvyZfhHboTJ0dsvgzJQm4h/FJPNay6nb/GUnd
	 5DoH/km0LFrJ4A57blCaH0OZ6OkCDr+22pY2qfoeA+G5tOLaeC00ccoTj+FSNnkXrR
	 8BNnjP5pXDmK2ufiCIf1rDL0XYWzlPrw+8RU5s4PuzpW4Y5HE63CDXawM66WgO61+j
	 uFNAw05eoe/zVDnJG0pb+oLyTTBuq6qGcZGcZqYGWZ77X6q11jufWlub2Ux9l5xXKT
	 QoIXazt2Kl0KHEkiL9mpXoEI=
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47dfc23ac71so2404595f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 13 Jul 2026 02:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783936672; x=1784541472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=APSxiqpB9sfMOUfH2IGy4ikKFokKYtX5pknrKsKxMHQ=;
        b=R80teVyvUZZGZ5T9WU2SLu2q128lP+2IXTwOmCidPPeSTIPMU/3bJ+yTl/pLbQ7rWO
         rs3qOmyvJUoB1H7YBb99+zQaqa/3cjiBrnpxiNee4s6pDwyda8WSU/rqEX8hJhUTk2B0
         ZVgOsUunsIT6VasNHA07BBXy/A3Lg0C3jM+SDrbfdkCCOqKrlX2tbbDEetSdYzAmjuav
         bnnGM3tfEU/q2VFK2Ra8m2gH9ts4f73Ztdfh4Had8zF1+YC5eq4tc8FeLGW2vmvqzzIw
         mMIud0uUjwXb0Bo0c3JOESNiSZ/YxmwUuYjvZk9l31crWkhnE0TbqQBoNXY2a4XXjVhn
         ECLw==
X-Forwarded-Encrypted: i=1; AHgh+Rpllbzowk2AM/Q5ktws43xMF0DEqpEGfWIbwP6HE6kutwRedlXbxKUvHivZtzLw84UYuYeqR4D9xHJBJp7x9j0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2q93lV4+nwtu7DMXdsj7FJbB1277BNMhgMQP/TabrPQpKh+sg
	2Z0NQUDB+z5K8R2xddtJT7dQlwm3rcZ4oiwtiTh20M3aBv6R83jygdFXa1naCMP50Y6xq4+mmoR
	LF2tNNeX1++huRFIOioq+uDEYeTUW9ChU6beRyOMfvakmlfAGdKTKyzwMGh7qlqCoXcNVDad0si
	NBkFVH7iXHtA==
X-Gm-Gg: AfdE7cltrU1NqTPxe6Fibe37whL9m7LVkvO6Cm9F4kuU14CSuydl4r+obEKCNvn2Pra
	qqTwuhb0mBQO1zk1C3CJni0vT2K/9nsSxnXjgBpAOO/UHwksLKCSqObI65B++Asw+9vAPZNW3G1
	lmvrKk0Q12Ydb9rGdlCGV/4PJ2jKeSRabBMXHmRtBIYEGwI6V8/GPUnYyUdxNby8F7u94Z7CqQE
	B3TeLjGGRw9ICXH7MaTJVULhw6/77Supf176DGjtPNI5fKAVEkg2iwQmL4krloVmJAI9x4hIzrV
	fF1O6V0uVLBabssxY/TCy/p4Xb08HE4vL7W3iojhzvXdgxHQZFD3Km3Hs9xKsOG76fc67bjWw5B
	VoNGVrUyS9ImIPAV7E02rJZK+4w+aMYstAjZ0zlkIW43daJOZ269JB469mTv62Civ5BE07qHOii
	zlL7I=
X-Received: by 2002:a05:6000:4713:b0:460:3233:beef with SMTP id ffacd0b85a97d-47f2dd016d9mr8632704f8f.43.1783936672523;
        Mon, 13 Jul 2026 02:57:52 -0700 (PDT)
X-Received: by 2002:a05:6000:4713:b0:460:3233:beef with SMTP id ffacd0b85a97d-47f2dd016d9mr8632685f8f.43.1783936672160;
        Mon, 13 Jul 2026 02:57:52 -0700 (PDT)
Received: from localhost (93-40-44-74.ip37.fastwebnet.it. [93.40.44.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm84973523f8f.28.2026.07.13.02.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 02:57:51 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Alessio Faina <alessio.faina@canonical.com>,
	Po-Hsu Lin <po-hsu.lin@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next v2] selftests/net: Skip srv6_end_dt46_l3vpn_test::host_vpn_tests if iproute2 too old
Date: Mon, 13 Jul 2026 11:57:50 +0200
Message-ID: <20260713095750.2671173-1-alessio.faina@canonical.com>
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
v2: 
	- skip entire test suite if iproute2 is too old
v1: https://lore.kernel.org/netdev/20260708152745.2430714-1-alessio.faina@canonical.com/

 .../testing/selftests/net/srv6_end_dt46_l3vpn_test.sh  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
index a5e959a080bb..cd7ac03e3907 100755
--- a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
@@ -536,6 +536,14 @@ host_vpn_isolation_tests()
 	done
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+        if ! ip route add help 2>&1 | grep -qo "End.DT46"; then
+                echo "SKIP: Missing SRv6 End.DT46 support in iproute2"
+                exit "${ksft_skip}"
+        fi
+}
+
 if [ "$(id -u)" -ne 0 ];then
 	echo "SKIP: Need root privileges"
 	exit $ksft_skip
@@ -546,6 +554,8 @@ if [ ! -x "$(command -v ip)" ]; then
 	exit $ksft_skip
 fi
 
+test_iproute2_supp_or_ksft_skip
+
 modprobe vrf &>/dev/null
 if [ ! -e /proc/sys/net/vrf/strict_mode ]; then
         echo "SKIP: vrf sysctl does not exist"
-- 
2.43.0

