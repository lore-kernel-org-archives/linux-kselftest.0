Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864973;
	b=X2ebKKYOPgRCp9PNLmRl/qeN6q7vgFoZpE4zZvyXllU6Tj+A+2yOp6WWnbsSjf5vO+dI
	 IMDoK7irJAVek0YwWS7+s03bLdHx/oor9ZSNHPZDIUoIj+lSHZjtjBVxTsCu71pC2r65r
	 p7SpNbGIa3FMRyiFC9oD50pm19hWg+lOaCS9VKESDo6OJgt58R+dS6GC+1WkHuOuXvaXW
	 PZFM/wdbkzV5rK/npTiYakRGG0wRVO+5ZtnXLyqXesTnIxqxAFI40XnPdJtS0UvD9SBUA
	 JlkZqfqSrgtCujRuRFFtraQ7Z61QESFGevXVfN9AQYcL2p/L74jqKIIdqQdD7shv3Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
	b=Sx4TfL6wSUwznMNZHkkj8NTtHZgzRTsFI7xwSN46otKGz7Bwi17/BpdofpQ3kiUAL2w/
	 6EodmGjFcuiW/x0KlTOFEPcF6yFM2lZPbEESxgXWA+/AjPeGzjmMYD8DSJ+izJzI6wM7n
	 er7tqhbWPCADIyfygZD/BrG9zhQY0gDb4Dus8yiOiz8xb4tZsG4iRCVyy7/s4/Yim3Yti
	 wBIQdSVWTSB7V92x3N5iJ31xWYWexzWCawrRJll3la04dumu8vwiH1cOhYl6I7K1sibyk
	 F76dkYt3ZKeQ6LfJIQ1EruTi+WPUaXEf1Pr22IEB321qhrtZ0bvYeG2xDluwdNpf/8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkvtWOck;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D138D606A88D
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 21:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D138D606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkvtWOck
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so24781405e9.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 13:36:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864967; cv=none;
        d=google.com; s=arc-20260327;
        b=sxy9kIVKFx38jQwhlwbzXr/mRyXMf/R/IzHKJBlXB6ALqGK2ASRqE8BguFTZ27/v8R
         qN5KTHpDLxpXd+HwPuruUom+WPm4fmCt7T08mUr1qgPAOI3ef/pW5WuEfAkw/uxFI5ey
         HAPMAqCtwVmMTKpU01DkXChhkqBgNcWQtI3W9QjFxsYVcovAAyGlKeY8pjDlLKdeapMa
         IR7upOK1l1Azp2nJxuU+loUxeva6fPQScyGoGrv358yxPMaiP0BEdwZL9HZ5OCN3XYu7
         wtJKK9akNaBa/ULkoJyT9ugT0+0AcY3DwdVTOpMsyyeMXfo0y81v0EAi8nHGXsvne+ps
         XxZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        fh=US95NfoIZ66c1B44PtOoYBzrBNtB0u8qzUomfODGjD8=;
        b=G7hcheg+t2gyip/1dmkvcCkaC+EsB4/o2dzKsvwkKgdCFgsdmrRLwTGTn87m11W16z
         50cYhI1KkPKiWstLxPL0KhgJ0JsY6lRuUyahgTeH16JzNg+D896E1xdtA52HCdEuQ+kx
         57cszVoi1dGgBdQgIkO+t8lcb4cz4B1urrucsOjbUzEl4SGDWRF+vYfGk6n/mXduDEp3
         g/Rt7Y3Afat8sVYttkKJgdVBAimd3bqSg7Bu9XCYzX5/ezeUyaxrlP5LLS/ukF/NcOAv
         YN1LqeK9Cpxc0fFvlc1TcyXXwuJpO1pc4ef7HQG88fu88x+PbqMKf8SpMtkZ7/Ii6kyJ
         OBkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864967; x=1795469767; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        b=FkvtWOckknAYm0RBIyWFk2hyjH/txzcVdLyRwArO3s5wVqxQHIzo36LUaapF/n6Z3s
         Q7YViKggIQ1g1al0cxXOXU7xjTQP9RgTuVYTzpM0kQPftfKlzmM61gyh4a9OElg7G8/n
         rmBBI0+BETwqhAGXFaSkKe6p/5WHlelwsUsuy8LR4H5E7klAZixS42zbd1Q9uuT/UEjf
         cmiohyXZ/DY8pBIkbFlE8Z6shSu+KQWFwv8z+SNAmrAZPdKHnEewpqdITKMjGCK+xR31
         Xbg4C/wyovicEPWi/6Xe7TuRlni2rKJ1ggTH70vyv0IIe1VP2eCc6vhfFEoFBqkjI4XT
         N83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864967; x=1795469767;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=apANsySrfP2AcQg+nmmV+CTyQp8Y33Z+cnFTxK46jGk=;
        b=LdAj1T2/DSzbz/SsOTnzs+noLpBSxCbOMU/KOCiVZ82RqpYbo6DI5vcPcVCenFfeuF
         x003frEvklljdebpuio7o/TW6gmRnHVK7JeRwNRueOU6pj/zuZ5PIQfCegAKVP6QKFtb
         L2C/ateRvD3wAXr9OW35ChcnVGewZIuMV5wfPpewVEMJCEy87ilhYZem3enWSlDdjY1r
         XVu2rEa7ilo4hjkz75r9YIQkSYNJIAJh/LMvYEuaEynY6wwLqBKl9fa4sJ14v3JurvD5
         jDD4lierE9rUutEkHhSaTewowJPeCnyft4eeWDwx8G4CmF20YoX903Oxcq5Bc4deUauP
         xZ/A==
