Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542C84D09F4
	for <linux-kselftest@vger.kernel.org>; Tue,  6 Oct 2026 22:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791327376; cv=none; b=AOCx73P1Vk1PL6hVBdMO0+BX9lIKHS4lMreiHj/zCciQmVgxa5gjRxEUrmQCqqbM5xDiVMXCFro1rcYZ3fcu6Z+lyl+iZPkCtCsPBd9BeI5PagAgHkArFCcFcgu1g38gUcGRyboTnyS81gaVNXqEzu+64Za9U/vuCFa5KRKngsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791327376; c=relaxed/simple;
	bh=c4b8vJUIyHvBPnYvfzT9hEIi5nCjAL01RpiqWzEUBF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nvbrL5mDKIdKr9Eqj1o2diIR6seWhSnfg+J9k9P3XWgkNEoczr8KAn6M9beOoh1wDIxta067eHHQ1To8gXO+h+qycFpQmWGGzAynQLQnl2+aNKhOqa1G/XnBfUG0ircdEKQki5vXfAcO4X4TBkWXzksoEyrOmdIsKxmxUReqguk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ST+2A727; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ST+2A727"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 544611477;
	Tue,  6 Oct 2026 15:56:12 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BFAB3F86F;
	Tue,  6 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791327375; bh=c4b8vJUIyHvBPnYvfzT9hEIi5nCjAL01RpiqWzEUBF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ST+2A727f7o2+P2zUbhBzO0CJOpTe+58ldfIhmUO1ebSoDgoF6U0vPytj9xNXyORW
	 TmjtRcj2BRyV444iAzhAAlsZ9rbc5clxQb50i7ljV1PmDCAitowztqt61YwEfFkgsm
	 t+N6L5+rWioNTL8hSV8648UiTijO1VwJ0NEFNzlE=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kselftest@vger.kernel.org,
	Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	shuah@kernel.org,
	broonie@kernel.org,
	usama.anjum@arm.com,
	mark.rutland@arm.com
Subject: Re: [PATCH 0/2] kselftest: Make MTE memory access robust
Date: Tue,  6 Oct 2026 23:56:08 +0100
Message-ID: <179132735993.1339931.13899856903297261117.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922105959.129380-1-vladimir.murzin@arm.com>
References: <20260922105959.129380-1-vladimir.murzin@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 11:59:57 +0100, Vladimir Murzin wrote:
> Currently MTE selftests assume that they can skip (expected) MTE
> faults by advancing the PC by 4 in mte_default_handler(), but this is
> not generally safe, as the faults are triggered from arbitrary library
> functions (e.g. memset() and memcpy()). For instance, memset() could
> be implemented as simple as:
> 
>       mov   x3, x0       // copy pointer
>       add   x4, x0, x2   // calculate end
>     loop:
>       strb  w1, [x3], #1 // faulting access
>       cmp   x3, x4
>       b.ne  loop
>       ret
> 
> [...]

Applied to arm64 (for-next/kselftest), thanks!

[1/2] kselftest/arm64/mte: Introduce MTE safe memory accessors
      https://git.kernel.org/arm64/c/1cd024f3f6ae
[2/2] kselftest/arm64/mte: Use MTE safe memory accessors
      https://git.kernel.org/arm64/c/9f7af3cf5cc7
