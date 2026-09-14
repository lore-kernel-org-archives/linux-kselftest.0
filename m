Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029BC40BCC2
	for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 17:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789406000; cv=none; b=nnwI6patKRDB3OP4dkZOwtFytvd9eCVym3X0KTzCqy9kp1xv3kTM3wtJ8Y61xYkVrhhnBrA9HZb5254mZX/GSB1v+lG19vjxz3fxIQ1Tt35DV4dUhnNVtCleajsyOpH0HZIbiBS1op5TsKJhclF5rf2BGvZraoM1+HZ1NCB5lO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789406000; c=relaxed/simple;
	bh=DWfd+OrYYBBAjoeKGlYddJuwoBUWlcnOVSA19p7gCPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRQ+T/TXoe5eMrpB6J5DWO4nKZMNUHUNT9DaQfO+GQmY5PJA6+mUQecta0P6sKVAjXC6ZYdqYp2/eE2kSSShucRP3C7JQrJxoltQOzLaEV9oOX1OFHI9Gm1oy0b96UxxfSmNQmAKHbd38G0eRcmT77Nk0xYIquC+uPI9x4xKPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFRnhab0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFRnhab0"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49e78adf099so16629175e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 14 Sep 2026 10:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789405997; x=1790010797; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b+lHxHvQW6ptoO5MEGq5MTyGK+6vHvFuZMkZJq4Ndzc=;
        b=MFRnhab0hntRf3ahIUL7wo8NO040OIvRogUEtdFVo5Nwzda2TxxX+GMt2UJpWJmWSu
         Mzvfa2b+TAPy2v3XccD8smBuVpMu3aA8MnscuWlty7Vif266e0Qt2sHReOST2yhq0zBk
         NKJwrOlBWXjWRm/jl7visdu6zMyfwDnPOW/HYfgxWuY+3zbY+EnptwdRNxqQHQCfedVH
         kNkdmetUgF8RBD4bfBInEvRgFOfrK3s0X8MtuZETdqJbbBj5CIi/NNWtS25xK/JIGLno
         VAg65NrBfqvdDs8n7vIxAsMaJdxkay2oAEaGI5sTu8rOJVDMVnWP/HMz2L+QStne0OGg
         PvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405997; x=1790010797;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b+lHxHvQW6ptoO5MEGq5MTyGK+6vHvFuZMkZJq4Ndzc=;
        b=LFeSjlibmvWNVyYVKsRRjyDQ2QJcGZBTyO9YLydzYt0V3K0guKke6hXxHkw3W/uCRX
         TSBpY0KrA9qrvb9IN/eo8G3xREVUh+GnyqqSAi6VdmClAr6Ua4ElUGQKsKL0GntERZk/
         4NckHq/JEXOp/HL6l7iubRMAprqk46CneRaMCtAK5GSliEVa+2x7GAWuVE0ZzZrtxi7F
         R7eeDXSbJoga82KRk2FVSsOGPabc5inS+n0mcQSpq1VruTGsSy3i1ZLAzgvALuLfIb54
         iQAN4cHpl5GzLAY7F+NTs2X63EhJvySpGPUD3vh4GkoIZ0+/Wa6BXsW0TgfYwdDsCKuC
         ewMg==
X-Forwarded-Encrypted: i=1; AKwUvBxNrWSqYpFbpJiamOjW3LYEsZW/eJeWcHV+bU8mwH9XceuwqtGkUjKXeFpE0E1RlbOUt0H5wShNnxgQwQVrlBk=@vger.kernel.org
X-Gm-Message-State: AFuF++kc8sSf6IyL1b9MohQYkelXpXQDdc8ZLraZM6MGyScViok1VlfN
	kWd1Iaq+e9Tjdf4k/pnlJ06cHLCzoMZW7JvDF0fe6Ja67F7WQIIhvWLI
