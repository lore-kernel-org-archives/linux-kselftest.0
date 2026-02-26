Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008F4396B82;
	Thu, 26 Feb 2026 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144693; cv=none; b=Hz4f1Bzvf2WSltnRX/YC04rBZg1iOGUwpUuw0FSwZyHvBvuEl06JccNJRlmc+RtNlJENyer9m/i+JEVbgE/7sA2LfAiwZfHSrUjyhp/xGVm9WL14rnNUNFnAPxMY5lUwHpHNn9OqSysfDayevoIlcBkA+1POxQSNxIfVN3tBJpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144693; c=relaxed/simple;
	bh=Ed5ZeeMeyy/vi/c75SL51tBox+lgE4FzfZW5alEE0rM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j8GtOguCkiFwSJkPz6cPnCfVYP0ILiQAbVtKM8z67/8tWCCa4/OaOHKkGSFDJgiTPFG/erLPgVA+B4rzllRC8cbVABGZa6Z+YC4zGWSUt7e/o8YUpFcSXx164XjYO10x/h/+UgaZ5/qfGnfml+hZI2bbsx/njpDBAoiF+vWL100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hek8RmB1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hek8RmB1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AC9C19422;
	Thu, 26 Feb 2026 22:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772144692;
	bh=Ed5ZeeMeyy/vi/c75SL51tBox+lgE4FzfZW5alEE0rM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hek8RmB1SnlhSv+QZfaPfou3Ro1FV7X513m+drgZ4FBv/KNaLT/BwspIT/QO3+Nh3
	 tOePmrzzOqYustF/MnbHM94CfumA2CjkN89RFDYRX+Mt+fuVBcJLzoxSKT4Jcw/LyB
	 G+S4j7PyjZF2a8/WwlPt86nM5a/GDe/CE4RiTAyu+0pPr1835agTXn2OH/+nbRpf0j
	 gke3ndaV3StLYPkYaaQPNTcTy6nY2MtzB446XkGMNJyyBtgtUsSfN+VCOCDWo1TcNO
	 KcvBruVF70FjYqBUe6DSA/wWXUtdOEIjc/vU5wZIATI8/itZyYVz+wfScCeN2WT8iI
	 DjJsmbH4Wh2Rw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Feb 2026 22:24:43 +0000
Subject: [PATCH v4 2/2] selftests/fchmodat2: Use ksft_finished()
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-selftests-fchmodat2-v4-2-a6419435f2e8@kernel.org>
References: <20260226-selftests-fchmodat2-v4-0-a6419435f2e8@kernel.org>
In-Reply-To: <20260226-selftests-fchmodat2-v4-0-a6419435f2e8@kernel.org>
To: Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=826; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ed5ZeeMeyy/vi/c75SL51tBox+lgE4FzfZW5alEE0rM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpoMgvRrb/oVJBzn8/20fV0mQVvsAibPK/RUYdG
 ZBdSACr/MaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaaDILwAKCRAk1otyXVSH
 0E6RB/9cXpHug8Pi+Lz1LvO0yVqnrk1K2Pbak8EXSBiHw4ukAA6vKfC2I5/U4bRWGdlrVMkwURO
 RC6G7Or0Z2WA1yMLGNz9gkcAl/0AwQ78Tsa3xkAm6OMBlESXeETR8F1zq4qlvEvaR2fszLmJO1p
 ogkvqdnp29SdfrUHwDvZIFXSynyIV0Ap6PkNCnklbmjj3WRi7UF48+HAgdV2fdvj9iMSkWIsZob
 1dQrhK87GtbuBv3zv83aQkpqMDNUTWZyH/bg3Yg4oIStaclWFESZ+cs7CnFrczvAlXMRmqohrcM
 JzBK7Pdu62h9dh2RmS4S8plrYATD6pD/pPCmakqAStjUSEO7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The fchmodat2 test program open codes a version of ksft_finished(), use the
standard version.

Acked-by: Alexey Gladkov <legion@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index e03430c4675c..8e1b6384b319 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -196,8 +196,5 @@ int main(int argc, char **argv)
 	test_regfile();
 	test_symlink();
 
-	if (ksft_get_fail_cnt() + ksft_get_error_cnt() > 0)
-		ksft_exit_fail();
-	else
-		ksft_exit_pass();
+	ksft_finished();
 }

-- 
2.47.3

