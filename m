Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF735A3AA
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Mar 2026 07:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773991325; cv=none; b=NISAfyZKgW7DFY3DZUcQdVW3uNADasZxirV+9tD5COKOynEh8BpPt9KuBw9a1QWNo4Bl1oh1eschlQjCZ6fN32+NQqnyl1sfpP6GZTbywUJUAxHRvLEkAjl1MA3Dz+OGSn0uFapN+L80gZdI6nmzQtMSHvmnSokPcthRv8VFyl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773991325; c=relaxed/simple;
	bh=G3o2iPkNDRsGx7dDpqsXPC6C/oDry2E07QRf7qDyw6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efvxXCsA6CSr/yr3ZhrRb0hIyXDv6P8jORBMl4g0FgfC5XO4Sjzw8mzGToHlLFOYr6Zh2KAlBdOsbEUy/hqfPSXHCY2+jWrfaxeWI+7UWbL9w/T21N1CaKXCE/Wpajmx3yyJSACDQjvlVHt8ApPKPTIP1UWpv0jOokht8JJDtoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mmqv3Z2f; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mmqv3Z2f"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773991320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qgg40LIZMS6635P0RIcSe8lkSrlpzbLarkbC+lLOBV8=;
	b=mmqv3Z2fAzHhGR7+hFeTYznwGywHbHYf7IZWjs4Yn0eAVEeLHDCHClZIoS1fkwsGbloPsj
	9sh9yJgIWwdTTOUieoHTrnbPlC7h+1mggutiT9mXObAKlzXOdD2g34Lm7tcyRxC8NcWQ73
	bKSR6J45oZzzICKh/ow9njlIZ1ENle4=
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
Subject: [PATCH net v3 0/2] team: fix header_ops type confusion and add selftest
Date: Fri, 20 Mar 2026 15:21:25 +0800
Message-ID: <20260320072139.134249-1-jiayuan.chen@linux.dev>
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

The first patch fixes the header_ops type confusion / parse recursion
context issue in team. The second patch adds a selftest to reproduce the
reported scenario and prevent regressions in the future.

Thanks.

---
Changes in v3:
- Clarify syzbot crash path in commit message
- Fix shellcheck warnings in selftest
- Fix config entry sorting order
- Update comment per AI review feedback

Changes in v2:
- The same fix approach was applied to bonding first, but could cause
  infinite recursion in bond_header_parse(). Eric spotted the issue and
  fixed it in:
  b7405dcf7385 ("bonding: prevent potential infinite loop in bond_header_parse()")
  After that fix landed, we continue with the same approach to fix team.

v1: https://lore.kernel.org/netdev/20260314062306.212765-1-jiayuan.chen@linux.dev/
v2: https://lore.kernel.org/netdev/20260317124606.157035-1-jiayuan.chen@linux.dev/

Jiayuan Chen (2):
  team: fix header_ops type confusion with non-Ethernet ports
  selftests: team: add non-Ethernet header_ops reproducer

 drivers/net/team/team_core.c                  | 65 ++++++++++++++++++-
 .../selftests/drivers/net/team/Makefile       |  1 +
 .../testing/selftests/drivers/net/team/config |  2 +
 .../drivers/net/team/non_ether_header_ops.sh  | 41 ++++++++++++
 4 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/drivers/net/team/non_ether_header_ops.sh

-- 
2.43.0