X-Gm-Gg: AYBFou2gCrLRC81/cgwsCEmXpDBjlUleFFtuqOQ3ExBxFKR2jdg8um5eh6DnPHFOpYr
	/vEe60pgRmj2UYsjWmBcDNR6lI22QyBmJZcRrtuy1iJcheLTqLQbxgqSu43xDDvcR28S7wjr8so
	N4uHJE2kz1z9AudhB7iEkRIqPFXzEkZTg+e+H0pqUXCi9DbPtsXZ6ne/7VyGCuiIyzw8tUPql61
	vjEO1QtnwEu9Uz76vHnOMzZ7+/wXayWzeav3T7ajVhMrHcQCT9mRuvXDUxEjrxUt40W8zd4T6kO
	vud55ErGk3LS/L25K0z031JpGZaY9LdVjoKqOU3N01XHzcrT0hHohj8IrIcxQd+N7VHdUKCUhhF
	DtO3JsD2KFmHzWI8xKZHv/fK2AtHA6MV7A1Yr57lGGZx9LSWUgElH7bTwCfXOocFsELA8WVbvvL
	2JqVMgWrrGw5hMbxo3LuXlTm+thHippzS5as0OXK78fmPMp3R4c02dyKUyzGROSekh0Xehbr125
	ByTDDPKAbBBzGaMqyjmb3X7
X-Received: by 2002:a05:600c:3585:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49e7a64b723mr52892565e9.10.1789405996936;
        Mon, 14 Sep 2026 10:13:16 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d675a50sm6040645e9.9.2026.09.14.10.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:13:16 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:13:15 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Christopher Lusk <clusk@northecho.dev>
Cc: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>,
	Oleg Nesterov <oleg@redhat.com>, Jiri Slaby <jirislaby@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Tahera Fahimi <fahimitahera@gmail.com>,
	Paul Moore <paul@paul-moore.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	John Johansen <john.johansen@canonical.com>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] Landlock signal scope and TIOCSIG
Message-ID: <20260914.239dc75285d2@gnoack.org>
References: <20260913221958.839429-1-clusk@northecho.dev>
 <20260914.b8a029f9abb8@gnoack.org>
 <20260914134013.1457130-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914134013.1457130-1-clusk@northecho.dev>

Hello!

On Mon, Sep 14, 2026 at 09:40:13AM -0400, Christopher Lusk wrote:
> Your capability framing convinces me.  Controlling who may attach to (or
> open a master for) the PTY is the right layer, and the master FD is best
> thought of as the capability, the same way socketpair() is.
> 
> You are also right that the series is incomplete as a fix: the same three
> signals arrive through the n_tty control-character path (Ctrl-C / Ctrl-\ /
> Ctrl-Z) that my patch does not touch, and PTYs additionally raise SIGWINCH,
> SIGHUP and SIGCONT.  That reinforces your point rather than mine.  Chasing
> individual signal-delivery paths inside the TTY layer is the wrong layer,
> and a per-ioctl hook would only paper over one entry into a mechanism that
> is working as designed.
>
> One question, mostly so I have the line right in my own notes rather than
> to relitigate: how do you see this relative to the SIGIO/fowner path that
> 4b80320ca7ed brought under SCOPE_SIGNAL?  My read of the distinction is
> that in the SIGIO case the sandboxed process unilaterally selects the target
> by arming the owner, whereas here the recipients have voluntarily attached
> to the terminal and the TTY driver delivers job-control signals over that
> attachment.  If that is the intended boundary, it is a clean one, and I am
> happy to treat TTY-driven signals as outside the guarantee.

Yes, that is the difference why SIGIO had to be protected -- in the
SIGIO case, it was the already landlocked process which could itself
select the signal recipients through fcntl(fd, F_SETOWN, ...).

In the terminal case, it is the TTY-client-side processes that select
which processes are attached to the terminal.  With the PTY master FD
alone, it is not possible to signal processes that aren't already
attached to the terminal.


> If it is useful, I would be glad to send a small documentation patch making
> that explicit: a note in the SCOPE_SIGNAL / IPC-scoping section of
> landlock.rst that TTY-driver signal delivery (TIOCSIG and the
> control-character path) is not mediated by SCOPE_SIGNAL, with the practical
> guidance to control PTY attachment instead.  I will drop the task_kill
> approach.

Thank you, I would appreciate that!

Thanks,
–Günther
