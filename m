Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B159392C40;
	Mon,  9 Mar 2026 11:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057291; cv=none; b=CWydr88sCTbAa+e5Qhp8OmOT0ysPqcCh+DznTCDTu/46fBk0HbybJtVsZ8WvmDcfEEI4HDuu25+4MfahpwQ7C/dj+bQha4i3zLT+PGk4+YBrNlVXYjlrYRo35YmqGxF8TMgE9nlfaZnkuI84vJBODDhB8pUkfeHmTgAqUUe6CJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057291; c=relaxed/simple;
	bh=Ddb+El3YDgPpuwIWODCSXmi4I1hpKgUou8IoTA7aR0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QB2R0MXjpOFuvHBnOubJEQ+GvsVsHMX2Qx5ovysnZpv3OrRT/8yzep1OsVEEB0cDL1cUWgmwcyaBIqUHUg2ETy2QP/8gYqMnBM+syQYIDeOD9tutweTy55+gRTvrR+VdOXPzZtm7Qevdra5PJcB4qxhTtnw06lTmb7sX91LRQNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sSk3ziS2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sSk3ziS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC4FC4CEF7;
	Mon,  9 Mar 2026 11:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773057291;
	bh=Ddb+El3YDgPpuwIWODCSXmi4I1hpKgUou8IoTA7aR0Q=;
	h=From:To:Cc:Subject:Date:From;
	b=sSk3ziS26djj8bwpKG0AaOZ7yAiinOp1WrjYXqDKQNwujipdA2xP8J3TbIRUoKQtZ
	 ju4hZeEPLmNnjWHBTXlef2+vWJlp+KLFvRyHJ464pcL38vZiG8I6TZeRp40CTzEnHX
	 /gzRcoNO8WuhPh7s/zOfIkFL7s94Rfjz4dWSAHDPAtooY5SXe6zkrTG1Lfyeh9V5N3
	 rN62j3cRqIgehyd4cF/XtjD3zhwMpN+/zjSOQ4v8Biadu0/h9ZYSB9TOJDEs6ByaF6
	 SIx7+NZmlR43vPW70gyVmzt0H7DA5BSZkrLfEP5iVoHE0bTucLUX2dF6aVVx7J50n4
	 2LtiBvWDj4r4g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/6] selftests/liveupdate: add memfd tests
Date: Mon,  9 Mar 2026 11:54:33 +0000
Message-ID: <20260309115441.266805-1-pratyush@kernel.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
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
 .../testing/selftests/liveupdate/luo_memfd.c  | 306 ++++++++++++++++++
 .../selftests/liveupdate/luo_test_utils.c     | 175 +++++++++-
 .../selftests/liveupdate/luo_test_utils.h     |   9 +
 4 files changed, 491 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/liveupdate/luo_memfd.c


base-commit: 6f04517c06a898228eda00cbd8573d9e84003108
-- 
2.53.0.473.g4a7958ca14-goog

