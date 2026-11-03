Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664714;
	b=XMiAP4RIZU6Ennt1AbfS014vU9pGidlAMdPTYnDGb4iAAGLOw+qIGbUh2UARgzcyXCwc
	 75hOWlMFI+FmQ6I29Xb7YSmG/YPZSEGkP4nuSbt5ddtEGNIYnKS+44Cj3WTnW00dQTJXx
	 mtU8lUqMak3DuDP54V0Ig+CWYAwXkSyLsIU4glaoTJinLmygwXGSPyI724JOH/ut0PS1R
	 drghGWT5nf/atKHP50bcqhO2OoMW3eFPwrg047/ziYXBWTq3F+cMieHXqIgF3+U+i99v4
	 R96HL97mq0m5r2anBQh6xZJybkgjIQP/IWZ+wwKurzb/9p/iMsuioHfIYX1fnp4mKsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version;
	bh=uEdJZuEv+71ZJNyRFUsTQlDm4iAneiepeaY/wo4w+Xc=;
	b=qIo2acdQ2yOZO8pG+6O/vkzX7pXjbFHhU1oZmyrcONXKaLeUGBhkMCosQyByxhgKQ6pc
	 WVT5nL5AOnvxBN4YLoJdlPJBKYvKFKqn08Oc6OWZLU0FiSzUPZC4852vWtr0awhav1Epg
	 SOlVKlzZWgZLoEWdpe5n8G6XaCVxYYQm6LvEhbOPYT/m8kfLoYKWWuIMidDTrVc+dkMJ5
	 09451vEbO1Ivb/Jq9fabmdzf3s5ueuqh1pLYVqC9IRmu7wMAhk19pQherxcMMoOc2T6/H
	 JHTdoDSi1qr5vI4aFguzUZd006u4I8zpWP+TrbTYHP4D9ARMzUZz0aPuHHmbU1uIAxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=BL+TYsC3;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAF606D80B;
	Tue,  3 Nov 2026 00:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BBAF606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=BL+TYsC3
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6EZ7168672;
	Mon, 2 Nov 2026 16:11:52 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps82601-s2048-2026-q3; bh=uEdJZuEv+
	71ZJNyRFUsTQlDm4iAneiepeaY/wo4w+Xc=; b=BL+TYsC3qdatBOu8xN+TwrEPZ
	Bx5G9uHPM8yIoUF1KaXNktEVeEWOhMTO3CRf2yKCOqb3VEX3Yopx2bdJpbSrO9Kt
	apjA3bH2Hp8QuHvShHcSTxInEoq1XIA7X29kCy6ZaHvmaJ8DlubyBqwkW6A5X7HG
	0YpSopZCGdfs3QcYylN8ykU2AbdYVUCWeopBlVdb9OQLVNFhxCCF5lWL+tWGb/db
	gIo+HcSdxCWmgHq/iYNUz+t49qUKDIgCUauxh/ZO3B0B0rXx0U1IV/uujUGIBBan
	ufKwmQms+AY0xG+oFHV40TvYYRJ8qrc+q7k9G3hwdk8ZxoJoHz4d8J7GPEotA==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hnde7f5ss-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 02 Nov 2026 16:11:52 -0800 (PST)
