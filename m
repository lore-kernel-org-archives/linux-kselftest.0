Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09464854E8;
	Thu, 27 Aug 2026 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844171; cv=none; b=ua08uT5L72xe4xefqyDqgmkc4QHXfT84m/Ie0sUCi+FgYxbi6uT+AYeDxCbGEHD7TJXdeNyLro5NUwrDoIlxSY7uS6Gc+e5+CtylCXoENT2MboBmElPaZykWawOab0eYinIMUtKc6PIEOhpKpoaePDreFYnQJU0kqfvQOzg7xxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844171; c=relaxed/simple;
	bh=ggyFxAdpfGgx40TtQROjIQ51x3xGAkfwgwWbnGWkKsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZZmPcKXTJB6oFUgD+qRyXbp8JnT+PTfjZLnK1m4CKq00YYbe59T1hRZc64KFsfeXooKUWNH8Mg9KGPTCWFJNNo82ecmPdXkOyFPats5VVGnPIz08NH6DBh/VE/VqFbiQE9x5I01Kzp83T+mSjOntLa76yn+p5Scuw/KilAP1Ghc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VllPGGzA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VllPGGzA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5EA1F000E9;
	Thu, 27 Aug 2026 15:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787844169;
	bh=v++WpEwEbf4EpZ34f/FFcUO3YM4jYeI19GmAxfUGHxk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VllPGGzArDP6/pmETstGz27ibL0nXuH/r1Udj5HTHTx06lntiCk6HX4/N1eWIo+CZ
	 aIa/FswvIcyvhffHlwAN6XBYVrsLhMhhnC4PnnibY27cOg+sUQcslSpHPFdkWwTXZ6
	 gMmC38TKOl3sxLUnOtxgKv7tEvULMtVDCLXV8dMgGPskzcRmzPOTG0RGk1ln2NX423
	 2IbJ13cA9a4b4poi+HBZYiGw+vpSNxfwTNPr5oSWVqjcTKxrv1/FA5J5w0wgzguVQa
	 eLXEAO3Obx2NUa4ZjlNvOEIIWJUIJShj1YZ9OuU7fYCEGKwAWcvDnstTRAqZTesx1e
	 ++YpLg0vPfS7w==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Amit Daniel Kachhap <amit.kachhap@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 0/4] selftests/arm64: Fix MTE test setup and TAP reporting
Date: Thu, 27 Aug 2026 16:22:38 +0100
Message-ID: <178784032021.66644.7509441879156473484.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825111929.2882324-1-usama.anjum@arm.com>
References: <20260825111929.2882324-1-usama.anjum@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 12:18:33 +0100, Muhammad Usama Anjum wrote:
> Running the mainline arm64 MTE selftests on a Pixel 8 exposed three
> independent reporting problems. Fix these reporting problems, then add
> an arm64 Kconfig fragment covering the facilities used by the MTE tests.
> 
> Testing was performed on a Pixel 8 with an Android 6.1 kernel built with
> the new configuration. All nine static MTE binaries returned success.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/4] selftests/arm64: Print missing MTE TAP headers
      https://git.kernel.org/arm64/c/8d2237e9d690
[2/4] selftests/arm64: Treat KSM merge_across_nodes as optional
      https://git.kernel.org/arm64/c/1a0dba077f34
[3/4] selftests/arm64: Fix MTE prctl TAP plan
      https://git.kernel.org/arm64/c/bb52892f9234
[4/4] selftests/arm64: Add MTE test config fragment
      https://git.kernel.org/arm64/c/2bd533739234

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
