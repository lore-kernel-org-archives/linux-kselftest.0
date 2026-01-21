Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFD547ECFA
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989920; cv=none; b=YZpLD8iA0IGQ9V4KjbxibWisgdjS/NgqwbTHfZUDaObai764eOfOyTAFhgCJ3umdOo5jrQZbmEujOdI6LCY06T5U+g6ThK1BSZOg5nf4HvF87goO/VPp1o6j8NJhi1DjzRJKnKWfMJPAHNDEfVN+Jxp4fBus13+7JW32LX9+s2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989920; c=relaxed/simple;
	bh=nNSs7YokmRk1k1on08BdoALUpjc6jTLbZ3Q3VkoaYgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XTup5qJCGL6wYBOTGVwkryaCpdXxHvqKcTu+vqPsqzdAJppIieU+FPD1FvMacsAKptdAom3ctMfm5wwAZkoo9sNsaJx6Vmqbbf9AqT41popYPm0weK1/2r/5peasGKbCZUmHZMdazZ1hDBYRmhgg0D1yALR/VQ3PU7uo87hNCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WAC+He0X; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WAC+He0X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768989917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1AOyQ4niMZQF0Ucl4X/QFKfMomvo3M8iWx16PQL5iA0=;
	b=WAC+He0XzrT7FpDpYCn9JKCHFq2lBkpyMqQ9GWcqygPGSmXlqX88qCCMlItZto+1JIucz+
	cg1zt4uJo3OEy2vbvry/Hx4vgn43FoMtiYv9PGOomjmH9XIxQxGB+PcU2wtHR8hycPB3hi
	Jun2rrJ9nueS69n/I5H/ZqqTCq4m1DY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-201-pQmYttFePfyuMJ-COpLlgg-1; Wed,
 21 Jan 2026 05:05:11 -0500
X-MC-Unique: pQmYttFePfyuMJ-COpLlgg-1
X-Mimecast-MFC-AGG-ID: pQmYttFePfyuMJ-COpLlgg_1768989910
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1F73E18005B2;
	Wed, 21 Jan 2026 10:05:10 +0000 (UTC)
Received: from xudu-thinkpadx1carbongen9.nay.csb (unknown [10.72.116.124])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 43E491800665;
	Wed, 21 Jan 2026 10:05:04 +0000 (UTC)
From: Xu Du <xudu@redhat.com>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 0/7] selftest: Extend tun/virtio coverage for GSO over UDP tunnel
Date: Wed, 21 Jan 2026 18:04:54 +0800
Message-ID: <cover.1768979440.git.xudu@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The design strategy is to extend the existing tun testing infrastructure
to support this new use-case, rather than introducing a new or parallel framework.
This allows for better integration and re-use of existing test logic.

---
v5 -> v6:
 - Fix the Makefile format errors.

v5: https://lore.kernel.org/all/cover.1768800198.git.xudu@redhat.com/
 - Refactor the rtnetlink utilities to use YNL.
 - Use Geneve tunnel instead of VXLAN tunnel.
 - Revert tap refactor as YNL lacks macvtap support.

v4: https://lore.kernel.org/netdev/cover.1767597114.git.xudu@redhat.com/
 - Rebase onto the latest net-next tree to resolve merge conflicts.

v3: https://lore.kernel.org/netdev/cover.1767580224.git.xudu@redhat.com/
 - Re-send the patch series becasue Patchwork don't update them.

v2: https://lore.kernel.org/netdev/cover.1767074545.git.xudu@redhat.com/
 - Addresse sporadic failures due to too early send.
 - Refactor environment address assign helper function.
 - Fix incorrect argument passing in build packet functions.

v1: https://lore.kernel.org/netdev/cover.1763345426.git.xudu@redhat.com/

Xu Du (7):
  selftest: tun: Format tun.c existing code
  selftest: tun: Introduce tuntap_helpers.h header for TUN/TAP testing
  selftest: tun: Refactor tun_delete to use tuntap_helpers
  selftest: tun: Add helpers for GSO over UDP tunnel
  selftest: tun: Add test for sending gso packet into tun
  selftest: tun: Add test for receiving gso packet from tun
  selftest: tun: Add test data for success and failure paths

 tools/testing/selftests/net/Makefile         |  16 +-
 tools/testing/selftests/net/tun.c            | 898 ++++++++++++++++++-
 tools/testing/selftests/net/tuntap_helpers.h | 390 ++++++++
 3 files changed, 1265 insertions(+), 39 deletions(-)
 create mode 100644 tools/testing/selftests/net/tuntap_helpers.h


base-commit: c5e7b1d1cc8a6cb8b709eef34c93a9458427ab2e
-- 
2.52.0

