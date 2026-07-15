Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84916424D41
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118547; cv=none; b=ZwuwS7fcaNXcdL2IThBJNPMS5hYZULvOmky5S3sxeXcN+08MjlW6elHkxbNsju9McopuLnLGoAO8iLIbdUhw84Mif7cpEkxwFeGPS48X9kN41LjYNaUZSidHAguMzwf/zeJdJ6b6a2RJSd/MXcj8/iemWXOGX55nw4PIayAR1i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118547; c=relaxed/simple;
	bh=OdruJZBa6oWspM/17dQouf+1Ety7FDflBlOYn7n3WbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZF1bVJN2hcWgjlzdJKD/VdmHIefOZszd78He7Po/g4R22V8MiOhpD3jDcweJW5rL0QFGq4dJL1TDWmOxcjne2s5E32mm9+Ig2qjtE+6/KfMPqP9QClU2s6ZAC+GM37o50y6lUv7s/oMb3AG+UL/c+epMwNVizIRKvdKE4ucC2Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=S0GFZWFg; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="S0GFZWFg"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9B0C53F5D9
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1784118542;
	bh=Xwm+NMhrBU9VQqJsed9CGdyjA7mRZEQ6yrEUTZU5TnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=S0GFZWFg+GLqFFN/+a5qTvjv35xqceiFvesf+m5wDQ2Pzi2vYDKONCai7BzYEnZBA
	 dR/TwWyisBh/w3oKAmjR1jlStj4IfhySqN32hGPutsHNIkzfmIwTSx4ztTv1CrJdde
	 PubicYGAgZUhvAk1CkQGFmHMQiuKB8NgW4cVCZ+y5asrh/Wx4AqFCnQo+Zi6MPIQlx
	 jBoZCUK6HUpSK7tCnY0Xh7KwSKCOD+bnNzNZdjG2sWLWhbAhxi+uYRXdf7BAGAVq+d
	 mSK2MG1DuamjbkJ4A9A/S+1oyrOS9iURtuRYmY73a7lLqIqJWfvWZuQpFXqAszTxnm
	 FZ6PHGQrPukAFZbFAesA/ARyuFtODFPse5I67/pKsHcLdDoDyBZEcOeDbcTzqx8v57
	 bBJGg4+EDXhlcsAMDkCAA0P1USfHBbCp4GPzkH+9SMPI0wySSXk2YxEghkTK7j9rKK
	 l8Xv38S++TCvDXEbweS1ngmgZV+qCOhBiEkFSw8Nh9vZHkdWuIkn461YuR/MFK+21o
	 +763s6YXPalXemUU0BrfA+LcoFm7m/e4N9O50b5My+oLinzfOMfMooU0hQP7ITfhDb
	 6wcc89e6O6YYDSLC9KTTeG7FM90ucyEkt0wLElnZFgVYNiiHhpvE4QhGG5ISJfuOpN
	 J9jqgzmwtMQtZbohj2QuTUcA=
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49244130073so57423715e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 05:29:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118542; x=1784723342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xwm+NMhrBU9VQqJsed9CGdyjA7mRZEQ6yrEUTZU5TnE=;
        b=nbFKQy9rp0FDG1U6e98J9PtScLBePlPndMd2GH6OhLTnOQTmyVS3qWJ01Ee8tH3S4Z
         MLaqRqe1c2LJNN4DYswVBlo2dmjb0kZGJCLQyQfI4klZBboJTn+JEhCuZqHqWD4S8bQi
         e2IGMfuYRJvFY4ryc7HnkpjnRwtt7gOXEFyAvmtMeYu7NZq0DvVzOmau/u4mbMabaEf6
         x2j4BFBjGVeDKD4ccCgYUORA+2EahzHMv1UjJKYPooN08AUl4q/6AgVH8eRmUtw4YwA4
         XXva/7V3BTRAfuzAVyzqoOxJAgaQDrJmzXWjIifxCWaw2o8re2dVJ6HXUz0kbXnWa8ye
         beWA==
