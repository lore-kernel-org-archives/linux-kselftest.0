Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895832D0DE;
	Wed, 25 Mar 2026 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464979; cv=none; b=bsCDiHkjgEj7kFnIvyhLaYIRe7VGun4BL9HrgSLUDyaoq7BRApFKwOWz1pUyLzaOXdKfnB9QTVioHpn18UPGy8xI5pJxOZJgocx6rBt6iYx0QX+MdPnBY4G3cVwXx6oqKIqX4cHwyibbGVnXXR9zSP+JgATR5MbssnWJ4Elextg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464979; c=relaxed/simple;
	bh=lp0LXh6BFpAmbxVcsSepCoAFLcbpz420PeI1wAApxVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KK0LXIgCgdHDkyT1H+q1nkwuWsxo2FX4DsFs9okF7a1nuCu7T8Z1xlToZRqqchzSsYXTloteK/+Wwh6er2jji2LMxI4IQGIKpjMob2b2XvQZAYvgmpIF+mlHrExJMrHbHoZ0MzN9Pd8lkjwWHE1joyHl09ilnhFl7OtlUxCF98A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnX+GgqK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnX+GgqK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E761C2BC9E;
	Wed, 25 Mar 2026 18:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774464979;
	bh=lp0LXh6BFpAmbxVcsSepCoAFLcbpz420PeI1wAApxVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnX+GgqKNcpy31iHo9ZdlllUIyufqIUI0lVEDG9Ls6JtXoJimek+xiiKuTGx/B4Om
	 pko+uOtdyDuFZMld/MX7eJzT51F8a0DGB/fEifSyipyA+7LmhAjC7+eUhj6ym0XTfd
	 5kOhvEIGAbl/rLGlhIszOkXSIyZUuUAyfhy9qf8rm8ptRa3UUE+zeX04M0rdxJhc1Q
	 5/VoEpj3kBhUzw+fiK3CjMhsMu3lawsBhuWrEeAxcp+WEHKNLONVwMWAUHfmRybjsU
	 k7UUH7aOqKx0nsuf85modRyQymnGguI6YrWRufNzQaLNhpNu+a7Ufc9fANPKe5fpgv
	 0VVvq8d8R7E1g==
Date: Wed, 25 Mar 2026 20:56:12 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: linux-kselftest@vger.kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	pratyush@kernel.org, skhawaja@google.com
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
Message-ID: <acQvzA6xTD6IlTll@kernel.org>
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325182026.467307-2-pasha.tatashin@soleen.com>

On Wed, Mar 25, 2026 at 06:20:25PM +0000, Pasha Tatashin wrote:
> Currently, LUO does not prevent the same file from being managed twice
> across different active sessions.
> 
> Use a global xarray luo_preserved_files to keep track of file
> pointers being preserved by LUO. Update luo_preserve_file() to check and
> insert the file pointer into this xarray when it is preserved, and
> erase it in luo_file_unpreserve_files() when it is released.
> 
> This ensures that the same file (struct file) cannot be managed by
> multiple sessions. If another session attempts to preserve an already
> managed file, it will now fail with -EBUSY.
> 
> Acked-by: Pratyush Yadav (Google) <pratyush@kernel.org>
> Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  kernel/liveupdate/luo_file.c | 26 +++++++++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
 
-- 
Sincerely yours,
Mike.
