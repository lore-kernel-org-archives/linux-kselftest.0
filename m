Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D263DA7EC;
	Fri,  1 May 2026 16:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777654125; cv=none; b=C/Fs6VbG6zr/gK9b7+FMDLg42e703RVPxZL+llkJQ8vr8NOTrFMjf9MKgPTYvU4XNxHZ8cu3P12vOROlSmp69ulYVzQxwfofTUYlvAh1XPkw2MOiIak4rDqZmItBB4cF6F8gCyimJEVqEzMvWSrOGumBzIzSLs42fVsTckWlFHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777654125; c=relaxed/simple;
	bh=0mhe5VO6bibA7BOMRyysUlyXRYgOpwf38PrIb8CTsm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ut1YA7kI6HdYf1f7cYzHPuckz1vgOFV7G+veyw97qHsKyRGNmN/vW2uy9YXfTAHyDjlv5l2uLEBFplV/jf2HyfS+lAwo6Bdw41HdL7gYQ7/gjXrj82MPAPm1PpVrkDdkRXi9l8U5qn/yTLCfWDdTp6gtZNj4iFPTXecLPpiP+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cOyG47tY; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cOyG47tY"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7240F176A;
	Fri,  1 May 2026 09:48:31 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F49F3FB3E;
	Fri,  1 May 2026 09:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777654116; bh=0mhe5VO6bibA7BOMRyysUlyXRYgOpwf38PrIb8CTsm0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cOyG47tYx2GM+V815gcxteslVYvLCr/JT7YyNNg9OXp8pk8PfZ6816/nXtBk6i61O
	 03DNgK6VCRnQhXeO3jpN99bDGHeGw6krvxSPMbHG6doMc9rYTk7R2nXDCdf1tRNpvI
	 3w+rwseFvJS7G2ypiaSJaivkB1YzcHNpkHP41vO8=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] POE sigreturn fix and extra tests
Date: Fri,  1 May 2026 17:48:24 +0100
Message-ID: <177765401795.1247142.18437523935136255541.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
References: <20260427-poe_signal-v2-0-2bd9d6f16ab4@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 27 Apr 2026 13:03:32 +0100, Kevin Brodsky wrote:
> Commit 2e8a1acea859 ("arm64: signal: Improve POR_EL0 handling to
> avoid uaccess failures") introduced special handling for EL0 registers
> that impact uaccess. This did not however handle the case where a signal
> handler removes the relevant record (poe_context for POE) from the
> signal frame; this is clearly not typical behaviour but it is legal.
> That commit resulted in arbitrary data from the kernel stack being
> written to POR_EL0 in that case.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/5] arm64: signal: Preserve POR_EL0 if poe_context is missing
      https://git.kernel.org/arm64/c/030e8a40fff6

Will, if any objections, please shout.

-- 
Catalin
