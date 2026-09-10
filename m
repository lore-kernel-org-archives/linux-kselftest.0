Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85016585968;
	Thu, 10 Sep 2026 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066937; cv=none; b=OUwWfwh8lDJUPS8Rqd7B5iLUIsq619OrkG61KZwvRRkxh2Y+66O1MFowbAj1pgOZpSoij2OIguapyZTpkHeHGHb9/HIt3Ylh/cK3v16EfQ1aYB7qYjBaLN3m4hPPKZ/Uyvgs87XgcbE9UTb57PEoSoUWlrF9wQrw544nyV50+FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066937; c=relaxed/simple;
	bh=ye4CpVQ11ZTQlz6g8VpQaYG4yMytn/wtKX3AqtEfxjo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mD8p3d24oyzOkQRz1h3J0C/zLPFaqCguSqbWPrHnT9EKRVinRiW8ZjLMscmEx8S2pTpHxJbUmhLJIEC3jpA80WkwXmyk9u5LUcVbPztxyA7DQ/GgFh4BVpZgZiJrx3SmbXkeJy5MgBIFu+wvjXdqLeLEKYLXtIf7RlQwE6pyy2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfye9/aB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfye9/aB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80CC81F000FF;
	Thu, 10 Sep 2026 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789066936;
	bh=/8/TOOcn/OrLcEta3oRoXI4aSxCPcOxTej8Jv73n5yU=;
	h=From:Subject:Date:To:Cc;
	b=Gfye9/aBnkbD876mdEkDiulxNHx6Daf7wS+hOjANOwxmj9WNFt4vu2XaSi2aojD54
	 PqYvKoKEEAGG9HExEA6L5i44t9IcRMF6kKXHJRdkZv5ZoN8ZAdtXwmjApcZCUjVmrL
	 KJeMo0/ca5o26XelTyNY2SJqs/aDynEsr6mla5xPXG1ryfMkrEaEh6EqbyX44wJ4J/
	 8RWaI0Ca9JaOCVOymi3aN3G1hJdeq10l+sBD4VV1SsU48Cn5QMl0rbMKsJtwzkvgzL
	 5KOMQYyg4URcfvEDlLU7GKIU95uJYhmdtNeH1uJDfqZSw7sEa0/x4Pf9nZPOuHysNt
	 L0IG4uYCatPsg==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented
 by locking
Date: Thu, 10 Sep 2026 20:00:39 +0100
Message-Id: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFf+omoC/yXMyw6CQAxG4VchXdukTGSCvopxgfUHq3JJRwkJ4
 d0ddfktzlkpwQ2JjsVKjtmSjUNGuStIb83Qge2aTUFClEMp3Hgf99xp4ueoD8YE71miom5rVKE
 SyunkaG35bU/nv9P7coe+vi/atg92KQHfeAAAAA==
X-Change-ID: 20260910-arm64-gcs-lock-eperm-06ce8f8e5250
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 Bill Roberts <bill.roberts@foss.arm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=833; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ye4CpVQ11ZTQlz6g8VpQaYG4yMytn/wtKX3AqtEfxjo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqov6yMpHf5qCjrBZaJV/TSwFp4pI3AAnv1URoK
 EDyXcA6oXGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqL+sgAKCRAk1otyXVSH
 0J38B/9LISVRgNhwK4yk5uSHglgVIVlJb7yqwb6LY5lAmHqoZpoLgx53ixpoqMom2NZNev+YLUD
 syBh9T3jd5rfZG5LpOPRz+FM3Nob4t7CHS3ISHIE3YiCTUP5TyN3Xr/TVNQuoaWaTkcE9jmhsap
 0HbjwwbGMYQMDo5c91U5FJW55bHbfS1pRu/YwjI3vrsRj3vMQsmI08xgL8SIHUEBKdclgkQBaG4
 TEtQERGAtS8MVrC82K4y7oKphROXxMIOUAiT8kAkqnKvWtVo39Zcj1FL/7/ObHaHuGAIrLDw3wt
 /PSpi6NYQM5TALh31uDQOUY0qwtUlmg/X2ndSY67CdHab1k8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

When we refuse to change the GCS configuraiton due to locking we
currently return -EBUSY which is an odd choice.  The only userspace I
found that relies on this value at present is the kselftest and other
architectures are using the more obvious -EPERM here let's switch.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (2):
      arm64: gcs: Return -EPERM not -EBUSY for prctl() locking failures
      kselftest/arm64: Check for -EPERM not -EBUSY in the locking test

 arch/arm64/include/asm/gcs.h                    | 2 +-
 tools/testing/selftests/arm64/gcs/gcs-locking.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-arm64-gcs-lock-eperm-06ce8f8e5250

Best regards,
--  
Mark Brown <broonie@kernel.org>

