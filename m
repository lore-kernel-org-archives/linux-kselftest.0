Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE2A3D5642;
	Tue,  1 Sep 2026 15:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275465; cv=none; b=O172bGMBYr/iZ6BIsD6IgQQxpctoEJbkNsLluzW4eovEObT0ieB/S4qkPKsLZ6iVK2j/SNHHGrArDRbiesZR3LEO+BJOOUfgltHmbtE/Kf6p0sZuUqGUpV1kLCTpOJFCVkL6IyrpYyrWNazXz2zd5bYhRuOztIxSI9VLqCHMkF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275465; c=relaxed/simple;
	bh=qDgj4MeYyj1g5LjsiULUt7k2hOoF1DI1Up8InGi5oIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O1zrXewtBDIFl2Zr0Au7uWX/Oa69ACm3eQb1OFhu2hR+sc3FA1tb5f6PKD8+Wq20x0F8zElqZtrEXNIX9zWO6wxZ68RkDJLvuHClsMVx6DwA75zlDn14ONrBpj3vxkvDIEGm/BOv+py1aKh+0j5jrFd2+R79cZWuIdYK+wy/7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tyk3bbEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tyk3bbEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6742E1F00A3A;
	Tue,  1 Sep 2026 15:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788275464;
	bh=0l8EZcNi6dolIEJzPnTrcTZgZ61RR9ype1tGA69B0/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tyk3bbEKto1qv1vFeKQyB2/orOBc/I8yZq4UqlIgGrk4sC7/W2GeUXCMg6p1mzirt
	 tXhtUCaei8tnXeWw1mSBK5eWSaGkn9walOM9lsvpjPwG/1/5gh6a8dvf4r1AoO9gY2
	 gQZocpZLRbWeLZNfqyMMe6+ryzYzK4vD/Qu1W8gBpBtlpEuNFEOAp/HD5FdrxS/g+i
	 vF5wjALEg/rMa2aWsl+iBQjWQ74mbdfnKf8rLzGr+NafpDl3/cqcmnfLUw2YBMRMv5
	 BDiWw1ELCY1VD2SuDShjOB98VE1Sl7oPa/CNtun1cNuQyHVUYVTcvoBFrMHIAQylk2
	 0t601hJxCR/vA==
From: Danilo Krummrich <dakr@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF
Date: Tue,  1 Sep 2026 17:10:59 +0200
Message-ID: <20260901151059.1262983-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8dfb4afaf70b59cd33af9296464395470405187e.1787239268.git.geert@linux-m68k.org>
References: <8dfb4afaf70b59cd33af9296464395470405187e.1787239268.git.geert@linux-m68k.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 20 Aug 2026 17:23:29 +0200, Geert Uytterhoeven wrote:
> [PATCH] drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF
      commit: bb3a94a68283

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for Linus's tree and should land in the next -rc release.
