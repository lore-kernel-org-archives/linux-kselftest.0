Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F0739989D;
	Sun,  2 Aug 2026 12:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785672767; cv=none; b=ird4dbAW5eqtI65QPG3pBkosnRIBxkX869fSiGiBmgh/CBlcS+KGeQQfqcmVzIKNp72tCokYAX8cVYThvjEi7VbCxHkEoPcOsFDseXNzJFWokV/Y0Xhxkl6Zf1ukq3co9aGBfHKiBGsYxcrSF1q1t5rFBG8x3V7psV3jQbujzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785672767; c=relaxed/simple;
	bh=zTSUVk9RUpVdrsZ02Jsx2oi4fZBm8Z4ElkTNUPZhfps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eem3hsct090XE9JejoqACHm/LrTERT/Qws7lORCmufOyA2xr8Vd/H80QPCZNlrXgIbKLoJhuPJ2/MhdIs/R96sM6z6D7CT0gRnmhThRBzvynK14N4N1ctnhPZd8ri+vxNH1FGhrqEwYaR/EE8RhiBpWmae4Lar6u0wxLmwHGtsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvjWMwJT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvjWMwJT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF3F1F000E9;
	Sun,  2 Aug 2026 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785672766;
	bh=sr4eyIZPLWanwYAJIo3G9W6r+iGCRZrMeJZoQ8okwIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CvjWMwJTCWWtrNiZeqtDB6hyap94T6/+ReUgqnvvgwJtIuXGlQ5jpzMp8q0HnxeFm
	 Pq42CofwQNBGidGQqvsoHRkAC8IMertIRsIJq3xBjbjaJxOMEN3Oz+OhFcQr1X1Y20
	 ug1vUoji6tYjKAUhUcvbYZyAeY6mLaNRNYsePBJopCnCxbRwGku65Lzj/yy1PhrLJF
	 rF1ugRPv8s9BiQcCCK5RlkLw0kfffWo/SexA6PSW7z11I5sVbr/ilo0ESHyQ7OTcM5
	 mRCVlwVwzwHAXhZ/2csyFi04GVnlYhTZJTvs/jzjzxTIQ/ICuTJQPgtE9VHPy7RqAx
	 11QyvDKp2GB8A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] kselftest/arm64: Don't write to P0 in irritator on SME only systems
Date: Sun,  2 Aug 2026 13:12:21 +0100
Message-ID: <178566447595.4144986.14825319968746082587.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
References: <20260731-arm64-sve-test-sme-only-v1-1-eb559009dce8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 31 Jul 2026 21:50:52 +0100, Mark Brown wrote:
> Commit 3e360ef0c0a1f ("kselftest/arm64: Corrupt P0 in the irritator when
> testing SSVE") added corruption of P0 to the sve-test case in order to
> ensure that the predicate registers were covered as part of the
> corruption.  On SME only systems this results in an illegal instruction
> since signal handlers are run out of streaming mode and the predicate
> registers do not exist out of streaming mode without SVE.  Switch to
> entering and exiting streaming mode in the irritator, this will reset
> all relevant registers to 0 if they somehow weren't already by the
> signal entry.
> 
> [...]

Applied to arm64 (for-next/selftests), thanks!

[1/1] kselftest/arm64: Don't write to P0 in irritator on SME only systems
      https://git.kernel.org/arm64/c/2b989c411ab9

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
