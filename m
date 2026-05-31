Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D925215075
	for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 12:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780231963; cv=none; b=Xm0Y0bVWV4/RUz00RIyaUsvD9TiF1Mr0qlm2sTPB5hhkr+yVLz+ep7KkpFx9D8mhSJkLO9+neNG5LUN0XZdYdn9eduJfdwcsGL2mvfz2vg/D0shBpyvahzlmrwbS+m5YiS1G5vYvGreJTG4DyfFlQLKXxIPkOAHmHXqYbW0X42w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780231963; c=relaxed/simple;
	bh=x8mfz075moeph0upF3Mu3jpczbDMMZHuc5hRryJ6wyg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7X7HGN64nRqyeturhGEr7JUf5EQ7UERpLOtO+LCs1h15Ebd7bL4RlEuCS/PpoxKH9wMkcxhOoFTHZlumiAxfI3wPbbzMGjadEFt2ux7v0J1Q5NgTtqNgQ0d7QsuVWXA7xg91565tWd/6XoUU2KL4N4XVtHaUd1RSqEKfltYO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=kdwcAk+q; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="kdwcAk+q"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-91550d518c0so59604685a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 31 May 2026 05:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780231961; x=1780836761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnMQ970O/37FDrK1Y36am7zIeSijQMUukVCUSJ3uyGk=;
        b=kdwcAk+qz5dYZlqVRUIFLZ5UdtfYxRTViVjSm10SH2lvAOTY9UIQARP0v18awLcFAY
         k5rwJmsmSiMjzXQasuXWI+M7ZLQb3ZYj3bgYUxCGp7fQt9Gwh+gdoqx4Y1mlunz7VTbv
         KoNPjubkzp17E6sPUpebCW26UoVLJryYO4P/8/kxkMjuVqTQ2CHUq8deZPqD+FZgqMha
         +diyv4ON4kngzjUtOxb35xR8WkLn3LHmnfZYITRSZqCD8zn462jWOJTtmO7YQ4CAwIzo
         OyF9E4o83pSbK7cu4mNFuuoD8NirlUC6kwi/xfHziTXKJsoactY3Uir6wh4sGsovG3sz
         76BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780231961; x=1780836761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OnMQ970O/37FDrK1Y36am7zIeSijQMUukVCUSJ3uyGk=;
        b=UWL2RgfUrFWmLR/mEfTUvi2ohJ9PF8BNp50KCSKrZ38XAvHDAs5B3KQp3EN1775Xce
         sx9Q2Hr2HtC/uNRLJ66Q5t1Y98jR8j+MufY0cLNqyp5FMjsilHhPlueXIvKR4KLmapAr
         URAWzyLtDRzUOX09RAMoRKJXIKVwyutzsvM0reWVpuwUT1G3yoZkROrLU2YtDECX9u5Z
         DcoUlxhhRm75F7R66bKu7WcyMRTVlmkB+CCDhdaLA3/4LwxuP2ya+jjmM9PyBpN/5coj
         /T8s6eqnOIV9b8yrwL/NVYoNxZO0WZQ9fVl5+RMEFyYmCDv/fKZF5ykN4Omqc3SHu3ZM
         sPnw==
X-Gm-Message-State: AOJu0YwyvXBD5oYHWWTtqtAtbHLOQOf3lv1StYMBY1EpkJ0cjVg2DZC5
	2zxQputphEr7DJzIODxJojAmjLLG0gP66+eNsGpeDR6Yxzw8ddJf3kz+YNubHiDIcF7eqzep24Y
	x93Ph
