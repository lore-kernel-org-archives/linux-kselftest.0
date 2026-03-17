Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2000415A864
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Mar 2026 12:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773751578; cv=none; b=arL/RlNLXjPYlV5UkBh63VGCOI8cC1dluWt1gaggv5ATMVluVnA71BKf+j4xOGxjkV/YprwPzXMFBqj/J/E4NoP97Q9vCSRkv/xsTNTGPJHXQYXOPzhPXravYD30l1BiusosnBNfB07lsI/0dOEvG3RuYHXtRjMkvgVMZfYyQAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773751578; c=relaxed/simple;
	bh=H+i7baUdVADCEmnsbi83752ZaNlDlaNzpdPDDZHYxQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H7Avdx+AOXRmMn6F0UN/W6+JrQ2mi/GnglSFzTLviMGiMNkYy95z6v6oAHBm/8+4jwH+81uGRzYbVm62NYQPiEI5/LcBeDTVus/ZhvWnQfafidEsj+t02GPWd9CTOzo+EJWTLaIY9/MM0qysb0mIwJyZeqLf+S4gVm6h4Zvn+Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LVGZSehw; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LVGZSehw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773751574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dOVavYy0n2C8czHAJEk7oEi8c3Gg9gupOZ2rTN3VHhc=;
	b=LVGZSehw8R+0s2klgR+AhhLLWVtaiCum3cT1Hps3Jvza8mbPmrc+YIUtMO2wNGm+gn+Vem
	d+hCvDBpkKfyhqGoOM5qyanpYH4oAvhQW8uTK5u6hEgGxqvewZYUJvYHrGzmNVm04+UBWW
	VDSy54EYG5ZPeqIJ24XW59OxFeziIUI=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: netdev@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Jiri Pirko <jiri@resnulli.us>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v2 0/2] team: fix header_ops type confusion and add selftest
Date: Tue, 17 Mar 2026 20:45:52 +0800
Message-ID: <20260317124606.157035-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

This patch series fixes a panic reported by syzkaller in the team/bond/gre
stacked non-Ethernet configuration:
https://syzkaller.appspot.com/bug?extid=3d8bc31c45e11450f24c

The first patch fixes the header_ops type confusion / parse recursion context
issue in team. The second patch adds a selftest to reproduce the reported
scenario and prevent regressions in the future.

Thanks.

---
Changes in v2:
- The same fix approach was applied to bonding first, but could cause
  infinite recursion in bond_header_parse(). Eric spotted the issue and
  fixed it in:
  b7405dcf7385 ("bonding: prevent potential infinite loop in bond_header_parse()")
  After that fix landed, we continue with the same approach to fix team.

v1: https://lore.kernel.org/netdev/20260314062306.212765-1-jiayuan.chen@linux.dev/
Jiayuan Chen (2):
  team: fix header_ops type confusion with non-Ethernet ports
  selftests: team: add non-Ethernet header_ops reproducer

 drivers/net/team/team_core.c                  | 60 ++++++++++++++++++-
 .../selftests/drivers/net/team/Makefile       |  1 +
 .../testing/selftests/drivers/net/team/config |  2 +
 .../drivers/net/team/non_ether_header_ops.sh  | 40 +++++++++++++
 4 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/drivers/net/team/non_ether_header_ops.sh

-- 
2.43.0

