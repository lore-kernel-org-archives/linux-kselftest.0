Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD59332EBD
	for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 15:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776873432; cv=pass; b=KyRBbhmYshRV3FaSvD1ncOzXpSr0fpKFvq0FEbaAHhVe2pxM8FKGbRyZYnUI8bOJtIe2QyLp35Qkc1UUBX7S3Vy/uePRHIOGa9JNGgMfd81xpVPKzWnQ85o4eaZkv0Jrox5LWdYVCwaxY5x4QNwUotXtDt27lNgqC2TN7pvH0Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776873432; c=relaxed/simple;
	bh=NieXPC3YS6T5Y8AdieDzRo0mzb0fpU++KX+cXLQAlNM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUHywf6UZ+onSesG2GDav9ZUJTrRQfPQTsxCbZahyhiW42J3B3sHh3e5pTahkLLW4NWa4yys12IE4xRZacfzmiSaTOgilR/LU6+ZhEfdnmN/XQE/3zuB5q/KJZQPi3bzZ54+QT3J/s0kTg+ftnwIf8N1lt8GT7pnoXrlZGViGQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SkjhoE67; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SkjhoE67"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e5b55062fso31225481cf.2
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Apr 2026 08:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776873429; cv=none;
        d=google.com; s=arc-20240605;
        b=blbQYbgdPhHdDxCTcDEf314Eb+J3+2ZAleFFi7Z9naXmJFiYSd1bSLE8LaUA0rwV9z
         lP8wXmy8Q7l17tp29csZ7/OYwp/sy+xnvKBHYIkuEA0cBVQzyF8XY3TcRzx34ivkhRKp
         n3rT1ApZlCx+obA8TOKbP4yDsLVLTC4WUYaWScpoUwfT6b6Vb66p0GZIyrLxmmI2Akbs
         /6v/WHTkn/98aDuTSnvey+J5DHysTDl8xyk2kMEcDPcxPABLNnOwi2RA5bV9OBJEcAaH
         i10EP+VCnWXr+7bb5r0JNOiMeTZv6IdSG0p4XAP6/NNg48Y4OWzsnuvyME795K14IsJV
         cpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NieXPC3YS6T5Y8AdieDzRo0mzb0fpU++KX+cXLQAlNM=;
        fh=jv4PUjjiCvvReWXe5iLoOGPCGlXHBxi6/2fkzE4iq10=;
        b=UslUe7i1VQ/F3ICV8hCAr1Qab/85GK+RWiACyIrZwiHPZ/srW1+84wc5zR9vXKxiQ1
         T/om5sVmrEV54CT1haVnt+pYztpLh4peT1WlXlA+PHuJXtlTBUs8AE+G5ADDhnYqgYeJ
         CD6no4MTIWnrE3DklJTGsQf09S4KLg3oPSCXOIF3tiAg9A96ZoVclc8vSDt1LUOvHM9U
         QMoeKU/GvGjJgQNclhqX+UrYOa5MgdGaMRzgkUmyxUN4mXkpypx0oquVWrZFkwttwBrJ
         JgRtAOOpHKe3TLbfZMY7RnHYVCfNRiCR6/YHXNCpRu6zpto0Vi/OPMiRnCwbBe3HKhx4
         l6FA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776873429; x=1777478229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NieXPC3YS6T5Y8AdieDzRo0mzb0fpU++KX+cXLQAlNM=;
        b=SkjhoE67dnRKt0g0ZeQ6NFvfbtBvQcZglYg3UgL8ahdJQXdxyy84Mbq8XO0OP88GuB
         HyJnMnGbCraKStvZ4L+7WOr7skiWRCrcgHyHk+tc1JjYhMHIoBtwLm6SG8b+olKPNZCW
         fZSlQ4s0jFwIlxklMcAwPnCr7hvyOAx2VOwgwD32AnZeVKf1pe7BgqQQkdCYGBI9+fh1
         GXMWI/W/myQflGSUzZUrJTOrOns/7itz3XCuV/eenXc2wgIeZsH1L8A4yTpTAZbWXPCI
         fMjxWVCEMHm7SVUSZJ3e7M1PSYKBUjmbgrlHjJ+WgebzeNccoNuwxjyqs7mYiOYy6nyH
         BvgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776873429; x=1777478229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NieXPC3YS6T5Y8AdieDzRo0mzb0fpU++KX+cXLQAlNM=;
        b=DvODz/NdQHZDIhWHqqiitKxi/YfhYu7OMehI1LAfumVnP5x7hsoKVwb0TlGohXlBKB
         F20LQoVGaqsVErE56nf/7pMG4Q0Dmum9lMhkTZEYR8Ba44U2wc4DeEGJ0e/EGtvKT9+S
         2Pstyn7GrWNkFC0jcZRKBAG9nXPzwN0lNE4vlGiBnBO4KuiSzi5rBhN97Q7WtySIxRt3
         zHw/6TOsq6MmrCYTsvsSaM/rxGJeHJD39E6P1wmZfrmGRZpOZDf8fVqVAycV/hzPNb6k
         DBwUfMpF/OrR/cN1PPrvFNUHJw98Qenr/MfziluUgj6W/XucfY4kmTPaquvAtSYd2QPH
         hpgg==
