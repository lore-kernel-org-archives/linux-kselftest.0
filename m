Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793065938;
	b=NCw1VA3tJWuLyaIdXQwJnvXbA/U13bQsi0AM8Oi246YsRtn0VciINOt/CwkSjzpGfebq
	 yGj7xv6+38/REw2oFPKeWxoTZrTw7eM2FX6vvmgHbGJ8zL3QfOz7n2lQuDNpzYuAnGxCX
	 xZqJlUr8eCEZTZkJUYUN+QztJZnnKzyxNKviLNk7MT4epeb7fizlNErx6lej2NxnZ5PdD
	 j9NP6TEMMumTBhyBNkVlGG0PF1rCXTs1bNe5yq9FrSKBYwgUjJHnrAxgHrUNvdcC9jAWA
	 O9IyQykNNAdIcIdMB1eLAvSe9GjDqc+FguNCrHElzGug9ci3qdU6VUeIXQCZM9LrWBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793065938;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9irWA7DB/pgiQwqP4jOs2zBv4A7WGObJHd6iCXZX84g=;
	b=KXUGIGmg1d6bT6Ny+goSeHdc1yPsaYbSiZsg5otYEZIMMCTDZpv8qg7ZvptLHv+6ZPni
	 +LRcjxvaBsb16XZ+pYb1GydMSAxZG0+KYuOF+mtmQkBBsn7jaDz3qn4TVv3HtA0j6hcMq
	 OWTKg2hQwLkg0p6XyrNSjzoZrlT6w0oyuHZi7guUldpqWxUbWlmTYfG2p19lmhahJFbPK
	 SSKaX4ghI1t6dOXq+57j9+tq0esKyfoPgRWCAMNHzwBBDslLq5OnyzAHox2h7/v3dnoZ2
	 Th66PF2ADQMKYMCp6louO646eZehvG3dYiRgoxjeYR6qOPSO+zBrbYlErCtnzhNAeyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNEHxG1z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2FE606A31A;
	Tue, 27 Oct 2026 01:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNEHxG1z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 541951F01829;
	Tue, 27 Oct 2026 01:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793065937;
	bh=9irWA7DB/pgiQwqP4jOs2zBv4A7WGObJHd6iCXZX84g=;
	h=From:To:Cc:Subject:Date;
	b=hNEHxG1zBsdyKvR9+CY+8ZIesyv1+JpP+xqeVsEIVM9BfMK5v+vuQBh8IRK0+qolY
	 UMxpjPkyPgjgLv2MOaQfvksOe9X69JwkTw4C4/2p8ZDrNbJ8YtJPZXEpjGMkTycbUC
	 T28FzdjX31qPRuGKL3CPBs3wigRizXwux8S2LSTBbhvWCQxTQfVHeOb5g5Ejev2NTJ
	 Uow1sEgwWgF5aFgUJ2GhASrfRfMWuY37RXHqMrZ5OiGQezOCya3f7HgluSaspRfOqe
	 5FFxgCMSXFCE7nmCzwpvDK/ZwQ/6fwWZqjCDdG5fCQeB6T8a3dSQw//bO0XnE6xZb9
	 ABpTBUCsDSSxw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sd@queasysnail.net,
	john.fastabend@gmail.com,
	shuah@kernel.org,
	cel@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net 0/2] tls: Honor O_NONBLOCK in tls_sw_splice_read()
Date: Mon, 26 Oct 2026 18:52:13 -0700
Message-ID: <20261027015215.605919-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extract the O_NONBLOCK fix from Chuck's zero-len record series:
https://lore.kernel.org/20261019-tls-follow-on-v6-0-ab01c4ecca0c@kernel.org

The first patch carries the fix. LLMs love to point out the missing
O_NONBLOCK as a risk for the zero-len record change so let's get
it out of the way before working on the zero-len record fix which
is more complex.

The fix itself is almost unchange (I deleted some parens),
the selftest was fixed up a little bit to appease the LLM
reviewers but also no substantial change.

Chuck Lever (2):
  tls: Honor O_NONBLOCK in tls_sw_splice_read()
  selftests: tls: Cover splice on a nonblocking socket

 net/tls/tls_sw.c                  |  9 ++++++---
 tools/testing/selftests/net/tls.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

-- 
2.56.0

