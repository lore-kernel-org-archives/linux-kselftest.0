Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB1857C70B;
	Thu, 10 Sep 2026 19:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066939; cv=none; b=XQNEOWS8VsoOzifHAHvIpvwJaRg+4lOWAZv6F/BGbAnDsnlnF84DlNdq264x7s79hKh47Y1lG+iIbuaQ/sJWUNgax/wakpySrAmfHn8PA2e/qzCkBdU4quTaMv0fZXVWPrkFCeytvW9dDd5m+5naIPfsc+t3hlHe/yVhkNhN8BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066939; c=relaxed/simple;
	bh=vU9yWrJuoA+cpifhPhPxnwazMEUMYCWdCoBAlgROTGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTkKvyCJ5yfM0YvXphklNsnAcZup/JNHHMGnOgvu3wtLKOsXTK0ZvbBrplyB3KPxUeV0F6BS8ThTcqJRqwGULOqbTfTWudWjlmjX7iHHDQxINCURPV6fLXfhYFdLrcW1ebjgrfeZH1LiZEpG8RH1Omvqv6CCRLtZOFq7S3mV3aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcwoTfL4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcwoTfL4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9441F1F00893;
	Thu, 10 Sep 2026 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066938;
	bh=HAMHT2wWkahUBzUJa6rU6nxefkvh71WH2CfBhS9jm8Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZcwoTfL4RMRjTGO7KA6R28gf0K1P+d/yc56bHe6U/rEzpBo0nqgj72Y/U3rnuBH/q
	 bczcN08K3g0bEu1jpYc7TgP3WmGanSODZncfvZafiugwZtVCoSZ4yQ8M6OG6WDIjra
	 5ZiMu7HoA3ef4UJwx3hs5+AmC3MF3XVS6V1pMOMLvtJC880STJPSNLAjUu0BF4IXlU
	 RkiM7gFsrLWij4d+EQLAhS6pG6KcbnXmpn7YaLMrFeEPu+ZOi3Vbcemp0BjOosrdwQ
	 oLfxvr6xPVrc6RAo4vQ77zHIiYtbcQ1ei3GY9GP4aBGfiQjNggW+gO2EUUOj1CRlcd
	 poOrrjWKgHM3w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 10 Sep 2026 20:00:40 +0100
Subject: [PATCH 1/2] arm64: gcs: Return -EPERM not -EBUSY for prctl()
 locking failures
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-1-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Bill Roberts <bill.roberts@foss.arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vU9yWrJuoA+cpifhPhPxnwazMEUMYCWdCoBAlgROTGM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov6z4s5CpPxwkjCGNsVndUvdbbURiX0+IaXam
 eyAPjZ0U06JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+swAKCRAk1otyXVSH
 0EroB/91yMMzQ0TMon3Pl732xM3Ub/Jjv8bnNG6TIpxZ3EjkSAIt52YZPoks3gxbhX6tATUJpga
 WqPl6o3ZqAlrTV91dfU5nqHvhac+Rm8/+c/KCiN1pe0rfPjqeSJyhmwZw9IOfZMlL3dyVJWniYk
 dBWXzkFkd5ywOPXA/bAHOg46dXPBD1yYmwXs/VLRY6sTbKWpMlFt8OmmTdGzoqE1KapXISGICT1
 ldGnOU3vd/eISwbdgdxsP7gO06CfoIKSLvRU3CYcPKBDiXTN58Bo21K03J+bUmfomE3Vdv2Ydyz
 NNekdVwinLO4LpCgyl14Y5MxzOl2KZK3woM6wTb/JR6RTl4R
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When we refuse to perform a GCS configuration change due to locking we
currently return -EBUSY which is an odd error code to return.  While the
selftest does currently check for this it is unlikely that we have any
practical users relying on the behaviour at this point so let's change
to return the more descriptive -EPERM instead like other architectures.

Reported-by: Bill Roberts <bill.roberts@foss.arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/gcs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/gcs.h b/arch/arm64/include/asm/gcs.h
index 8fa0707069e8..bbc22e382cfe 100644
--- a/arch/arm64/include/asm/gcs.h
+++ b/arch/arm64/include/asm/gcs.h
@@ -76,7 +76,7 @@ static inline int gcs_check_locked(struct task_struct *task,
 	new_val &= task->thread.gcs_el0_locked;
 
 	if (cur_val != new_val)
-		return -EBUSY;
+		return -EPERM;
 
 	return 0;
 }

-- 
2.47.3

