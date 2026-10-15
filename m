Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30384429029;
	Thu, 15 Oct 2026 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792086380; cv=none; b=lX9FRZXU73tBHnsl1D/jsuEeDzvMkVmmRAI8KIkvOP+vHSkh3vGSA3cQJarvmX10o6fksIV4poxu8RqTR4pzCdefk6SqmGQlFsPhjPEJL9bkFCScb7/igPN9mkBBhGNgXiepCTuSZ+XmJyd22TeC/JRPVtgF17Zt4+f8rXR4yG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792086380; c=relaxed/simple;
	bh=ZcBJl+1YsL1i0rpJaSh3sSGUpQjDAqsQLBJYELIC3bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPo7NILt9HBhhQyCN4k/YNaK34OME4336+IP96VT9sroJyes/72pmN1fAajzoIJQ2Xv3GZlLubEwMKrmdvMkiH7Ydglmx1Vyg5slp3l4NIteKMHkoYkXLEjWCQYc0/N7rMT3bHkq73CTjU7MLdcJ+Tt9lDwrhHaxy+ZiCYqppmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qmNb7l6/; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qmNb7l6/"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1D0614BF;
	Thu, 15 Oct 2026 10:46:07 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3BD03F7B4;
	Thu, 15 Oct 2026 10:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792086371; bh=ZcBJl+1YsL1i0rpJaSh3sSGUpQjDAqsQLBJYELIC3bY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qmNb7l6/AnyI4r5dhqctAbBolDjTTifnOOP16R2tXBoFVoSYpXvm+bZDNbyY6G9xJ
	 BWkmbUCVIHtHnJotwWIv79b3yW13Ubw4scQJbLBQJLfYBhcZxwnwWZa+gTY6HRIKX+
	 0EC4GoHyUZWmeFf3Rh7NatqFRfvwvHn0VSbHP3gQ=
Date: Thu, 15 Oct 2026 18:46:05 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>,
	Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] kselftest/arm64: keep building and installing after
 a subdirectory fails
Message-ID: <atERXTfz9xsIuv-7@arm.com>
References: <20261014200115.1363363-1-sashal@kernel.org>
 <20261014200115.1363363-5-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014200115.1363363-5-sashal@kernel.org>

On Wed, Oct 14, 2026 at 04:01:12PM -0400, Sasha Levin wrote:
> The arm64 suite builds and installs its subdirectories in shell loops
> whose status is that of the last subdirectory. A failure in an earlier
> subdirectory is therefore lost unless FORCE_TARGETS is set, while a
> failure in the last one fails "make all" and, through "install: all",
> drops the installation of every other arm64 test as well.
> 
> Make each loop fail only when no subdirectory succeeds, which matches
> how the top-level selftests Makefile treats its targets, and keep
> stopping at the first failure when FORCE_TARGETS is set. When a build
> report is requested, record each subdirectory as arm64/<subdir> so that
> a partially built suite is visible even though make succeeds.
> 
> Invoke the subdirectories with $(MAKE) rather than make. The command
> line variables already reach them through MAKEFLAGS either way, but
> $(MAKE) lets them use the parent's jobserver and makes -n, -t and -q
> apply to them.
> 
> Fixes: 313a4db7f338 ("kselftest: arm64: extend toplevel skeleton Makefile")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Sashiko had a comment about breakage ARM64_SUBTARGETS is empty. I think
it's a false positive but I didn't check.
