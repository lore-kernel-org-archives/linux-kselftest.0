Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012077;
	b=EafCYO4tv7gODE0YnU2Sf2hPmW0EwHWqVKvOFjtL9fZJpdDx/NpQVK2JzeahjY221scE
	 6kH/ExExN4ao/eWyuBxjmkzMDOkU5GsoyBtdg+Yo6ueA/sSz5yDYu8G/SzxtfJhLNopfI
	 WTK2hOt74C9a8p2bJ8cVAhaoKQbuXPobZnwiRIxKMhTVyMSCRe1CCWDyVvnz/Ctzq3JRo
	 QvTIDVB7Q8s6lARFJeHlAARTn2GJ82Jg9cC1MziKI+CNnofZH8Tkz9gyAoDkBvwm/H9Wg
	 NA053RDbGgZ68+cXiPO9dHRpH2irtoK7IILQ99Pt5gi2Q/TW0JkINOEcgRZhMSPGE/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012077;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
	b=VI7gM6XamJpMfJzKz9gxWkxvNZvMsRzmCKQRRiBr3GJ5CbN8n3uiXQHOG42d0UNScG4+
	 etrZR3J0fDJX1ZdCSI1h7uEgbuaRDTAozVtMOegtNL+g61b5Gt2eL06xq4Trn7hry9KG/
	 7f8YQSdvrV+INt7ZMB6vhaUPUf5MJIgFN5PE8cVpxUNuCh37WCUEGZjcAUOFp1sxN/SFp
	 nNkd0JVJSvoCVSGPxGnwJ5eWtAkSj5AS4CRGAfhgH+VxBgs3+TaucxSP0szjtJ+T6Ybt5
	 MsO+N1BBbEOQn4RQdYyr0nvo6T2PIgoY1jLCKeHsnyae6jk2f2Guac5JU2+gGSvlqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkYNVbFy;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovW6qsQm;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F660A2604
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 14:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4F660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QkYNVbFy;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ovW6qsQm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795012075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
	b=QkYNVbFysbtyTo4AxL9B0KwDuvSpfKKsbLodLqm+JE17yhpqM0Uc1uPV54vOxQ2dt2R8Mp
	DR5gWNMiUB1X7iZeh1X3GFSnqhRQITCHNkf1td9SMRIMjElUawN3/Z15TV4NKlFp/cpIEF
	H5TGVjuYC28MEq+4aildZ7y8A8b27uc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-sU_v-mAROH-KMTrS7dL1WQ-1; Wed, 18 Nov 2026 09:27:54 -0500
X-MC-Unique: sU_v-mAROH-KMTrS7dL1WQ-1
X-Mimecast-MFC-AGG-ID: sU_v-mAROH-KMTrS7dL1WQ_1795012073
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-490d2ac331bso1103200f8f.0
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Nov 2026 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795012073; x=1795616873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
        b=ovW6qsQmxXVAihs5E/C0Up2koWSJwl97J3RlT0gDjxNl/3ewPaKcGrXV6X/pbbBTw2
         xi9g//5llwdtKmaJLelowcrxl6y2x+sSq/SIaGXuPrGIx7XotPDQPhf3iy6TPJp63kL4
         z3BSDoag6uBYVTcj7pKhffpS/T6Nx38DFBhbvGqc6b472iaOq7TrkQ4AqGzbrwYncE6F
         24mDqAPo/P1px0V9gCwDqrbihj3uE9zsWEh4eM7S8K66PxOvWYx6UwR6BnOD5nLDovKG
         ZgBLNUOY7akxZNQFRg8u9y4rWNLBdBE+JiRdlM+VlZqGrz+8T5aX1b4vTxhG8aQYZkGP
         G7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795012073; x=1795616873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZboGS9TzIUKYx8nlJm/8q9o+1lIrW0X9zgljbgU57g=;
        b=bLjygsN5ZXeZyFSGt6XFEbc0yW78jhDj2WOKqPpy7wLE9tnQYl1aeUICr5hKBXBg2W
         W9tPwXlvZ0CPxCSIgdc6xJ48Pkz6K6AdbT4lek8vMi4d2eothmethdybSw3PqKky8aFH
         c/g1KbGi4UCyBjfEMWIDcSuaIxxyWzekZ2yfZqcrZCc9vdIueXpz9Tpuuts7Vzw8K1GM
         c9KstZHHuyt4bdSDHYfsUNgGC85e6EHjYokhOX4lHWjKlWUsKoXg15xn5FZxB8GZXQ2V
         +Xb2lbVmEKkKLwXzJE6bQp+9MKQp7QbjD+xm1BTKS8LztNFjGl6HJl/o4r92B450P2bl
         fm9w==
