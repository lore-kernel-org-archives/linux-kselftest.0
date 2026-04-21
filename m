Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0733388E77
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 22:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776812147; cv=pass; b=fwW+E1nnv+LDafLZQPB1X16IwrAGarvabP7LQxvgeVwCLOgfbBhQCA7jGgauq61CKu0LvSkhAhxlVx3MfdFbTQoGRV7oxaKUFtfWny2/3eOqrXieK2oykvY5mrGhhsVMM+bUcrXmI9EQINzuEinxuuUWyWUuR6Mkc7ZCpemis00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776812147; c=relaxed/simple;
	bh=7g+6Nj4I9wlSgMa6eYN57nLSLjoKXWzdMIwO8KfWfA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MSzEnI+hEnhu1xY34Vn4HYnFLu2HYpJHaEE5ouYKmD/yPU/WtxueiuO4JL4ym1jMO3KTMUA9n6dEHTBlBX7ny0hiQ9qi3uG3y21FhhiClPACiJRavHrSXB6+/3pUB0svci2WbReniyzvsy6NMz9hARyyy/HMzKH5A6mq7FyyL1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T1rFC0W8; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T1rFC0W8"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c1a170a50so5944474c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 15:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776812145; cv=none;
        d=google.com; s=arc-20240605;
        b=M5VEoQ76zINew19YjCztyswXLJ0YBnXNtIp/j7SNhbchle3DSYbiHZCMymddfd8dXx
         5uzbztfZEB5boJC/g+xvXTNHYTlmyH3htQQss81mioMcGDHrtjUnBTyQARPVspQDZTP5
         jyBMv1JAQywc4m3w+kHrZS+9TMSSRJn5FO8aEyRaHI74GgJoPhb4ISAjtWpu84CeRH9e
         LI7IyWwOHQTo8Et+Y3qIeNd86HZM7Y3chd53PoAQv7hbm8+mQdCYTjhbjOO7W7AbIg3+
         V2J96MhW4J3H1wmvbDX4BTOnwZjUdReKcMYWYD9dWpZaRmzvfXNT9i+0NMX464G3k3QJ
         uhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7g+6Nj4I9wlSgMa6eYN57nLSLjoKXWzdMIwO8KfWfA0=;
        fh=6isCXyYZe5rObCUoujXgcQd1ummQ+YYCUNJKcsX8Ob4=;
        b=WAKYlbasNRDy4GtYxsK5bB5oUj0G8iCtTwR6TuhHHu6c5169tP9Q3lOMeRwjhrClLT
         vlXRBPqVreFzYIDrb+n1E4Um3NpADM0ZL+ADrLf17KZEEwyt+h4R9OrNqyVRNLisstIT
         p2G4lrQNM0drhCsgEqbyIZulbnOj30KMwJwW7wezJdKhX4J5JWi4i3KphilhrgX40eKO
         IjuMWAK2lH56954Cu6CRt68BaSYKVhgrC74wbf5mI9SGA+fpoCUU1Gs+/ErP8ZjnoJHz
         wHC5V7830AWup3D+lPqtLP8bLHfPnKPvCVo1qO3daEuTcK1zxwbNhWnCV4HOuUeR3ynk
         Y15g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776812145; x=1777416945; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7g+6Nj4I9wlSgMa6eYN57nLSLjoKXWzdMIwO8KfWfA0=;
        b=T1rFC0W8HJjEU5SYA02Yi58j2YaXzPiQfqL+81p8TaMFaUhTnYnp0fMRhmKsRdY4vW
         ROjCRNiuafgBnFCzoVCuvtgYyZHlGBuJyMB0OQWu73QxEBrHz0WqzkmD/uUgRjCpWLp3
         pfW9IBLsuNEqRRhUcJamdHgV/Ajncj2v8JVDqYQ1vAv2YC5Ui1LmgRpeuqE6w4O0p40+
         xXzSwMO3NaQQZ/tLGkzd3X51HGIAWIg1kjgI5VhsnNGOo6RxU6OFTxAo9TmG4JPmLSHF
         MEiVGFRbNRuBzxyOCM4s+2VlFVXE83XLAAIxgOh7pCrq1Slz6+MuBWHv8tumHp1WgWz7
         JXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776812145; x=1777416945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7g+6Nj4I9wlSgMa6eYN57nLSLjoKXWzdMIwO8KfWfA0=;
        b=UVmrBK5rn/4+/cwuBAdrakAl/TzC1t8utiKKR3fA02Jr5cOwd9fsWikWoL2e8lboni
         lo7YxayrNFsJy+9IxneHb+wYn/2VSYU3Z5zhMnUmYj3pSlMXFN1Sf/T2Y3vKrJEN1LOL
         64NI9wS+MkP8wjNeNaoj/GpqO4vw62/hXjLdygXP/TbuKheKAgdjteq7CrWhJknqZ5p+
         Ko7sTgwNZ5O8u5Ppvbk5Gk+sfOXxck7H7UVA4vNOMGU613ce7HK+iVj6zo4PjvGhETSK
         kmuUM/Nr5JO9tnMx02TThcSx/IRCNgP6gJcMC9KRmsWoEvVfwBx3mt/7QOWoimuMQT3M
         umWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/uk0I5slOIJY4CAl+zjF1BsNaexTDfoFpQlfqXjxFr6Cb/7lRJ+5/wgSUBxcRrpDYvlO6Sh7V6iUwuAL6rH/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDUcQ9kHVZiCXjVZRyNWn3cLmCCdH1qAAODn/50p8HPPeyF59t
	HQtOyoQlrtTb7/ew8/wMFgcWoKuKcewMfbbA43O6BowvAcdFIvga6pdMnBgYG3u2bEZY7So1yd4
	9n2HVCKSQySkOKmAmIHpRF1rXA1UgpIwIQH38zhWP
