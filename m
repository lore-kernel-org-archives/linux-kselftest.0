Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58574494839;
	Thu, 10 Sep 2026 13:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048000; cv=none; b=edGNJAYTr9Pq31AkLcba4DPoVyTPCjxiMnDfu3/7Sl8zUVdNhnP6G7Ar/yaqPvjuioyQvmx9D56C3KfWegsHeGaS31emW4wXu0aOCZ2cun0RP34DimIAFsqnY7hHttbCxbDM0Sw0n7qmIemGgQpflg423wPikLw36oFtXDc7rBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048000; c=relaxed/simple;
	bh=AUkXD/rFmYPtCqqzAsWncUxZK0KLle4j6rAaoF5LEDE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9PY1miQnVjtYTz2ZtM5GGrWiBEhViDDcpaKn/J4pCP6NeI17HqZ9GC7RmcINTbJ9/NYx3TLuMQSxIegMZ9+tJdlmS54a6WZsYhupg3etIHgaiId4PJG4QdalUV2Dzpa6cSv7SoNTPOKfcUChC9/ewp/ozqya2LCoNN4BUsu3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ThS9jBxE; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="ThS9jBxE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=x/dPzdX9SZpdJrsIHbzEoIUdQCJTs8nVvTgtVxAxF9U=; b=ThS9jBxExUNZ7rwq3HrOi17UmZ
	/i+WEzaimzU5cDZdvA4KZGkw08PlBooIcsqY0EKo6yD4jGWLdFs4tZYtdeLAIDjYpB98sGdVdOz8Q
	f7M9Mnleo7i/6PSZeEJIgPqyaihWLctSnH6jy1w1fqwG2zL0CWs9rd9xvSPog0Xj49X+knqOThVvq
	ya/bsS6D0czByHThCrcNv67rOZWzWxyUyJrHODoMcXh7r6RKUD/DwHHpw0C1c3utGhmQVREQuoaKJ
	ZveLKkQfg5L75VOf9V8Xzg9yo6g93fkzK4vmHgfvKZwazFFuf3XNK1/YWuG2HzwiCp9SDmDvESdtw
	eQfwyHhw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x4f6i-000YHf-2R;
	Thu, 10 Sep 2026 13:46:29 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH net-next v2 0/4] netconsole: Support messages ratelimit-ing
Date: Thu, 10 Sep 2026 06:46:09 -0700
Message-Id: <20260910-netcons_ratelimit-v2-0-ebf0dd91e26e@debian.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKG0omoC/23N0QrCIBSA4VeRcz1DrU3nVe8RI5yetgOloTIWY
 +8ejC67/uH7NyiYCQtYtkHGhQqlCJaphoGfXZyQUwDLQAnVCSM1j1h9iuWeXcUnvajyTvWjuDh
 99q2GhsE744PWw7xBxMojrhWGhsFMpab8OWaLPPrPNX/cRXLBjW+DClJr0/trwJFcPKU8wbDv+
 xeySZjSvQAAAA==
X-Change-ID: 20260817-netcons_ratelimit-629b04a73c57
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, paulmck@kernel.org, 
 gustavold@gmail.com, asantostc@gmail.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 kernel-team@meta.com
