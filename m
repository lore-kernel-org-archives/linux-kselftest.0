Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43203342C80
	for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 20:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787602618; cv=none; b=nYcdRlln0jlH/HwZjOOAz0c6Aji2pQPstyWJmbiIRYJEQxT7RmIWoaLhfxI+tcFT4d6NBv7hDVLH5Y+QxB6e1RHURfsfl40AeBnPVqyC43uCIMjehY/j9uDsG0tn0TXMhranpgXhIGFdZ/pH/psdljNir/TfvjjWlZRfX0wvGG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787602618; c=relaxed/simple;
	bh=hQjlGuZlCnDHfkbrg+tQFOHCoJBhwQJXTENokNCYpwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZNktKA9hQG3nC41IisFiJhlksPwfT1qSzwPu+BZ94M4vwRgdun+jljn76sylAIXvak2U/jz3jWTngtY2a+WYuE5GEiLgChNx4mpWcXwyQObBT/i5LDXsfiAFxnn9GhcFG7+aWGkjYcDt7b8kehqvdA2eS/dReAhTsMky2RV7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1kJfFje; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1kJfFje"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc11a30a259so4118779a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 24 Aug 2026 13:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787602616; x=1788207416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/UVYXaYGpqOjS4wy3Xiwfv8E1t/SazvgREqms2nJdOQ=;
        b=u1kJfFjeX5oFqFookgth1QWuJfUwok/5XqPn+10Hiuig05MQd4qqwy0hZn668UQLc2
         XsEzegKs/vGs+SXDYLDcYx2RvgCehiI+nCToZOPYAjzuH8H3tvasFG01Y6nCmCZIvhqX
         i8Ueq1JdlKCTPP//YhGV6eQxL+l9xxOFzGzd13hNF0D0riwkmrWV6UINM097j983faG1
         KdKh8eqt3gUgviys/sYp+7hV1ZZBE3jfNl8VFnb10kTA2mDnsYLlx8wJ3KAjlGT4omV1
         TRYwMHGt2i7Z4Eg0tNcLsWhJowtNMtt7YcPmDLY3TQJUbSFpr3eg7O22AZXLk50JEVMl
         OSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602616; x=1788207416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/UVYXaYGpqOjS4wy3Xiwfv8E1t/SazvgREqms2nJdOQ=;
        b=mB8Ttb9BxAi+HBPD/P6eZOsuwTIrCWa0h0FZgUu0pAq5PxOKGbEYmtIAGRfVuwvG1D
         f/xxosDX7qu2pxpn6jn3aWg9+oYhLEhPHNpuI2OhAapXy2ghy7ZqSVG328G5FGsBQCo+
         dh70ipHUh7qpwaS8PQ1N/Hm5csi2DbNMv3HatLxbuvnAo+OwuEY9x7MD2Mf/fr0+QRL9
         5koznVSVzAPR36AueoyQ+NVkD8eIEX5qMbVmsJKqccxcttOK/L8E32hdsta3F8ZHEv3T
         QDvXq0D+6/qAgvC40t+z+C6MAanHSUgVjJ+ylN8U9NCrAO/FlBa5y+1DuOIG0SwkLxBg
         t10w==
X-Forwarded-Encrypted: i=1; AHgh+RqEBMyCqR5OIbvyQnJ075xJspqtxSZvdDidwJ0c+y9jZhHyl1G1J0hPxOBFfv6KTJbGri4dJq4O5XF9L/rCisI=@vger.kernel.org
X-Gm-Message-State: AFuF++lh0/3LiTOd+Nwuf0oNPqlUtsy9Yw94a94lv0nJLkev4yiVM92r
	9fmbXkjvqeothwLlRaMeXEFI2z7RK909NVmZXL5RrK8YU1Hk3bvgNuuKYWFf9wsCzw==
X-Gm-Gg: AR+sD11MYp9RLXQ4c13IPdbo+ZVaURzluFlk7R8Is0UwCTa8OS9gB14xeSlYkiQoIO/
	CL6ZCQBGwKIbdGia47hHGi9Jcvt+M1e1+d9vmu4aknlifqIHA1pHw+k/uI8/HBlYedrjFrkja0k
	bDqIcgbcqYHXVsEAN61EsLmfiPrFp0EchQ+0oVeHOFljlEGUYHBA2quRS0/YK5lz/wu2i/2+4Qw
	Ip90KkFkQRjHiA9SxPFoU48k0QFCTgueTxTT8eKBvm8v4D2cKafDWHVgsljX2VXSHqXV984IMwU
	EAu5Y+YCiZCOxAkUVpP1hXk8/XTvLGmb5PXtjDUwmw9fOEkyBjWzQsQHZl7oQvCYwUc4KyVWLGa
	oCSBGsfkr6xj/Wns4FKMZG5EeTVm8IL488ZZaVahfUEWpSYLQHud3E17S91G0Y+fKl5oHy+JHkd
	ttgS6//dN/gE2QZlFp31ZHXYZ4Xd5PsfA1O3EEkxzpHOZXr6jiaTt8U2XbFpx6gCzyEgzJuP8wM
	51E2vwc6Wl+pP+qLEhIdgT2OLiOZsFRqwH+Xu1W
X-Received: by 2002:a17:90b:1801:b0:38d:b36e:9813 with SMTP id 98e67ed59e1d1-395df25998dmr35769803a91.11.1787602615899;
        Mon, 24 Aug 2026 13:16:55 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39645bbf59csm809431a91.15.2026.08.24.13.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:16:54 -0700 (PDT)
Date: Mon, 24 Aug 2026 20:16:50 +0000
From: David Matlack <dmatlack@google.com>
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: kvm@vger.kernel.org, alex@shazbot.org, shuah@kernel.org,
	seanjc@google.com, jrhilke@google.com, rananta@google.com,
	vipinsh@google.com, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/vfio: Include <libgen.h> for basename() on
 non-glibc builds
Message-ID: <aoymsrcVYQ6SUJ07@google.com>
References: <20260821122110.902382-2-hisamshar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821122110.902382-2-hisamshar@gmail.com>

On 2026-08-21 05:21 PM, Hisam Mehboob wrote:

nit: "vfio: selftests: ..."

> sysfs.c calls basename() but does not include its declaration.
> Glibc exposes basename() through <string.h> with _GNU_SOURCE, while
> musl declares it in <libgen.h>.
> 
> With musl, this results in an implicit-function-declaration error and
> subsequent type-mismatch errors at the callers.
> 
> Include <libgen.h> so the declaration is available on both glibc and
> musl. This is safe at both call sites: the arguments are local writable
> char[PATH_MAX] buffers filled by readlink_safe().
> 
> Link: https://lore.kernel.org/kvm/CALzav=fs4bqMM7BXNPXqhtbqGzA+LW5fgx2-1Q5=sTN5+krYhw@mail.gmail.com/
> Fixes: a262fc49e0aa ("KVM: selftests: Build and link selftests/vfio/lib into KVM selftests")
> Signed-off-by: Hisam Mehboob <hisamshar@gmail.com>

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/testing/selftests/vfio/lib/sysfs.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/vfio/lib/sysfs.c b/tools/testing/selftests/vfio/lib/sysfs.c
> index 11415448b2e2..daf117a299a6 100644
> --- a/tools/testing/selftests/vfio/lib/sysfs.c
> +++ b/tools/testing/selftests/vfio/lib/sysfs.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include <fcntl.h>
> +#include <libgen.h>
>  #include <unistd.h>
>  #include <stdlib.h>
>  #include <string.h>
> -- 
> 2.51.0
> 
