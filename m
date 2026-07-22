Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8991F28C854
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726129; cv=none; b=ZspkxA1oGr30QZ9YSGtC5gifwDmBe0xzqANv2DxvRfcGFD1xxmXVptngMDg/8tTzhuqkJ6z6QHvWX447un4FWLvuGnd//QNGZanXjTglSEI2HU54sw67Os4mODz+MSB3BPHg+n4i+9AeSlt68mY4ZH/ZLySpKww4T9Pyg2a5Eas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726129; c=relaxed/simple;
	bh=/byUoJ/WMc6UHqgCYQepUc84g2a8J34F7f8DVdRPKCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuPNsHZDwc7/AiWJqDq3xbw6iBwU2X+LNAvYejs0HlInxbVGCYxdM03YsjNQolECzUpXVJ83fCi1usyEhdzzu8cjn9GLioghaqvAmqoTOs2i0vwVKyS8pbxycs2WXKdKV1DWndOEmWqGajB3pNYcEQuoT1BWjBA9JYBASUKTIgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=R0uGdrtc; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="R0uGdrtc"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84864086bfeso4867b3a.1
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2026 06:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784726124; x=1785330924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iD1PTipWdU3DcXEKR2UtQxdCuq75xUopzE+YD6AEWUQ=;
        b=R0uGdrtc33TPlbNHKEqRhN6iNt4LRedE6PP3/Bv4cV+PX4o4w11ID1ci4liis1fVje
         B8eLSDLzdBRMTKOujFdZF54NQl8vqnCnDKIgPC+y/KuCBDW1j7/B3MLX0WSxdKJM+zic
         DUMQZM7+j5iNFhQDhP3ugrTZmOxvsakcQ/Pa6Ct6MDWEveRverGv4J3/AWW7WOi/pIQO
         FJN32z3AJNpLQ4Uq91Hi6rLlDujnye471NBEQKJ6AfGEx6btQT5DfcghLk+IUWA2K1Md
         wNQiPwj2ozLk1Gr2ugwgxQfpcET0Y5pNvY2xoTp3GoFsgveYaPOeTP/wu27HqI+7WG4b
         /gRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726124; x=1785330924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iD1PTipWdU3DcXEKR2UtQxdCuq75xUopzE+YD6AEWUQ=;
        b=B80fiAvHjm9Pv4jRhoY8wuyvpodHonXSjFkuEZPlBdEnSlJUXlLvYuOJBuqs5+FCjr
         FvjUbNkRqjwwwIphRJzn48dPpgx2ykC/FB4LeIbExsD67G23TXTixPmGx/grNRwenNX3
         r6CaTZFW22qHKZ2GGmwCM+/+A7c5ez38t+uIuaRa7tFaoj+YURu3vdRWTlzl2dzZY1am
         rHI6sQWwaujHgjOjMnmpKfPhmAAqlH8EfMHb9caoXkIobfqP6i01YKdd2XV9BHBpPl/1
         gxFHf4cFwUvqWI/406IcC2dWj2+uSt5ExfyoXcJHg4RVYuRtPYp1SzykKkvSDuxnJjMv
         aLCA==
X-Forwarded-Encrypted: i=1; AHgh+RqM75+W0uRDlcidxAavpKcPMGLTHzx7f+6Kme1XgGBGzOQg88Jj/U+ZwN4v5VVs3ZAXBz8jZ1ChHtWpVZQRvQw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9s6CXXGdE6dgY+XMIogjrlxwgso3AgIAuzEenpanqSwpJqRI6
	/MUVKKQMAUwgyFfgoP0gWev84UGA3nUTNIyjLuUeThJtObYS2taSfczSvTuYff8KQAU=
X-Gm-Gg: AR+sD107V6AAf1gUD1M8G793HPf09wUUsdTYZZkLyeXvEkPRMyMlDDs6jUV9FdUlAHL
	FglyPMYxsKwDF5I6LXb/eic422VGfzC7G6vQiESpIf58y+KfZ9CR9lwWNOQcVJVIbKrYb6ymqh0
	v+Xj4c9GltNu+H52QxkQfQZjoiLNtXUTKMwEEdSkf9yJhL97/HfMV99FFU/BxkXPcJu3szJ/QoY
	ieJ6jqNf7ZJjxnU4dmmJ7epdcbOrGQ72wgX9lukDmAQFHah7SOm2UrU07RKgg6as7WQ7MWukxz6
	Nb2L9NqO/7OLExwTbOeTT86otETTY9+LsiS6Con4iu+5KJzXZbCbviR4CSoWLjmx0Kcu+/YAZDf
	EhuNEqWqmYYELZG/zfxFkmJbEHl40OjWFwAl7aJfD3AbsOMln2Jm/Fu0z5Hg=
X-Received: by 2002:a05:6a00:3a21:b0:847:8d2d:712f with SMTP id d2e1a72fcca58-84c29239a02mr23869158b3a.10.1784726123466;
        Wed, 22 Jul 2026 06:15:23 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:49::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17237c3fsm1368442b3a.9.2026.07.22.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:15:22 -0700 (PDT)
Date: Wed, 22 Jul 2026 06:15:19 -0700
From: Joe Damato <joe@dama.to>
To: longlong yan <yanlonglong@kylinos.cn>
Cc: pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net,
	edumazet@google.com, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	shuah@kernel.org, horms@kernel.org
Subject: Re: [PATCH] selftests/net: use MAP_FAILED instead of (void *)-1 in
 tcp_mmap
Message-ID: <amDCZ5t8wDtqNAIe@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	longlong yan <yanlonglong@kylinos.cn>, pabeni@redhat.com,
	kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, shuah@kernel.org, horms@kernel.org
References: <20260722015129.916-1-yanlonglong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722015129.916-1-yanlonglong@kylinos.cn>

On Wed, Jul 22, 2026 at 09:51:29AM +0800, longlong yan wrote:
> mmap() is documented to return MAP_FAILED on error, but tcp_mmap.c
> compares the return value against (void *)-1 and (unsigned char *)-1.
> 
> Replace these with the standard MAP_FAILED macro for better readability
> and type safety.
> 
> Signed-off-by: longlong yan <yanlonglong@kylinos.cn>
> ---
>  tools/testing/selftests/net/tcp_mmap.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>

Looks right to me. Not sure if it needs to be set with "net-next" in the
subject line to make which tree this targets more explicit?

Either way:

Reviewed-by: Joe Damato <joe@dama.to>
