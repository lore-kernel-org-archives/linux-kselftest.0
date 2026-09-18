Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AC44E3246;
	Fri, 18 Sep 2026 15:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745757; cv=none; b=Zlcd7MY781K4GnMrRpwTAuB8pODan79RTmcVNtp1MR1Jp8Zx4yFVzZs+5Hgx71glwRw/ifSN6V/PmFvGqWlS3b8t2gLPaxnAITnz3Y2oD2aSWeUyyr4bAUkpjYcU5p60hQZ81CQTtkos8ASyNOlChq9mQRo8xpjCxI+9tVpudTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745757; c=relaxed/simple;
	bh=ySlAoej0F93YdtOPSNSbn4zdzVykp84gZGKWD5skUcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dv/sGLvpOc9uEtZ73lothsE/2vcn4cSB5IkEPzBF9NiUiSAPrqoYi7xwpMQ8rXOGllp5Sn6GMLzYbrw2ONfLZk0Dwt2nfSmXhEoS4h77LVqp+DKvZadH5zIJ8GzXnTUVlNMyjJl6RwLcoJPOk/e2zOthg8oLYHWEiOiD8IWfh3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3A5034773E;
	Fri, 18 Sep 2026 17:35:52 +0200 (CEST)
From: Gabriel Goller <g.goller@proxmox.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 0/2] net: ipv6: seg6: extack messages for lwtunnel setup
Date: Fri, 18 Sep 2026 17:35:14 +0200
Message-ID: <20260918153544.1178884-1-g.goller@proxmox.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1789745751682

seg6_build_state() rejects invalid lwtunnel configurations with a bare -EINVAL,
so "ip route add ... encap seg6 ..." always reports "Invalid argument".

Patch 1 attaches an extack message to each of them.

Patch 2 adds a ksft/ynl selftest that hits some rejection paths and checks the
error messages.

Gabriel Goller (2):
  net: ipv6: seg6: report lwtunnel setup errors via extack
  selftests: seg6: check extack messages on SRv6 lwtunnel setup

 net/ipv6/seg6_iptunnel.c                      |  25 ++-
 tools/testing/selftests/net/Makefile          |   1 +
 .../selftests/net/srv6_iptunnel_extack.py     | 168 ++++++++++++++++++
 3 files changed, 189 insertions(+), 5 deletions(-)
 create mode 100755 tools/testing/selftests/net/srv6_iptunnel_extack.py


base-commit: 4bb9710c6a68d35207f123aef55dcd50e7195ec5
-- 
2.47.3


