Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A2A379C23;
	Tue, 18 Aug 2026 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787048989; cv=none; b=KWHk863tYXuAdyDWPV431H6N0shhryL37fUaU1GFLUlf5Fe363Y6i822r/uVLtoI3SIwr3cEt8gkXRKKoo0L0J0COIb/e4hAHrTn56aUAt7tGSgQ+c4HW102keAaLRxdRfusk/z0m2a8Iky9udngIK1X/P6hESIWgxQ+9cJe2tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787048989; c=relaxed/simple;
	bh=NcXMhbxnhdJjpu9qU4Me9JanRh/TkL9U8EJdJW7KG5c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T6CQvCYC/d4lmRl843/l6H6MurJdrgpw3sMiz2EQkBjfQTfzuEhoC8PBrV1UGv5oczcgi9icjDzArqdjWgB0tXhQSx6of80K7JDp979tbIPdh8jBfsORPujQ0ulMhrvFA+VqO67rcxjlMGoDqPSfZ01cKz+5ijTGpGxG40lVwzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=t0ljEPB9; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="t0ljEPB9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=nG+UO/T3C618sy0QM2BjHBC8fO/2QvZ9MjdkEruPCjA=; b=t0ljEPB9Kzfs2NtfwQlTw38Vsw
	t8y821WHsvmFNpdq3ZWmWL8XDuN0ba5CGYDniVWKzjPXXlsLhPHXFWhroOHu2ga1SL9O2IM8pSipH
	MtoLQN9jCYh3YDyA8xoNJG9gYlfBcqMND8b/yWAnMaygcySXcVbgPzGISMDNUUHt/fLte7/2NZbhH
	dvtzNQWyED4kryZrIpx2Iol88jf69YhcKupqOTD/TnRArq1Htn+vcVKiprzD8NEwwghIKpDMjGXva
	zwChtFL0gnvwEVHCRrsixPuQ35K+jh2JvdnBr3dHrPs449OH5y+PXmksEaWvHiaIc+J/+n9dLPamk
	sAeAb/Gw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wwH4e-008x5j-1E;
	Tue, 18 Aug 2026 10:29:40 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next RFC 0/6] netconsole: Support messages
 ratelimit-ing
Date: Tue, 18 Aug 2026 03:29:10 -0700
Message-Id: <20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYzhGoC/x3MQQrCMBAF0KsMf91AGrXRbAUP4FZEYhx1QKeSD
 FIovbvgO8Cb0bgKNySaUfkrTUZFor4jlGfWBzu5IRGCD4Pf9tEpWxm1XWo2fslbzA1hd/XrHFd
 lE9ERPpXvMv3PE5TNKU9Gx8Me52X5ATZf+ztxAAAA
X-Change-ID: 20260817-netcons_ratelimit-629b04a73c57
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: paulmck@kernel.org, davej@codemonkey.org.uk, riel@surriel.com, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, samuelcrossley@gmail.com, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=3016; i=leitao@debian.org;
 h=from:subject:message-id; bh=NcXMhbxnhdJjpu9qU4Me9JanRh/TkL9U8EJdJW7KG5c=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqhDQOD82f4VBDHqB7jgdKEa2El0ZjHb/dfAvxN
 ja16QDqG6uJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaoQ0DgAKCRA1o5Of/Hh3
 bU7oD/9pqgMtJtJxWhVBMBZToblzWDCPnPG8qmxWNOm6sv0visVHMkdTNnb5MCvV3QkwwvkV7is
 PGlW14KBIMSJHpTaFhLGoLEltYdPR6IxcdMlWYbjXRt/nrAidLoI/Wc7duCn41yAtlQWK/3ZexL
 kpdR+FIqBVb6ArOrcl4Mc+We4X8QWGpTa0Ny4TElN+marFOdN1KBxqTm1pYNah2ePqR2N2Q/ADV
 h6l4YOF1fhmtuvGpIPIIlzQH/mZ4jsgvPyIEg0vdV6n8WHVBqRcwX1p2BXklzPd0un+S2vN5R72
 Vd1AhVXKiNadD1JOIlVKwgE56joWx/XeFSmXDjqnY0IHkNPU2gJ341IY/sCDQGwQKnBrlOi5lCa
 hLS+gMBUmvushwe7oGESownkHz2rdPdp2DKb33efXwruev7wSYxrRZPHEMfQTvvLxOK9dHiUHHu
 piO37k7E23qa2ThPRDY7iZ7Rd037bfb3g4PaTzMsnMoYAnUH7SgzCc8OAAElg0QJdRt9uPDfUJB
 ioY1vWFOrKf0nxviXIXvTgHCmqpkyA30uJPhZvGqU1hmIgCnbzJQaugCHevmljAYx85yBONs4qP
 h/ORaI7a6+sap6QdQ3kWx5DrL363pmajFCJNvKEKEm+OJ8pmg035Zo73Sw7zwfiMT/VgzoMaR/n
 i4nw5DeIP2AVYzQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

