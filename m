Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4423E47FB1A;
	Sat, 17 Oct 2026 14:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247869; cv=none; b=Yu8Pgj92l/Z4lh8sCi5giW0qz+73FpsIrZqMsj7N7EsLag0vvTPZfrgx47S+/rojazT/Qp1TGkCvMLhyuJDrREyetURvuyG+LDTVA6ppaxcvvpTkgIp9RWHVPKKjgcqF9halJIpyGmyKvxWBl0htv4cthyHy74x3vEYPYbhBzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247869; c=relaxed/simple;
	bh=ydgGhY9Z85UyKksQCkoKQnXTWGFqcMxlx+dDqp1/Jk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/l+njaoeCE/dnYaRCnTKX1RohAgaRvMJG6pUeRA+PBfeFj5cboBCtpkGeISNGo/A0zLPgFEQl2+pAJuPSRGCch5Fjs3qoII9mC5DWvh84sGR7ipYcxtPKJPPy4QtJepUVaAoCrL4JF4bN6MUvmKpJxJsi1cI+nCcQrcJL8we9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cg0Mgu0Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cg0Mgu0Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B4D71F000C5;
	Sat, 17 Oct 2026 14:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792247867;
	bh=1/dD6OwplAn37JFSPxXGNlQWLSZxnTDMZBYLKUqMNCs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cg0Mgu0Q2JLhKt1XwFDqy+FOopqDmCcIJG+PU8IiMZxQwGNl7xZZW1LGGjYq6Bss2
	 M4sS4PEU5keVkMzP1QEH4o3HVO2jH1ZwnKs11zJ79+BM1KbUkdvijWBHNTBS19ri/c
	 u2b85mthx1uttLdB7hh0zlHqv5xWebNWBH4pEP1So2wTYwIaEXxVsETrciGPxaQPct
	 /tysWrU37FQ6GFQ2ktDuyLW2p/pKGXTBMxW1OM+X6dAPBkojZRS5jlbe+CIW9qmYrJ
	 3thCiKkmCoUoEddWKWaO/iN9HFkDmUcWnz8CrZu1d/NryQFGUcY1MvLloS6a8TtyXf
	 fMQW0MoqhCM+A==
From: Sasha Levin <sashal@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	=?UTF-8?q?Ricardo=20B=2E=20Marli=C3=A8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after a subdirectory fails
Date: Sat, 17 Oct 2026 10:37:44 -0400
Message-ID: <20261017143745.2601801-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atERXTfz9xsIuv-7@arm.com>
References: <20261014200115.1363363-1-sashal@kernel.org> <20261014200115.1363363-5-sashal@kernel.org> <atERXTfz9xsIuv-7@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 06:46:05PM +0100, Catalin Marinas wrote:
>Sashiko had a comment about breakage ARM64_SUBTARGETS is empty. I think
>it's a false positive but I didn't check.

It is a false positive. With ARM64_SUBTARGETS empty the loop expands to
"for DIR in ; do ... done", which POSIX allows: the word list after "in"
may be empty, so the body never runs. The $(if) sets ret to 0 for that
case, so the target succeeds.

I ran the patched Makefile with ARCH=x86_64 for all, install and
emit_tests under bash, dash and busybox sh, with and without
FORCE_TARGETS=1. Every combination exits 0 with no output.

-- 
Thanks,
Sasha
