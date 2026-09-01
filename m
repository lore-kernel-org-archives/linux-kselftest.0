Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE54419304;
	Tue,  1 Sep 2026 17:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283634; cv=none; b=aU4xI2LfYc36WBQl803a8y5A7u63gdhRKnMSbGjyKb2ejQmtBcPS/f81vfP2VkShZXEp/cHHuvxeXwUxrXAIxG3hIlsIR5hoE5lIpbc56pw1aJAuXaVu7syYMrc/V1/RqYiv6FKHra9XwnQKIo/8RnhfrwTlnHMzO+PWYySg4WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283634; c=relaxed/simple;
	bh=GitzmlQ5l2hvhW8wvFRTMCxX5/K59sspgMLl2BRFAKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oLnSsBNai6FlOZrpJdqY4LMz3ImxISB3T+TaqgYdDksxLwHr06Pfh/3sschjJ6yHZ16jCd9/sw2FIEcVLl4h0r3bRbGxqrT3C56KYUoTW6odly24MR7hkLXVF4Os9dHcItsW5pQRo58YiJ2XElsUbwbRnlxRiy5HdUXtaKcs55c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQIvTMiV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQIvTMiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B548B1F000E9;
	Tue,  1 Sep 2026 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788283633;
	bh=UTYhxBnwSC8yAJEvjw+cCqMcJ96NHJ7AdHx5vnA8Kag=;
	h=From:Date:Subject:To:Cc;
	b=OQIvTMiVjUOTouHgNZm/4jk1gj6AWHc5oxw7C9FLVGOKURh5qWfEXeBbJXtfo+XaU
	 3M140dneL9GwXkoTfQcr2klZMtlwdfsyDoLgZyOLRT+idC3U+XvjNlOj+BGljcpn+1
	 haX7CJ3T+02vxcobqGJuF9TZVKPqlDaYwpH5Itcp8NbwZenTVpCJfJZmZQLS8AuRqe
	 rqSMBHK2VPQ5CTxVssecqZBO+itmUzCwqzkkjaOCEv+bOWsP/Pl2Tp+9IhgJeTunH7
	 XNZsc9LFFwnvxeFPwq96DVCsSW8x4aEhzd/A4xvC6lG9RxCCFVfMD1i/9Kqf+SnN0K
	 oFWB5ucle2NAw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Sep 2026 18:27:06 +0100
Subject: [PATCH] kselftest/arm64: Extend gcs-locking to cover cases where
 enable is unlocked
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
X-B4-Tracking: v=1; b=H4sIAOkKl2oC/yXNQQrCMBBA0auUWTuQRgnVq4iLdDKNozWRTCpC6
 d2Nunyb/1dQLsIKp26Fwi9Ryamh33VAV58io4RmsMY6M1iHvjzcAStrxUiKc6a7pIgpIyc/zox
 kjz0FCpMZ9tAyz8KTvH+L8+VvXcYbU/12Yds+KogZUYQAAAA=
X-Change-ID: 20260826-arm64-test-gcs-locking-no-enable-c291cdcdf083
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Bill Roberts <bill.roberts@foss.arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=GitzmlQ5l2hvhW8wvFRTMCxX5/K59sspgMLl2BRFAKs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqlwrtKh42AbGQdwtSNDUXnKY5gRabpMQmdzjHD
 UEke+z5R3OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapcK7QAKCRAk1otyXVSH
 0Du0B/0d+jiM4CD5r2DSpJPQ0ZEneNMYRJD+tpkMb2BAe1cTlB6P0/4zzqlVrlbIPRhs8JI5GyN
 RnDgJ1optVUKvI4x4Rzdtf83OzHBh76lx9VHKkvVY9dv+LE70SNihTryO8Ru3tv3rVZVZeRQOLv
 xjnA3KdZgmcuMIXXgf2/PJv41YYvdig1e9T2wGqGDSqY+BeCU+4/i++ba2bsZdFxKCSqOiugUAe
 7H0Bkv9UPP3j3hE9b3tQS65HDyzQMGlhSicEfeSjj/54c+elh8lfa2iFbevg+SeZ38oOgs0rqRA
 crCUKVmx/KXiosqF3/NBLh9/RG3GzZ+QQvDV59new5CB6zqK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The gcs-locking test case currently only covers locking combinations of
the various flags that can be set for GCS (enable, write and push) where
enable is included in the locked bits. Since it is valid to only lock a
combination of write and push while leaving enable user controllable we
should also cover those cases, add coverage for them. The new cases pass
as expected.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/arm64/gcs/gcs-locking.c b/tools/testing/selftests/arm64/gcs/gcs-locking.c
index 1e6abb136ffd..4dd7ab4191f1 100644
--- a/tools/testing/selftests/arm64/gcs/gcs-locking.c
+++ b/tools/testing/selftests/arm64/gcs/gcs-locking.c
@@ -77,6 +77,21 @@ FIXTURE_VARIANT_ADD(valid_modes, enable_write_push)
 		PR_SHADOW_STACK_PUSH,
 };
 
+FIXTURE_VARIANT_ADD(valid_modes, write)
+{
+	.mode = PR_SHADOW_STACK_WRITE,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, push)
+{
+	.mode = PR_SHADOW_STACK_PUSH,
+};
+
+FIXTURE_VARIANT_ADD(valid_modes, write_push)
+{
+	.mode = PR_SHADOW_STACK_WRITE | PR_SHADOW_STACK_PUSH,
+};
+
 FIXTURE_SETUP(valid_modes)
 {
 }

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260826-arm64-test-gcs-locking-no-enable-c291cdcdf083

Best regards,
--  
Mark Brown <broonie@kernel.org>

