Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2C44C64B;
	Wed, 12 Aug 2026 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786554788; cv=none; b=TRHQOsb4s0ctdirO6YXMBd8V+rLTyjaeK0UVgZFPE0vhHZJC5Ek525q7FhJQcO1Qdb5tBYiooWgmV3tpw68CEnhQZCerA9TCjfUsn1+uWXTRfufFV3q8dEFXYqirbSD2zVuc95IdcokeWtfmK7K9WllVJLqJA9uftGPHBnS6yDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786554788; c=relaxed/simple;
	bh=NUHakfA5wOaNFH8m//BZvSNhsW/jL5A7W4If2h3ougk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZezKzvw6h801ZxqYnt0XY9+XxAY1E8hEtmQNgGWw/0TDz4FVugAalnhfrINhasFkdz8gFEmgiFK1jt6Eb+a7R8Wt4abj9pjy1fCgMsYJk6smLiwgdHZYwqt7eIuvj47LSyhJ7D08wT8N7ZtYPdQM8UJOr4LBpAQ3bpYxSRkMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgHjjHJ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgHjjHJ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116111F000E9;
	Wed, 12 Aug 2026 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786554787;
	bh=ySom+W35hlbVdgG0O/drnvFh8xIclA9qmbIcooWrXSk=;
	h=From:To:Cc:Subject:Date;
	b=GgHjjHJ65X/bgXSYdUN/PQ6LF50mhvDMLV36CnTgvpFwtcEI0JhtfNWPrcw/ZhR2s
	 JG/PJT1/X8eAK0h7DjTDkd8HoUSzU/ILvsgfD9GLfWgrH1XrFWkmdE03EaHPcWIRqY
	 Xb+/5Awzo2cUZJcNyj5o8PnS1+fAtvTMvxC/+kSGnKR459B6oT6tNovFbXZvzLnxuy
	 YAsK7b3r4f/xv9wNFq0CeHKW/bj3KMnDc71Iw5QGx5tWSOlkFv4XyO7u1P0AYQ1Z9v
	 dW1HbqG2OYmHu1ThyeotqwJvT45V6G6XZUeIW3GXQLhZCcJHNPiTbXo+7lNWSid1VZ
	 hEBUR1PX4xRig==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	noren@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next] selftests: drv-net: bump the timeout to 15min
Date: Wed, 12 Aug 2026 10:13:02 -0700
Message-ID: <20260812171302.1888667-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GRO test takes extra time on NICs which support HW-GRO and LRO
(as it also runs the test cases against the NIC implementation).
gro.py takes 6min on bnxt and 10min on mlx5 with debug kernel builds.
The delta between drivers is to some extent due to their defaults
(mlx5 sillily defaults to queue-per-thread, while bnxt follows
netif_get_num_default_rss_queues()).

At the end of the day the defaults don't matter much - on larger
machines all drivers will create more queues. We should bump
the timeout. Let's give ourselves a 50% margin over mlx5's needs
and set the timeout to 15min.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: noren@nvidia.com
CC: shuah@kernel.org
CC: linux-kselftest@vger.kernel.org
---
 tools/testing/selftests/drivers/net/settings | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/net/settings b/tools/testing/selftests/drivers/net/settings
index eef533824a3c..e2206265f67c 100644
--- a/tools/testing/selftests/drivers/net/settings
+++ b/tools/testing/selftests/drivers/net/settings
@@ -1 +1 @@
-timeout=360
+timeout=900
-- 
2.55.0

