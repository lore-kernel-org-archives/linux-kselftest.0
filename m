Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA2E36215E
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 20:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790885191; cv=none; b=GxcUeeB0a3HfSxBrpVe2vQ/cXHXE9104Aj/TLajcA2M/h7WZAzrdn2pQP1W/4tLxlJlZ6cTSwJVUMrh32n8ZpU5/Fix65P8pA0uAnnOsF4CbPZb19XQQU+f8OK0Ld091xUc2VK/u9WpxOotQ5fulFN9DACUaHDzTvh4XaZIlPFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790885191; c=relaxed/simple;
	bh=itH6vbMqVbMJFlSOzycQd4i1lZJJhxPN2ByoF1230/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPG3Fbo06NHkPGK6gdEAGvUXD75/MFR3WIVU7VYNh+nWCwTY6T6gr1k8EBKeCeiDAzpH/KeYgh8BtR0pmNSoiuYYuE4/dHGsDHaF5nc/ZX1WQ+eajtyPZrfT0OAiKuOtyzGEMW9KOzPk9eawanGs1bQTKtJ/KgBCd5Mpm8ES3pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=w9rMd0Hk; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="w9rMd0Hk"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so3687180a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790885188; x=1791489988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grsKZ1OSZx24kS0KKL4KN4ISoNfQyaFFM1VYosHh8gg=;
        b=w9rMd0Hk+ZowXQ/lND2xLY7F3ULhmQarHLxnV8DxrNfYf6fnLC7OVT/rKuVneGV0pr
         bu24hYzRhqZrmlLBHkwHumGGwxBsFmLh6TEiF0tGqgefrJFgTKJX4An4IG5fz6yHHXiU
         BF47F1Sm/NO8tFdFldO8VxSnSK+wX7NZpBm2+ZEmsMEPIDIK0iZbxgalzK4Q1F1Bhw2D
         XSIW5vRGss3h1EzK/JT0+5ruit9zGmwJ6eFQkb9Y9pZHcfUSdpNtlYmwmXXLz4YpcMvw
         i6yhw63usOXO7nCMaOZusvC6RH0VhOMJxW2K94TffckNPbBVGqHeBS1m+YjRZ2wVBi97
         KDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790885188; x=1791489988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=grsKZ1OSZx24kS0KKL4KN4ISoNfQyaFFM1VYosHh8gg=;
        b=ecHIgqOARv9z4yMrTYDPKT8NfjuRh7dj4wCgOtrmyRtsmfQ4lyTmKrbiOAVyc1PlBh
         WYXHB2TcX7VaA4qMZxTmdsWwrsmbpUQjcHi9bLRsRLTH/BbwU+cp2QhZJCxyZRds2Hwh
         0BK5c0sErFKpZHLhcg+VZY7kErjMhxqAIkKmqZy4AHYpcHsr8zJRpLhXn2AqdGxB5/Ut
         UDSH4ZUoV5c54oVKkvu8S5ydCEff9sjd6Q1gjACKwGlhklmP2oMIGDdUIyySA+F9V5m8
         MIag/R3t15ZYb3fuC5CGq+KR/Pn0Im/2Yfzkaz2GUKbdmBccKR4VuiTpS8wd+bfH8jam
         syTA==
X-Forwarded-Encrypted: i=1; AKwUvByloMAzu+jYiu3iB8pX50l0QUmZ4mHhgF5sW4SZo+ZpW9ZTUNU9R+RnnhsrTX8pePzSZO+s/W9shNiCDUjOEOs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLznNVLvk+VmlO6P2+tcuremi46qe2Dw5REtkTfxKza7mi0Qkq/
	PAoysxCrNlSsg0aTAZH7peL84eVS/MZlqB78pJ02VWkuTlbVoKPL7N5HDrg+06NtBOw=