Received: from localhost (2620:10d:c085:208::f) by mail.thefacebook.com
 (2620:10d:c08b:78::c78f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 3 Nov
 2026 00:11:51 +0000
From: Todd Freed <toddfreed@meta.com>
To: <netdev@vger.kernel.org>, <toddfreed@meta.com>
CC: <linux-kselftest@vger.kernel.org>
Subject: [PATCH net v4 0/7] psp, tls: don't send offloaded contents in cleartext
Date: Mon, 2 Nov 2026 16:11:36 -0800
Message-ID: <20261103001143.246081-1-toddfreed@meta.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vjivpWtr9xn9rNKPyx5dy-QSh5PEau05
X-Proofpoint-GUID: vjivpWtr9xn9rNKPyx5dy-QSh5PEau05
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX36RJhpVf0DFi
 r6jSSEXEbDKVj1OTAnlEKx+KMqEkfx4H2H9MbydgfEtQiD/YitZukw+kla4i+C+TEu7XohvNX/e
 Vji4GInzWAAkSZFSOCmbHG/PGrGL6Dg=
X-Authority-Analysis: v=2.4 cv=W6+txhWk c=1 sm=1 tr=0 ts=6ae926c8 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22 a=VwQbUJbxAAAA:8
 a=VabnemYjAAAA:8 a=lmvCLA915dBuvYjvTxIA:9 a=QEXdDO2ut3YA:10
 a=gKebqoRLp9LExxC7YDUY:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAwMCBTYWx0ZWRfX8ibHkltqsB8N
 oUMpEs+q+aExVhTUEIPpbzN0UUOrzX7UqhGfurdi3g+7j83N6Cfi6ZQYMNBnyrY3LMFu/BQjyAm
 uJKWUj6x2xdkxIvf9bKlZHhu9RwaL8Pi0Uf/0Pr9n3wWDEXfPCR0UHTdqRuRQhx3U1FiRdvqpe5
 HARVar1fn62Pvzoy+f+d53uuRsgG/Z5NufNChGKYmrdUoQ91LvAtsegOLV9BZeivX/hT/TISEP/
 Ioq2KT1hrlAhdzh6meRLkVm1Qrv8ItznMvoC3Zy7qM4vtcnkxvawBTjN51tu9U4tutiiceAKjhA
 zTTJbaNn7jF0BYw8DGZLS/bdwVyYYhochYRa/x3htYEjaYdeOwEHN/F2LKPDX9x8Xz8SGGuBTY2
 GjmcHAQvT+JY7RD4ssSAThbRQlXFxhyhExhc5WNUds7IlG95CJwELl/0na8V/e8NXkglmHEpuw+
 gJ16Wu2jm5TmRKjuOrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01

While working on adding support for socket-less psp associations, I
noticed the case of ipv6 extension headers was not being handled
properly for psp packets. It will be relevant with that series, because
it adds udp support, for which the psp nexthdr needs to look at the
inner packet.

That led me to various other ways where packets on the crypto offload
path could be transmitted unencrypted.

Since the tx/tls association encodes intent to send encrypted packets,
but these various cases circumvent that, sending these as fixes.

The cases are,

 1/ ipv6 extension headers,
 2/ ipv4 fragments,
 3/ icmp errors,
 4/ icmpv6 errors,

Cases 2, 3 and 4 are relevant for ktls as well as psp.

The last patch fixes an mlx5e bug in tso checksum calculation for psp
packets when the l3 dest is an intermediate hop (ipv4 source routing).
It's not about preventing unencrypted tx, so could be considered
separate.

Testing:

all hardware testing was done on connectx-7 (fw 28.48), between two x86
hosts, plus netdevsim.

 - tso checksum seed: a psp tcp socket with an ipv4 loose source route,
   the peer checking tcp checksums in software. hundreds of checksum
   errors before the fix, none after.

 - tls offload, with a kernel built with CONFIG_TLS_DEVICE and
   CONFIG_MLX5_EN_TLS:
   - tx offload, ipv4 fragments (route mtu above the device mtu,
     IP_PMTUDISC_OMIT): without the fix, some fragments after the first
     go out in cleartext. with it they're dropped.
   - rx offload, an iptables REJECT rule on the receiver: the icmp and
     icmpv6 errors about device decrypted packets quote the ip(v6) and
     tcp headers only (52 and 72 bytes). errors about locally generated
     tx offload packets, rejected in OUTPUT, are still quoted in full.

 - net/icmp.sh and net/pmtu.sh pass.

v4:
 - new subject, since the series grew beyond ipv6 extension headers
   (v1-v3: "psp: fix transport mode with ipv6 extension headers")
 - back to dropping ipv6 packets with extension headers, but moved into
   mlx5e instead of psp_dev_encapsulate()
 - drop the psp core changes to rx and tx ipv6 extension headers
 - new patch 2 to drop decrypted skbs instead of fragmenting
 - new patches 3 and 4 to prevent quoting just-decrypted packet contents
   in icmp errors, v4 and v6 respectively (Jakub, Bjorn, Sashiko)
 - new selftest: ipv4 fragments of a psp tcp socket

v3: https://lore.kernel.org/netdev/20261023234640.1459291-1-toddfreed@meta.com
 - new patch 1 to fix tso checksum seed calculation in mlx5e (Daniel)
 - accept routing headers and reject ah (Daniel)
 - split the psp_dev_rcv() change into its own patch (Daniel)
 - return -EINVAL instead of -1 (Daniel)
 - selftest: one variant per extension header type (Daniel)

v2: https://lore.kernel.org/netdev/20261022223014.556388-1-toddfreed@meta.com
 - walk the extension headers instead of dropping (Daniel)
 - reject fragment headers (Bjorn, Daniel)
 - reject routing headers
 - psp_dev_rcv() handle the rx case as well

v1: https://lore.kernel.org/netdev/20261021210200.788191-1-toddfreed@meta.com


Todd Freed (7):
  net/mlx5e: psp: drop ipv6 packets with extension headers
  net: don't fragment decrypted skbs
  ipv4: icmp: don't quote decrypted payload in icmp errors
  ipv6: icmpv6: don't quote decrypted payload in icmpv6 errors
  selftests: drv-net: psp: test ipv6 tcp socket with extension headers
  selftests: drv-net: psp: test that ipv4 psp packets aren't fragmented
  net/mlx5e: psp: tso: replace only the length in checksum seed

 .../mellanox/mlx5/core/en_accel/psp_rxtx.c    |  39 +--
 include/net/psp/functions.h                   |  11 +
 net/ipv4/icmp.c                               |  54 ++++-
 net/ipv4/ip_output.c                          |   8 +
 net/ipv6/icmp.c                               |  61 ++++-
 net/psp/psp_main.c                            |   1 +
 tools/testing/selftests/drivers/net/config    |   1 +
 tools/testing/selftests/drivers/net/psp.py    | 229 +++++++++++++++++-
 8 files changed, 378 insertions(+), 26 deletions(-)


base-commit: abeacca61eea4f6803df4a595b656ea45c2d3249
-- 
2.53.0-Meta
