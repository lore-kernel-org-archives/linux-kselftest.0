Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1426252269E;
	Thu, 15 Oct 2026 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792087938; cv=none; b=XyG5cpqrRNOhfTx0r2wcEcLZ01br0clX6kVKuG07Ovevscqj/+QCnC0kUxY1FXB2dP7wtt/NyLdmTJJakktIqDN8XLz/EUb1iNCxmLfD5offxa769kFG5yqs3RJhH8DLYDm4Lf7oOkDE3nNEcOjfdqW5v+DPJpezYyRqNEgvmFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792087938; c=relaxed/simple;
	bh=s3cfgIWhdHIxDrJgWLCdvB1wawB3jHD/bU2OUWznot0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lZJ81CtPIey9WQ2fcpjcfquUDfPOjIl0JDQsABtl27SJd4Yflxw6QnPGvTt5ksvKVrq3scoVuMw62uilISSDX1uO7BaCcjdHFqpsMqxwAF2h1ChZ7nTv6POXi+O/fLbDRpRMcAJEFLSY6gThAW+y+xSKt0BUpvhDADfN+5uNFZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=lbI7xIhB; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="lbI7xIhB"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C995A14BF;
	Thu, 15 Oct 2026 11:12:08 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D51103F871;
	Thu, 15 Oct 2026 11:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087932; bh=s3cfgIWhdHIxDrJgWLCdvB1wawB3jHD/bU2OUWznot0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lbI7xIhBM0XvZcv2h3iQ43C5ZjXLqBq+ITxu53qEdtLPC6V1wnzVIh8Pq3uGYv37o
	 dCxy09k464L68Skd3910ki4OJd1eGTVGXO53MAlScf9oxs/sRjL+zNh9goRaVilTNy
	 b/lizPJHky2WhKjhZHG9LfB6BWIeROHlpDFB2Nnk=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: signal: copy each test binary only once
Date: Thu, 15 Oct 2026 19:12:02 +0100
Message-ID: <179208792227.161414.10905688398757679860.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014200140.1364282-1-sashal@kernel.org>
References: <20261014200140.1364282-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 16:01:40 -0400, Sasha Levin wrote:
> The signal tests are built in testcases/ and then copied to the output
> directory. The copy rule lists every generated program as a target and
> copies all of them in each recipe:
> 
>   $(TEST_GEN_PROGS): $(PROGS)
>           cp $(PROGS) $(OUTPUT)/
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/1] kselftest/arm64: signal: copy each test binary only once
      https://git.kernel.org/arm64/c/7b3b147c4104
