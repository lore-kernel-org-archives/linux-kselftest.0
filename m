Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419133F37A;
	Thu, 16 Apr 2026 19:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776366262; cv=none; b=oqNO4SC/aFnWsBpQb2amMrw/7eHBH3M91snXsvJ8n8xqfiwvXdo8g0JtJaBIu54vMkBax5OuwB5Y0zPX3PcUZZa8OFshUzN8E1OOo7mON/HdGz+XAX16yMJwT4SSoUAW+Xq68wfM3qo96nuNWZlPVa4rniuOQep4Dm7nZoGKqr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776366262; c=relaxed/simple;
	bh=tWkeMzkb7B682Er6irD5sd2qQS0rENE+Txe6AIJc79I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7GoREQ5vxadZzEoW9L/wRc7aepPtgaQ/O3R185kwA/izHIcFgd4xaJCgc+VOIH1F8el8sQA2+EyISv2TZ9IEuxrlCD5oBzOjXR5Mo90lqAAexgRoc/BKQq1BVJUbtU3GQVFRar+TItfb+3NTh8MKN6Q2ZG4nBklQ7438ekAjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEEvtYqs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEEvtYqs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3D2C2BCB0;
	Thu, 16 Apr 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776366262;
	bh=tWkeMzkb7B682Er6irD5sd2qQS0rENE+Txe6AIJc79I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EEEvtYqsCbnY/oQ4h3CyASWgUjBpFkdE6kWCxSbqxQSI2qDcJ/jK5Jv6mBuWGUt89
	 nLMYxb4UHPNyM9nrvdDa8ufjesdsTtwhQgxDkIy7BqXmWFLcD4vRLwDsk1bieLIVS7
	 N4UyS2KqSYV8fHNq6F8OdgScW+bGjU3tQCUYblZkvlie4Zdd39UH3+LwZoVDRyZY+l
	 ySVeeCS5mqzqKYwqtzynrqeSLT7SptxivlfZ9VMULnXLiZykpIwifO1lDHYmHshrpM
	 PQ8VGkmfXDqNAs7neVvSMuyfUwCIqWDg1dSv4DGnaZOYsdGIZwxJ1NXFXSC2fw0doL
	 bA1k43HMTzneQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Apr 2026 20:03:58 +0100
Subject: [PATCH 1/2] selftests: Fix runner.sh busybox support
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260416-selftest-fix-readlink-e-v1-1-94e4cabbdec4@kernel.org>
References: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
In-Reply-To: <20260416-selftest-fix-readlink-e-v1-0-94e4cabbdec4@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Hangbin Liu <liuhangbin@gmail.com>, 
 Brendan Jackman <jackmanb@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tWkeMzkb7B682Er6irD5sd2qQS0rENE+Txe6AIJc79I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4TKwTAkuSvwzV79FrsllX0iPFBngLaDXgnx6P
 GwtY62YtGqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeEysAAKCRAk1otyXVSH
 0MGTB/9rgZasXUNMSHPB7NfI3RZfLub2Ei9e6j788Q0oe3j2m1fHZLoDgokuJrVtW0nH3oniCzx
 6gPphq9OI5buoFiTt/b4QqJ6ed20PHifSXW7gXkxP7dmvqRxD3BEREViJIgkykZ0DtqZqRy2Nnm
 Lm5tCnTT8dypF+vgUt7Bklgs96HSBBQZz1jbqgN6QKuKFn/iyScAexDLY+bnQub0SmR8R1gr63G
 IxuTtag+jX92VV7dlsz7Ak7YevmlydLpDI+3yH+b1l/uatE6SC3k7M8zro884dcCclgP8zdmlYf
 /rXlfcCtyG0j9gwqwrAOeXfd5BjnDPqkiQq/gm6vHmxOuTT0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Commit 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh") added an
import of ktap_helper.sh to runner.sh in order to standardise on these for
output formatting. Rather than build on the existing requirement for the
user to supply BASE_DIR to find the helpers it uses some magic which
features a use of "readlink -e". Unfortunately the -e option is a GNU
extension and is not available in at least busybox, meaning that runner.sh
starts failing:

./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

Fix this by using the already required BASE_DIR to locate the helper
library.

Fixes: 2964f6b816c2 ("selftests: Use ktap helpers for runner.sh")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kselftest/runner.sh | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3eeec93c9da4..4dfc4271e4ec 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -2,7 +2,16 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Runs a set of tests in a given subdirectory.
-. $(dirname "$(readlink -e "${BASH_SOURCE[0]}")")/ktap_helpers.sh
+
+# There isn't a shell-agnostic way to find the path of a sourced file,
+# so we must rely on BASE_DIR being set to find other tools.
+if [ -z "$BASE_DIR" ]; then
+	echo "Error: BASE_DIR must be set before sourcing." >&2
+	exit 1
+fi
+
+. ${BASE_DIR}/kselftest/ktap_helpers.sh
+
 export timeout_rc=124
 export logfile=/dev/stdout
 export per_test_logging=
@@ -13,13 +22,6 @@ export RUN_IN_NETNS=
 # over our soft timeout limit.
 export kselftest_default_timeout=45
 
-# There isn't a shell-agnostic way to find the path of a sourced file,
-# so we must rely on BASE_DIR being set to find other tools.
-if [ -z "$BASE_DIR" ]; then
-	echo "Error: BASE_DIR must be set before sourcing." >&2
-	exit 1
-fi
-
 TR_CMD=$(command -v tr)
 
 # If Perl is unavailable, we must fall back to line-at-a-time prefixing

-- 
2.47.3

