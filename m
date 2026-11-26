Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660270;
	b=L1FctDiG6/DNNWznoT/Eddbl1QsMRmaw7ndAJv9YbFtDDY+JQx24EXtcMTye1IprGdc0
	 ol6vxmwQ8sAq23BYmLjeVStotBZAyD6f0TP9ScXmkvJtnJxhp4MuoXNUP57ABdD2EiwaJ
	 zJkP/DC+xZsbCd6GVQ2K3Vbz/serFenr1RyFzShWlTqj/eMJU3ohHNUCt1YptImmC5xih
	 yHm2ejElSpHWsU875CjMpCOFOQxx75Y/N56XCCQzWyeXyBovObv1EcLtt+oPNGwB0+qs7
	 Tb51+7qr22xAyZ3btMDnD1RJRmWHYPdUjY/70aBuFtvtkWqPNxq3tm+6v7OT6sSb1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660270;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=kMxeDlOyVy246zFNkjFb6a+Vb4c4RNhRRen/Z5ufh8I=;
	b=lwxXyWZFsiVG8zlSJI4MaaOM9LgZgFq7K2nTaTnaNLY48tpNcR978ENX+GcQxRy7qyIX
	 2mWgwWZWetkaK2llJehkp/8KGD601PQN4Ke50EybtElc7qX+twQfIt3V6MiQdJtRrQmn9
	 JqjZV94xPBDLQB0XY98UeQyV88MAkntO2DUGMXgXc3/qYP+xtXel7aubDteaSVzOfTjZ8
	 RJE+Fo93j7NukGI0kQUMoLpyVR5YV/8K3vepQXnYc39tVNIBTjnGaIRlwXQ2OSCZOWvMf
	 BVUS0wqEV60ul3DCjRd7UR7wPH0QU4eOhU6IGT23/D9yPOxTsnNSTdCLUbibWmwping==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l7tVnGWO;
	arc=none smtp.remote-ip=91.218.175.35
Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060A6606A32D
	for <linux-kselftest@vger.kernel.org>; Thu, 26 Nov 2026 02:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060A6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l7tVnGWO
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=en3ED6HDdCtLFu2umCErAM1rLJXWL3SVuTu7Aq5hR8I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795660266; v=1; x=1796265066;
 b=l7tVnGWOgrKtXzohludXdLI0s1muEZzOrVp5uwPqF7resYTTsiTgzObnlkTzOmkpYrmboMx0
 1zzFcA5uGbmP1vZ5cBtXSFicmlHRTIIV/WGCOVIjO/Z4bM3P4QTYKBaDDcnyZyaizjd2uzaezfr
 ptm/8OSJ/OwqPQxXk2tCZ7+A=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 1df46ec555e3532f;
	Thu, 26 Nov 2026 02:31:05 +0000
X-Mizu-Trace-ID: 1df46ec555e3532f
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net 0/3] bonding: ignore updelay when no active links for
 broadcast mode
Date: Thu, 26 Nov 2026 10:30:54 +0800
Message-Id: <20261126-bond_broadcast_updelay-v1-0-188e5538d6ca@kylinos.cn>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMUQrCMBAFr1L220ATSwSvIlKSzatGJCnZVJTSu
 zfq5wzMrCQoEULnbqWCV5SYUwN96IjvLt2gYmhMpjdWa2OVzymMvmQX2Ekdlzng6T6KeeDJW/Q
 4nqjFc8EU37/xhRIqXf9SFv8A1++Stm0HCSsO6H8AAAA=
X-Change-ID: 20261126-bond_broadcast_updelay-cc4cfb6e0e37
To: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Tonghao Zhang <tonghao@bamaicloud.com>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: "jiangjiehua (A)" <jiangjiehua1@huawei.com>, 
 Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

This patchset fixes updelay handling for bonding broadcast mode (mode 3)
to align with bonding documentation section 13.1 paragraph 4: when a
bond has no active links, the first link that comes up must be reused
immediately even if updelay is configured; when usable links exist,
updelay must be honored.

