Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DAFC33F8D4;
	Thu, 15 Oct 2026 18:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087927; cv=none; b=pOwMxP+YV2vYQPOlPYRcEogH3OcfXDM0DEXHPb2abOjcbJtwq0IJCVcPVoI8ZIbWiuNI0vnAgNclEIuk18JXOohB08qfh9CL3wAHC4AuzblXO5VLzoI/r7tqvoRu+n+/nuZHqf3UOsQYS5L0uzuzZaWyg9CWh4h7OewxesFsiJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087927; c=relaxed/simple;
	bh=lb4Rl1o5/3HkWX592DeNjfwpCj6DGSbq0M9PUyV8CwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ezfxZj/SYQBCPo00oU6h8NXFP79MLCxvPiTuuml3pXCMXxXuQEsk2pK6cJwf5CTx4wfrNv5iLU3PFqNc0VuPOBS+8UC1RTgV8F1SZCnO26nzuTy9BYexerJmpNG2MradbY8JVZnuauOVwDMMPFvrnK7TsnIWOvckBlJKDqx7rrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=tRAQC+9J; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="tRAQC+9J"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE7BB14BF;
	Thu, 15 Oct 2026 11:11:56 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5C613F871;
	Thu, 15 Oct 2026 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087920; bh=lb4Rl1o5/3HkWX592DeNjfwpCj6DGSbq0M9PUyV8CwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRAQC+9JYeNu1Lo5qLLgcEKcdHvjm4GTZ5y2DaAWJGu/woDL7kSTd6k9SNg2aYzn6
	 CfnYTCtnmvj3aZU49EJJvQzYIUU/eArK3Qoi6EJvSt88b6lSbFLg+RYVzzN3g815fX
	 GOp8Q3Zle06+ptc+0P2G1j1C69YoXxCoNA6Tx8ZM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented by locking
Date: Thu, 15 Oct 2026 19:10:36 +0100
Message-ID: <179208783673.159915.17856867908691720090.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 10 Sep 2026 20:00:39 +0100, Mark Brown wrote:
> When we refuse to change the GCS configuraiton due to locking we
> currently return -EBUSY which is an odd choice.  The only userspace I
> found that relies on this value at present is the kselftest and other
> architectures are using the more obvious -EPERM here let's switch.

Applied to arm64 (for-next/gcs), thanks!

While a minor ABI change, it's pretty harmless. The benfit is eventual
(hopefully) common handling with x86 and risc-v. I did wonder whether to
cc stable but we can always send it separately.

[1/2] arm64: gcs: Return -EPERM not -EBUSY for prctl() locking failures
      https://git.kernel.org/arm64/c/988be99717ae
[2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the locking test
      https://git.kernel.org/arm64/c/8c831e5cd3ad
