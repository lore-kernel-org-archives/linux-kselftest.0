Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905A94E780A
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 21:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287157; cv=none; b=STwxofIR7Ll7Vhmr+KG2n/uFwGmi6+clhtDrJZHNbTXegOTEt0L9ZQOmSOwOPF8insguOsypw+GjPXlw9FB3iylh8FcRTdErrN+bPOqV5mQI+pOROUlQRlD55gh0bSvr1vARZGysdAInuRWKnyijKuxvAJLSf00mDst8wm6+dzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287157; c=relaxed/simple;
	bh=jdOnvM7WMqeUpU7l2mytGEp4oxIHLj8qtVUlj6NmVsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0XQHieqlySGW3ewV1p7l4SLwhq4eSkXShm0airvAP70eJzRSf2JPHxnJYXtvYQ0UYHIVxbPOOV5eO+7KbK1Fi8erM1rN7yM6ikL7EeZxze0wzK1iklfjXytzwrbwdiERCeaQaVsZAMKxglppMLMA2yANNj35zp4JRnzJqJfKQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=vPEiD9ry; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="vPEiD9ry"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d04d740cso84976a12.0
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790287154; x=1790891954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbmWMvcZGPaQES2g8FHXYoBiPxQtaNORw16tr7nwuuw=;
        b=vPEiD9ryapYVAbcs8kdk/aarwnWZDJyTINZAS9v17BANQiOuYq1oHVyJBCxjEAkD7W
         OctHq3duc79f++pDhRki9fmBx8iaZqo7WTEO3/KRGGQo6+bxo/NBJz7x9mDaDx9yeSkm
         H+ok/Eqr1G1IAHpAGCOJjW0tBbSC6GZQ4faR6VgM1LIofN1MXaQ2GrHLhpxb84L3erPF
         MKZKqlLcvnbE9KVPFO5CWFiC3ortqSZHI1Hj3EY76mwz0EQDeYKZlJcdkfMa+9Tj7hHN
         d8re22ksBgofM9DHjvonMZM1H/MckT642VKR5gjzZ82kbtpL4sunMCl1BfUBlHuqr/JA
         83ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287154; x=1790891954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bbmWMvcZGPaQES2g8FHXYoBiPxQtaNORw16tr7nwuuw=;
        b=M7vhE019yL7VqqBT09V+ABALy6MNuEIz+TCG4ZgnGzg8LLtnoFYBHSgAstXiP/1+ZE
         vWFcatmu+Pz3AYkCTdwbvzY/XVoW9aCCHKpIWjBQkIVVgfgNSTNZbmjo9VBKpcEphgMR
         16wDzfghKxBBpI/AVmGZN1j83s3yWA2JQYA6sq3XL4lXwn9MXaM5kBFUUVkG7KZKcRtw
         OpuVERGw+s1INAogzkKQR7wqqnxeduh2aNYkQ1zj7rtKQpWE2tb67xBrWCA2yQQVkl6L
         CxxYPRjdsNgXedm0zhpJ6GBqiYgWR1BNdOiIYPzF2MI5TvWUz4p7ORzvXupuuGenCrjr
         8TxQ==
X-Forwarded-Encrypted: i=1; AKwUvByxmVtZEJeVIL1p3KiSdfv7mZUmY2wq54V8VoJax5ABnu67LTeNFQNPdc5MLynW4hEVPQ1PfAoNDTdrRDJzOKE=@vger.kernel.org
X-Gm-Message-State: AFuF++lUQh+EOGvU2/jZ0m/fM8KHXmqgdFg5duSZ0569r0dW0HDxMm+p
	XluV5wzMr82mgl8jFea3VFwavJciFQHZgqrBKEqXiAPEjNZF4vEubWrhYQn05Bo5DWk=
X-Gm-Gg: AYBFou3WXJs5e93F/KEvrWQstL+WDzZLV4Bhf6F9BqYXnw4OlL+E9BaOKCZm1cWhvV0
	1Bgaeyks5ajZoZJAwIstumQRjT0IqIJQM1xyiBlV6yGn8DRXvWMPx7tv+i4iSRLIk4Ih5dBkeyF
	y0gPI6Ujd4Z0BX7QjnwpFp+Wjmv0DkXaiEx0WfPOX/yutRoakZd1lCnSGxfm6zi4rMOiw56lEHq
	wqUui/X1nKb8qJ31q5LSK1U78GOiGIepqqcGP87CSlsZlAjwrsVt7lOoqQelZvY82FaG4SJFbD/
	J5nnULBvXWkr/uSRu4JDq7g2arHFRhErJGtGHSWLuLuTgr4YFSkJ2xfjVQU2PYF6a3JV9qSQCjs
	Q4gB2wFr8eoOhEOe3Sn2hHsv63YH8A/gQ6RJTtJSVqcTRwQx5DF48p+uQUdoVen/6t+8Nvr9zjW
	xjzPPEcZNplEQ1KrtN+3mQaLh9NlqZl0hOftxiVSWHI0kK75anck4olTredVl7o+uR4Ckz3hcOJ
	Z2VJVM0U6G4U8/4qHu8oaU=
X-Received: by 2002:a17:90b:35c3:b0:3a0:bcc8:1546 with SMTP id 98e67ed59e1d1-3a0bcc815f2mr76894a91.64.1790287153608;
        Thu, 24 Sep 2026 14:59:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:59::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9481e17sm582065a91.8.2026.09.24.14.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:59:13 -0700 (PDT)
Date: Thu, 24 Sep 2026 14:59:12 -0700
From: Joe Damato <joe@dama.to>
To: hengyul@cs.unc.edu
Cc: brauner@kernel.org, viro@zeniv.linux.org.uk, jack@suse.cz,
	jirislaby@kernel.org, sdf@fomichev.me, edumazet@google.com,
	kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
	horms@kernel.org, shuah@kernel.org, linux-fsdevel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] eventpoll: return -ENOIOCTLCMD for unknown ioctl commands
Message-ID: <arWdMDek0iv0obDy@devvm20253.cco0.facebook.com>
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
> 
> diff --git a/fs/eventpoll.c b/fs/eventpoll.c
> index e0c4bf88a838..adf30b720b13 100644
> --- a/fs/eventpoll.c
> +++ b/fs/eventpoll.c
> @@ -1264,7 +1264,7 @@ static long ep_eventpoll_ioctl(struct file *file, unsigned int cmd,
>  		ret = ep_eventpoll_bp_ioctl(file, cmd, arg);
>  		break;
>  	default:
> -		ret = -EINVAL;
> +		ret = -ENOIOCTLCMD;
>  		break;
>  	}

I think based on the documentation this is probably right, but I am now
wondering why both ep_eventpoll_ioctl and ep_eventpoll_bp_ioctl need to
exist.

Maybe when I first implemented this I thought it made sense to factor
out the busy poll ioctls into their own function, but in retrospect maybe it's
cleaner to just collapse the ioctl function into a single one instead of
having two layers?

In other words, maybe:
  - delete ep_eventpoll_ioctl
  - add the is_file_epoll check to ep_eventpoll_bp_ioctl
  - rename ep_eventpoll_bp_ioctl to ep_eventpoll_ioctl
  - fix the test (as you did in this version of the patch)

Would result in a cleaner fewer helpers / cleaner code ?
