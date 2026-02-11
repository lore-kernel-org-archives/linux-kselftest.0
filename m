Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0D1350D46
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770798440; cv=none; b=MFLz3STuaYEX6nxwNYvorAUcnKELccG3MU5WVMtL8PJSmmdENRqhQ6ZMq6Z5w7trADMfIybwe4NONNwPZRUnqMsKeMETgSF5HJ/M2H7HLAUJt8YetILdv5UonrYa7CXPLMOAQlAjNVwUMtjQuYcr/SNhsSBLUw8Wx9Hg98Dwrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770798440; c=relaxed/simple;
	bh=wauK2dZHL/Swu0Aa78B2CWtSK0cPu04/2gZCSFMWTl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vD5QSackcj31K6vD7XfOxgSSRN6maPmbupkVl/YGaY3awIIHXWggtPAlTwFMxQmR7Jxk0e0d1YnyHgZrma85IDKFn+iwM+WUO9gAzvqX0SIAiLtMtw0TV93x3BVLtYbJWzmLl4mTL2g7pPpmKTwROcndHgeEXTgARRR3AJf6V4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4/p2mOa; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4/p2mOa"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-481188b7760so45935125e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Feb 2026 00:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798437; x=1771403237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wauK2dZHL/Swu0Aa78B2CWtSK0cPu04/2gZCSFMWTl8=;
        b=d4/p2mOaS8LXWyP6DYymEjdAiQdkcF84551CY5hu+c7i4drttavdF2v78g78OdAcXG
         5W7Lh3ZDURXMwWpUIQQM2v0s6cRmJHpmOrAE2v9B4TyF3rItQ5aXKsu3eEP4pWDHZUiQ
         NaLG2SpDuEBNR6LKqoeO2bO8US0qj2snDeiHFa0ulC+JdcPwwXoh2/qxy3yyqGMe1TwM
         ykoQFNyGa0gqCSBgHIH1/gdyB4EEMlGZ1NR+snNDAm1iuUQe2p5bRYsKjKj9/68FHxzq
         vmSyn3mQ+jURLClcmbU5YvZsUeqZyjFLGyml4myQL2V2MsxoioxBEui6mZ4JW8vOlT64
         IbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798437; x=1771403237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wauK2dZHL/Swu0Aa78B2CWtSK0cPu04/2gZCSFMWTl8=;
        b=V/83v8NhMXCJ3ug71aN+SbnOcLxq2mJsq8HBhWMExiLmd5m+CB0B+WeCv6NPLe6NAB
         f1cs5LZlHoCmfzBRtm5Blu7phnyxMMsjL/gviJT76ap3Z/sx7Rbnb37zGktR6GHE8OC3
         yPCOrLHE13TBO1nxsY2uJK0ANUO1GR2wHcLdiu0OfqxVzUcsePG2PxP1m+c9vABbwl5v
         6Vc/AMU+TBBkBiBsxkmklcBxTjHgUC37ROGkIuGJLSvkYUnltvkpbjnfZskcjurTZwvu
         RgmDXBDzteQ6OR0Z2rj9wjv6y7jARl/caldMUQNIhE++wY9wIu3BUAEyvAtsTCfGtcaS
         P/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1o/Zz7W4LHU60WMwO9MnzKnH6pktJVgBEnxQ11FVImhAbXYjfpfP3RoKrRI224G+/bckWRLM/oLausTJVRS0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6lzLQL6CEoi0ldBrDaQolxZJLQwzBBy/fa1bhCEOBDIMQ4W72
	f8Jm8T4HAPpShUW65ncl38/uNtbC+/ZGBzJZKAIuFcdTFWOi+1AQDeDM
X-Gm-Gg: AZuq6aJe+REjf+qmwUWGv+eQnTLZmUL/EN8vvzJNQLhohY4e72MpYw32sC3FGmEeLAd
	CeNUfwk+WZQTUt1/IUOp+NmT0RQbLsW+ySjqwp0onhPN17sQTAo/FcwU3cZoRdknY99dAvRD3ew
	vX/LrkbOVpLgikNFVDkWB38jFZntt9MczZW0UQpADa6SWh+6VSTihYtjUZC9Tyw6OzLkqLNdJAR
	8d9siu4ag4lyjSsCHG3Znez7rnpSYRasmE8klXtRDS8XOrC9oOeOT3jb8yz3HVa8z8gOobXHaDN
	6MDcdlTIOBmocidpdYh1miIMr3rB/3UgwV5CIcpXkkoAlVV7E1Q2Ik3t3FCel+7Dm5Q/OIOmVEK
	cjRh+XRot9JJQUYEeRmQOlg558XnbeJK1iS+BffiyCVsJgxOuT5Gu3M42LQPFfUQwK2NR7wFWXl
	zWfgm9/C0Gw6ql1+pmQVWa9AdY77WmA7xx+sH3IaLNNbsvQOb50XUbOynQfT4=
X-Received: by 2002:a05:600c:3f16:b0:47d:92bb:2723 with SMTP id 5b1f17b1804b1-4835ebecc4cmr10013935e9.3.1770798436993;
        Wed, 11 Feb 2026 00:27:16 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835ba69160sm12599365e9.8.2026.02.11.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:27:16 -0800 (PST)
Date: Wed, 11 Feb 2026 09:27:04 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: mic@digikod.net, gnoack@google.com, shuah@kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests/landlock: Remove duplicate include of stdio.h
Message-ID: <20260211.71676f77cada@gnoack.org>
References: <20260211062122.2975127-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260211062122.2975127-1-nichen@iscas.ac.cn>

On Wed, Feb 11, 2026 at 02:21:22PM +0800, Chen Ni wrote:
> Remove duplicate inclusion of stdio.h in fs_bench.c to clean up
> redundant code.

Thanks, well spotted!

Reviewed-by: Günther Noack <gnoack3000@gmail.com>
