Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594F623BD06;
	Thu, 23 Apr 2026 23:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776986208; cv=none; b=i8wx1uxMNBGE5cb9jEP7kwsmcF+JfassKnLmG20bFZ3f5lgtxtYCAzW+Ng7cFE1G2yPOzI7eGVaqt3aQL7uGFpY4/KNvFfAVK2ETVURgkIK5RcjuIQB8367pAuwkChsEocYNBANI0AheLC6ipeZoVH64btA24lvH2Ju1/9ZXe6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776986208; c=relaxed/simple;
	bh=PBOOnBDu6N9+TKIZiWkWoePc/vR/NOWjl3zwDHP5lZ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GOeIkbj5tTrXfsk6gl10O3UM08xlaTDb6UyXtJsHUzEpGGueksdQz16V/TF/KXUbIaW4zlkReE724Zi83bTzrIdevdXLeSi1ESUrBfK//JYcjr2QKZZYKhcHak1t1iXL+wKzN5OmwWundJVt4odgiQc44Ldja1jqiHZgThR7bQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8txcW1f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8txcW1f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 576D9C2BCAF;
	Thu, 23 Apr 2026 23:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776986208;
	bh=PBOOnBDu6N9+TKIZiWkWoePc/vR/NOWjl3zwDHP5lZ8=;
	h=From:Date:Subject:To:Cc:From;
	b=D8txcW1fZg4TTe7/PPKtUW+4D8XpE68JsVl4x7ROVUC6S/vvvmkpqRxWtzQz2HVfV
	 fFnAmphSZrtAGu131I1xocwbW5PBqtBkCo3539hr1bKw/UxPl5tHSbJgSaKsaxl9uY
	 ZeEyGFu5B7wVE+1F3Ts4FO2jzY2DrYB5NTa7QW69oM5h/s5xQ0c4+R9Px2rOl7t/dx
	 txgJXPRGF3BupsGNNS4wIxuBQcsRyJJ0+jBJZkK8z2BlnwVePUuWR638ELS4/hpXDu
	 Lt1p963otaYf4v91SNWN+UPkh4yv84NB/BLlk7Op+Fpnijhra6iFXb4q6Xdbe57DLB
	 qqVsI1Ak4QBQA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Apr 2026 00:16:22 +0100
Subject: [PATCH] selftests/rseq: Add config fragment
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-selftests-rseq-config-fragment-v1-1-fcf60116e690@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEWo6mkC/yXNMQ7CMAxA0atUnrEUAgTBVRBDGuxgBCm1A6pU9
 e4EGN/y/wxGKmRw7GZQeovJUBrWqw7SNZZMKJdm8M4Ht/UbNLpzJauGajRiGgpLRtaYH1Qqhh2
 7Q4rs/D5AizyVWKbf4HT+2179jVL9VmFZPnBnSBaCAAAA
X-Change-ID: 20260423-selftests-rseq-config-fragment-65f09caf0276
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1736; i=broonie@kernel.org;
 h=from:subject:message-id; bh=PBOOnBDu6N9+TKIZiWkWoePc/vR/NOWjl3zwDHP5lZ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp6qhdThXA+9vgVBGCZ3z69vDU9kQ9iH3cjhkpz
 TzwAknenuKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeqoXQAKCRAk1otyXVSH
 0NsfB/9BTEzGRGETKyBndfKjJOryofeVdXhmxEJkksOoBGrQtJ0NDTlp2TAyt96muYXSgSY4Uys
 fFIQpHH0iiIzsXtV6VVht812cQlEqXFdo6Ayti+4u3xd/BfoBfCKgDuFiAQCaENI8LC0HNc+W9V
 NKyiz3faytwnHxtHhpGYOHUATFjw9vAueCid9vHJbzRStvkj7gVshc3zBq5AVoE5tPAjAkhZI0l
 g8Dg16PxEAfviQS93dP3XatfBmjzkqNoorsgJvTmWSVZ/ovlDB2AMxdiSfKeY4Iadg92XWjo/nb
 8eHjXBjOAU1nmYGY6nwS2o/d0zGEO2U06mm9B7hG66B88tZC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we do not provide a config fragment for the rseq selftests but
there are several options which are either required or helpful for
running them:

 - CONFIG_RSEQ is required for obvious reasons, it is enabled by default
   but it doesn't hurt to specify it in case the user is usinsg a
   defconfig that disables it.

 - CONFIG_RSEQ_DEBUG_DEFAULT_ENABLE turns on runtime debug checks which
   would for example have helped spot some of the recent issues we've
   seen on arm64:

      https://lore.kernel.org/all/87zf2u28d1.ffs@tglx/

 - CONFIG_DEBUG_RSEQ enables debugging on configurations that don't have
   generic entry support.

 - CONFIG_RSEQ_SLICE_EXTENSION is tested by the slice_test test, the
   test will fail without it.

Add a configuration fragment which enables these options, helping
encourage CI systems and people doing manual testing to run the tests
with all the features and additional checks.  We also enable
CONFIG_DEBUG_KERNEL and CONFIG_EXPERT which are dependencies for these
options.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/rseq/config | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/rseq/config b/tools/testing/selftests/rseq/config
new file mode 100644
index 000000000000..d11b8c61530e
--- /dev/null
+++ b/tools/testing/selftests/rseq/config
@@ -0,0 +1,6 @@
+CONFIG_DEBUG_KERNEL=y
+CONFIG_DEBUG_RSEQ=y
+CONFIG_EXPERT=y
+CONFIG_RSEQ=y
+CONFIG_RSEQ_DEBUG_DEFAULT_ENABLE=y
+CONFIG_RSEQ_SLICE_EXTENSION=y

---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20260423-selftests-rseq-config-fragment-65f09caf0276

Best regards,
--  
Mark Brown <broonie@kernel.org>

