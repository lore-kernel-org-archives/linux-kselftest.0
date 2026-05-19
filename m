Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E9331A7E2;
	Tue, 19 May 2026 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204238; cv=none; b=jea6fSBEWqqRp/D6vDJWrS7rjt5OFgM/GgefLvLgxpJmErktd+FmZ1RAhahfkbz1fhAn/sG82/FMafSkK/ui0DQl3CfjQB1jh8PErX2OR5jgEhfzxtlaNJuoBl4ACNYB5A61uMdpEaqJN83pAJGHTvLFwLlv+8KMkxfy5VVlgzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204238; c=relaxed/simple;
	bh=I+IjMYlDv1l4GPKm44lgcCi3BwfRmTlX+eKtPHhhqsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d3Dd595XDXzPDjEdSQFZu3aSqdXFyxMR4XxmAUD0t6nLFNt75ZMXbl1fpjx7xC5r7euysmkUiIQN1OzGr+YUIWhqVuzRx86FXZnpQrUmF59gprSUSp/x7fcQOV5U0q5X2F1rO3WLoPsAa3AVkDt/o9+oaGR8juVh4vjdCM5JFsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYZnYUNq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYZnYUNq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39324C2BCB3;
	Tue, 19 May 2026 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204237;
	bh=I+IjMYlDv1l4GPKm44lgcCi3BwfRmTlX+eKtPHhhqsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KYZnYUNq9Tu1sJ42jVFYrVmNjc4OMw6j4rHkWc8RCHgSKRCcftXwoeNUIWSz9+OS0
	 r0c02nrsnqNc6/JQjsTHsaeU37UrpfA8nClHDw5XOtuH5Kvf56lKMLFliBfQlkLWRY
	 rOnOly7/E/NAF2d3srHRek71+aoEYVHDdMQWp6krJsvzXg66vIfvRxx5RA6asbk2CJ
	 cGHQ0O/3wJY3ev9zpJ5G2P4UdLdtdWLML8qCUsnXmR/PIxXpQ740UUg7yaVjVlgxjm
	 OEkCYc8tl/MiNQl1JgFj77G3Ko+KFlK1zIH03Olc8YqjhtuFhozw9FJ7ZutA73ebha
	 sEYUKk1vNmAWQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] POE sigreturn fix and extra tests
Date: Tue, 19 May 2026 16:23:00 +0100
Message-ID: <177918804505.746149.6023931077901684027.b4-ty@kernel.org>
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

Applied selftest updates to arm64 (for-next/selftests), thanks!

[2/5] selftests/mm: Fix resv_sz when parsing arm64 signal frame
      https://git.kernel.org/arm64/c/c364aa56d673
[3/5] kselftest/arm64: Add POE as a feature in the signal tests
      https://git.kernel.org/arm64/c/42c21954063e
[4/5] kselftest/arm64: Move/add POE helpers to test_signals_utils.h
      https://git.kernel.org/arm64/c/925a082ec2a0
[5/5] kselftest/arm64: Add tests for POR_EL0 save/reset/restore
      https://git.kernel.org/arm64/c/f2db075234c8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
