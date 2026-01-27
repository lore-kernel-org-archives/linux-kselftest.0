Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E759635CB86;
	Tue, 27 Jan 2026 16:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530738; cv=none; b=rzKihYa/l59KCgzMq+oYipuVD3uF00+tKZDxIlMHLGmnfv4miIQ6kJya4teOuiI0N9eSnDO79wMWz0PKbH1vpyyl84FdKZI7ntHtJGQsOT/iAnXRauLDsHVJ/RYAsKKNAtz9Ryjkybbqk1OJlfOFWuQVCzwGgiyKvEMEkaYabXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530738; c=relaxed/simple;
	bh=qN+iDa2h31PUuD+8uQTYfX0FDbhK4ykWb7nOlFRU9Xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJzdQCSShYDTwpW3Bfb4HWhrzBQ9GB907zpYqziDLsrQhwBvLIPJLfJ4s6Ibxo5JkD78gE481JJ3NjVgobLJNZtn69zFTXMoi+jAIqfyfHoh+DYOadAjoVCVkB+a5F9nErNHJJpomG336p82esIs7bM7pMswPAd4IXRG+W1z2JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRUsf5K/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRUsf5K/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45368C2BC86;
	Tue, 27 Jan 2026 16:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530737;
	bh=qN+iDa2h31PUuD+8uQTYfX0FDbhK4ykWb7nOlFRU9Xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NRUsf5K/3ntfr16607kAZDWuezozyWeqS50NUEXP+HMu2dd18auTEbkvgB06awj4F
	 OVehvYaJHDVwmAoqd5T5rV0PHGJSTUDDeviiHdpRzvy97rTO3DsfBjhczGSIQCpwi7
	 WReyFb4JHVi+HuL4ajHgP3hRhjkVRzetiM1qxOVHbbUYq4tF/VWU3IFRSAvXaN1kQz
	 tty7Lb4BacgPe9K386sM2I6frbj/XESsNuKsWZtUnn7l2byjUnRRAI7242N12ZtWUV
	 Fe48kEsW3a+LyweecvQiVC3/airwCzzx1o3pRAbKc6fBoBIwmrDeux2LKfpd4a6XwN
	 IwFstv6qkpz6w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Jan 2026 16:16:14 +0000
Subject: [PATCH 1/2] kselftest/arm64: Add a no-SVE loop after SVE in
 fp-pidbench
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-1-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qN+iDa2h31PUuD+8uQTYfX0FDbhK4ykWb7nOlFRU9Xo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVsTbVbOUPbuFIFFlOSYlUatPEfRDZbgvj6d
 r6Y2H9o/DmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlbAAKCRAk1otyXVSH
 0EU5B/9djdmSiQVbQU/ugUA2QMRPFCvUCafBTNJc138dNWdGb7aJeCfzaZ6jLjYpbsMRFAXQ9zl
 0ws36EDRTR6Mzt4ca1f0uDdlM0NFTW8bs1+gtT2VCfDoxxm7VlSS/G2bvh42K6dAZhtSa6qvGVu
 mwwZawEWWr99t62QZGUU8mLdWHp+0AsjHspJkkGPdRSWaxr6SMdrDpM856FTnsx6POzj6WVoH1s
 YLVpXG+UboHxMigapUeOdVziG8fKocW5z3Suf5yC4xHgLyyBR8RW2z22VG0A0tuJ5SM0uU/RkjK
 uCrxJZ8vc//biqYqDVYbc0ANjy0Bdlz5FtpvGLaSFOlZy8Se
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

Some applications use SVE intermittently, one common case being where SVE
is used during statup (eg, by ld.so) but then rarely if ever during the
main application runtime. Add a repeat of the no SVE loop after we've done
the SVE loops to fp-pidbench to capture results for that.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-pidbench.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index 73830f6bc99b..aeeadc7873dc 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -63,6 +63,10 @@ function _start
 	puts	"SVE used per syscall: "
 	test_loop "rdvl x0, #8"
 
+	// Test non-SVE execution after SVE
+	puts	"No SVE after SVE: "
+	test_loop
+
 	//  And we're done
 out:
 	mov	x0, #0

-- 
2.47.3

