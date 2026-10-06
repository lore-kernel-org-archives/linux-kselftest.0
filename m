Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C4EF4C2278;
	Tue,  6 Oct 2026 22:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327368; cv=none; b=fgDkPwsQ3eMqTESbks6Rr3J/AdUlzLmWxIi5mCEwb3Gus46llgABPTnSymqPx08ItVSNkeh/tIws7Y5iifsElxa+GuzkcRMIOme83cOvZ9BDXN43D+prZsc6KDvGR1191eqydxCDW7rdlhFww/kHQusiB15tjFH3BLjgAFXc5+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327368; c=relaxed/simple;
	bh=7UBz5hm4+Ztn+y6F1mrEQVJwXm2+jD7d0OgQGQel3M8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pTIj8fkr1aS0p2oKcTVB6QT2UcbZ4pfrjcqyfQrHnFaCNLKxGs7jquOEoqG6iiFKtW0GnMAFQveA1jEWE7/cqssopmznacGLH6uoYNuJc4omJKl6zWep8lMwIXKJU/uaFyJUuO1wi7pejrhJMUhNBXTMGhyueWkxnorXeSBe6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=vie5/HRm; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="vie5/HRm"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 065872F;
	Tue,  6 Oct 2026 15:56:04 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF9E03F86F;
	Tue,  6 Oct 2026 15:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327367; bh=7UBz5hm4+Ztn+y6F1mrEQVJwXm2+jD7d0OgQGQel3M8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vie5/HRmRA7/bz1eVq6A8FpUOLkGx7RZCPjAi/sam0LddUZSWyN4eDFryxqzKTmbu
	 QpXtBAzHViyWNBe86qrVv1W86tePrHZGPsdU6IR4byDvf3sO98OW66uvGeAeiG+xVn
	 qZFJHpwjhxlc/yCO/pEu959K1pttkZElAO+X3T40=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Bill Roberts <bill.roberts@foss.arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Extend gcs-locking to cover cases where enable is unlocked
Date: Tue,  6 Oct 2026 23:56:00 +0100
Message-ID: <179132735991.1339931.2590712297330967589.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
References: <20260901-arm64-test-gcs-locking-no-enable-v1-1-8335dacb1587@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 01 Sep 2026 18:27:06 +0100, Mark Brown wrote:
> The gcs-locking test case currently only covers locking combinations of
> the various flags that can be set for GCS (enable, write and push) where
> enable is included in the locked bits. Since it is valid to only lock a
> combination of write and push while leaving enable user controllable we
> should also cover those cases, add coverage for them. The new cases pass
> as expected.
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: Extend gcs-locking to cover cases where enable is unlocked
      https://git.kernel.org/arm64/c/a3fcb14f5673
