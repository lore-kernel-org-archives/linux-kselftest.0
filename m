Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CD627E1DC;
	Tue, 24 Feb 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947479; cv=none; b=EUO44+h8N8Bl9HJMcbZfDGMurM/PG98fwlhRMu8GEUjXTdFa2fLqCGDkfhMk3IlfiV82ysMD3ipSZd35TF5k15uu/yJdgE2D5e6LqU49oRCZ+CaFZW0hbb5NQIQkpb/9m8a4B5heqCHlaMbBiSEIGUFQtDSlnOIY9K7IDTlCt0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947479; c=relaxed/simple;
	bh=CjLWLWdk1AfOx1lgw13R91ead58DTPZ83zEmlvLsoNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=q77iWLUbt0OhWkKzkh0cZc7Qo3ccV8uRHD/FdyYtPyiozpKoaypxZoMFKizSLrgYj+fmm5jrQ/rWkNHRYhJjM8OUHLJ5y0rQ0wP/M082mh27Zqa6XgawTQerqrGMgxEoD2HAYG5ZK/zABhA6V6S41aGOEN4tMgZ5dap453nmPZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZuZBedDA; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FOdRxTtk; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZuZBedDA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FOdRxTtk"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1771947476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PdTDsG3anmd1K+DiatEg20+2IA1sCvJS/aPoMRmuusQ=;
	b=ZuZBedDAN6WOQaBTDrbfCALW5WGpEO9J7NUYjLefx3z+BhXsA2HmNNW9H9cPW9nLR8vRP/
	ycxwjZCahAht1Gh5hnenDTNGfqkDedFexbs1lrgqB+eK34MMmOPwKOZVRcsS6llbKos6ff
	lva7WKYYQB+eJn03ynvdS4fm550bTamcWwxSDPNQF08BST9jcZG6/P/3WB3g1ret68hjzl
	HbzoS+Y37iOvMkqZGlfTaPbfhFYAxsWJrb3gTvn3KKy4NRnl5hn9/1nmQOruMroFLt1GsF
	mkr/YdsqJCqvpb6dwKaRm9SkuNPwcZgmEr4Q4Ax18b+51idP8CT6DtYlRXnADw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1771947476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PdTDsG3anmd1K+DiatEg20+2IA1sCvJS/aPoMRmuusQ=;
	b=FOdRxTtksEPIrHWvwxVnVCobaxKPjTFARH/7f7v3y5r7aRON/pVlsnjVaRnnwadkV8TC2G
	8Q3EbfcJJbMF/5Bw==
Date: Tue, 24 Feb 2026 16:37:56 +0100
Subject: [PATCH v2] selftests: runner: Avoid spurious warning about missing
 failures file
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260224-kselftest-fix-failures-file-v2-1-2bfb8f5cb6a8@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auQWTuGDrFUV97DsIAyyMSmmLYQD
 OHuVk7g8nuZ/LNB5CAc4VZsEHiRKJPPoFMBdmz9k1H6bKCSdKnI4CuyGxLHhIOsOLTi5sAxwzG
 arjL6SpbaykIuvAPno6P+aLJHiWkKn+PZon7rf91FocLuYsqarNaVqu9O/JzC5GU99wzNvu9fO
 kw7dMoAAAA=
X-Change-ID: 20260128-kselftest-fix-failures-file-8b38692c2a3c
To: Shuah Khan <shuah@kernel.org>
Cc: Brendan Jackman <jackmanb@google.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771947475; l=1436;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CjLWLWdk1AfOx1lgw13R91ead58DTPZ83zEmlvLsoNM=;
 b=ne2sypSoeg8wd3OCp1uuRDmvR4YDViddiS5rdrj2ny677J6pCCE2Q/Ntf6XV/92JINdHDTq1a
 gldn0CD+BSMB/SYClks6qq8H0611TkIaykICh8GU9gg10zCawBch9tY
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

When runner.sh is *not* executed via run_kselftest.sh, the variable
$kselftest_failures_file does not exist. This triggers a harmless but
annyoing warning from runner.sh if a test fails:

tools/testing/selftests/kselftest/runner.sh: line 50: : No such file or directory

Silence the spurious warning.

Fixes: d9e6269e3303 ("selftests/run_kselftest.sh: exit with error if tests fail")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-By: Brendan Jackman <jackmanb@google.com>
---
Changes in v2:
- Rebase on v7.0-rc1
- Pick up review tag
- Link to v1: https://lore.kernel.org/r/20260128-kselftest-fix-failures-file-v1-1-b58072c66317@linutronix.de
---
 tools/testing/selftests/kselftest/runner.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kselftest/runner.sh b/tools/testing/selftests/kselftest/runner.sh
index 3a62039fa621..1eb935b6f790 100644
--- a/tools/testing/selftests/kselftest/runner.sh
+++ b/tools/testing/selftests/kselftest/runner.sh
@@ -47,7 +47,7 @@ tap_timeout()
 report_failure()
 {
 	echo "not ok $*"
-	echo "$*" >> "$kselftest_failures_file"
+	echo "$*" >> "${kselftest_failures_file:-/dev/null}"
 }
 
 run_one()

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260128-kselftest-fix-failures-file-8b38692c2a3c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

