Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793637778;
	b=Y4aSENPulxlFtCvS89xIxoKjMHqOMBapAsYjcY6zcLEFb4PWi5IKYqjZErx764rqZPU9
	 GPnaRmK7XyaOTr3VCWFdCqGBmdeieOsxzwk5QkW+dep2eFqfpzuXfzNdvY7wv1hsEf3gs
	 1SVzwn63xq3iLqgfRZv4IGWyrcFP2DDBA8eYNP5F4/Wyf4N2qwxICPUt5f9e51bXogtbI
	 ntB/ZnkUOSzIk6rheTmv3o8gLewgoTuwSoq5o1Sq0bLsM2d812PdGIXfryim8XnGDOiIq
	 jRovXCznH/+RXLT0zQGQfOq6ptU4Crg0jKoyW48oXv6T8YJe7LzQALJvQAG/EfAUmCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793637778;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hamBEuV7gXRtKOsQfWyZlxR5aAN+CtsuFbIk3kGlk/E=;
	b=1yTJ872v+a2rERSXqXo/pH24ct/oyovHdPOA/NGZuWe11QAbfHFJ64Xleo5t1uUpFd8L
	 t69nopXc9FDQxgOlXs54HDFfR8sH3veX1W1LJiPZ4Ga2KoySFII6zkOpMljGxAXY7lEhm
	 lLaCiaPFyu987cxHjD4quEzG/6dH0sCss3ifsQOQmfhtjAyhsDX60X8Njs2dR9kWwYS/x
	 Mjq1mNdZCZ9LePiVC0/eDKzs2/KS2LVtqQhDmamFyVvaA3oxxGguspKWLyFPN670TqXNa
	 W3z3O52O5e3Xm+I8LIDDMkgWAdqBGYNOo19V+v/Pbx4jH03LFtfthetp/IGR9DsDxKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euSt2yyR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1E960A44CD;
	Mon,  2 Nov 2026 16:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=euSt2yyR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DE81F00A18;
	Mon,  2 Nov 2026 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793637777;
	bh=hamBEuV7gXRtKOsQfWyZlxR5aAN+CtsuFbIk3kGlk/E=;
	h=From:Subject:Date:To:Cc;
	b=euSt2yyRWWfkTKF0cWx7EZrHGYDl9ua4g8hU1rksJq62LG7P5yqj2pgpaCNHCES2n
	 SZ3+NwmSNDsxZdKhhHuHongnMld8YPJXpyHf4/Hi+rt3K2zBSgax22ze+04qvPEwKa
	 eKl/jZwFmzZhRiue1w3sr1UvlFfxJsacZ8387NNwIonBqmLev9VoTojHCK7iAKjxaz
	 S8OdOtcvsy+1x1LlggHz1omwGBTfOGhnzFu3QuGJVpd4tHmg0WXwNUDp2NfrD7i1n/
	 h7vOKXOpQznDl5BitNc3L3GyZMQBF0DG+gPHh7y1Dz5jjQdqzTabxJwebydwgSwKjl
	 OHbnVy3z6VYzA==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/7] kunit: tool: Support parallel test execution
Date: Mon, 02 Nov 2026 16:37:41 +0000
Message-Id: <20261102-kunit-parallel-v2-0-8774b558d4b0@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFa86GoC/12NQQ6CMBBFr0JmbU1bRMGV9zAsSh1gpGnJFIiGc
 HcB48blS95/f4aITBjhmszAOFGk4FfQhwRsa3yDgh4rg5b6rKTSohs9DaI3bJxDJ0xuLphaVZh
 UwjrqGWt67cF7+eU4Vk+0w1bZjJbiEPi9P05q837x9D8+KSFFfapQ5zYvMsxuHbJHdwzcQLksy
 wdp46OPvwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124; i=broonie@kernel.org;
 h=from:subject:message-id; bh=y8lyyoJh2Nm4AuwxAjiMi5AE1q5sIB1iDKcXzCvU8n8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJe7O1RXbgwd/tx2UMPdp7fWcSuunzXxY7Lksnuk1PLx
 Kd9W7kuuKOUhUGMi0FWTJElLov7ZX3J6zV8Bxe2wcxhZQIZwsDFKQATeZ7O8M/q8uXcgxnyat1c
 lgcOxVcc8D1r6Ofl/u7A5shwgb7gVmFGhqmlU9KsXnhyxh7vLYw+rXhJ4Sf/LBdls/vbvnvf1Xu
 +hQMA
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
Changes in v2:
- Rebase onto v7.4-rc1.
- Link to v1: https://patch.msgid.link/20261013-kunit-parallel-v1-0-f4be28c895e5@kernel.org

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
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
change-id: 20261012-kunit-parallel-a8a7e3c19a30

Best regards,
--  
Mark Brown <broonie@kernel.org>

