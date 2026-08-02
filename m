Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90139989D;
	Sun,  2 Aug 2026 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672780; cv=none; b=XhQFFVvXLvOzZyiCfYEoZFKUdzVpD6FdRFpldEHUGyIxeVF8QaP0ibZsstiidwQq96y7u46DaQ2/bGqbbRdIgaKNkPIgjWk1eMGpAxmVMDcP9RfPcUFDHxEb7H9Bz3suJ5i2IfJebv4knYkiKoo/YFYc/GRqPGEr5YiVpWQKVoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672780; c=relaxed/simple;
	bh=X+zrJdqIfyv6mSmekcs134rvOMoPATM+XEV/Z183Qqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dyFhONxDGxdrry2fB2VjA0PUx6IMk6x3S7AI7usF+MdL0f8gkDfN2f3XJiJmua+rlb7gzFePp94xdzfiwOCK70JpMyb+8EmusZZZTUwX86UMfHzRKw82yVuvTSSGy9WXXnMEJCEbGQ2bTOW54ewDfWOWoRrrzUxl7hHIh63I0Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Non4kLQt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Non4kLQt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BF51F00A3A;
	Sun,  2 Aug 2026 12:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672779;
	bh=9u/CUMEHJE1r7darJazQnppDclpbOonsLgGsBUo8D1o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Non4kLQtHLY3DHA/i/RsQgWW28Fvwj1qRLo5X338tdcIaExJaTuVrxMedRmhsUPMv
	 yEI5GWxaMh8GVqYpdZa2yZTwLYqvovfnT5W7fi1np7okD/FvWBH+BnAlRF95B5c5gg
	 vjpKi0UR4mwSnbNGD6NiKiPXjO10YK7wEeAY1oqZcvV1bZAMdZmRMqv3YOBSM5wYJj
	 oliO09H5zlj2FGt2KHYU6HxYvynwgKzK3MjhKiGOwnpLJBWoBzM2biuO2yZT84raeT
	 kM2pkV1cm7TlILLJqLVfDI6ONsp+eN8nRo+AonHnz4GzEzu7SRMLCdGWhHQJaBzKek
	 oM/SzhgJl1riw==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
Date: Sun,  2 Aug 2026 13:12:25 +0100
Message-ID: <178566399651.4140416.18012923201896956345.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260729004255.15630-1-kmehltretter@gmail.com>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> sve_init_header_from_task() takes header as a pointer, so for the
> inactive mode
> 
> 	header->size = sizeof(header);
> 
> stores 8 rather than sizeof(struct user_sve_header), which is 16.
> Userspace sees an impossible size smaller than the header it
> describes.
> 
> [...]

Applied fix to arm64 (for-next/ptrace), thanks!

[1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
      https://git.kernel.org/arm64/c/c3f83d021162

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
