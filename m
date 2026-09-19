Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3B43F1072
	for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808875; cv=none; b=eFw7cduz7tvwY3QRd1lY1DIFmdV3SPDTrTKflOKVFBEFUmiZSWG09kx/x9Ub3DIbqNsgVXuridJhwJWs3Zntmli23BcIp1g2KxNzxKVLjfubtusYOXlhphbvQbZAGBMN0LWKMDVdWKyK8gdLdfuOibju0qa+2Zfbdjk3loOyIXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808875; c=relaxed/simple;
	bh=EWOHrvtfAdH8SUMdIJx2yEBFvBc3QNtqqxzu2fF0hD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KVhAVd3MPy/mOc4+qN5nGiDJgazTjY+zd5J8KY+eUnTTaPYzHWaCF0YscueXe0R6xH5ErqLJrIn6NabG/zFn3FelQ7+83q25xuVzHcnvGbe0B05l9GpORPki+prhHHBUdfcCmRk/REHJYY6Sqz47mn3Akk2zrnRqLcqYXXv+mjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fprrbYwr; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fprrbYwr"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso15849765e9.1
        for <linux-kselftest@vger.kernel.org>; Sat, 19 Sep 2026 02:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808872; x=1790413672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NbapgDXr+FyoTKQ50JUeVgfa7Tqe0pMogS4ct7fFvKE=;
        b=fprrbYwrbQZylNVye0yOD5gMuMSrQVHMsLOgDD+V00Xhz/3FDJdu58hyzbT/seM/Iq
         phj/3vAj/rkJwSnUzCqrs0jCi0eN272M4vvV3DsknxFbv9GPr3KvkGPWTmWAnvonbFaJ
         NZi+vdGeukRjh3iwAdq7UHJ8pELZqY2ta0HAybuUROz0NlMAYfE5sxhW+L7C5uWiNR0K
         39McqlE0dqc+mYYMnYvp1AQcLkjtbFqzp6HPEzIDjY4BiH7/7QP2Slq2GC0pQL3oMAqB
         nXw7FDMMLFMi9wHJFUkhDLHusVYNEdC6kTBGSjC+50hS0LbAFUXKPa7zbyHa8AFFvPOs
         0Jew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808872; x=1790413672;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbapgDXr+FyoTKQ50JUeVgfa7Tqe0pMogS4ct7fFvKE=;
        b=LuKbM4WG/otxdP1o3mpSm0eAT1gjxp70RzM08aJ1Z1cb2qm/Zs3uT3Kc/BmcIZrWow
         V7XnuUWQUNCHwTnckYBBdbj6Jgl8LHLVIDqJt36lkDjZvhcoXv8FB9Y44gdkpknp4kOL
         tuYMKR1BLCXpFV5j45ecuZR8gQqvbBIehxH/ikoUBFFNYk/BrAdSfd/l8f6syKTC4f6P
         9eGZJCTKaQnwbZV2MoPoyzhUK2lC2NcBkNAinO/qGJUVhHwvsZ8nj0VC+3e21cW4uCxw
         ftk48J5YI7Mlf3VGrMsNAsE8kEprCVarX3fMdGpGtATjEpVqpQfT96eu30EYfKcy91tz
         kt5w==
X-Forwarded-Encrypted: i=1; AKwUvBxHv/owd4IG9ZkO53m7/JoL4wXX6+h/Kh0Ou2ngGGjz5msPJ5gSj/er1qgrrTxEVdeXuI5EmB+gdEjsmspkvFQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kptLT1cIotQmF201igqRSR05qkAUWIT8rU7ygppczFVYidcilW
	rr44KXf09iohaCLv6wuEsREJZ1HJyVPCEyoP2HDy8sEh1234z2tIjp5Z
