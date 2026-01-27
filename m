Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB42ED846;
	Tue, 27 Jan 2026 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769513974; cv=none; b=CCpR+vE0PAjfJmpIYHFN59QodBhITki68mBs6oucEqiL5AkoCQpXbWKcw0mfB/lU/+SI/1RAeZ9G8TT6WdPCZubo8AnwXgNUamHWkkfopN+o3OFQPT6I7cOUsRmPsCuYyTQA5xvQ6bOF86jieX06WSrzkKUF3Fy7j3v/d5JIrq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769513974; c=relaxed/simple;
	bh=hPUb1Sf/Y+o1iHyYT+qaHgmrkVOaEBAa48umHaclhUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=crEsgK/3SppABEb8WS71wRZKXKKqq02IFzMgb4wS2O0ZnIlyXFqDci6u22A2jm3Nk6b1SElaTDdB+UlKQf0u5O55GbJif31WSfb/6SMeNzoJOpfHFAY1Er7piejLeoUoTbSlvUzBc9QKF4ip8FZIVd75cNFGOFr1a7jiM8/txtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsKjy2P1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsKjy2P1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 232B1C16AAE;
	Tue, 27 Jan 2026 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513974;
	bh=hPUb1Sf/Y+o1iHyYT+qaHgmrkVOaEBAa48umHaclhUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsKjy2P1I4kpNU/SaUK3hQAAzsAQL0KnMZT7g9kSE29HhGgoDkANSZDKlEry1k8uA
	 mhs1g6ZR2DIkivh/7zkCiGhq0K336psB2fT91va7/qZpNuGLv+lnLevZHg+rYogr7w
	 Cot43YaE9jgvWKbgfWqG7OaYVlzi5GuY7pMOKSTkZCCvMPjTspcYKT0Daba/gnDN3o
	 4cLX5kwEraDJ+3XL8CUf16Dcb0LunODG2opMgEb9kS2j3OU1GHcmFPIzrvugyGI+sM
	 HwhAKkhFxENwSYAG0apeN4Kkoimbkwt51XH5Nh/Hn33t/tzpsq6xVtMNG/M7lXAahc
	 KkwL0aRctMLBw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	oleg@redhat.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	shuah@kernel.org,
	kees@kernel.org,
	wad@chromium.org,
	kevin.brodsky@arm.com,
	macro@orcam.me.uk,
	charlie@rivosinc.com,
	akpm@linux-foundation.org,
	ldv@strace.io,
	anshuman.khandual@arm.com,
	mark.rutland@arm.com,
	thuth@redhat.com,
	song@kernel.org,
	ryan.roberts@arm.com,
	ada.coupriediaz@arm.com,
	broonie@kernel.org,
	liqiang01@kylinos.cn,
	pengcan@kylinos.cn,
	kmal@cock.li,
	dvyukov@google.com,
	richard.weiyang@gmail.com,
	reddybalavignesh9979@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v10 00/16] arm64: entry: Convert to Generic Entry
Date: Tue, 27 Jan 2026 11:39:11 +0000
Message-ID: <176951031735.722772.3896025304943173435.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 22 Dec 2025 19:47:21 +0800, Jinjie Ruan wrote:
> Currently, x86, Riscv, Loongarch use the Generic Entry which makes
> maintainers' work easier and codes more elegant. arm64 has already
> successfully switched to the Generic IRQ Entry in commit
> b3cf07851b6c ("arm64: entry: Switch to generic IRQ entry"), it is
> time to completely convert arm64 to Generic Entry.
> 
> The goal is to bring arm64 in line with other architectures that already
> use the generic entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths, such as
> "Syscall User Dispatch".
> 
> [...]

Applied first three to arm64 (for-next/entry), thanks!

[01/16] arm64: Remove unused _TIF_WORK_MASK
        https://git.kernel.org/arm64/c/e7e7afdc7c14
[02/16] arm64/ptrace: Split report_syscall()
        https://git.kernel.org/arm64/c/741a9000173a
[03/16] arm64/ptrace: Return early for ptrace_report_syscall_entry() error
        https://git.kernel.org/arm64/c/a3386301667e

I know it's a drop in the ocean, but they look good to me and it saves
you from having to carry them over.

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
