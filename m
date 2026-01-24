Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B5B13B5AE;
	Sat, 24 Jan 2026 08:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769243412; cv=none; b=D7KZEYpk9wu+hlhfF5ypfqiqdblnG38187KhFUerDNDKBcEgerjLxzl343WRgTHVvkN5dvU+YkKHsZHjnAwbIkJLu4inLcaKuTwMhBXB9y0HJH4mO6rPiDA70xOCpLm1HF+/aFe6p8XgtBLhLze3rHrX/3bqfzEsRk3DsR07vfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769243412; c=relaxed/simple;
	bh=IfSksN2DAR6jItQtNlLEGOjx6mECbXSIHAxZaX3DZ2Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nowWIA6+n9HFEfp40CuKJbLftXTBzmOpGMvP45e88pNi3GR3WTdPJqu8IM4joBDKfpcPT8098oGAzqx2XBa3LVZRMMNgfN1/dVXUtIWGDq/AG1WNdZ2DwxyGY2PMzL8XnIv+1CcUBbJoJVMPYfOso8qiQCMZ3+uDLJJLZpesYBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/KRvkYw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/KRvkYw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D49C116D0;
	Sat, 24 Jan 2026 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769243412;
	bh=IfSksN2DAR6jItQtNlLEGOjx6mECbXSIHAxZaX3DZ2Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o/KRvkYwoKde30JrO5/+uRYoTU1kAPgW6Tv87WJ3/WIZaZ3olmQBY90T273f1zqNM
	 IYX4E/J6STWwO5NfWlZHiy0tjuLIgZlYH9PGdW/5fbl304e2lub+3GHNqdWmiJYgAv
	 a7esFeaUX4E5+87E6KMXPvfXGAKsi1IEEJg7ubiR+EhHvLrzw6peuDt3yKjGzLTh1r
	 QE0k/BOYqtEgAVkofWqfTQ2KJzkd5wNz7L8B/jl1a8gu4Ij4tOMXLvys0As0BXPa9e
	 Q4JZZUGy3lCIPbqsqzTr6RE1nN+H6hThrTy4zKjhXquS9RhRKo6fvIEJcxRncWosb/
	 vBBfDjfrhY0hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11CBC3808200;
	Sat, 24 Jan 2026 08:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/9] riscv: vector: misc ptrace fixes for debug
 use-cases
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <176924340785.3247175.17185864218197872186.git-patchwork-notify@kernel.org>
Date: Sat, 24 Jan 2026 08:30:07 +0000
References: <20251214163537.1054292-1-geomatsi@gmail.com>
In-Reply-To: <20251214163537.1054292-1-geomatsi@gmail.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 alex@ghiti.fr, oleg@redhat.com, shuah@kernel.org, thuth@redhat.com,
 charlie@rivosinc.com, andybnac@gmail.com, samuel.holland@sifive.com,
 joel.granados@kernel.org, conor.dooley@microchip.com,
 yongxuan.wang@sifive.com, heiko@sntech.de, guoren@kernel.org

Hello:

This series was applied to riscv/linux.git (for-next)
by Paul Walmsley <pjw@kernel.org>:

On Sun, 14 Dec 2025 19:35:04 +0300 you wrote:
> This patch series suggests fixes for several corner cases in the RISC-V
> vector ptrace implementation:
> 
> - init vector context with proper vlenb, to avoid reading zero vlenb
>   by an early attached debugger
> 
> - follow gdbserver expectations and return ENODATA instead of EINVAL
>   if vector extension is supported but not yet activated for the
>   traced process
> 
> [...]

Here is the summary with links:
  - [v5,1/9] riscv: ptrace: return ENODATA for inactive vector extension
    https://git.kernel.org/riscv/c/35328975fa84
  - [v5,2/9] riscv: vector: init vector context with proper vlenb
    https://git.kernel.org/riscv/c/66d52c54e59f
  - [v5,3/9] riscv: csr: define vtype register elements
    https://git.kernel.org/riscv/c/0d9acbd7836a
  - [v5,4/9] riscv: ptrace: validate input vector csr registers
    https://git.kernel.org/riscv/c/995e66a25b26
  - [v5,5/9] selftests: riscv: test ptrace vector interface
    https://git.kernel.org/riscv/c/dca68b94a8b1
  - [v5,6/9] selftests: riscv: verify initial vector state with ptrace
    https://git.kernel.org/riscv/c/1a353e49a0dc
  - [v5,7/9] selftests: riscv: verify syscalls discard vector context
    https://git.kernel.org/riscv/c/4b7e068fe676
  - [v5,8/9] selftests: riscv: verify ptrace rejects invalid vector csr inputs
    https://git.kernel.org/riscv/c/bfdd22c430ca
  - [v5,9/9] selftests: riscv: verify ptrace accepts valid vector csr values
    https://git.kernel.org/riscv/c/ccb3038e946c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