X-Gm-Gg: Acq92OGUUgKF1yjNbfxNJ1sBQd5hUKGOJSat/swH20/nUGnHWQM7hhb7vE/aKEz3+6A
	Ct3Ym5e7UgLtv1/xditur9WGAzyM9H1XjE6mM38jdtKeOBZqQ/K3AB2W9WsMMsACXK9+/gFmS2W
	PrRv64910Z+42zsOnKjwKwUSlasufr6phKpnUl8CwFTzGAcnR612ZcwhhgahjBU7yZkoHfmzlI5
	XSsD7E3YA9b6f6Jc+NHqGHx+5yFszq1xTyB3RQF7vQB4pJltMTsny+KV5Wx90y/neSmn58XFRRF
	y7H0kC6f8JfIhrWUZEXDS39XkrjzIcJv1jA05XwCnAJQ8ktn7gopB+827HEjaIuOuivuimZXi6V
	FPBNLwHYnh2YB/SSdfNpiOHSfsySfMSXO7x9+KLYJac5xXfuB3yZl0r+TAeJo5gptHPGaeehl4s
	No1sxpDgq/ljA/bIFK04pN1I9jwnbGmk7VAWTGU8JyVx8GM+l40bbg35zouqd4Uw==
X-Received: by 2002:a05:620a:1792:b0:914:ca5f:bc59 with SMTP id af79cd13be357-9153db8be70mr1156444585a.62.1780231961592;
        Sun, 31 May 2026 05:52:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153247515esm743332185a.13.2026.05.31.05.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 05:52:40 -0700 (PDT)
Date: Sun, 31 May 2026 12:52:39 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org, 
	akpm@linux-foundation.org, linux-mm@kvack.org, skhan@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net, 
	pasha.tatashin@soleen.com, dmatlack@google.com, kexec@lists.infradead.org, 
	pratyush@kernel.org, skhawaja@google.com, graf@amazon.com
Subject: Re: [PATCH v4 02/13] liveupdate: avoid mixing cleanup guards with
 goto in luo_session_retrieve_fd
Message-ID: <ahwuA1tYmM0LZt0d@plex>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
 <20260530221938.115978-3-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530221938.115978-3-pasha.tatashin@soleen.com>

On 05-30 22:19, Pasha Tatashin wrote:
> Refactoring luo_session_retrieve_fd() to avoid mixing automated
> cleanup-style guards with goto-based resource release, which is not
> recommended under the Linux kernel coding style.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  kernel/liveupdate/luo_session.c | 25 ++++++++++++-------------
>  1 file changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
> index 146414933977..8d9201c25412 100644
> --- a/kernel/liveupdate/luo_session.c
> +++ b/kernel/liveupdate/luo_session.c
> @@ -291,25 +291,24 @@ static int luo_session_retrieve_fd(struct luo_session *session,
>  	if (argp->fd < 0)
>  		return argp->fd;
>  
> -	guard(mutex)(&session->mutex);
> -	err = luo_retrieve_file(&session->file_set, argp->token, &file);
> -	if (err < 0)
> -		goto  err_put_fd;
> +	scoped_guard(mutex, &session->mutex) {
> +		err = luo_retrieve_file(&session->file_set, argp->token, &file);
> +		if (err < 0) {
> +			put_unused_fd(argp->fd);
> +			return err;
> +		}
> +	}
>  
>  	err = luo_ucmd_respond(ucmd, sizeof(*argp));
> -	if (err)
> -		goto err_put_file;
> +	if (err) {
> +		fput(file);
> +		put_unused_fd(argp->fd);
> +		return err;
> +	}
>  
>  	fd_install(argp->fd, file);

From Sashiko:
This is a pre-existing issue, but could this error path allow userspace
to hijack a recycled file descriptor?
...

Answer: No.

get_unused_fd_flags allocates an unused file descriptor (FD) that 
initially points to NULL. It is not associated with any "struct file"; 
this association occurs only during fd_install(), which is the final 
function called before returning to userspace.

>  
>  	return 0;
> -
> -err_put_file:
> -	fput(file);
> -err_put_fd:
> -	put_unused_fd(argp->fd);
> -
> -	return err;
>  }
>  
>  static int luo_session_finish(struct luo_session *session,
> -- 
> 2.53.0
> 
