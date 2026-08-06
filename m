Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531223A7F75;
	Thu,  6 Aug 2026 17:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036341; cv=none; b=fD4LIsph7tCSrEpx0ZhG9/2JtKA32lrrZwpKi7nJe8+Zs+LZnJxr4hwatT3AHzEivAaPrFlmpzvEZzVluJfE05iEXwsQvWyt8UmIkmtYmFQs3wEHORogi+x0enug4mfpusS2URnixRAegZcbcuKRRKJqTEw5y/YAoKZbE6501Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036341; c=relaxed/simple;
	bh=L6nQHpCmHYHG/GHHMhZ2qnL9lmII53/OthzE6rsPah4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kp3CsDqYF8002w3Ed5mdXU/Mm1t3WDXlHPGY/qPQrAtCB0hNJcrBznc5TljaOY9W0q3hnfuRlCZeXcteorUgX1iWif3Hd7Lf8VKossxirSj/zjhn7dG5kTFoFBBZM+S3RXhYGVIHeAa4uqp4ljejC2bT5G0NcL+jQRW8c2H7/Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=itg203n/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="itg203n/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2308B1F00A3A;
	Thu,  6 Aug 2026 17:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036340;
	bh=XpYKqC5ieeH0CeVfPg5XXhrYkSlRUnEoujChOtFxVHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=itg203n/X9z7r8BvUTyqqg4HN+pgvQltq3OEpnuhRJovfdZYmyuY0JrdsB0FN6p0U
	 XNyYL6tOsuTAqZQRwS3gS44EKj/FNNigUhXwAQ60L8HanplHB+r+chLekmgRZ9NJBk
	 qKCdXFIQQO9v/N+AsUcSFl85AzdI5g5QxvJrSGsp62xybVceZonq0kpZugYNCmziij
	 nbI6CHv62c51LUaUjirub6Mbt3PJW7BP1rtXobzhT2xVFA6L4cwBKbdJFULZwOjlhU
	 E2TFv4804ozpS9B1hPx2EQ9fsv/9UP1HmjiGcR6XPMib6VAs4Ku1uLCr2ckTQ8jW8O
	 JxlWkC+TxIdxw==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	shuah@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH RESEND] kselftest/arm64: Fix abi test compilation errors
Date: Thu,  6 Aug 2026 18:11:45 +0100
Message-ID: <178601918128.406021.15265264695708888556.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260806111546.42042-1-ruanjinjie@huawei.com>
References: <20260806111546.42042-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 06 Aug 2026 19:15:46 +0800, Jinjie Ruan wrote:
> The arm64 ABI selftests fail to compile due to missing include paths
> for kernel headers, causing errors like incomplete type struct sock_filter
> and implicit BPF macro declarations.
> 
> Add $(KHDR_INCLUDES) and -I$(top_srcdir)/tools/include to CFLAGS
> to resolve the header search path. Also remove the hardcoded __NR_write
> macro and include <asm/unistd.h> to obtain the correct syscall number.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Fix abi test compilation errors
      https://git.kernel.org/arm64/c/eb78ef9cf77a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
