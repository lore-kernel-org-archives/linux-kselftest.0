Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847388;
	b=W50lpsFCG6AuddQcaV2x2PPBVumbKvzjyoRckkG3bcDRxgYYIfUO4e1+61tZeCTP54Dc
	 OJsQJPCQFQFW8/AGNTPvY5Fu7NXzntzQsohg5cdZw+syMcQGpaY8Hkt2BAwhhlNPwMZZA
	 2xJbq8YKSoEGfBl5hHgmn+hOI3K6gqsK63T+vvKgoIzKH7K8bO1wyqRHXIDBzraAKu1qw
	 RSTbBwvMQEzNOxFVkObrOjg6pihY1aH7id7uWTfyOXY8vQKJHvaTpbhSXW5uyjRMvcXkH
	 lZXAm3KiaoJdRQ0Jdu1/RB57F8TRnOegpfvEqfio5eYQr/lUqCOPas77OO7+cEYVWiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
	b=Q0ZlV9pW81XgeEpFFDs/1lBA/sBZZzPiTTkG1hgXM3RrB5B3pWAKTTQ9ic07lDyvEh4P
	 TvAvlfSpuoDVpKwRNf1t/LsaIMshtoXVED6vrUpgJsIun6AazjtNrdQHSwzgM4nmH3X9N
	 aaoAVUEq0G7kNMPapqMEYGoBEYU7V4tsTFj4cY3Vjz4YI/1Kt+q34LAuQsgXG8IU0I0Ue
	 Rgo2ANR/zEGmqfIbgcz5AE+b5uIyk+Fq6BmapWq0k7AitBayEyzwfZDGtD+Y/mL/GjgX2
	 FH7KvUlWFp7P4hKkf8+/NEzcWhDPUJELPudMg6BhmftfG11+UmFCMS+giodkM9Q2MzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHD+g70C;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704FD606A331
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 704FD606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IHD+g70C
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c508bafaddfso408482366b.1
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847387; x=1795452187; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
        b=IHD+g70CMjjDb+lNyaZS7FPrR9hKiBjI6am80yEPTtTB9qWtugwit+DSXHqY66L98K
         8EtcQ72+xPDDvax/dKjPailSRAMm2iFoAICCBJiaKhmJXvLESaGHskyifSodaT1tRs2k
         FnHt0a2P09ARVfqqIUhh4npU9nurbR746tcMFt5h0VvYTWxJ99h7V4nt5AdC5Xn+RuNw
         R+UPfCjsMpCI0kZGUr8m/0061Cxdd4HI0FJsop35cbdBWrApwuRCUgB8AqRfgWVySydR
         5NYVgGLoJ1FeSnqZ87k51s8BnWjIU7UBqdkx4H+pPBId62cZa0wxGpKqydkewL7P/Ubz
         LItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847387; x=1795452187;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDfU+sS9f1CGfQAVDBxxcGKeVZ+qJ/3ua+e3uJH5HXA=;
        b=z0K5xTD3ZMmX4APK7F43HOnxSe9wlgMlwApfStX23KtPpl9I6OOCjIPyWT1E1KfpIS
         h8jDtTNH5hOjEDs4nFt5cAv9AGxG3nGXHU3C4Fto2kS1E+abLnADQXRX1/FHGRuczn+b
         WroWRN/qK9TcGmiRv9YJdlL119hqjBBoO0UHZw/G5kjeLkZuTGCT3r2ZEDl33YOQLoSK
         Ytzf0BPggm9i/l3LSoCxCuNushZJPiNZL+v9Rh3h+TbQmo4XUoTjsCUs5gpfLDnYlgWg
         gtIKh4i1VhTWpT0+SXqVCwXDb7Zd8aFiR3hv8LMXZGAWE0kQ4JfbcfKJRtVMFRV3HT67
         W2fA==
X-Forwarded-Encrypted: i=1; AL+hErFYPeCCFDNOSNXZ+MuXDQ80iZgfLKIG1g7mNQVeo3gF3T0T4RD64PIB/RSLUpP6437t79OhYvUseYyl3MxI/No=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UeAT7uo2x4on8QOKtpiS3L0hvFQWvRLbO7HX2edJGofT8948l
	3j/68zOJtHfvMHvZdBogo7kyq27V/t+lPkp1cpOpyXjxhsD1JyDysmVmB166fY0/+q0Ilo3ycg=
	=
X-Received: from ejja21.prod.google.com ([2002:a17:906:3e95:b0:c3e:edc5:36b1])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6d08:b0:c34:e9fe:82ed
 with SMTP id a640c23a62f3a-c50963d803amr901765866b.28.1794847386433; Mon, 16
 Nov 2026 08:43:06 -0800 (PST)
Date: Mon, 16 Nov 2026 16:43:05 +0000
In-Reply-To: <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028221705.3915340-1-halg@google.com> <CALCETrW9ygriu54gxiHFLEd5+hJminQo0r8Jwd63wR69Dj4W7w@mail.gmail.com>
 <20261106-befreien-addieren-eislauf-e09212803534@brauner> <CALCETrWa1SBLcb5oWjqjgzZvKvCoHjmYFk=Lf5ytEM9uqm5jYA@mail.gmail.com>
 <avM41a80aig2de-R@google.com> <20261111-behagen-faktisch-entgegen-e2e714373895@brauner>
Message-ID: <avsymRBSulVZfouF@google.com>
Subject: Re: [PATCH 0/8] userns: per-namespace capability bounding set and
 opt-in netns loopback
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, Kees Cook <kees@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Jan Kara <jack@suse.cz>, 
	James Morris <jmorris@namei.org>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Jann Horn <jannh@google.com>, "=?utf-8?Q?G=C3=BCnther?= Noack" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Jonathan Calmels <jcalmels@3xx0.net>, Casey Schaufler <casey@schaufler-ca.com>, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-api@vger.kernel.org, containers@lists.linux.dev, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Nov 11, 2026 at 04:20:02PM +0100, Christian Brauner wrote:
> Just a note on the essay I cut off. I really object to any arguments
> that amount to "it's too much work" propped up by a few thin arguments
> sprinkled in such as rtnetlink.
> 
> I also reject any arguments that amount to underscoping and overscoping
> of the new capability. The scope is clear: empty netns with brought up
> loop device.

Understood, thanks. I'll split the loopback work out into its own
standalone series and handle it separately, keeping the scope strictly
defined as you described.

> But again, I'm more focussed on cells so here's what I find acceptable:
[snip]
> * a new CapUns: line in /proc/<pid>/status
> * new audit mask in AUDIT_CAPSET record

Quick question on AUDIT_CAPSET: today it's only emitted on capset() and
only logs capability sets that capset() can modify (explicitly or
implicitly like cap_ambient). It does not include cap_bset which is
modified via prctl(). Since capset() never modifies cap_userns either,
does it make sense to treat it like cap_bset and leave it out of
AUDIT_CAPSET, relying on prctl auditing instead?

[snip]
> That gets rid of the sysctl, the clone3() field and the clone flags,
> doesn't need a new capability bit, and nothing changes for anyone who
> doesn't opt in, I think.
> 
> And that loopback thing should be its own series. Not as an nsfs ioctl
> though. All nsfs ioctls only report namespace state and I'd like to keep
> it that way.
> 
> Pipe this through an LLM and make sure it makes sense and covers all
> holes.
> 
> Thoughts?

Thanks for the feedback and the detailed proposal. It looks good to me
and nicely ties everything together. I'll prepare a V2 for review based
on this hybrid design.
