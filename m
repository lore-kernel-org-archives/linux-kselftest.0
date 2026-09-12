Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8893A8FE6;
	Sat, 12 Sep 2026 20:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789243490; cv=none; b=qKaOLlyisE1yHahmdZliM3z7KEELsRYH/0YFlolf4t2kkdC/ozIxZC9AsILAnUddKDFp02Y8i6VFlp2vwXqGERJx8jNtDjJvOoImq/3BJ9pZE2NG8YEPnJ55VoVmUkEBd05maxd/SmNwa+2G9thB97USZaz36BjU3PlWJSa+sPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789243490; c=relaxed/simple;
	bh=ZGBkcg/CotUkXuFJqvq1oy6aRlrVDTSD0Sb9RpUeZek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XVeKQNfbQbTnogYxJE5IjuwBvRMwfKaqs7/uwOtpQH9a6rbiKhgznvNSg8h53r6TX7Os1b2DcPGYvC7zexqMx8FVsVI31tvq6qiGpNKJfKxWZPL7Edv7Tps/x8q5tGoeqwuKkWlz/+9GSYzUcv6cvMP6Ud1whhzviWHH+se7bDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOqc0HCb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOqc0HCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926111F000FF;
	Sat, 12 Sep 2026 20:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789243480;
	bh=kPdQOt5UkB3R6qDNT2KZ/ai+Nhh2TS7DjIJZ1fKJP1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eOqc0HCbRxRfiAZV1YcCJuH5rNMs9qsW0+WsSLxXCPd2a1KG+dndPORCDjzHY9RWe
	 ZEtt8+zlzMAC7MCG705JfHhCYJbB7zyjErXPFKwqwxylj9kXiYAZvix2HJojvl1COr
	 zuP6PvFh5AW7KrMuVaV2HX9mJRRjfqvsgO0vStyY6PFwWRL/Mq8VURVg3b5PQE/+E7
	 lrvL+Ylcpq54Li2I2efql6Db9NZcS2crUJ2w2BiOycDad+iQnvbhxuUsNg9HQNpVGt
	 y17t6ubHWPsmmJsQb7dnZWrZQOKB0WwNKIUXbCay36pgKGH1R4pnwamRgU6GOhHpxK
	 ZEm6IdNWHplDw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	daniel.zahka@gmail.com,
	willemdebruijn.kernel@gmail.com,
	donald.hunter@gmail.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 1/6] selftests: drv-net: psp: fix linter issues
Date: Sat, 12 Sep 2026 13:04:21 -0700
Message-ID: <20260912200426.121025-2-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912200426.121025-1-kuba@kernel.org>
References: <20260912200426.121025-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix ruff 0.16 warnings:

  C403 Unnecessary list comprehension (rewrite as a set comprehension)

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 tools/testing/selftests/drivers/net/psp.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/selftests/drivers/net/psp.py
index 315648a770d0..5e87fb50c348 100755
--- a/tools/testing/selftests/drivers/net/psp.py
+++ b/tools/testing/selftests/drivers/net/psp.py
@@ -525,11 +525,11 @@ from lib.py import ip
 
 def __nsim_psp_rereg(cfg):
     # The PSP dev ID will change, remember what was there before
-    before = set([x['id'] for x in cfg.pspnl.dev_get({}, dump=True)])
+    before = {x['id'] for x in cfg.pspnl.dev_get({}, dump=True)}
 
     cfg._ns.nsims[0].dfs_write('psp_rereg', '1')
 
-    after = set([x['id'] for x in cfg.pspnl.dev_get({}, dump=True)])
+    after = {x['id'] for x in cfg.pspnl.dev_get({}, dump=True)}
 
     new_devs = list(after - before)
     ksft_eq(len(new_devs), 1)
-- 
2.55.0

