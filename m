Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8F46D548;
	Sun, 11 Oct 2026 22:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791758056; cv=none; b=O/rybnCzTxSEQMSy6C6vveKoUzfyanIPp2lXGl9HhIysi/UsoKlk399V2RvFch9HWA5CrdRFdK9j6diJw1lOLO2HQugH0Dnck2mv2W+417CIaxho5wGTmGmBFKifMCMR9Dhi2Z89RSzqARLndopcbuGBbmvday6aVR4OwuWy9q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791758056; c=relaxed/simple;
	bh=a4MtRTQD61rrt5cIJ+YeGGJui563x843TEp8gtfWjtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZPH4fC/SC8n02b1rwreu9UGXO9BnYe/+Jw5a+LNZZzUp0Es1EIn0CSXTsKwOin/D8rgAEnMFFdUV0Vzz76PxbIZRioef5VKbczT/A9GaR+DpMUOcE26ww7Xkems4vhYNHs4Dxui5BmVzaquq/PPy4grK3R7TQmQo0n1msoYcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSmr3l51; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSmr3l51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC2B1F0089B;
	Sun, 11 Oct 2026 22:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791758054;
	bh=t2DhM25p21o9l/pAEnbyFweMWw8kprCFEPxQvQWjcwA=;
	h=From:To:Cc:Subject:Date;
	b=LSmr3l51lthtMvJi8aVNJWp0jwcUvk+VTu+inraxbd/ojKljXfYXe9XKifZCe5WTs
	 DvkjaztRqbAnTyVeOGZbEkTF1QUrjX9k8OxpRrTCvTWcEnYZ16iLBELXxxRH7BkL3U
	 rQGCHJF7DWB+vsgtxw3kje7NbpQQr9PCiY1S+dwMnfQwctxfr0YMWXj4QeHRFNvFQ5
	 /XClYjxZXSJ78AHtOiw4xd9SWKrLbHcw57t3iT+X+1za7qm/gtCcE0ynqpbs9/k3Oc
	 LkUyqHPH66IV78cNZNfeV3ifQmPHPJztDT+3kJATX4v5Pp7IKafD/zUQKNNeOyJuYr
	 7qyy2fyoY05Tg==
From: Sasha Levin <sashal@kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>
Cc: Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] selftests/rseq: avoid an ordered comparison of function pointers
Date: Sun, 11 Oct 2026 18:33:36 -0400
Message-ID: <20261011223358.2327625-8-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ASSERT_NE() compares its arguments with the relational operators when
printing a failure, which clang flags for function pointers:

  legacy_check.c:41:2: warning: ordered comparison of function pointers [-Wordered-compare-function-pointers]

Check the result of signal() with ASSERT_TRUE() instead.

Fixes: fdf4eb632683b ("selftests/rseq: Validate legacy behavior")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/rseq/legacy_check.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/legacy_check.c b/tools/testing/selftests/rseq/legacy_check.c
index 3f7de4e283033..b59c4cb874ea1 100644
--- a/tools/testing/selftests/rseq/legacy_check.c
+++ b/tools/testing/selftests/rseq/legacy_check.c
@@ -38,7 +38,7 @@ FIXTURE_SETUP(legacy)
 		ASSERT_EQ(res, 0);
 	}
 
-	ASSERT_NE(signal(SIGUSR1, sigfn), SIG_ERR);
+	ASSERT_TRUE(signal(SIGUSR1, sigfn) != SIG_ERR);
 }
 
 FIXTURE_TEARDOWN(legacy)
-- 
2.53.0

