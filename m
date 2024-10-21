Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0E01EBFF2
	for <linux-kselftest@vger.kernel.org>; Mon, 21 Oct 2024 13:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515744; cv=none; b=h76en21JViKRnmitRZHtExMs4gualPbNrWU5RJPPXDIM5UVCxMTTI2viXDRrEsLjliNjXXPC87XSDcmYhG+uA17RIe3e5R1q5tevT/mScCycOtjby+ExEyrEDkohEXKJm8mVyxHZpDdHI0DnKspoXj5J0odifty35xArnzKWsMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515744; c=relaxed/simple;
	bh=YwYBJ5iheaN4qE2/51LzttFZzdPwxHiYJIxWdlg74rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bHbYEkImwJCU1Eh8JWDyWtXT0YNJJAP80wV8wxRgLh2wusPATcgqIw1Kza3AbubGCjeOebyTcqEmt/L6IW9kYthCzrqtly0u2INRP2tWB2McoWPSdpUxkfk9qKXX4K2Xbq+6SqG6KC8C/pUIqk/1jN+d/tdq27damEcEY4Q03NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0EEC4CEE6;
	Mon, 21 Oct 2024 13:02:21 +0000 (UTC)
Date: Mon, 21 Oct 2024 14:02:18 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org,
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com,
	broonie@kernel.org, dave.hansen@linux.intel.com,
	dave.martin@arm.com, jeffxu@chromium.org, joey.gouly@arm.com,
	shuah@kernel.org, will@kernel.org, linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 2/5] arm64: signal: Remove unnecessary check when saving
 POE state
Message-ID: <ZxZQ2qjQmMmY9Aht@arm.com>
References: <20241017133909.3837547-1-kevin.brodsky@arm.com>
 <20241017133909.3837547-3-kevin.brodsky@arm.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017133909.3837547-3-kevin.brodsky@arm.com>

On Thu, Oct 17, 2024 at 02:39:06PM +0100, Kevin Brodsky wrote:
> The POE frame record is allocated unconditionally if POE is
> supported. If the allocation fails, a SIGSEGV is delivered before
> setup_sigframe() can be reached. As a result there is no need to
> check that poe_offset has been checked before saving POR_EL0; this
> is in line with other frame records (FPMR, TPIDR2).
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