X-Forwarded-Encrypted: i=1; AHgh+Rqb4zjJYNpns2JF95ZR+VBB7Xpbkb3IR17LfAJBYsJVKoD2uTs2hSPVcAoc/0tO/OoGFtznRc/qZFfdUywbtHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO1vfn+m7b20nRxuLKxFTifAUJ0AIu2FhStzRiJTgB5ik62nI8
	dA7DN7rhCyo1ibsw2SNHoZf3vIk8NxWslydCJSTTpR/vxM8fjMXmshHheqlvSQ3LIOxEsRYgu/t
	K/H+tJBBuLtlgqPDwLRQElDjJjsIOveeSGAfVLqMUdpphwrZjm37sCt0ZkLgHxQi0LiBpit0uPZ
	ihQv6ozUIImQ==
X-Gm-Gg: AfdE7ck8okFF48jjteavjverNWgTYq8brZo4r1gYl4w2VvDZr4yKuak+sZMgEbeXeLA
	FNTmeDrslktVLFGxjf59AhNWjHGjyY7diFTNz2dWmqUTHA5anLKIMDiDWJ/qpskQ3QqcP8+UotD
	QsoagZZUr+m+3Q3RoKliOycacuw436V/d15sIGecXdfAOoA2pji/WhJtkoMNZ4v9hYg5b+b+cSM
	nAiqL0UIQxpYoa7N+L69lttkAMTxS+Q2f4gI/DeUpyHh1C7U02HP9zBUuAyydrNzI8sk3mNy6kx
	p0jsaq5AMxckdR2ZYZO1g5IuWoqPQ0HU1SoFigq3yppqXC2YDvX1G/EJ2yje74ZATehmmAJEkqx
	VSyymla/OViSwoU1T7g42V7dyCCzi2pwKFH5zOnlO56/yZyGuTfxfT0lJzrw5/l1WQSYxFOTNn3
	KAYe48jQ==
X-Received: by 2002:a05:600c:608d:b0:495:3e0d:ea3b with SMTP id 5b1f17b1804b1-4953e0ded3amr21982905e9.19.1784118542152;
        Wed, 15 Jul 2026 05:29:02 -0700 (PDT)
X-Received: by 2002:a05:600c:608d:b0:495:3e0d:ea3b with SMTP id 5b1f17b1804b1-4953e0ded3amr21982645e9.19.1784118541771;
        Wed, 15 Jul 2026 05:29:01 -0700 (PDT)
Received: from localhost (93-40-66-109.ip37.fastwebnet.it. [93.40.66.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4953c599049sm44206255e9.0.2026.07.15.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:01 -0700 (PDT)
From: Alessio Faina <alessio.faina@canonical.com>
To: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Po-Hsu Lin <po-hsu.lin@canonical.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: [PATCH net-next v3] selftests/net: Skip srv6_end_dt46_l3vpn_test if iproute2 too old
Date: Wed, 15 Jul 2026 14:28:59 +0200
Message-ID: <20260715122859.36177-1-alessio.faina@canonical.com>
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
feature and, if not, just skip the entire test to avoid a failure.


Signed-off-by: Alessio Faina <alessio.faina@canonical.com>
---
v3:
 -  fix indentation in test_iproute2_supp_or_ksft_skip()
 -  fix subject to reflect full test suite skip
 -  https://lore.kernel.org/netdev/20260713095750.2671173-1-alessio.faina@canonical.com/
v2: 
	- skip entire test suite if iproute2 is too old
v1: https://lore.kernel.org/netdev/20260708152745.2430714-1-alessio.faina@canonical.com/

 .../testing/selftests/net/srv6_end_dt46_l3vpn_test.sh  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
index a5e959a080bb..50e37d3217ea 100755
--- a/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
+++ b/tools/testing/selftests/net/srv6_end_dt46_l3vpn_test.sh
@@ -536,6 +536,14 @@ host_vpn_isolation_tests()
 	done
 }
 
+test_iproute2_supp_or_ksft_skip()
+{
+	if ! ip route add help 2>&1 | grep -qo "End.DT46"; then
+		echo "SKIP: Missing SRv6 End.DT46 support in iproute2"
+		exit "${ksft_skip}"
+	fi
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