X-Forwarded-Encrypted: i=1; AL+hErG27sw4C0PjOMtYZ9c0kUKR94bBmTo/D1f+yhqcohTqIlDgJPGQUbgr+tHGnRSp246OVc6AgSpNaknhIXryt8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W5tmKUJdMprqVKcJFY1OQ+IdBBIqxkF53u5Dp+uCLUFI0KEiR
	CdnISOwvJ6ZE/SGizl4n/WbtdhwDlItcVN6TjM/OxSQpFKICb9xHZgyWnqabls1jFpyhL3eP9+I
	unYqEEpZCDDp4nK1lgCbIIXP3wZotAFx1OQk5tws=
X-Gm-Gg: AYBFou1x1H0AwGr2cFvupcLRSdftnZS5LzFxE40KizE5lnZob6899AhNV6doSpY11Lq
	O0uOPTT8Raeh9TTWdfiQS2gQ220PHF1PbhggdHNSChIJMqUMI8E9FruFcnmvHY9AQSZVH6zzen/
	nH0fwDIg8X2XdITfnDRqmpue+0AWD5J4X4Uqd4blM4x+sR3JAB09umhizXnJIWj/PiZcnQUCODL
	Rq9UsHDR0Cpu/89TLpzznxzHWGDPquCjrdl6GNLlPXA0/5pR7cykAD6ZukDIPGpn2zytUxBE+xg
	WuBCjykJEyA7Be8lFLGRKJOV6Og/mYLKHAZWe1tcHFv3KKQmW9qSZDKv2NcZW5Gd4l3Io70FL1c
	kVDlRfB/W2gqQPNTF0XPWYEOdBy1Hc4BWr90xmGtWZ/JuJ7U5IQeEbBnG8J/Yk752Ncqeo7hSks
	XJVUt1ZLR2wOpgS78Lj6y6pjIuYdUbzk3vXZcvZcuuFq91/xujfB3bjwVvo2ufXMD7pvhUi9tDI
	n16USryby8jjrGO+VmPxzrE+cHFqPs+Aqe2iQpLjSnTbxAXRYum/bV7cG+bidJYh4mziQmiwjcq
X-Received: by 2002:a05:600c:6090:b0:4bb:6752:8413 with SMTP id
 5b1f17b1804b1-4bb67528699mr154625985e9.8.1794864966813; Mon, 16 Nov 2026
 13:36:06 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-3-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 13:35:54 -0800
X-Gm-Features: Aa3M54qNbJqnYjwTpJDqdrj2fM1PpHTuxzMAt267iJG4QdrELR7wDN9LyqQRXVg
Message-ID: <CANDhNCoWGAPr+TBPAiZB1bd3o-CGpkYG_w2ssgx0WQryBXe_bQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/8] sched/proxy: Wake blocked RT and deadline
 tasks through the full path
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, linux-kernel@vger.kernel.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	connoro@google.com, arighi@nvidia.com, akpm@linux-foundation.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 11:26=E2=80=AFAM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> With proxy execution, a task blocked on a mutex stays on its runqueue.
> The RT and deadline classes do not put such a task on their pushable
> lists. enqueue_task_rt() and put_prev_task_rt() skip a blocked task.
> enqueue_task_dl() and put_prev_task_dl() do the same. find_proxy_task()
> migrates it instead.
>
> Commit 7918cf369361 ("sched/proxy: Only return migrate when needed")
> wakes a blocked task in place when it is still on its original CPU.
> That wake-up does no enqueue. It also skips select_task_rq() and the
> task_woken() method of the class. So the woken task is runnable, but it
> is not pushable, and no other CPU can pull it.
>
> A SCHED_FIFO task woken this way waits behind a higher priority task
> while another CPU is idle. In a test on two CPUs, it ran 500ms after
> the mutex was released, when the higher priority task stopped. Without
> proxy execution it ran at once on the idle CPU. The test uses
> SCHED_FIFO. The deadline class has the same code path.
>
> Fix this in proxy_needs_return(). An RT or deadline task takes the full
> wake-up path, as a task that was proxy-migrated does. The other classes
> keep the in-place wake-up.
>
> Fixes: 7918cf369361 ("sched/proxy: Only return migrate when needed")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

I need to look more closely here but this seems likely to overlap with
currently out-of-tree chain-migration patches that Conor came up with:
https://github.com/johnstultz-work/linux-dev/commit/80b820a921bf5058196314a=
b72f8446f5ca3bad6
https://github.com/johnstultz-work/linux-dev/commit/27f701c997a152cc831262b=
55a226d513fa6abab
https://github.com/johnstultz-work/linux-dev/commit/fd1c4d9c6df6183e5ad9348=
51dbbaa31846619e1
https://github.com/johnstultz-work/linux-dev/commit/d0d409fad42196f4f412675=
93566c0e55f856d6d

(from my https://github.com/johnstultz-work/linux-dev/commits/proxy-exec-v3=
3-7.4-pre-rc1/
branch)

So I'm not totally surprised to hear there's DL/RT balancing issues current=
ly.

Also in another thread (which I can't find right now), a good point
was raised that some of the early return "shortcuts" that I've used
elsewhere aren't good for core-scheduling either since they can break
the cookie checks, so I wonder if a better fix here would be just
removing that (task_cpu(p) =3D=3D p->wake_cpu) conditional all together?

thanks
-john