Commit 45fc134bcfad ("bonding: do not set usable_slaves for broadcast
mode") tried to fix the second half of that rule by never updating
usable_slaves in broadcast mode. That made ignore_updelay permanently
false, so updelay was always applied and a broadcast bond with no
active links could not recover within the miimon window when one usable
slave up.

We revert 45fc134bcfad to restore the enslave/release side of the
usable_slaves updates, and add the missing bond_miimon_link_change()
case so the snapshot also tracks link-state transitions. Both halves
are needed:

  - revert alone: the snapshot is only rebuilt on enslave/release, so
    batch enslave with updelay (new slaves start in BOND_LINK_BACK)
    leaves count == 0 forever and updelay is never honored, even once
    other slaves are usable;
  - link_change case alone: with 45fc134bcfad applied,
    bond_set_slave_arr() discards the refreshed array for broadcast.

A selftest is added to cover mode 3; the existing mode 1 and mode 2
recovery-updelay tests are merged into a single script covering
modes 1, 2 and 3.

Before revert 45fc134bcfad:
  TEST: mode (3) bond recovery                               [FAIL]
          No connectivity
  TEST: mode (3) bond recovery                               [FAIL]
          No connectivity
  TEST: mode (3) bond recovery                               [FAIL]
          No connectivity

After revert 45fc134bcfad:
  TEST: mode (3) bond recovery                               [ OK ]
  TEST: mode (3) bond recovery                               [ OK ]
  TEST: mode (3) bond recovery                               [ OK ]

For the second patch, I use test script
  ```
  ip link add veth0 type veth peer name veth0p
  ip link add veth1 type veth peer name veth1p
  ip link set veth0p up
  ip link set veth1p up
  ip link add bond0 type bond mode broadcast miimon 100 updelay 1000
  ip link set veth0 down
  ip link set veth1 down
  ip link set veth0 master bond0 && ip link set veth1 master bond0
  ip link set bond0 up
  sleep 2
  dmesg -C

  # Test A — bullet 1: batch enslave, snapshot stuck at count == 0,
  # updelay never honored
  ip link set veth0p down
  sleep 2
  ip link set veth0p up
  sleep 1
  dmesg | tail -n 5

  # Test B — bullet 2: stale non-empty snapshot, recovery delayed with
  # zero usable links
  ip link set veth0 nomaster
  ip link set veth1 nomaster
  ip link set veth0 master bond0
  sleep 2 # wait veth0 up
  ip link set veth1 master bond0
  sleep 2 # veth1 comes up after its own updelay; snapshot stays
  # drop both links (bond has zero usable links after this)
  ip link set veth0p down
  ip link set veth1p down
  sleep 2
  ip link set veth0p up
  sleep 2
  dmesg | tail -n 5
  ```

With revert only:
Test A:
[   13.190593] bond0: (slave veth0): link status definitely down, disabling slave
[   15.165875] bond0: (slave veth0): link status up, enabling it in 0 ms
[   15.165919] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
Test B:
[   20.366724] bond0: (slave veth1): link status definitely down, disabling slave
[   20.366957] bond0: now running without any active interface!
[   22.341960] bond0: (slave veth0): link status up, enabling it in 1000 ms
[   23.382194] bond0: (slave veth0): link status definitely up, 10000 Mbps full duplex
[   23.382428] bond0: active interface up!

With the second patch
Test A:
[    6.208526] bond0: (slave veth0): link status definitely down, disabling slave
[    8.184359] bond0: (slave veth0): link status up, enabling it in 1000 ms
Test B:
[   13.384852] bond0: (slave veth1): link status definitely down, disabling slave
[   13.385093] bond0: now running without any active interface!
[   15.360849] bond0: (slave veth0): link status up, enabling it in 0 ms

We can see when there is active slave, the second slave follow the
updelay rule (Test A). When there is no active slave, the first up
slave will be in use immediately (Test B).

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Hangbin Liu (3):
      Revert "bonding: do not set usable_slaves for broadcast mode"
      bonding: update slave array on link change for broadcast mode
      selftests: bonding: add recovery updelay test for broadcast mode

 drivers/net/bonding/bond_main.c                    | 14 +++----
 .../testing/selftests/drivers/net/bonding/Makefile |  3 +-
 .../drivers/net/bonding/mode-2-recovery-updelay.sh | 45 ----------------------
 ...e-1-recovery-updelay.sh => recovery-updelay.sh} | 13 +++----
 4 files changed, 12 insertions(+), 63 deletions(-)
---
base-commit: 1ab3fb564f20b78615a6d88b8c90da292f29e227
change-id: 20261126-bond_broadcast_updelay-cc4cfb6e0e37

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

