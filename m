Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F135FF46;
	Tue, 27 Jan 2026 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769530739; cv=none; b=r1ZMX29C4+Dun1Qttmbw3RGhc8OYYls4o2Jh7/VC8i/2RYaYCzrcEVnr8hDA306W0EjU/cE2tkn7aDAe2AE/A+9f0JA+R3FFc6tlYqzsfgaD1oM9xupneZ8beFrO6Kb12PY+h5EOtEVHPjx7RHb1Ht7oLaDq0gbaDSSzoCxsKIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769530739; c=relaxed/simple;
	bh=wCJEdNxOGcIpHHzzvDaU+OqZu7c9QbMKEKo1H+o03eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JqDTeTIT43wasjYPyRqS6uBZ3JiFnVQk7HgUQDHkgXzDKr04zK5eD8r6lun/LOZl9vuJD/SQL4wqc5zui4E1tFLSmf8wv5MpmYyTeQUgo3qFlQSUiMpDnX8wzt+hbgDVGL87M2Z0ZwbtB5dpNc3erM0NDBu9gfL72y7kP+qEfZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRVqmcey; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRVqmcey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06AEBC116C6;
	Tue, 27 Jan 2026 16:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769530739;
	bh=wCJEdNxOGcIpHHzzvDaU+OqZu7c9QbMKEKo1H+o03eA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRVqmceyZPtdcwqMVZAitdDYAiYep11cF8d9oa1pyfZyFA8DL1fQhg0y5bE2K8Iwf
	 5/7rKTvc8mmP749G6r5anMYPUsamLwf0jzPailhe69gDsy3AJfF/dNQacSKHNEELYe
	 mNhZEjsyahs893IdSn6GmryiNCcyjrjvtmheLYnYyNnDuvg8xHQwOOW8TFhongB0fl
	 klBg1CywNIGn7SguzfhftQ80tPSOLw8lBWvGaih09liHpzA/w8bbGACDfu19Aeu5tR
	 DF5XTgVk4uaoe5GyeFwu7WE6GfySEitz/wToJbw68fHIQ4PKPcmn700P49TjjdXTfg
	 HJrANEdaoU8cQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 27 Jan 2026 16:16:15 +0000
Subject: [PATCH 2/2] kselftest/arm64: Raise default number of loops in
 fp-pidbench
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-2-3c78eda0d58b@kernel.org>
References: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
In-Reply-To: <20260127-arm64-selftests-fp-pidbench-post-sve-v1-0-3c78eda0d58b@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1135; i=broonie@kernel.org;
 h=from:subject:message-id; bh=wCJEdNxOGcIpHHzzvDaU+OqZu7c9QbMKEKo1H+o03eA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpeOVtgt8ST5SZyebzCzzIreMCj9N7OwYTqgiAm
 nqqIRy+RWeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaXjlbQAKCRAk1otyXVSH
 0O5RB/4hrJHcagYmATJYg5v8gbWxTMdG0VIP2G/T8zoxaBoQLHVYm2HyA3DZSzhs4mOoK+NPZNV
 VYXlBhWLpJx/AVLWiKBAJtMRAzcYJBezmLXzEBWYvUIeQ3GZvyp9RGxqdz4f47CW1+0I8xpyAmW
 kREXw0oW5zpsRPV9qiwX9YrmdyVsu6FhjUnKXn4ms5tDYn0eLmhqn1v1S+PDzpWzHUXi+vjQY0v
 asbzBu35HvcCDrZYjNoO0xBGs/uqyg4D9u1FseNakmm6dSrBx8tFnU6CuC4rR9AQ3QTBSHNehMY
 jju0aiGJRonsN6VZhISot1eynvierKLRWAPz4oWnQNsTR7GU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When fp-pidbench was originally written SVE hardware was not widely
available so it was useful to run it in emulation and the default number
of loops was set very low, running for less than a second on actual
hardware. Now that SVE hardware is reasonably available it is very much
less interesting to use emulation, bump the default number of loops up to
even out a bit of the noise on real systems. On the machine I have to hand
this now takes about 15s which is still a toy microbenchmark but perhaps a
bit more useful.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/arm64/fp/fp-pidbench.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-pidbench.S b/tools/testing/selftests/arm64/fp/fp-pidbench.S
index aeeadc7873dc..881dfa3b342e 100644
--- a/tools/testing/selftests/arm64/fp/fp-pidbench.S
+++ b/tools/testing/selftests/arm64/fp/fp-pidbench.S
@@ -33,7 +33,7 @@
 function _start
 	puts	"Iterations per test: "
 	mov	x20, #10000
-	lsl	x20, x20, #8
+	lsl	x20, x20, #12
 	mov	x0, x20
 	bl	putdec
 	puts	"\n"

-- 
2.47.3

