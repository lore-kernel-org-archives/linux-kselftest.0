Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A87130CD80;
	Tue, 26 Aug 2025 19:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756236926; cv=none; b=uhGBWSaiVQl9V7CXpmxgCQNilO8Ocu8rByqZrA5nJrSNpBHKdmGaEL8xXDV+SVNl6lQMa2+/+z/KpK00Ny44FWnUR0hhtbZ+is5X+5rtV+AanI6+XpiFQxKt6aY9TXSpZ8jnvt/SC9R9f0ukAfs1YY06MlGBQYuGeJ9X0D7h544=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756236926; c=relaxed/simple;
	bh=Bef/MrtyQLJ8VpNScHFkujp7woGJPMjI2bTsrYEnwBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a0hDGA1J+mG4X4hsV4IaBfwriragqKr27UpSeMIhLSIF6YH91LFj+KmHi79jKxey6G96L+vrlcrGjZWFEAYIpUZSdAM7XgR/wXho8f+Cfk+mZub5LumXCgKVDFLKy57h+BZoYsPoAop/f1I+D5Xbno2Cur74wXbEZ95Jexo4RZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F3CC4CEF1;
	Tue, 26 Aug 2025 19:35:24 +0000 (UTC)
Date: Tue, 26 Aug 2025 20:35:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 6/7] kselftest/arm64: tpidr2: Switch to waitpid() over
 wait4()
Message-ID: <aK4MfzBhjkChTsvd@arm.com>
References: <20250821-nolibc-enosys-v1-0-4b63f2caaa89@weissschuh.net>
 <20250821-nolibc-enosys-v1-6-4b63f2caaa89@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-nolibc-enosys-v1-6-4b63f2caaa89@weissschuh.net>

On Thu, Aug 21, 2025 at 05:40:37PM +0200, Thomas Weiﬂschuh wrote:
> wait4() is deprecated, non-standard and about to be removed from nolibc.
> 
> Switch to the equivalent waitpid() call.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>
