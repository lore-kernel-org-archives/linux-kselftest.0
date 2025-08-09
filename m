Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D436613D246;
	Sat,  9 Aug 2025 00:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754698328; cv=none; b=QjwWYpJgZT7ZjUaqK6XoybaPIWjPf/feT+raik1JeGEkNaNZ9GEXCN6s8M7CyTLOohx0iF0iWy/PZJc/2lagXRhnK9k7pMYECCD1F/Zp6iUwZVRvWb5eSbBEKWz4fAQUC46Qy/m/ANXiwQ9UqKYBuilqKSUP1fSv8IF0cqe/Gag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754698328; c=relaxed/simple;
	bh=fF3Y3oI+s+TvA2iYO9mSEciYU8hRJZWReywCtT0BEfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qg//6eQcJPI15YvhLzLiAHk7OyopABammX8pMxs++0sgpVcA9skb+lQisyl3FrojUoJN69A0P4S7CQzPa5DO5t9wurVS8PTN6u/vZVGvBJNeMr5UL94osHMyt5TF7df9Nx9SmTEMaidgxX+hJRDuT1K8i2n1At1jdlaKwX083u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XugAe3Vk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XugAe3Vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054DAC4CEED;
	Sat,  9 Aug 2025 00:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754698328;
	bh=fF3Y3oI+s+TvA2iYO9mSEciYU8hRJZWReywCtT0BEfM=;
	h=From:To:Cc:Subject:Date:From;
	b=XugAe3VkBPWeQT074c38SJDgIgz9/UVpZkliIEln4Mly7UudAbX3Njt+KxAg/ci+J
	 Nj+7FfSQMZNTd5IlbBVna+fITgYmD3SIMMQTNbLRThDpUFGqQHbtxrV+SjJZc39ZsV
	 A8mpMAq66TCPgluNuXM7AFlet0hLISjq34444byXcwajkHkL8t0G7fAPdMPD5SPcGJ
	 jD32R1hUC8UNTAss9Silrxuh0GVBmIDZvIxrFoyEui5jWJWhJsdHnPDCjY2CQH0zIF
	 f5bHiuILNXtXKmTgeSJ6pL7QxVlIZUSW/2s2NHQ1o162c1r/fuT3NubjHNLdoXP6Pq
	 3RJWbx5zOp6WA==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	willemdebruijn.kernel@gmail.com,
	skhawaja@google.com,
	joe@dama.to,
	sdf@fomichev.me,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net v2 0/3] net: prevent deadlocks and mis-configuration with per-NAPI threaded config
Date: Fri,  8 Aug 2025 17:12:02 -0700
Message-ID: <20250809001205.1147153-1-kuba@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Running the test added with a recent fix on a driver with persistent
NAPI config leads to a deadlock. The deadlock is fixed by patch 3,
patch 2 is I think a more fundamental problem with the way we
implemented the config.

I hope the fix makes sense, my own thinking is definitely colored
by my preference (IOW how the per-queue config RFC was implemented).

v2: add missing kdoc
v1: https://lore.kernel.org/20250808014952.724762-1-kuba@kernel.org

Jakub Kicinski (3):
  selftests: drv-net: don't assume device has only 2 queues
  net: update NAPI threaded config even for disabled NAPIs
  net: prevent deadlocks when enabling NAPIs with mixed kthread config

 include/linux/netdevice.h                            |  5 ++++-
 net/core/dev.h                                       |  8 ++++++++
 net/core/dev.c                                       | 12 +++++++++---
 tools/testing/selftests/drivers/net/napi_threaded.py | 10 ++++++----
 4 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.50.1

