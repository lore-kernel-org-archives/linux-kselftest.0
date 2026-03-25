Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DEB3B2BA;
	Wed, 25 Mar 2026 18:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464717; cv=none; b=Aqvi4BqulPRKEtflwVivQbelvG9N4/woWxBU3+fpPTUdxP942eXu9n4mdbQRmY6YFWLLRQ/QJWlwsqrvJ8shs+7paFKqxdfSaPYjJmNstfrMSvwzflolv6KerBezUaNQLojSfBQ1+zmwnzjB3fM31V+m1xrWF7d//8OI32QMUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464717; c=relaxed/simple;
	bh=nKabycmD8hGlr8ej2ZDiLueAYeZuktU71Q2acHEXT6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ttxAiCBvM+vM8ZgHAdvRoNjpuC4NVcHfQDM44Eb3NGKW5NrBTjUzvjI1yfgAngQCDel4PcRHIIQP8pgB8yPyrswHGvhYha93jGUY/UaePyzQm1lFLc6Tm/+xu0/ZFcZlQ6flRQqJ8i5/2HVyFtjKQPf9n5J15tJ5Qnbm/i7YESI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgRXez6Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgRXez6Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA06C4CEF7;
	Wed, 25 Mar 2026 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774464716;
	bh=nKabycmD8hGlr8ej2ZDiLueAYeZuktU71Q2acHEXT6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgRXez6ZsmGXFcpqu/Y+DeLpqQglo39Ma1EdXqsgZBoSJAQo/KIDcNLfWXlcELFlD
	 2LXMtXZQjNJfmsCXmHbi1feqprwU4Q/ct0PW+Ab1K8ivIN+O74lCEvdEHZh8rQvzkU
	 mmhfb8H9/ZNeyoTla5pL7SlAwXBXbRKnA0bts71cOVF7YLV5qk9bljWobJSTIFJkTD
	 HCXb9olaOuz6vqjBXcpXvSJjdRtp5GlVywF1TrxPYHt9VDMXcmd8O/Y4kf6aht0Sz2
	 xURBufzzqX9OeRr+XBGXyy/E2jixymfjVr3uvDmn/V0tRQZ4BChvAK3l76DnCMGJyI
	 SnkniX6mz+5iw==
Date: Wed, 25 Mar 2026 20:51:49 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	pratyush@kernel.org, skhawaja@google.com
Subject: Re: [PATCH v2 1/2] liveupdate: prevent double management of files
Message-ID: <acQuxXLN16puikaj@kernel.org>
References: <20260323203145.148057-1-pasha.tatashin@soleen.com>
 <20260323203145.148057-2-pasha.tatashin@soleen.com>
 <acP_6wY_HVMyTLHk@kernel.org>
 <CA+CK2bDNu4+eR1FPOeaN+rZf1GWkiFHCaHwvS8wCKUPJkmWKOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bDNu4+eR1FPOeaN+rZf1GWkiFHCaHwvS8wCKUPJkmWKOg@mail.gmail.com>

On Wed, Mar 25, 2026 at 12:15:53PM -0400, Pasha Tatashin wrote:
> On Wed, Mar 25, 2026 at 11:32 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Mon, Mar 23, 2026 at 08:31:44PM +0000, Pasha Tatashin wrote:
> > > Currently, LUO does not prevent the same file from being managed twice
> > > across different active sessions.
> > >
> > > Use a global xarray `luo_preserved_files_xa` to keep track of file
> >
> > Do we really need _xa suffix?
> 
> I liked it, because `luo_preserved_files` is a little too plain, and
> not self-descriptive. Anyways, I can change it.

Just reminded a bit of Hungarian notation, but I don't feel strongly :)
 
> Pasha

-- 
Sincerely yours,
Mike.
