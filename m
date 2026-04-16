Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE80334B1A7;
	Thu, 16 Apr 2026 19:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366264; cv=none; b=tUq6+uKHF/4cE2eLckbs5cu4jzk9FrDeN95MJo7WFP2Mvt5jej3DL79B3B7wydW9qzMIBwLgYAHVSa3WRtFvgsUPXsiA/1hEpeeAfKDt4L4OIvsX7fv1RN8fIZSTaimY5QVEyBmfUCZKhAqiDj55fyV4uL8ivEv3NGkFWHptLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366264; c=relaxed/simple;
	bh=9/WXBmMLmvTBMXIIdQxyH0N5W0Q06heZ2t1XgZ7sLjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOWHNzLnmlYJP784INbpYUTvChGCK4DCiRqoVmNOqda7yhUmzkL79Wa36nuP61IbADHzDI3A5mqaTwNylpjTo60nTM4uSxaUb0CfU0u7An2mvyDsc4l83VE6yP7IYNsvZBsMRI+Ez2xUsrM/F+isSNshZETFYDBfLvuvjK03RW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjBKTOQX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjBKTOQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C8EC2BCB5;
	Thu, 16 Apr 2026 19:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776366264;
	bh=9/WXBmMLmvTBMXIIdQxyH0N5W0Q06heZ2t1XgZ7sLjc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hjBKTOQXhSDaw3Ve5a1Q5G+Eqt9nGg0LVpz0fnUkwVnCRWopLiON153cypNTOJS49
	 OUr+Jd4RMHAtJ40JHu1AN+daxp21J3GtqDXX1hp0/j2jOPzwDYR6ZGVPQk34WlPCP9
	 9/nhawh1wprFNn+lI2YFz16GqytLNH8U1f/qP3qzJ8/7/NuC/Z5SLmCAuVnKDZfxq5
	 zF5q7d71Ut/MY/VQKV3a3j3g4qXHbH0CAQ7BfT6MJOZBYDgpDl8D+54eX5JvcVYQA6
	 cFhjckUyn/wAYqUMyOPvQ4raQHRSWWSSIxFl673T2GSFd1AnQfrLvsBn+kcujfKDtX
	 gBO6llQqgZV+w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Apr 2026 20:03:59 +0100
Subject: [PATCH 2/2] selftests: Fix runner.sh for non-bash shells
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-selftest-fix-readlink-e-v1-2-94e4cabbdec4@kernel.org>
References: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
In-Reply-To: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
 Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262; i=broonie@kernel.org;
 h=from:subject:message-id; bh=9/WXBmMLmvTBMXIIdQxyH0N5W0Q06heZ2t1XgZ7sLjc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4TKxwOL6d6WyviNpn9cwuKDrQo0/6cqA61qyW
 21XGW4jD0OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeEysQAKCRAk1otyXVSH
 0G3WB/sGw199qivOCRiA7GLQYyVzT/lbQ9QT7fQ6117XeN41AcA5teX5Pd2Hrkn7dGdT6MkHRu+
 u0/1OMaF8rb0W3h8NZtk8LIdyABomE7UW6It0n6c+2FX0EqUjJCLvhe7mflwmGQlj4Wn7p9abNe
 1gJu1CFj9jL7ZYcmRv9riUvz5KohNG00YlQIuSN4pOC5nbt3q4gWmUx6K0JjbzQZTE70xid7dLC
 TLd78Dhc7hOSPF4U1DhqSKloDlVSy2NYsnJLfsA6ZDgbU7x+BKCIBkHXmzlzcmVlvFnWL0oOqpe
 P1kQkDBJmwKmhmQN7xTYUZ27ivjmb+Qzznhofyfvaj+2FSP+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh") added a
number of bashisms and updated the interpreter specified for the script to
be /bin/bash to reflect this. Unfortunately this does not actually achieve
anything in production since the main way runner.sh is invoked is from the
top level run_kselftest.sh which sources it rather than running it as a
separate script and specifies the shell as /bin/sh. This means that on
systems where /bin/sh is not bash (such as Debian where /bin/sh defaults to
being dash) we see failures:

./run_kselftest.sh: 195: ./kselftest/runner.sh: Syntax error: "(" unexpected (expecting "}")

These bashisms come from this part of the change:

      4. In runner.sh run_one(), get the return value and use ktap helpers for
         all pass/fail reporting. This allows counting pass/fail numbers in the
         main process.

which uses a bash array to track all the subtests being run. Convert this
to use a simple flat variable instead.

Fixes: 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kselftest/runner.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 4dfc4271e4ec..50919ce206f3 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 # SPDX-License-Identifier: GPL-2.0
 #
 # Runs a set of tests in a given subdirectory.
@@ -192,7 +192,7 @@ run_many()
 	DIR="${PWD#${BASE_DIR}/}"
 	test_num=0
 	local rc
-	pids=()
+	pids=
 
 	for TEST in "$@"; do
 		BASENAME_TEST=$(basename $TEST)
@@ -203,7 +203,7 @@ run_many()
 		fi
 		if [ -n "$RUN_IN_NETNS" ]; then
 			run_in_netns &
-			pids+=($!)
+			pids="$pids $!"
 		else
 			run_one "$DIR" "$TEST" "$test_num"
 		fi
@@ -211,7 +211,7 @@ run_many()
 
 	# These variables are outputs of ktap_helpers.sh but since we've
 	# run the test in a subprocess we need to update them manually
-	for pid in "${pids[@]}"; do
+	for pid in $pids; do
 		wait "$pid"
 		rc=$?
 		case "$rc" in

-- 
2.47.3

