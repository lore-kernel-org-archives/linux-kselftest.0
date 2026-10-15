Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C6535E950;
	Thu, 15 Oct 2026 04:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792038884; cv=none; b=eOlpnU0lyIwliCZY75XUyyMAl65p4TZ98Z9PZVCbrAAP1fTotMuXhc05ZXLMNFqKb+/h6+hANsN0iu9t98qQwV1myxKgv0hj4dBKj9x1CAKHPN/rR3MgTKhAsvuI/UpLKLDttjSMi4q+nhtfKUY98pcZuXP6ehG7y+7C4/xzd50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792038884; c=relaxed/simple;
	bh=cWFUAZ58f1ijGKwcE/D69i7CZfwsEloqc8lfavSSIMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O5n/SNH/jVHHgLCBIOrwYyF29dhnu5Zc6JFt/b7kgrkaJJ9mLLtB1d3XRCkUAuvraxt86c5lQducYl5qtB1CYdvOd8juBG6ypDqRd4SgNN2lTa6UGkxPREm92OS1eYLbp5rI17ia72XhmSsXMKwxP2uQCzrzyjj1/MXgnhYEi8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ly+xXjT3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ly+xXjT3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F401F000C4;
	Thu, 15 Oct 2026 04:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792038882;
	bh=CDCR3zTq4gu5VssH7XXKdr+KOGhe+b5fWjQKW9Pd8mo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ly+xXjT31/uiIN5iO0IJyZQ4l6WbE1kf6GCDYEJ7hESL9rU/0PjG1znObm/Qrv9vN
	 pwodBmsKnx72FjNDNYKmj0FnTw+jvxHSDdOpakFJWTLt9MGNA0DYKVUTBSgqAD8jUm
	 LdVN6h38/kD6/OfC6s6PMwaIgw+yUfn5uYuyoKoJ/R4L+FEYkIjs6Hw787qYI02BDv
	 rSAQZ1wrJqb7IsATBXwx1qpafQkJAKcg8XGfFPUcoC8JoqXk8yxoYla8k35fMSszLR
	 qmO05lc/YZxxF9WhLNZ3aD2x2C5rREmclR4biyPu9Lpc97PbD/wi002ozBjXwAD60U
	 yhtji0mr+Y9BA==
From: Kees Cook <kees@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Farid Zakaria <farid.m.zakaria@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/exec: report the skipped binfmt_misc_bpf test on stderr
Date: Wed, 14 Oct 2026 21:34:38 -0700
Message-ID: <179203887733.2951657.8311886793376077466.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014200135.1364053-1-sashal@kernel.org>
References: <20261014200135.1364053-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 14 Oct 2026 16:01:35 -0400, Sasha Levin wrote:
> The exec Makefile announces that binfmt_misc_bpf is skipped with
> $(info), which writes to standard output whenever the Makefile is
> parsed. The selftests install target appends the standard output of
> "make -s emit_tests" to kselftest-list.txt, so on systems without the
> BPF toolchain the runlist gains a line that is not a test entry:
> 
>   exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, ...
> 
> [...]

Applied to for-next/execve, thanks!

[1/1] selftests/exec: report the skipped binfmt_misc_bpf test on stderr
      https://git.kernel.org/kees/c/b36b990c50b1

Take care,

-- 
Kees Cook

