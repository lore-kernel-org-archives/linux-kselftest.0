Received: from mta0.migadu.com (out-253.mta0.migadu.com [91.218.175.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0969B43DEA0
	for <linux-kselftest@vger.kernel.org>; Tue, 22 Sep 2026 08:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790067306; cv=none; b=OL1HLJQetOna8ZQsenAu7nIqt0q2UzMa4eYZQ93VwIq0ZL0mru2MTdD5PsktrrOPun0cP81/7LrxomvzPHrJ5skMhAKcGe4kB5xBAxCwpYxBhBdj/SXjwDGJspgh8XxZmu1vqKt8RbOjfyg3i9jcZZLomuA/qgLmDCuOW1P4upQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790067306; c=relaxed/simple;
	bh=hqy04BB/HgDINoVUhWeFWFYZZ6xOyJXokN9oZJ8qz1U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oQKwsZFOT2vxrUlpaEiVjuCLIONdcO5WoIc05wcoFnQbolmNHUBwmPZZBxekMqg8iKPlBQpSEF/DFc3QSYl6pf89xjVor/Sz+TWEUBcTO0cOWgU5tqBzJWhv/RsBYsCJ5rSY5JxHNcQ5p44Ztt/DpDM2RnWu59CK6ZBkb3YxSqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=C4L0xKv1; arc=none smtp.client-ip=91.218.175.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="C4L0xKv1"
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hqy04BB/HgDINoVUhWeFWFYZZ6xOyJXokN9oZJ8qz1U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790067302; v=1; x=1790672102;
 b=C4L0xKv1Cz83nuliQuW/2k+c6HctVfr+/SyHNZccSWZSxYReW/Qm0p15EHmr990vARqYRS72
 uMZzAgS4/l8wEuZAW1CmTYR/rq7QhqAmdI4JdwG2CpcYflLL7dk1bvzDr05gjVNGri25WtKJcM/
 cT9m0JUqlLwDHlZa9l3j6EDE=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id de27700ab8f48a64;
	Tue, 22 Sep 2026 08:54:52 +0000
X-Mizu-Trace-ID: de27700ab8f48a64
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Subject: [PATCH net-next 0/5] seg6: add End.X PSP flavor support and
 selftests
Date: Tue, 22 Sep 2026 16:54:42 +0800
Message-Id: <20260922-srv6_flavors_endx-v1-0-4d01c05c47b7@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrDIBBA0auEWUdQSaX2KiWEEMd2oEzKTBAhe
 PdIlm/x/wmKQqjwGk4QLKS0c4cbB9i+K3/QUOoGb32w0XujUsKSf2vZRRfkVE2cntG5kB52m6B
 3f8FM9X6+gfEwjPWAubULuyNQX20AAAA=
X-Change-ID: 20260922-srv6_flavors_endx-9489116d50c4
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.14.3

This series adds End.X PSP flavor handling in seg6local and extends the
SRv6 selftests to cover it.

Patch 1 splits the final forwarding step out of end_flv8986_core() so
RFC8986 flavor logic can be reused outside the End path.
Patch 2 uses that to add End.X PSP support through the same
end_flv8986_core() path.
Patches 3-4 refactor the PSP selftest setup/cleanup so flavor tests can
be added more cleanly.
Patch 5 adds End.X PSP connectivity coverage and updates the selftest
policy parser to accept an explicit action field.

The goal is to make End.X PSP behavior consistent with End PSP, while
keeping the selftest structure easier to extend for later flavors.

Run all srv6 selftests on debug kernel. All passed without error.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
Hangbin Liu (5):
      seg6: split final End process out of flavor processing
      seg6: add RFC8986 flavor support for End.X
      selftests: seg6: move SRv6 End PSP setup into its own helper
      selftest: seg6: add explicit cleanup for SRv6 End PSP test
      selftests: seg6: add End.X PSP selftest

 net/ipv6/seg6_local.c                              |  20 ++-
 .../testing/selftests/net/srv6_end_flavors_test.sh | 168 +++++++++++++++++++--
 2 files changed, 172 insertions(+), 16 deletions(-)
---
base-commit: 10cfa109c880092df32e396647b4afdca9be8350
change-id: 20260922-srv6_flavors_endx-9489116d50c4

Best regards,
-- 
Hangbin Liu <liuhangbin@kylinos.cn>

