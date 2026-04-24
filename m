Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5D13D3D13;
	Fri, 24 Apr 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035618; cv=none; b=UjNXMwVB/5JzsYHnWCd3nTnOxFbIif27KIWPLcvfF5wNgY6pXNIS8DDPcgocnx9+pbSLagF/6LXKXSS0GT16r/UJ20JxG/7LpEmSetoW24OVldFmLSftJBbhkWpifwytMzWQxlytoKvG0eI9CS0KYQsSoanfmfw4bX1CM+xqR+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035618; c=relaxed/simple;
	bh=XqiZqZY2PN3PSfVMw2GzQf49/a/m/v8lcNJMrNh/OtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=swq4VK+1y1B5evetH/OveACPUIrXmda8rO8K1l9znAH6CjUUavNgVPFoGD8PRCUGuMpaVddxUkOTRpoETFvIHT3NHbdHV6hqE8+DiAMrGC6PEkDNAXlygUR+LJremgaXJH+0F3hT7MKodFd+Gkw9gG6lVHChcD9frEsrH16hfhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kmAcmIci; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kmAcmIci"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88192C2BCB5;
	Fri, 24 Apr 2026 13:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777035617;
	bh=XqiZqZY2PN3PSfVMw2GzQf49/a/m/v8lcNJMrNh/OtM=;
	h=From:Date:Subject:To:Cc:From;
	b=kmAcmIci1xxEO3+4ymtOXVtpNLs0oXfugKEtO6J4DyjJIB7nmiwXP7j4oNPaYLUnY
	 E7BqywxoLeO/YIz88sdR+CV2Z6oZdhKY+MqmaeVhvYeFk1nyO4jhEtCGG6uErqCpR0
	 WF0n9oPhXkv05gdZQy/QvRcBQPVAxwTrTizfGz/exFvCp8HF4ZuvKqTY7cjF0f1Rh0
	 w4X0Ho/O/QCNqHWmTsvCa1UvgGTRshQ5IkiC1B0biNmKNwnAU2mnkxzUIhvgG1YDa0
	 iTFoy4nvj1h1FeHI2jIRwW3crjR3VuH4YclMBNb6LGExdDapAzr+GUiXLwAfYNdqsE
	 +aZmw5AmjSq5A==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 24 Apr 2026 13:45:21 +0100
Subject: [PATCH v2] selftests/rseq: Add config fragment
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-selftests-rseq-config-fragment-v2-1-a9475996edcb@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOBl62kC/4WOQQ6CMBBFr0K6dkxbsQZX3sOwwDotVWx1phIN4
 e4CxrXLl7z89wfBSAFZ7ItBEPaBQ4oT6FUhbNtEjxDOEwsttZGl3gBj5zJyZiDGB9gUXfDgqPE
 3jBnM1snKNk7qnRHTyJ3QhdcSONZf5ufpgjbPq7PRBs6J3suDXs3eL1b+i/UKFDjrjFTKoKnk4
 YoUsVsn8qIex/EDVC0edd8AAAA=
X-Change-ID: 20260423-selftests-rseq-config-fragment-65f09caf0276
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1614; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XqiZqZY2PN3PSfVMw2GzQf49/a/m/v8lcNJMrNh/OtM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp62lenYV13zvWOU11cXlLg8JB7GBAXozNl0ZR3
 ENZMwGWk4qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaetpXgAKCRAk1otyXVSH
 0BTMB/9qzzxs2xyXbm1pur7DnIzyjj2czWF2DJJBCV2fni/nIxuRFhdf2rrwmO3OaGZLxSNxMYz
 RgNQp7UnD0n2Ltj6oZVauketpGELHvDW5yVdOuFqBa4g2o/VFNkogOTwNONr2uYKtBTOAy2pNAL
 TG7oH+NIj83yXtjTM9lGxc1LjaysQKgXuyIx88Wcp/v6Keyh3h+9yyEckfk91v6/NRlO1ls630o
 nbVTzP7ewaWGjV+nRrJv5pbxZ2VPZ+qSe+++ec/f0n6bZkcc+U0sGBrjw1fnN6FY8quYfq0/3E+
 sABoAeH6uQwZCK//uc6n3E9nCdMGoNuWUEzqs54VkP/d2dx3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Currently we do not provide a config fragment for the rseq selftests but
there are a couple of configuration options which are required for
running them:

 - CONFIG_RSEQ is required for obvious reasons, it is enabled by default
   but it doesn't hurt to specify it in case the user is usinsg a
   defconfig that disables it.

 - CONFIG_RSEQ_SLICE_EXTENSION is tested by the slice_test test, the
   test will fail without it.

Add a configuration fragment which enables these options, helping
encourage CI systems and people doing manual testing to run the tests
with all the features.  We also enable CONFIG_EXPERT since it is a
dependency for slice extension.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Remove the debug options since Linus has indicated that he wants them
  removed entirely: https://lore.kernel.org/linux-arm-kernel/CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com/
- Link to v1: https://patch.msgid.link/20260424-selftests-rseq-config-fragment-v1-1-fcf60116e690@kernel.org
---
 tools/testing/selftests/rseq/config | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/rseq/config b/tools/testing/selftests/rseq/config
new file mode 100644
index 000000000000..a64608043ace
--- /dev/null
+++ b/tools/testing/selftests/rseq/config
@@ -0,0 +1,3 @@
+CONFIG_EXPERT=y
+CONFIG_RSEQ=y
+CONFIG_RSEQ_SLICE_EXTENSION=y

---
base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
change-id: 20260423-selftests-rseq-config-fragment-65f09caf0276

Best regards,
--  
Mark Brown <broonie@kernel.org>

