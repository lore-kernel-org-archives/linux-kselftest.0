Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8020B4CE66A
	for <linux-kselftest@vger.kernel.org>; Wed, 30 Sep 2026 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767759; cv=none; b=jLne+XRpo8No5IdolOTpeQZj3/x2LQiYH8hQ0lPyH4jGaXAzIqnRLMpwj9zIYC7RHAWkQ2WgAyKjxOc00B314JwFCW7lMPKsw6t3+CrggTpJrNCsyLxkdbyA4NhadoRT9s3pPd4D91NFL89nZDjPDYBalm4NExrfMLX1RVUQg7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767759; c=relaxed/simple;
	bh=gKxfXi6cGkNr8XZEL8GYYlQjifo9+vQaVfMR50Nbgos=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dFkztbP0JSUuqqFvdtjgvz/kjIcwmhN2ojzB/Sb1w0cGCt1as9K0gTtDNarTLHpzhxyKNvDGSDpEQzFI0AUN+n5sIL6h6ep9J0G1zJ62IwsrRKtHPLwENcPS69Kyh4EpUUeN/zxzpaK9WAZw+7CAAmpLKIoF3gilKo3uWQDIXO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com; spf=pass smtp.mailfrom=runtimeverification.com; dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b=Voe0K2j/; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runtimeverification.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runtimeverification.com header.i=@runtimeverification.com header.b="Voe0K2j/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=runtimeverification.com; s=protonmail; t=1790767748; x=1791026948;
	bh=pbMuE/pbDKt9eWQNn14OeJncPEf0UJI7mrx1M/pPJ00=;
	h=From:To:Cc:Subject:Date:Message-Id:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Voe0K2j/gsMIpKV6G2aDzA+mLgb33k1+kA/FD4zN9GaR0t5Yh01PYzumjp9ndrwfM
	 60bl0B8uo/Bc6WNbkBQFIMPIzA8nQn81Vz/Kgvt2aBwu7aUqunH584Qko1YxRFjVnA
	 SXelaXdx5mxa1IyDZB6qCIpEC1dJfsPMWZQbGOCpyfOEmth5L3d1eCwr9ZbW1xvtFd
	 oUmxShsYmqH1FQZLUtHq7hjeUQ2d4xYtJ17ENpAGW2hU+AmP3Xp2KUzPf1m0rNtbRj
	 ZZ1TrxV0x8Vl+NRSrsEEbtRyxMmyzFR4Z7bTyYC8Su0RMkCzRbxeRnZpishNklvqqM
	 oH/liIaieS60Q==
X-Pm-Submission-Id: 4hvt9C1ds9z2ScDC
From: Natasha Klaus <natalie.klaus@runtimeverification.com>
To: Christian Brauner <brauner@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Eric W . Biederman" <ebiederm@xmission.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Natasha Klaus <natalie.klaus@runtimeverification.com>
Subject: [PATCH v2 0/2] userns: reject out-of-range uid_map/gid_map values
Date: Wed, 30 Sep 2026 14:28:52 +0300
Message-Id: <20260930112854.373184-1-natalie.klaus@runtimeverification.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_write() silently truncates uid_map/gid_map/projid_map values above
U32_MAX modulo 2^32 on 64-bit kernels, so e.g. "4294967301 1000 1" is
installed as "5 1000 1" without an error. Patch 1 parses each field
with kstrtou32() so such values fail with -EINVAL. Patch 2 adds
selftests for out-of-range and negative values in each field and for
the unchanged in-range path.

This makes the parser more correct; it is not a security fix.

The patch and the selftest were drafted by Claude Code (Claude Opus 5.5)
in an interactive session; I reviewed, built and tested them. The
assistant flagged the truncation while reading map_write(), and I
confirmed it by writing to uid_map on a running kernel.

Tested on v7.3-rc5-37-g551c722f4080 under virtme-ng, x86_64 defconfig
with CONFIG_USER_NS: all 12 selftest cases pass on the patched kernel.
On an unpatched 6.8 host the four above-u32 cases fail as expected,
seven pass and the root-only case is skipped.

Changes in v2:
- Parse each field with kstrtou32() instead of simple_strtoull() plus a
  separate U32_MAX check (Eric W. Biederman).
- Selftest: add negative values in each field, "0 <uid> 1", the
  largest valid first id, a line with extra spaces between fields, and
  the largest count written by a privileged parent (Eric W. Biederman).
- Describe patch 1 as making the parser more correct, not as hardening.
- Rebased onto v7.3-rc5-37-g551c722f4080.

Link: https://lore.kernel.org/all/20260928072537.115668-1-natalie.klaus@runtimeverification.com/

Natasha Klaus (2):
  userns: reject uid_map/gid_map values that do not fit in u32
  selftests/namespaces: add uid_map/gid_map range tests

 kernel/user_namespace.c                       |  29 +-
 tools/testing/selftests/namespaces/.gitignore |   1 +
 tools/testing/selftests/namespaces/Makefile   |   3 +-
 .../selftests/namespaces/uid_map_range_test.c | 299 ++++++++++++++++++
 4 files changed, 328 insertions(+), 4 deletions(-)
 create mode 100644 tools/testing/selftests/namespaces/uid_map_range_test.c


base-commit: 551c722f40809618230001baccf219193e22fc5a
-- 
2.34.1

