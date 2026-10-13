Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AB047989A;
	Tue, 13 Oct 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906701; cv=none; b=mUDZkBBkHoIE0aTDnJJZQCInpzdt1z2pOI4H+nUKV2LOkhX8RCZ5JvHm02dlOS09MROtHNMzmPNkdwx9TQn+T7vrS6IPdSrSAWp3yLMwnZqMVuRNW0GpWSFnaoyW4hbjCQeSoGLiuvNPgIjKoTF6fOmwAya8RnN40zxYpwL9f5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906701; c=relaxed/simple;
	bh=jhtcs2kIjofB9uC+ufQCJuZ9QkgVv2ovySVGSOQsRzc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iLGOs9hMoTD6bR9t3zkRSBVDV1GF1jv1YWQWUK4wH2dYB1rUAxwxrwVT3hgZwHH+85075UfwjNyfwcVY3whHN2Y4qn3iZc4ZxDFmF2QzUvGlIr0CPxSIoe6nIk0MhvwuNi+i6maoSJomzZyFEwyixA7RSzYQRaHCxW1WCpDGMO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RGZma2Bm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RGZma2Bm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39801F00893;
	Tue, 13 Oct 2026 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906700;
	bh=3jczBtpOifpDlo5lVRKStdN0xli++8cp5aTz+8ww//U=;
	h=From:Subject:Date:To:Cc;
	b=RGZma2Bm4bFaaPPVwQAjnYAzQVs4nCRiMEjbUyzasr/Oa1VQqyCdeQQ98JyrGt/v9
	 BcNOj4FhUHA1eO/ZpNg6cYbghD3SvKiPdnPTYo8tWF/2xCMCOOhUddr8XPPE5lWDZa
	 Rbfcg7JSShhRXy8RJ1PPKJ5NxieoDUrtowyIgNPNBdYq9f4GiQ2ar0C/VO3XkLB2Fn
	 W0pMmX2Y9/yQX2AM4bKua1RiU7wW+2FnzMWs0jjFTO4gO1voOPkig/0v+jvqCygNNX
	 ysIRzRPHFy9JCbZeZkadSH2Oz8QOL8L+hhF4ja+pTwWFlELgoSrWW/RTQp9xDf3v6L
	 HZJbXUykl2Aeg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/7] kunit: tool: Support parallel test execution
Date: Tue, 13 Oct 2026 16:43:19 +0100
Message-Id: <20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhRzmoC/yXMTQ7CIBBA4auQWUvCT1K1V2lcjHSqYwklUIwJ4
 e5SXX6L9ypkSkwZRlEh0Zszb6FDnwS4J4YHSZ67wSgzaKWNXEvgXUZM6D15iRc8k3X6ilZBj2K
 ihT+/4XT7O5f7i9x+XKC1Lz2FNsNyAAAA
X-Change-ID: 20261012-kunit-parallel-a8a7e3c19a30
To: Brendan Higgins <brendan.higgins@linux.dev>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Latypov <dlatypov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jhtcs2kIjofB9uC+ufQCJuZ9QkgVv2ovySVGSOQsRzc=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLOBbfaNJoXCWc9CbHYXjXBo4m19aT4gdA9SaunHHIsf
 +WyLf1bRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZi3sjwzzj8TN3ufylbNE2O
 Bpw7suVKq+vcnR9mh2/85L/40KYNl94x/JWSdDifz9++k+E986evF9Ie/td+s0V5zeWHL2znGE/
 6wMYIAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently the test execution part of KUnit is very single threaded,
meaning that on larger systems with many CPUs the wall clock time for
running the full suite is longer than it could be.  While we don't want
to run multiple tests in parallel on the same kernel for stability and
clarity reasons all the tests are being run in a virtual environment of
some kind so we can achieve better parallelism by splitting the tests
between multiple simultaneously running virtual environments.  The KUnit
runner already has support for splitting tests up and running either
suites or individual tests in isolated guests, build on this to support
parallel execution.

While developing this some existing issues became more visible, some of
these are fixed with some standalone patches at the start of the series 
but I split some issues with test naming out, these were sent as:

 - lib/tests: util_macros: Drop the '.' from the KUnit suite name
   https://lore.kernel.org/r/20261012-kunit-util-macros-name-v1-1-810b401baeb0@kernel.org
 - kunit: Add KUNIT_CASE_PARAM_UNIQUE() and KUNIT_CASE_PARAM_WITH_INIT_UNIQUE()
   https://lore.kernel.org/r/20261013-kunit-param-names-v1-0-4b22ec5b85b9@kernel.org

Performance results with --alltests, using the elapsed time reported by
the KUnit runner with an already built kernel on a Raspberry Pi 5 with 4
CPUs and a Graviton 4 with 192 CPUs:

                     default  parallel  per test   parallel per test
  Raspberry Pi 5     67.7s    49.4s     836.4s     326.5s
  Graviton 4         64.1s    30.8s     445.9s      39.7s

Even with the overhead of having to boot more kernels we are seeing
substantial speedups, even on lower end systems with limited parallelism
available.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (7):
      kunit: tool: Preserve failures from kernels without test results
      kunit: tool: Combine reports from isolated kernels
      kunit: tool: Boot with a larger log buffer when listing tests
      kunit: tool: Add an outfile argument to run_kernel()
      kunit: tool: Allow several run_kernel() calls to be in flight at once
      kunit: tool: Serialise output written from multiple threads
      kunit: tool: Add --parallel to run suites in concurrent kernels

 Documentation/dev-tools/kunit/run_wrapper.rst |  11 ++
 tools/testing/kunit/kunit.py                  | 151 +++++++++++----
 tools/testing/kunit/kunit_junit.py            |   3 +-
 tools/testing/kunit/kunit_kernel.py           |  78 +++++---
 tools/testing/kunit/kunit_printer.py          |   9 +-
 tools/testing/kunit/kunit_tool_test.py        | 253 +++++++++++++++++++++++++-
 6 files changed, 438 insertions(+), 67 deletions(-)
---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20261012-kunit-parallel-a8a7e3c19a30

Best regards,
--  
Mark Brown <broonie@kernel.org>

