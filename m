Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004234D926
	for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 15:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476909; cv=none; b=pUAdg/itZgpDfhZdIXoPW9ceYjl6SebWLC03UUnsy7a/jzq0WcCKzCD5gGxqpCQbUO81C511Jl2+g0s6J8njB1sPPqb3jo4UmuyyCwB62FAp7BuEagvLMZp6UENpwOSoQjC+IC0frHOkqsbQWUBf+QQJ0RLKr3N0eHxUUd1DEWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476909; c=relaxed/simple;
	bh=MPtseMcPFil/hMFJneNT69ahx4akFZE9eLGxGiLszb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtzMNb44Ku1cs+0hjj3KBcuP4xT9jyAhhDhaLe99ZYTrAIPwE6/ROWn+yL6QOg9bVJ7lz1Z9u/iLm7ZV7txgrU6aTzTQ2jLBGnQyUQA/FrFmtZfugzkrXyx1reiCD++xK6bEbKiZ2WsYYilhNdMoruk4c5s5rqVUjPvXXyZpOqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laFnhgY3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laFnhgY3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso142115335e9.1
        for <linux-kselftest@vger.kernel.org>; Wed, 29 Apr 2026 08:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777476907; x=1778081707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DGcwHPSiFxHxYPNUUq+KvwIWZ9lWOTC64lUxpO8JLXk=;
        b=laFnhgY3dEyqcmP1T+nqa7CQNxDjtpkOHtFReQtEHfdCon3XTCMJsO4D6Uo2bzPsSq
         l74nClAxSQzx8C++a1PXm2sQYfi9bscmiyvIBkDveiFpFwMWIF5gXVT+XbleYA4i+Pbq
         zhMGMqSTEpw22lYyuIylGZ4n+k8WDVSFOXpnn8TRyvNB9coXShvrQf+GZV+gwh8NG8nG
         4L+GETBsp2ZBW3rEGpY5bOIFj+lqbGpJWdL5d3yOXk0V8ILmql5HnA9F0S5zUiltAFrl
         EN4S8hqvzJLcbNqPigbYezEfCqFQGaBm+IwkSyCp4rgvTzHFmWe3rvzumKFPp9CLDlpO
         fb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476907; x=1778081707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DGcwHPSiFxHxYPNUUq+KvwIWZ9lWOTC64lUxpO8JLXk=;
        b=R98+k0i87PzogM61057V6F2in6BtJae+b6r4v6lwlodxytYG+zYAIYPGKg0lqEK0bu
         7MxtYzRLyFZgzBFKV6Q+K3bu3j6saJI5pOPOxH32n10jnDVK8kFAEKPmO0LAbt8rESOT
         6vPX8o3Y9ShhwWynhkXM5FfesYJc5jbjWZuCthcHAJMfyn60IxpIlz/0m5hBvkN5Lt2p
         UfBkMgrUP0JikJUooDHIcu+f6tI1iox3Ph9rrumtLLjyHFjNFcX/VE1ziLcayns+ofX1
         mKl6pwVAdSbiv/1eM045HcVPhlL3d1jczpFFaMZ3bQvuH0JZtjSjz9x5AxeCPZjZLrXZ
         aZ9Q==
X-Forwarded-Encrypted: i=1; AFNElJ/EVl9YlcLp01pjheXwBTaz6Up7F2RUROiCRa1M7nof26f3iLNxI0Es/u7yhzODk9B8yAuVSHCwY4Ba0yk5lK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUUv7zRQIz87NqFVXnbEHu3URleQVgkTsPkNn0wDj1wKHBF1/3
	ODv7srD1ZJTnpVRTKvEzZv/u0euC73rFG4VYTxkcLHFQadPsUHwBZElK