X-Forwarded-Encrypted: i=1; AFNElJ8dfRDTlWAyIARlQT/t4lDaFyMjoi1UUfJuaWXx1BCds2x9LEfj4qNNV7tsiyt0aMu8Ev8N6LwmhF3zdrWscS8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwIqUX0LRi4tP4QOaovXsowZu4THShUPMhqSsmOsT8CXWI0C1
	XSSzDgB2UZlGQXtwEKJipjgHLmA68odX5ULq791HauQNSQT4qU97ibmlbGtcx+dRw4HTufndrdu
	FSCroDPNVLLgLyI63nmDLgWwCEHyzcsqTjDdRf00s
X-Gm-Gg: AeBDieup9tvlVa+lu1GRRIDW/rsGt46A/OnHhmlWaj5gZK2GSLh02NnWX2IfrXM9H5R
	l5TVgWabAbV65yWcC2DuXzT24114QLgadwjOLuNvOR+o55Ucut3TRlywnzBinXIE3Y5LmJuLOi7
	vXVuIhsjBKd5LbCA5KIkz8WxBMAlQamSakSp3siuMM84L6S9muqtsBkc5u/OHDjFJun9gdr4q7A
	CyA545LI2cbRSKNLTj0ROVeoGlhrW5TrkOhDKFN98NsaGXquIO9j+XsAF2blZcfAGWk7Qhvj6g0
	hm6XLaGo090Ofucus/YpK4+JCBpIRaICcmqjVOQvW6nKiAMHZtNDi5CbK1eFcmQAIS4JHt6lAFw
	su3NxNiEo
X-Received: by 2002:a05:622a:4c87:b0:50f:bdeb:1e47 with SMTP id
 d75a77b69052e-50fbdeb24e1mr81744721cf.44.1776873428348; Wed, 22 Apr 2026
 08:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422024554.130346-1-jt26wzz@gmail.com> <20260422024554.130346-2-jt26wzz@gmail.com>
In-Reply-To: <20260422024554.130346-2-jt26wzz@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 22 Apr 2026 08:56:56 -0700
X-Gm-Features: AQROBzAxAmfFhRZGfkUgjI6oI5pnFyMaVXwdwbwsAVkf7mnNe9dRlKDjPQZm21w
Message-ID: <CANn89i+RuNBmUuacPLv9oKNFA0g71z65Fy-tFRjW7gm0TSGbqw@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tcp: call sk_data_ready() after listener migration
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 7:46=E2=80=AFPM Zhenzhong Wu <jt26wzz@gmail.com> wr=
ote:
>
> When inet_csk_listen_stop() migrates an established child socket from
> a closing listener to another socket in the same SO_REUSEPORT group,
> the target listener gets a new accept-queue entry via
> inet_csk_reqsk_queue_add(), but that path never notifies the target
> listener's waiters. A nonblocking accept() still works because it
> checks the queue directly, but poll()/epoll_wait() waiters and
> blocking accept() callers can also remain asleep indefinitely.
>
> Call READ_ONCE(nsk->sk_data_ready)(nsk) after a successful migration
> in inet_csk_listen_stop().
>
> However, after inet_csk_reqsk_queue_add() succeeds, the ref acquired
> in reuseport_migrate_sock() is effectively transferred to
> nreq->rsk_listener. Another CPU can then dequeue nreq via accept()
> or listener shutdown, hit reqsk_put(), and drop that listener ref.
> Since listeners are SOCK_RCU_FREE, wrap the post-queue_add()
> dereferences of nsk in rcu_read_lock()/rcu_read_unlock(), which also
> covers the existing sock_net(nsk) access in that path.
>
> The reqsk_timer_handler() path does not need the same changes for two
> reasons: half-open requests become readable only after the final ACK,
> where tcp_child_process() already wakes the listener; and once nreq is
> visible via inet_ehash_insert(), the success path no longer touches
> nsk directly.
>
> Fixes: 54b92e841937 ("tcp: Migrate TCP_ESTABLISHED/TCP_SYN_RECV sockets i=
n accept queues.")
> Cc: stable@vger.kernel.org
> Suggested-by: Eric Dumazet <edumazet@google.com>
> Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>

Reviewed-by: Eric Dumazet <edumazet@google.com>