X-Gm-Gg: AYBFou0jQ8mz92+SVD1JZ98676x5BycAezHJp4MBjp/0tfW7oTnsjcJRgywVvO69F/8
	d2tYDhsGS7UexYjwfxsQhPas3Yh8LnbAYr9op2zQJW+eM07EvQtaKCQslreu/UBOetapKnUtuJI
	FMnEZ3Bbbvv97ZIDrBda6vIv2tHLV/mS9DlqsP52/CyAOyaJ27shbpkcoaMARpnm+lgzSgg/tlA
	hle0wGzTJwzU4//ryqR+zBXqTzL5pVc6mCz+G0hVOoEne1gJpA1dChlkqztx+i6D+KXVKW7q6wL
	e369e9nit7qZaDCA3BWuOdKp8ix/Ti3bvikdIBzK8UzKFkTwVWeRuUzf+GPbnFafKQivBaUUSPL
	q5tACx54wUN043+8IY6/040lNxItf4X4ZYSwkJGRk0OwuhYeX4UDGusviOY1KRFCwatig5po0Ku
	oWYgCrjmS18v37oophD7zzgDCvJ1h62NS70RxQ/pQGqzZFi0QfWQXW/NTtrd0xF78Lx+a7VUJEL
	nh1D24olF8=
X-Received: by 2002:a17:90b:4c06:b0:3a4:a2f9:f2f9 with SMTP id 98e67ed59e1d1-3a6cec2c079mr577802a91.52.1790885187917;
        Thu, 01 Oct 2026 13:06:27 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd135d8asm39150a91.3.2026.10.01.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 13:06:26 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:06:26 -0700
From: Joe Damato <joe@dama.to>
To: hengyul@cs.unc.edu
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
	jirislaby@kernel.org, sdf@fomichev.me, edumazet@google.com,
	kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eventpoll: return -ENOIOCTLCMD for unknown ioctl commands
Message-ID: <ar69QvnV3y1diHVg@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, hengyul@cs.unc.edu,
	brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
	jirislaby@kernel.org, sdf@fomichev.me, edumazet@google.com,
	kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20260924185747.2166326-1-hengyul@cs.unc.edu>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924185747.2166326-1-hengyul@cs.unc.edu>

On Thu, Sep 24, 2026 at 02:57:47PM -0400, hengyul@cs.unc.edu wrote:
> From: Hengyu Liang <hengyul@cs.unc.edu>
> 
> Before commit 18e2bf0edf4d ("eventpoll: Add epoll ioctl for
> epoll_params"), epoll files had no ioctl handler, so ioctl() on an epoll
> file descriptor failed with ENOTTY. That commit introduced the
> EPIOCSPARAMS and EPIOCGPARAMS commands, but ep_eventpoll_ioctl() returns
> -EINVAL for any other command, so since v6.9 every other ioctl() on an
> epoll file descriptor fails with EINVAL instead of ENOTTY.
> 
> Documentation/driver-api/ioctl.rst says that an ioctl handler must
> return -ENOTTY or -ENOIOCTLCMD for an unknown command, and that
> returning -EINVAL there is wrong. Returning -ENOIOCTLCMD was also the
> intent of the original series, whose changelog since v3 [1] says "when
> an unknown ioctl is received, -ENOIOCTLCMD is returned instead of
> -EINVAL as the ioctl documentation requires", and ep_eventpoll_bp_ioctl()
> does return -ENOIOCTLCMD for unknown commands. However,
> ep_eventpoll_ioctl() only passes EPIOCSPARAMS and EPIOCGPARAMS to it and
> handles all other commands in its own default case, which returns
> -EINVAL, so that path is never reached.
> 
> This is visible to userspace. For example, isatty(), ttyname() and
> tcgetattr() on an epoll file descriptor set errno to EINVAL, while they
> set ENOTTY for any other file descriptor that does not refer to a
> terminal, as they also did for epoll file descriptors before v6.9.
> 
> Return -ENOIOCTLCMD from the default case, which the VFS turns into
> -ENOTTY, and update the epoll_busy_poll selftest, which expected EINVAL
> for an unknown command.
> 
> [1] https://lore.kernel.org/r/20240125225704.12781-1-jdamato@fastly.com
> 
> Fixes: 18e2bf0edf4d ("eventpoll: Add epoll ioctl for epoll_params")
> Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
> ---
>  fs/eventpoll.c                                | 2 +-
>  tools/testing/selftests/net/epoll_busy_poll.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
