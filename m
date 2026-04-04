Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98D329E47;
	Sat,  4 Apr 2026 10:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775298303; cv=none; b=LFProgCEa8vm8ghAF9Lo62sknEGtnoEmBUGoY/eGCB3Y3Y6Z4K25BlgIUsrhoC1hXokYaPgG9xvFLO4t7lLyV2dHRrYhmZZ/QkZ5LSVq7MnbFZ/cy6ejc4QVqq3lvTJQ/hE9WrFFkEyTgVjUhRewWKMOB5TVKra8I1QqymRRTlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775298303; c=relaxed/simple;
	bh=ByOnS4HzfTTQZAhJJz0SxZtaNSu6NrKjsBAusN0AUIs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W89mLlK9rvPw/gtYTdB3WNn5YXooPEYHSNnktx6EQwFpBBJNoe0ra3OQhLbrL/SEH4UFPey1CMCR1Cd+3gi/uEgE/l9AEB/ZqGH370SYEosE+cBOaq8igf8RCrOyN7q0suf+mTALwbzwPcKMYFoYpoS4DtDe/FvbuF46l8RINzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ARqHXi/t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ARqHXi/t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F80C19421;
	Sat,  4 Apr 2026 10:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775298302;
	bh=ByOnS4HzfTTQZAhJJz0SxZtaNSu6NrKjsBAusN0AUIs=;
	h=From:To:Cc:Subject:Date:From;
	b=ARqHXi/txN5TnqjmiEtATZ5YeyNFtrgSqgAOXqm2MIXFiMtNrcNH4JY8A6iuwObax
	 KBBcbC2KKFqd9QnITYW7rB4TVbeSb7xvC9sFCxKuoBL4gA6N8DivPVHO/peSMLTD/+
	 gQ3zDiN4pjSoZCcqJhBr4+zI8yJWGLd3wt0QKQ4P9AkHz7JLhvHQqTtx5SZe763dWj
	 qxxGiayspP6LgIGcl7D7Amrc3O/+leWsUJ2GWKOCQfG8IOYQxRWkjRQZxGdb1UIWBt
	 VSkizps2OPJYNz48d60nT5uUKCHuNFLwH3gby/k2Ssc8LwNMEbOcey0tpWBaN6Z1X8
	 n6AUEN1OxBn3w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Usama Arif <usama.arif@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v3 0/6] selftests/liveupdate: add memfd tests
Date: Sat,  4 Apr 2026 10:24:43 +0000
Message-ID: <20260404102452.4091740-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Hi,

This series adds some tests for memfd preservation across a live update.
Currently memfd is only tested indirectly via luo_kexec_simple or
luo_multi_session. Add a dedicated test suite for it.

Patches 1 and 2 are preparatory, adding base framework and helpers, and
the other patches each add a test. Some of the code is taken from the
libluo patches [0] I sent a while ago.

[0] https://lore.kernel.org/linux-mm/20250723144649.1696299-33-pasha.tatashin@soleen.com/

Changes in v3:
- Retry on EINTR instead of giving up in read_size() and write_size().
- Use O_TRUNC in save_test_data().
- Return the value of write_size() directly in create_random_memfd(). No
  need to check errno since write_size() already returns -errno.
- Save errno before calling close() in create_random_memfd() to avoid
  overwriting the value.
- Use memcmp() instead of open-coding the comparison loop.
- Return value of test_harness_run() from main().

Changes in v2:
- Drop LIVEUPDATE_DEV since it isn't used.
- Split luo_fd and stage declaration on separate lines.
- Split all 2-stage tests into helper function for each test.
- Fix wording and argument order when LUO_DEVICE fails to open.
- Rename verify_fd_content() to verify_fd_content_read().
- Advance buffer pointer in {read,write}_size().
- Add a check to make sure current working directory is not on a tmpfs
  mount. If so, skip the tests since saved data files will be lost.
- Rename RANDOM_DATA_FILE and RANDOM_DATA_FILE_FALLOCATE to
  MEMFD_DATA_FS_COPY and FALLOCATE_DATA_FS_COPY respectively. Also
  update the file names to reflect this naming convention.
- Collect R-bys.

Regards,
Pratyush Yadav

Pratyush Yadav (Google) (6):
  selftests/liveupdate: add framework for memfd tests
  selftests/liveupdate: add helper functions for memfd tests
  selftests/liveupdate: add test for memfd content preservation
  selftests/liveupdate: add test for zero-size memfd preservation
  selftests/liveupdate: add test for operations on a preserved memfd
  selftests/liveupdate: add fallocate test for memfd

 tools/testing/selftests/liveupdate/Makefile   |   2 +
 .../testing/selftests/liveupdate/luo_memfd.c  | 355 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 191 +++++++++-
 .../selftests/liveupdate/luo_test_utils.h     |  10 +
 4 files changed, 557 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c


base-commit: 98ddd87f9704ef2fc837ec2ca38877c364d8dada
-- 
2.53.0.1213.gd9a14994de-goog