X-Gm-Gg: AeBDiethfibxLdGRYKVAGZLH25hy2mXHGUkB9q5Iyf9+nbJLSO+JxelZC3PAhId4koE
	jq/17O3QM2UnrJk3GbjfxBmXi8VXn4Tw/EdmdOR73siA+KCCVSvksU5TWPPwjrEQ66hr/0BnoWq
	bOl+PAxxxqgPmZs40n6ByVB1RQIb0E6LgrOe1w8y4EPV9mSR1o99gbbcsbE7fuNcNmHDdi6R4nm
	T4QOG+/OkgtNmQd6T4XD6ACb+GZg5aeOXVA9yeyfYJLrGtTjPFKgRp9c2KgKu/Rr3rSiveaIEPq
	5zpO/Aj2QMgN0cV/S0tOy49YAJNR2Y7kRo7503tbS0uRZlZvW+/+41iFhi+eGERP11k5LE3uvft
	x0fon9o9O4yHNEsjgTaabfXBlaX+SPwa77+bWkSGpMVJYY/kf+I88lmZI3UYYMrxIsH0tckwUFQ
	==
X-Received: by 2002:a05:7022:6627:b0:128:ca83:5aa1 with SMTP id
 a92af1059eb24-12c73f9217dmr11175890c88.16.1776812144868; Tue, 21 Apr 2026
 15:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421123106.142299-1-jt26wzz@gmail.com> <20260421123106.142299-2-jt26wzz@gmail.com>
In-Reply-To: <20260421123106.142299-2-jt26wzz@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 21 Apr 2026 15:55:33 -0700
X-Gm-Features: AQROBzD2b51gLvsY15bbLEJ6mf5qB0jtCSoEC5dNs0R6RYbWMCDYXu37HOUp92I
Message-ID: <CAAVpQUCW2rAdz47kYM-YN7Er2iKVReyZbFSCJXG04Cw-8y_VjA@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] tcp: call sk_data_ready() after listener migration
To: Zhenzhong Wu <jt26wzz@gmail.com>
Cc: netdev@vger.kernel.org, edumazet@google.com, ncardwell@google.com, 
	davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, tamird@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 5:31=E2=80=AFAM Zhenzhong Wu <jt26wzz@gmail.com> wr=
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
> Signed-off-by: Zhenzhong Wu <jt26wzz@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
