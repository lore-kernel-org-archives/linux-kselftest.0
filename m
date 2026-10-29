Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793307517;
	b=ppT2D/ssTomCJbQD4ILEmH1y1oNZHrz6YJmrAut+pR+lwQr3FoaSgPaQcbl7Y3klAY0w
	 2oYvOS+jy6dhS3mi/uoKqMAXx4XJb0WH5Ll5K6+kA32WoWrqba7M2McqX3m2o4UPeztm6
	 tLE32QklcuBpiZdJAJo5zXwJUx7T+As2ZRiCo/cn0klMCm9vRqd3eXWcRJzWRcMskaTdN
	 yHP4VeHSP0hIzPOAfrubME5lIjmLBbRolHA6DBsSU6ThY1qb+Pq8PXkMC+0dueKvukOAG
	 UiZN28d32lx3rVCyD3cfydTWDrALrNiHCUCdJHlySHyl+fmVDbvntRP1GFCsLA30aIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793307517;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dIfxXtJJhYl1IbYSRp7uBxydnNbuRGgEr9ZG2LuSx/c=;
	b=EJuXEcWW+lHzeqgm5yf5WXVljRVw/eW+mVOKoFupkDCD8e/xpU4O7Ajqwi01EiGkxrc5
	 zUzVVTBppWBRhbNlDl+6MBK4FQ+UUorghTiaV9Ztb7POsqmq2FeUnKupDGxKzjZZ9y0Kp
	 l9sIJYG1dAJuaClrfsidx2nNoL23h94/R0Zatxjcup90kQqdzJSRTN2KQUMDcyM+VlHTv
	 aR7qm3BWL+wy7dDtyRIkg+xkRbywaKugS1lvhWJRaDcm4aEp3oApqzwOe0rrpwhUw00Am
	 FgFcfnS80Q03qTBisIAVrK1m8QiloU6wB3AvC73bNXQT9hRMOJPVqFKUfbTL1P/I89Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jg3ya3oC;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F178E606A329;
	Thu, 29 Oct 2026 20:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F178E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Jg3ya3oC
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CAE01682;
	Thu, 29 Oct 2026 13:58:32 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B0EDC3F673;
	Thu, 29 Oct 2026 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793307515; bh=eGINbpk+u5dvPrarZzSg3shFUdSyR5pE2iLotRLHSCk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jg3ya3oCDlJtfPw43F1dYsM67Or+gCyrsue5QCdurwpKyWWtwvnp3RvmiZ9Ynid6f
	 iXK50kRZhgRaNStldTmZwtCpo9XV7zcXJIQFkujqsnRBs7R0sgV/HmWc4ZXcZO8oWA
	 kvVh9562O4fhFDKMW7e1cT/sxwAvKVPukiz1ppBs=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: Re: (subset) [PATCH v3 0/4] arm64, riscv: release shadow stacks on failed fork
Date: Thu, 29 Oct 2026 20:57:00 +0000
Message-ID: <179330742036.2531571.12603232226357262067.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 12:43:11 -0300, Iván Ezequiel Rodriguez wrote:
> clone3(CLONE_VM|CLONE_PIDFD) can fail in put_user() after copy_thread()
> has mapped a shadow stack into the shared mm. copy_process() then calls
> exit_thread(). arm64 and riscv did not implement it, so the VMA leaked.
> 
> x86 already frees via exit_thread() -> shstk_free(). Its separate TLS
> leak is when copy_thread() fails after the alloc and skips exit_thread().
> 
> [...]

Applied to arm64 (for-next/core), thanks!

Only the arm64 changes, riscv can go through the riscv tree. I changed
the commit log a bit on the first patch and addressed some nits Mark
raised. As a separate patch, it might be good to add a kselftest for the
io_uring worker thread and GCS.

[1/4] arm64/gcs: release GCS on failed fork
      https://git.kernel.org/arm64/c/078e122f3bf0
[3/4] selftests/arm64: GCS must not leak on a failed clone3
      https://git.kernel.org/arm64/c/f46be4da2cbb