netconsole hands every console message to every enabled target, with no
bound on the rate.

At Meta, a few hosts caused some DoS and netconsd was OOM killed in
some regions, fed by 3 billion RCU messages from thousand hosts and by
a swap fault that retries forever, which logged 6 million copies of one
line on a single host in a few hours.

Both floods are being fixed where they are printed, by Paula and me for RCU
Tasks [1][2][3] and by me for swap faul fix [4], but that only ever
covers the flood already found, not new issues that might be happening.

Use the ratelimit in the kernel to ratelimit messages from netconsole.

Give each target a token bucket, consulted once per message so that a
message split into several ncfrag packets is sent whole or dropped
whole.

It starts with a zero interval, which struct ratelimit_state treats as
unlimited, so nothing changes until ratelimit_interval_ms and
ratelimit_burst are written.

What the bucket discards is reported on the wire, so the receiver sees
"netconsole: 45 messages dropped by rate limit" rather than an
unexplained gap. This is what is captured on netconsd, when this patch
is applied:

	7.2.0-rc7-01460-g75848acaf136,13,628,252392647,-;netconsole selftest: netcons_AGujw 1
	7.2.0-rc7-01460-g75848acaf136,13,629,252392782,-;netconsole selftest: netcons_AGujw 2
	....
	7.2.0-rc7-01460-g75848acaf136,4,0,254742176,-;netconsole: 45 messages dropped by rate limit
	7.2.0-rc7-01460-g75848acaf136,13,678,254742125,-;netconsole selftest: netcons_AGujw 1

Crash output is exempt. The bucket is skipped while oops_in_progress is
set, so a limit configured for steady-state logging cannot cost a target
part of an oops or a panic.

[1] https://lore.kernel.org/all/anw8Qw8lfeIykski@gmail.com/
[2] https://lore.kernel.org/all/20260810-rcu_task_shrink_lruvec-v1-1-4d9f7d5251cb@debian.org/
[3] https://lore.kernel.org/all/20260810-rcu_task_shrink_lruvec-v1-1-4d9f7d5251cb@debian.org/
[4] https://lore.kernel.org/all/20260813-swap-v2-0-4a625ccabdae@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (6):
      netconsole: add a per-target message rate limit
      netconsole: allow configuring the rate limit interval through configfs
      netconsole: allow configuring the rate limit burst through configfs
      netconsole: tell the target when the rate limit drops messages
      docs: netconsole: document rate limit feature
      selftests: netcons: test the per-target rate limit

 Documentation/networking/netconsole.rst            |  43 ++++++
 drivers/net/netconsole.c                           | 145 +++++++++++++++++++
 .../selftests/drivers/net/netconsole/Makefile      |   1 +
 .../drivers/net/netconsole/netcons_ratelimit.sh    | 160 +++++++++++++++++++++
 4 files changed, 349 insertions(+)
---
base-commit: e6a5d573d24cd375e09d24f136523cb3cc85c9d3
change-id: 20260817-netcons_ratelimit-629b04a73c57

Best regards,
--  
Breno Leitao <leitao@debian.org>

