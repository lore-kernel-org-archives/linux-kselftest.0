Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9AF3B8BC4;
	Tue, 13 Oct 2026 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885442; cv=none; b=omdy/Uyayj/g6+DTw0JKNca9VuYRGZjS3KPGX+UKH4ujpBti1SYsitbJQziBt91yBigW6KiNmVVluSkTO4J0WYf6jNVp0dGSzOJ0jj6CTS/CrwCXCfLs7BoADmMIU1phzWYiUWJLb047QRcMi8PgEVP5vEJqnv/ZWU5jeO/rq2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885442; c=relaxed/simple;
	bh=HGoeeZITY1yiqWKPCRyOegKLth8A2d88tkJlPFv5jJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJyeUDuubaJyT1VnAseuYVcepyDAg/vvI3fKtSjy5kZMfGIraK5dFl66vGVSiXKmVxY0VzJ5UIum1+SBrO/HJNoKJPJoZVV0kZlImieLMxEmycAazO9vlGjsuGR0Bh8uAWSW+mb9U55z8XTYc5NWqQCL5YBae71bq1AX2e2TP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVmjV3TC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVmjV3TC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FBD1F000FF;
	Tue, 13 Oct 2026 09:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791885441;
	bh=veCpztZVQ0/cgy+OxvseE+wNCflm5n0ceWAT1R4Yum0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UVmjV3TCF6PyZGIxzC3hOmgxGjwEOr9DY+UYRT3mFLXIkgFwMVepBE2eytkPVczlv
	 Lifc6k0g+ZxPgi7YH4j7ZXspcPPnr06K5IDXqChhPZ4HNgXOaawufKHBnhTNcFVSql
	 rAU0PpMlHy9VJuI6CEEMTMOTupR6Y3VdUwTUAoHmxYyULnBJ0UMJeq5rQrfBAgTeyD
	 VMBx2RRXqDvLbzoSQWV6CxO8mGXDyui8nH5/r/TmTaR+Rm/k/EI3O5gV6vbiCdp1iJ
	 2iUQHBVPbE5IEoSh1/QfstI22OkftOw877p0qxMv41ZPi+jITo2zrO0a8T2qgHJ7wE
	 UIZ4rTM3VwE7w==
From: Mike Rapoport <rppt@kernel.org>
To: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Jordan Richards <jordanrichards@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Subject: Re: [PATCH] selftests/liveupdate: Prefer KVM and HVF over TCG in vmtest.sh
Date: Tue, 13 Oct 2026 12:57:13 +0300
Message-ID: <179188542242.4186121.17333029282373982813.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008132813.1966023-1-dmatlack@google.com>
References: <20261008132813.1966023-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Mike Rapoport (Microsoft) <rppt@kernel.org>

On Thu, 08 Oct 2026 13:28:13 +0000, David Matlack wrote:
> Pass the -accel options to QEMU in the order KVM, HVF, TCG, so that
> vmtest.sh prefers to use KVM and HVF over TCG when they are available.
> 
> QEMU uses the first accelerator in the list that initializes, and TCG
> always initializes, so the tests currently always run under TCG, even
> though the commit that added vmtest.sh describes "automatic accelerator
> detection (KVM, HVF, or TCG)".
> 
> [...]

Applied to next branch of liveupdate/linux.git tree, thanks!

[1/1] selftests/liveupdate: Prefer KVM and HVF over TCG in vmtest.sh
      commit: 48e6e4202e12af36671c6479b9ebcb8212d37cbb

tree: https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux
branch: next

--
Sincerely yours,
Mike.