X-Forwarded-Encrypted: i=1; AL+hErGSlxru6PSz6l7QtD/QtLWt67MvBmI8E6tGp2xzYB7YLTDK3r/UP7J+TdN/cZDqQ7u19gcYXbPDdLwxLbOYbnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gsQ96bvCyuvrN2pI4IMwYRJiYXCMPUVeKUMJ3wBuAcezsSIjw
	vsQwY4H56b3hh2PlmW567FgDBfgq9KIPedi4UbJvj/HEQyBnhgywm36CJfFljXrnutkVbElJoEe
	j1EPDgdtuHYy+pp8q+mglKu1PSzJStUbe4oJPsPn+e4v9W2PHX9AsG0vqf8KHic9JF3hlQg==
X-Gm-Gg: AZFdTZf3qBy1gU3qBKveD/gjFT8GjBdO4HhSTkvFOr8/xEJMJuGrBjLq51dwSVLtBK5
	H9CJd+IBpFuZ0rOFa1ePYNqVNv4mf0O5nrDQSuKzrQzw1P7O6ykWG5vZgbiUhA8Jh2n55yQ0le1
	3G3uKXwwsuhkboZazxs9GGE/zUcH7lpR4W6PATV0wOL58O3E/S85ggkf5EI7p5ZHgioV1/CzGvf
	6rj5WncX705ZyU38rduQvU5nMHXxo2jX7lwHMHFdPSZrjPXA0Q9EBWHpnFDnnURG8lrZWwsmsK/
	WZN6PWyFlA1G5FiHUvEJ6TbZpsp0uinL3sjUswIuTAFS8RQoLK5yFxtP2q/BlYpmoXkjdHEdQTy
	BlzUpwtjxC2Y8T/hfCeNTGbNAFyQocnbeX7cygdfeU3j0Vb0CneigfnyxM6QUUUp7q0OCOZED3Q
	5D/lk=
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr5574844f8f.17.1795012072808;
        Wed, 18 Nov 2026 06:27:52 -0800 (PST)
X-Received: by 2002:a5d:5888:0:b0:48d:ff71:dd87 with SMTP id ffacd0b85a97d-4a639475750mr5574789f8f.17.1795012072412;
        Wed, 18 Nov 2026 06:27:52 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656933961sm5275395f8f.46.2026.11.18.06.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:27:51 -0800 (PST)
Date: Wed, 18 Nov 2026 15:27:49 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v7 09/40] rtmutex: Continue the chain walk when a
 waiter's deadline donor changes
Message-ID: <av215SnBF5GShg0J@jlelli-thinkpadt14gen4.remote.csb>
References: <cover.1794922146.git.mathieu.desnoyers@efficios.com>
 <c8b228501d8981454f63843b394019fefd4002f3.1794922146.git.mathieu.desnoyers@efficios.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8b228501d8981454f63843b394019fefd4002f3.1794922146.git.mathieu.desnoyers@efficios.com>

Hello,

On 17/11/26 09:10, Mathieu Desnoyers wrote:

...

> Fix this by recording the donor in the waiter with the sort keys, in
> waiter_update_prio(). rt_waiter_up_to_date() compares both. The walk and
> rt_mutex_adjust_pi() use it. A new donor then takes the walk on to the

...

>  kernel/locking/rtmutex.c        | 22 ++++++++++++++++++++--
>  kernel/locking/rtmutex_api.c    |  2 +-
>  kernel/locking/rtmutex_common.h |  3 +++
>  3 files changed, 24 insertions(+), 3 deletions(-)

Thanks for confirming the Sashiko finding and for the plan in your reply
[1]. As you note there, a window remains however the walk is changed,
because the donor pointer holds no reference on the donor. So I have to
wonder (and ask for Peter, Thomas, etc opinion) if we'd rather not keep
extending the chain walk for DEADLINE PI, which is known broken and
proxy execution is going to replace anyway, and leave rtmutex.c alone.

It looks like what we lack is memory safety, apart from accurate PI.
It's an hack after another, but how about having the owner pin its donor
instead: take a reference on the task behind dl.pi_se whenever it is set
to another task's entity, and drop it when pi_se changes
(rt_mutex_setprio() and __setscheduler_dl_pi() are the only writers).
The donor then stays allocated at most for the owner's critical section;
its parameters may be stale or cleared meanwhile, which
replenish_dl_entity() already copes with after patch 8; and the owner
may keep running on a stale donor, which is no worse than today's
DEADLINE PI. Thoughts?

Not against doing "the more right thing" of course. Just evaluating
alternatives.

Thanks,
Juri

[1] https://lore.kernel.org/all/f535fbbd-2247-4d0d-9771-a67116fda1a2@efficios.com/

