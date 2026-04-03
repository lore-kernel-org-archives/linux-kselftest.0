Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EBAD531;
	Fri,  3 Apr 2026 19:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775245226; cv=none; b=N+pMuNReyqZqKcAP/Nt4GaKhHrUPyG1cUQpQ1XGmekDsQTZP+s0h9S1DcwKInb4PiEQQ/OPFBb6GIFCgpJfD5g+3KEOSGXvcigd+T/8NXAk6r7INx8p/xTEvh6fm3lkRclZinmye0l7c/X17iuVx3zCPsHfygGz94Mt5zkuOjZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775245226; c=relaxed/simple;
	bh=DPjrTtifdEBaKQw6NVui1Rhd5/iW96MpvVNjDyfpF7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KARINtwjwyIJfyZcEWT+2pdZ2RSlDP/A4QLe/RYs9EMI3A0+hWiII8jALhBs1qOwLSGedSAtdEIOUg6lO0FI3JHNnVS3y3Rdi7UIguqNZLALbT4QNM/OaonLg3iOx7/sT8PiW6+mRm9sh9qPdH5qTxAPOPvvm+lNc/wXE+Mz6Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HN7jXapC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HN7jXapC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DDCC2BCAF;
	Fri,  3 Apr 2026 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775245225;
	bh=DPjrTtifdEBaKQw6NVui1Rhd5/iW96MpvVNjDyfpF7I=;
	h=From:To:Cc:Subject:Date:From;
	b=HN7jXapCcwFpY8190StoaiGbRmNWC5lrpQPE7K9FY3j74OKrf02qlfkIoV/aXzCA6
	 R+nnTVkUO6QMUcxegDG+Pc6SmfC7Tx6AxLh5CqNKzcTBEDvdSD1qwyg0G4H0+Y43S/
	 VfIcZY91k75ZfgO/u8RBtYkGz7TzWbqGUO2GfnzaqJG2yo2rVbX6wTFgj1B704EtUv
	 g1K6aMRViO5wcJhyRzgkvvvKOH6Wa5U+kEs58byvRX5pdojALzwqzF/mRLfHIh61MC
	 gb6OBmWhOMkWgKd/Qc2Q9GQLXSqm2OJ+vhSmApAeuT27X6wpzzW2TBzfLVJU2YYaPY
	 I75l0R3sRRcWg==
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
Subject: [PATCH v2 0/6] selftests/liveupdate: add memfd tests
Date: Fri,  3 Apr 2026 19:40:06 +0000
Message-ID: <20260403194014.3704180-1-pratyush@kernel.org>
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
 .../selftests/liveupdate/luo_test_utils.c     | 189 +++++++++-
 .../selftests/liveupdate/luo_test_utils.h     |  10 +
 4 files changed, 555 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c


base-commit: 98ddd87f9704ef2fc837ec2ca38877c364d8dada
-- 
2.53.0.1213.gd9a14994de-goog

