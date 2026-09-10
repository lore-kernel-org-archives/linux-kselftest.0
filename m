Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C97658FD05;
	Thu, 10 Sep 2026 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066941; cv=none; b=GHpdYMD2nGthF3YkN/zBaj58XUEMXP5fiTWA/TKg68fMTje4Rbbqza/h2jbCMlVcAi8QPZ6mKKQ/Ajb7LUYNzj0Dm1QkoWGp5254k054a2sXrFkxR8+6e9JKPZkEisV23PaNxuDcT81aVOG4Yu8rHsCSyQA7i6/Sd1evV8uGZcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066941; c=relaxed/simple;
	bh=qLblgPZW15ywU/QuTyo4vd/prNw7+Tn+C3xZYVdlpxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lXQ/njXhF2VfGGgbxVPq+W/LthzEhoVGOeckmNm0MBbndS/NIVlp4MtU6GBLaTV6j+Egp6U/HUcP5NpMfHDdFTFn4EK8DOKUr1QI7TLE8SS2jWUOrfsAGaglu9rReka0AIXQ6DGxwpNvGzILkheiwmRM/wHsBxN91J4brmRaYjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awrv2Ar6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awrv2Ar6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A25421F000FF;
	Thu, 10 Sep 2026 19:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066940;
	bh=A6Ski5oShHi724kKberIu2tJzQT3gRoRlWMUMrxLHHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=awrv2Ar66ekaz9NOUsviWrU1A7CcXwXk+/6xozdaZaOAAcGiFhadkZnxhdDuoDM34
	 s+rCKLtCAQqZ6DOmpiN71wprjga3f48MSq6d5MdjdD3YoST5UH9miO0WAZ26C89gyh
	 fuCf4uwS8pSouq/FhOeg6dHcyIuJKpcxQgYxbRorN92fScEg8gWjyuDvWo9Ugm20/e
	 v7B59Gan7vClS8wLmsCi6DDij1hxg58UsYOoHKFfephK0cEvJSDYS6oLj43OmobNo3
	 PmiTsK7zmhCycrDBZZeIMORSLm0g6HJaD1dbzW+65dEgk88D3weDOhMajShoSQpTn+
	 KvDjbeok9ezhA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 10 Sep 2026 20:00:41 +0100
Subject: [PATCH 2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the
 locking test
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-2-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qLblgPZW15ywU/QuTyo4vd/prNw7+Tn+C3xZYVdlpxs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov60kFQTmlVbWbkGI5xS9oIPlfeF2zsG5e+Nb
 x8/8oaAuxyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+tAAKCRAk1otyXVSH
 0KFUB/9HtIQ8tQo/WvM6NKR7U1gCDJ5In9ka3Kf1i4j03qlOTRHXo8jJ0UxzqQtoCOUUt1q9BR7
 Tzei9xC7l3ZXnbes6SiH0fZz1jM4IgemcUX9VmVAG0lNwPMCmMo4ZyISALw4SL8YbSwnS4kpgyJ
 yi21AOTetMRwbyzN9XEEt0Zk6ZeZxvuqlc/7DSid1GeVbIv1p5G54d00UbY6mqhiUSbbtwNbD4I
 paplYyVttspYNHNnGx7knntDVsg0pyhqyhesKgNTxgLLhfwe1d6zTUqmqCIfxRMX1qVFYA6K4mZ
 ajBQ2XbefqVCOmxbi8Ki+enyxJpRarQpWQgEHOHwdJ0bXe2a
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The API has been updated to return the more permissive -EPERM rather
than -EBUSY, update the selftest to reflect this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 1e6abb136ffd..f780f0c7b8dd 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -115,7 +115,7 @@ TEST_F(valid_modes, enable_lock_disable)
 	ASSERT_EQ(ret, 0);
 
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS, 0);
-	ASSERT_EQ(ret, -EBUSY);
+	ASSERT_EQ(ret, -EPERM);
 
 	_exit(0);
 }
@@ -131,7 +131,7 @@ TEST_F(valid_modes, lock_enable)
 
 	ret = my_syscall2(__NR_prctl, PR_SET_SHADOW_STACK_STATUS,
 			  variant->mode);
-	ASSERT_EQ(ret, -EBUSY);
+	ASSERT_EQ(ret, -EPERM);
 
 	ret = prctl(PR_GET_SHADOW_STACK_STATUS, &mode, 0, 0, 0);
 	ASSERT_EQ(ret, 0);

-- 
2.47.3