X-Gm-Gg: AYBFou0FcK0qVLzWul1YUgvZH0RASpv6vW6tOYKId3WAArny6tABis1CoZ7PNvsh4AH
	XNamCCx577jWOCWgHMAOqpC3tubwAnqdtlVmok5TTCwXb23AP0J/NfuJ9M1RGDNDKcIISuuojXF
	dM/r1ibZY8RdT1MZPqWppjes0l/327HlDeIvH9BkvDYdOIBfE0PztYjpMKjbxoUaxHN2cPwRZQp
	koANjlKKGSFdKMe6n7iXxzZbIbFgY9P/Q+mSiY6vSky9c8duGtA4DIGEzAR2qXyKBcfYnawgxUj
	bI27PqITNd273zmvUoHoTvVVDEl69qeUvkojzayDY75WT1l+aUWu28cT8QnY7ayogafainRL0DP
	GPIxaU5rAsS1QlT7I9a/4n59oodckOoUXAzDTpk9lz7sP9t+yignPhRkczYfQwBGpo3pKBrjPd2
	m3p5VKn5/8DlRjqKGsmJX7rEpd1q0bexDZQ/7nw9rzggV6RkQITymEUAUL6RpeFR9y+G0bRoKvf
	c3whpytczLtI3YOWYFxI3H8/0MWOgLt2hvivmIi9g/eGkMPZ2eLsOToWj7oAzgyXkmgl/QDN/Nb
	Dvn04ZnT/98BlDJcRKNA4YlyjrgL3yoCXeKAN3EVaL17UOaRcDRTYXA3ZLV2rMZBrxDb8P9oLgO
	w1xg=
X-Received: by 2002:a05:600c:a085:b0:49d:25b0:cc60 with SMTP id 5b1f17b1804b1-49fc5747f7bmr70121265e9.29.1789808871519;
        Sat, 19 Sep 2026 02:07:51 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cba562sm86917495e9.2.2026.09.19.02.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:50 -0700 (PDT)
Date: Sat, 19 Sep 2026 11:07:48 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/5] slab: ZERO_SIZE_PTR alignment and ERR_PTR
 hardening
Message-ID: <aq5QkQQkyaljq0R9@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
 <apqmVDiyGJWnEnp8@nixos>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apqmVDiyGJWnEnp8@nixos>

On Fri, Sep 04, 2026 at 12:25:59PM +0100, Harry Yoo wrote:
> I don't understand why v3 of this patchset suddenly implements
> hardening for kfree() and usercopy to handle ERR_PTR().
> 
> The address range for 'zero or NULL PTR' range and ERR_PTR() do not
> overlap. The bugfixes and hardening patches are irrelevant.
> It should be a separate series?
> 
> Also usercopy.c changes go through the hardening tree, slub.c and
> slub_kunit.c changes go through the slab tree, and LKDTM has its own
> tree. Patch 3 and 5 touch files across multiple trees, which can be
> avoided.
> 

I added the ERR_PTR changes after Kees raised handling that range in the
v2 review [1]. The two topics also came up together in the 2014 [2] and
2019 [3] discussions; in the latter, Jann suggested a separate
warning-and-return check [4]. I wanted to broaden the discussion and see
whether considering both together might suggest a better approach.

I agree that the resulting implementations are independent. I'll send
v4 with the ZERO_SIZE_PTR alignment, exact-match and zero-size KUnit
patches only, and pursue the ERR_PTR work separately. I'll split that
work along the SLUB, usercopy and LKDTM boundaries you pointed out.

[1] https://lore.kernel.org/r/202608111716.0FA9DB17@keescook/
[2] https://lore.kernel.org/r/87oaumdz1f.fsf@rasmusvillemoes.dk/
[3] https://lore.kernel.org/r/20191010103151.7708-1-mayhs11saini@gmail.com/
[4] https://lore.kernel.org/r/CAG48ez05QVn6_gQ2TBrRa1a_DWQoaSSYubUsu5YMWxx-gqMijQ@mail.gmail.com/

Thanks,
Karl