X-Gm-Gg: AeBDiesius5obhpuZZXd/WI8Tj2AstFA1JuBzGm+Qz8VVIZ2MtDRhX/kL0qHAkXeFzk
	33z9bp33tOgu3hTSjzQ52zgBiHF+JngsMrU76h+VQHv/elvYwyqQj7UixpzBzMQz1tf7aYJEG0a
	DaIpu33IAm808tIqs668jbvirxJh0LKRIRn69iMMHLPE1ZZwAhgXHe6X6gQLFtW3vcuad64psC5
	vgX3QpDb/D2qMsaIR+ZqgB0BjNp0Yb5ch0Y4jTGmoPctZ8eiZgRjnqv65ZkAQV+HSCVeh2R5npu
	5wwJvohgJbVEXFyPFob6VxOltiJX0EjXa86U73lp0Zn4B2jRG8wct4hpNbW/Qz1SMOxOlYx5hhZ
	k18N8Bucr52YBhvCeizWBLUkUNLDrc6ShTxEERfTyYVxJ+fMpOel0qvwx6wSNWtYlkYNT0WttIK
	Vqa/JOK6BE63IoyieybFfNIna6FdYtf5rZKvoNXAy9f+p/mzy4dXJ5twINpHkgfyio4FlLbWgfG
	MFvSUR3/g==
X-Received: by 2002:a05:600c:a41:b0:488:8840:e5ae with SMTP id 5b1f17b1804b1-48a7b543f0bmr72325055e9.24.1777476906362;
        Wed, 29 Apr 2026 08:35:06 -0700 (PDT)
Received: from f (cst-prg-93-232.cust.vodafone.cz. [46.135.93.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc810e1sm62983695e9.14.2026.04.29.08.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:35:05 -0700 (PDT)
Date: Wed, 29 Apr 2026 17:34:40 +0200
From: Mateusz Guzik <mjguzik@gmail.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Christian Brauner <brauner@kernel.org>, 
	Soheil Hassas Yeganeh <soheil@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Shuah Khan <shuah@kernel.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Khazhismel Kumykov <khazhy@google.com>, 
	Willem de Bruijn <willemb@google.com>, Eric Dumazet <edumazet@google.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] eventpoll: Fix epoll_wait() report false negative
Message-ID: <xbotidrmois5ygxtqtwqzczkt76wcc7uw5cz5lptda53coaavj@pzvxcpe534cu>
References: <cover.1752824628.git.namcao@linutronix.de>
 <43d64ad765e2c47e958f01246320359b11379466.1752824628.git.namcao@linutronix.de>
 <CACSApvZT5F4F36jLWEc5v_AbqZVQpmH1W7UK21tB9nPu=OtmBA@mail.gmail.com>
 <20250718085948.3xXGcxeQ@linutronix.de>
 <20260429-november-speisen-3084d769d316@brauner>
 <87340exm2o.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87340exm2o.fsf@yellow.woof>

On Wed, Apr 29, 2026 at 09:27:59AM +0200, Nam Cao wrote:
> Christian Brauner <brauner@kernel.org> writes:
> > The selftests rely on this behavior that timeout=0 sees events from a
> > concurrently running producer. They would fail at a very higher rate
> > after this change - believe me I had a similar patch that changed
> > something in this area.
> 
> Huh, that's interesting. Do you still remember which selftest cases rely
> on this behavior? I would like to study them further.
> 
> > I would explore the seqcount that Mateusz suggested tbh.
> 
> I will investigate that.
> 

In the meantime I grew fond of another approach: have the write side
re-calc the conditon the unlocked side checks for.

While the seqc thing solves the scalabilty problem, it still requires
fences which are not free on arm.

the goal would be to make it so that this:
static inline int ep_events_available(struct eventpoll *ep)
{  
        return !list_empty_careful(&ep->rdllist) ||
                READ_ONCE(ep->ovflist) != EP_UNACTIVE_PTR;    
}

can be converted into:
static inline int ep_events_available(struct eventpoll *ep)
{  
	return ep->has_events;
}

Which in turn means that any codepath which messes with either rdllist
or ovflist will need to recalc before it ends up unlocking.

Strictly speaking more error prone than the seq approach, but should be
faster on weaker-ordered archs thanks to avoided fences.

I'm definitely not going to protest the seqc route.
