Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7B576ED8
	for <linux-kselftest@vger.kernel.org>; Tue,  8 Sep 2026 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885386; cv=none; b=X8Eexh7nlx0ipoDwurDrRCIaq9108llP8GO5BSAPIinIZWx6Vxmc8Ief/TR0XrfuInlA+hLhm3mmjDyKWYOwH6zIiFkUcC4zteBJWktdLZLYmKMoq3AGcgp23HqdXotFzNnXUBBdjrq44zTQtVkPPh8ASU/NfTo931xvByBNGqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885386; c=relaxed/simple;
	bh=lecO3ttVgRT8QyyaiDOzI3/QgRH4/dihpQ/rnO1jfaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BO55Ubn7d2DS/mR37/hSDUBSElHDgxgBWOc69Z42p4Zf4y258JShkmhHfJJGn7RyoGZFTyRz/5C+cdYsgrT7kj/7ZcitpXZh+zGwfu1G75gxn+EAhqVaWDb0gxK7oX2AKwCCK4lAJ+RZLG0+fuHPQYDONpH4BPloGBUJtCqlZrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=er2Ntb9a; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="er2Ntb9a"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d0b98d6d0so28435425e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 08 Sep 2026 09:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788885382; x=1789490182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/EansYsnai8F81StzziY3cP4ZOtzfOu0U6ChvK15jxw=;
        b=er2Ntb9ae8iLiMg72UuUEzUCtuyD9MIuaADma091ODZogrHLUXlgLgtb7BSbQ3sXvW
         K2KoYI5KIIhH0npatxPYgbSPcUyWPogBl4Yg8+EP/35Rqg6X+IiGq8WXYLnCL7ecHvM3
         onz8sPk176BTD6LEMTKZ1YuQofmxeyv5oZMhsjqYhsNUOGs1gyxl/Yp9vcwupLKWWeU/
         4v1KAoYDQapvbhkiFBJlPuk/sXquAzPs40yUJkQl12PLHBbpUzeAjhbjk/D4Jru2FX4E
         yjs7E6MH+CWVpRaSdnVnhb5vcUu8odkMPBqKq5GE9Q9mdzyacRtS2hrRJv4yeSh/HB+/
         6UAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788885382; x=1789490182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/EansYsnai8F81StzziY3cP4ZOtzfOu0U6ChvK15jxw=;
        b=oVbRHhF2KlRiRgKEbd/pedCJofhCvswoApyr5+44jsKJmDihLv7VplutvjbDNdT30w
         LbU0Kmh9hG2L4QD9+6ZXCP73Rw0DeL2oqmw24FLFeDZ6mp3gwyIRXRoiMveU8mOX5/RP
         af1S89FbUCsa5jEn4mWZ6YzvmAnPVFhv90Lo/G/kahkRqThCEZBsoqzoYKQL1JGSGmW2
         WRJfFgu/p2PIPOQ5Gt2h37xOS9XclfasBf8x/kf3N25TmfnGTEE9pMcgmz9wlPO7p9ZU
         2QBa3AiJe924i21tDGIjA7FYa053c5k0RzkrLo28pDXXlqD1rJQc9rTfEIKKOU8ZAa/n
         j9Fw==
X-Forwarded-Encrypted: i=1; AKwUvBzfqdRYGcTJfmDnT1H1pH7hlTxVqFlof9nfqssOeVIez1rsTQbU6V4qBcQ8l0IJkRgqoUZjQab8VGL6vr9hGxQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nIBw+/gx3s7EJgiUq2uAEVW88TT7vrmggpkKPsoDvs8fQi8N+4
	EmT9KVopLS+KYH9SBjqA34UOSLWBm+xQ0Zi/AQAFBnk8pRXeOO79bxw=
X-Gm-Gg: AYBFou3rqQiQ2ZK1UAkonXEAZx2ILKb4SmCMMrbYXmk+y0j+LZMePu0Y0MasSqS4V8g
	AGy9/lk5hjHfXjbZulINk8M4ord0uAab7cl6bk7ixG8If530scJr9DErsJPdxQsluqtzJBIRjaL
	GQw4tgqFb1nKqBI+y6vXRtjvIC1SKej3mRz3PGynhGDvz199FJKLXmcnlcVKDeQ5HneSM5FwLO4
	XmVz7RL6dE0gTrbRMVLFYzt23MBdfmI9aux1pQP3m98uwE3yTUBa3tTNrmsVh2RdwL23cEm3Fzj
	oitRRNMmP/neBu1RPxp6w3DpGJJ5Zaj57TPtFa4HaF9CMp0Pdz4xJbX5B6nA6LndciQQPCZJNxT
	7ECK+pv3IMOmH+0izq7dYY+9bkLrvP4vfNtC1CpXVon8Y4uZkG0dcOTph/mksZnhmpNr3cjgvp2
	mhcRXyXrp/4R7zsLxixi5zoM4AuAdq2RcgttW9juHmfmMe3n8s
X-Received: by 2002:a05:600c:3f06:b0:49d:1cc3:fa9a with SMTP id 5b1f17b1804b1-49d1cc3fde0mr39898535e9.14.1788885381519;
        Tue, 08 Sep 2026 09:36:21 -0700 (PDT)
Received: from p183 ([178.172.147.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm545494045e9.5.2026.09.08.09.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:36:20 -0700 (PDT)
Date: Tue, 8 Sep 2026 19:40:27 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Paul Dolan <paul.dolan.dev@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] selftests/proc: avoid exit() from SIGALRM handler
Message-ID: <a07fc37b-11e3-48a4-a89c-4b59e867e961@p183>
References: <20260904123752.157562-1-paul.dolan.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904123752.157562-1-paul.dolan.dev@gmail.com>

On Fri, Sep 04, 2026 at 01:37:52PM +0100, Paul Dolan wrote:
> proc-tid0 uses SIGALRM to stop the test after one second, but the
> signal handler calls exit(), which is not async-signal-safe.
> 
> Set a sig_atomic_t flag from the handler instead and let the main loop
> terminate normally. This also preserves the existing atexit cleanup
> that kills the worker child.
> 
> Fixes: 0658a0961b0a ("procfs: do not list TID 0 in /proc/<pid>/task")
> Signed-off-by: Paul Dolan <paul.dolan.dev@gmail.com>

Yeah, yeah.

Reviewed-off-by: Alexey Dobriyan <adobriyan@gmail.com>

>  static void sigalrm(int _)
>  {
> -	exit(0);
> +	alarmed = 1;
>  }