X-Mailer: b4 0.16-dev-f8e9d
X-Developer-Signature: v=1; a=openpgp-sha256; l=2699; i=leitao@debian.org;
 h=from:subject:message-id; bh=AUkXD/rFmYPtCqqzAsWncUxZK0KLle4j6rAaoF5LEDE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqorSv0nPvhImQizWFrx+LXLzla8sHJh3/OCHNd
 ycX6fETru6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqK0rwAKCRA1o5Of/Hh3
 bSL2D/4xIpguvU7M/DmY95shqgvrbjP0BvMqw9YOmFy44uDoLwjV9XMXL/5r/7pLDoroaXm0ot0
 iwmKlSxVdVP/CyFkZq05WT2RMcm8R6wBhhSARym1fyZRULYEfO4Yg0TJopQTHGRVHsXLuV375+Z
 ON7tCbNl6B+pv4zJoBgGJdlacM5Q/FDR5cpJtGJ4MfRuppQ4oLElou+ivgKyzQqP9HKQStJS7wU
 UdhtzVS14lEPfdyyEUSpFk3oP34fJLKmDerKHup8rYAu+s9xnmWO1xT8slwO5IKvJMNAjO5wPZY
 JAF62g0KX1jv0De4dbgw3DWOy+Kv78soQCifiIbenPbbzCxVCEWl9n06Ss90pkoOJFL4FgTsfum
 67b9kaKLWFbq+jW/8rgLXiRWAsAMiex8LHN0MnfQHmfwep9VNjY+ex2MVYy1p9LErjw2V8myZCa
 5VV+1PdPf0qv98AXO25qcVMfudwj13jUQOIzd4+Tp6Z3a2gZKaV9DQ2vBV7aX6wlhzWPDmNfVoH
 0GaC2AsdXuswX/4U8YZWCchBHu65IY9baXe7fjhVLdJAdxzQloKRiH2bH/OZ25vknziLTesMUdg
 LoUgBIAC8SHkuNShBTFLUqvC3s0wnj+9JrYbD1IxbK9GbNHddgEe8B4dWLb7qGyCeDySiiyJjhJ
 EvCnu3P4uKfAtMw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

netconsole hands every console message to every enabled target, with no
bound on the rate.

At Meta, a few hosts caused some DoS and netconsd was OOM killed in
some regions, fed by 3 billion RCU messages from thousand hosts and by
a swap fault that retries forever, which logged 6 million copies of one
line on a single host in a few hours.

Both floods are being fixed where they are printed, by Paul and me for RCU
Tasks [1][2] and by me for the swap fault fix [3], but that only ever
covers the flood already found, not new issues that might be happening.

Use the ratelimit in the kernel to ratelimit messages from netconsole.

Give each target a token bucket, consulted once per message so that a
message split into several ncfrag packets is sent whole or dropped
whole.

It starts with a zero interval, which struct ratelimit_state treats as
unlimited, so nothing changes until ratelimit_interval_ms and
ratelimit_burst are written.

What the bucket discards leaves nothing on the wire. An extended target
sees the loss as a gap in the sequence number the header carries:

	7.2.0-rc7-01460-g75848acaf136,13,628,252392647,-;netconsole selftest: netcons_AGujw 1
	7.2.0-rc7-01460-g75848acaf136,13,629,252392782,-;netconsole selftest: netcons_AGujw 2
	7.2.0-rc7-01460-g75848acaf136,13,678,254742125,-;netconsole selftest: netcons_AGujw 1

Crash output is exempt. The bucket is skipped while oops_in_progress is
set, so a limit configured for steady-state logging cannot cost a target
part of an oops or a panic.

[1] https://lore.kernel.org/all/anw8Qw8lfeIykski@gmail.com/
[2] https://lore.kernel.org/all/20260810-rcu_task_shrink_lruvec-v1-1-4d9f7d5251cb@debian.org/
[3] https://lore.kernel.org/all/20260813-swap-v2-0-4a625ccabdae@debian.org/

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Drop the patch that sent a "N messages dropped by rate limit" notice
  to the target. (Gustavo Luiz Duarte).
- Link to v1: https://patch.msgid.link/20260818-netcons_ratelimit-v1-0-8c5d2d17789c@debian.org

---
Breno Leitao (4):
      netconsole: add a per-target message rate limit
      netconsole: allow configuring the rate limit interval through configfs
      netconsole: allow configuring the rate limit burst through configfs
      docs: netconsole: document rate limit feature

 Documentation/networking/netconsole.rst | 38 +++++++++++++
 drivers/net/netconsole.c                | 99 +++++++++++++++++++++++++++++++++
 2 files changed, 137 insertions(+)
---
base-commit: c68a982815dcce5464e3bf2a31ac94f5146c04ca
change-id: 20260817-netcons_ratelimit-629b04a73c57

Best regards,
--  
Breno Leitao <leitao@debian.org>

