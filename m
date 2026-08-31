Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB413415F2E
	for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 17:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196009; cv=none; b=XQCJzt4pSxoNmd9Q2bxwYDTpYEz6fxVkVsNMpgxcoy73vER8/INsS5rGlFyGspaoz6RGIVW1wYZEB4mNJFFZd3csrU6l/d1df1Rugw9LAsVT6O/LGiQtN9rsO+r+U/yqx+O/KVqK5iro2VGnPKfOdG+texRO8UjCQQDrPn5B2W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196009; c=relaxed/simple;
	bh=K2KqcoylP9ajdo74uYFE/bbmE9F2Qm+5zWNnAdHfvtk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJKtbeLeXbXZH5AU8oIaIPoVQyaZca8zQWBCEgomcByluPtXU+V/+Yz/piNUSvqvirM9lpOaIB9Ulkc6Oe+mdcSfbeJ7GlPxgVlr/nyBu5KKVSnsSpjPvt+D9k0eCNQrLgfEM5xlN6bYcDs3JO5pp7GVJTKgeMAq5fB32S80m9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=gK6qDEqY; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="gK6qDEqY"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52de50e77ffso45153901cf.2
        for <linux-kselftest@vger.kernel.org>; Mon, 31 Aug 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788196005; x=1788800805; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ey0i6GY/+uYMiZdrZqXVheWdxLiejFy0vPzvLZWYeyQ=;
        b=gK6qDEqYLplMfc0PeagNg51XBWZ5Gezhr+drQWG/zYTbe0cDiqE1bJFqfYn6/jGUuV
         bnLDKRq8OZc1doxPIcSiwcHKxWLLutMkgJAxdUQOTIE0Vq+09axSfP1bNfHm85E7JuCu
         6Fa8PexMdPFZ8o7aAP+tRcDOokPf+25n7TrUr74zJm5QnuAPQuNEMF9fxwyWjkJDbO+q
         na/oCVWpgDzcnbquL7Jg8SFRmIFIme2Ny+uB+6i3qMuII6OB0nVA4vjLc6lavRe3lQ4G
         mTUdgxP8R/GTSQtnAzWdROL6ND0r6xINxq4b9hKumbN0e2tELfY1O7LbYLQhEZ+0FD0/
         Fg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196005; x=1788800805;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ey0i6GY/+uYMiZdrZqXVheWdxLiejFy0vPzvLZWYeyQ=;
        b=YXP8i5BA0KNbt1RUk77kv4YzNvT0fydpILAAzHF3+ICIzuR1Wz0jUxIgA8HSiXAHcl
         mp4oIvVxT61d/dtSzgW5Rj2IMbDZaqVBZhJiBe0AH4qUrIv2TcW8owa2naoTvhgdqq4T
         B3HNSKCd5q9MHqbQUdTdFwNHbSBE3PgcdhOcjPuv3Fw5GobjzW2lht89FTdceimVPxvF
         PBvcsqrkgQQByH9fn8VgTKh4UJE9r7xnaBYymz3uVn7e+wmXW/jEQilkONU2Wnxyz+VH
         DS2b0EML22zrBROf8+fiQxBh8F/3pXmgnheF9PszkPs+Xsw+ToJf68XExHResJfKD/tX
         OtcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkIa2zBqHsVvjsNEVWrML5el9i6j+uOyKk67IojA4pWHHyJBgoZYASeidytHaTGXaSHSqG3GsUYCRye8vD9yA=@vger.kernel.org
X-Gm-Message-State: AFuF++kVmh9sRuNR+1dOu8d8q3Cz+iUh9lYLB8jgIpyW+t3yFCOuD6F6
	wMX9xjlT8+K/98Gh00mWnL3O3cGbVJ/RJAlLreBS1isux7QIKZzU2rYRitCj1nWhXCg=
X-Gm-Gg: AR+sD1314SWAwUbZrVqNpijTF/PKPc/tDmE1HUaTF9mCsrKFT3yCmZiTanZ7KKufTB6
	1sKzzMd/aL/t1+e0rPs0Iz0WUWSb+bNE94WqGi7iSF2FgRXJRJwZKe8SqqbcKU94smyuLWnnov/
	JtG4gKwsTEjvV2407H+uNLAo/X7XE2wGE28ckFlpjopg2RnytF8OItbNLvUUULWqvAB4XK/y+eA
	aJxbZ4mLYqg95eeR1rgKwD9aEVUOuMkDsK74TPt4alTjkt5ENU6ZgszznY2NSsJA3y7OJrfvTVw
	jLP2oXc5Xrkjdx54nrYD/cd83lTnnailzU9ff14EOC0eIa3OO5VlKT6eiwzVumw/ASP8BszQ1J5
	TOEo2Rx5Ct0s7odjs/ILOlwbAy8UdE8bZVW5W97RQcvM94GRzJXKZyefg1H4maY3WW6dndiIuV5
	LZT4v50V/a3psuCyRQcfE69S8hWSI9c93SCe7GTUDtulSAcM78wkDIqf87BmXzdZPUsgcuBtgEF
	MbvCH/CD5lzb4WbIqILGQafH83RF3YWSPgOTMK4giG0
X-Received: by 2002:ac8:5750:0:b0:52f:9e5c:33ff with SMTP id d75a77b69052e-52fb93edd51mr337452961cf.13.1788196005399;
        Mon, 31 Aug 2026 10:06:45 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce44f4ef8sm87774886d6.31.2026.08.31.10.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:06:45 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:06:43 -0400
From: Gregory Price <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Pratyush Mallick <pratmal@google.com>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/testing/selftests/mm: add missing .gitignore
 entries
Message-ID: <apW0lpz-4o6zGbCK@gourry-fedora-PF4VCD3F>
References: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-fix-mm-selftests-gitignore-v1-1-c984bbd4c5e4@kernel.org>

On Mon, Aug 31, 2026 at 03:18:23PM +0100, Lorenzo Stoakes (ARM) wrote:
> Commit 2bee308f3adb ("selftests/mm: use pattern matching in .gitignore")
> switched to a pattern-matching mechanism to reduce churn in .gitignore.
> 
> It however accidentally excluded the page_frag test's-generated module
> intermediate C file with .mod.c extension, and also the local_config.h
> header generated if liburing is available locally.
> 
> Explicitly fix both the issues, fixing the module-generated C file as a
> general pattern as these are always intermediate files that should be
> ignored.
> 
> Since this is a trivial .gitignore change it doesn't seem necessary to
> treat it as a hotfix.
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Reviewed-by: Gregory Price (Meta) <gourry@gourry.net>

> ---
>  tools/testing/selftests/mm/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/.gitignore b/tools/testing/selftests/mm/.gitignore
> index fcd892ed21e3..a306d7754786 100644
> --- a/tools/testing/selftests/mm/.gitignore
> +++ b/tools/testing/selftests/mm/.gitignore
> @@ -2,7 +2,9 @@
>  *
>  !/**/
>  !*.c
> +*.mod.c
>  !*.h
> +local_config.h
>  !*.sh
>  !.gitignore
>  !Makefile
> 
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260831-fix-mm-selftests-gitignore-dd389da72760
> 
> Cheers,
> -- 
> Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
