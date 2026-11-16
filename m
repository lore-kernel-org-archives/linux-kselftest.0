Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861756;
	b=2SQmK2aOaiAjU2qNpTp9zlJVFtNcpyg0Z5x2w9zoOTkjRe/jMUrkkyDs+AJ2ghQ1mVoX
	 6XDCgLxmjrkEA6RQHIs3VrdL+rlobnMIH6RDt5v6ewxsGp2vBiu0XaBBG5hlG+mDdz2xe
	 e9/NoNYsnsvA3chWVmLzt79Mrjy5J2GDW6NkpcXS3iCXSbZRi/zhK6uGNRYZI1/yltRd+
	 YdHhoILDgl5DvS1oXMv6jBkx1z6tp0E4suAeuRFVgxy2CVyafKQGsELutjWNk2UsTRNJ7
	 ubWOXO7yGD2lAkmqUnRNQPD+VhUqkqhw9P00PWyk1WLluVhOZVHxy8Us5WNGifgpL1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
	b=u4DVQ3cdoB4Hk/Ty9GoXEW8yN0i987T9b1bnc7t+d4Uga1CSf50DeijYC4wi2WdtU7Dk
	 L7vsvvT/l6qpERPXghZrdF7UM0kyW1N7HqsZt3chBJiq/44ous+U02ENWCIyqBviHx0Oq
	 xPj0xzy3q897aoblCvdk4bHomjvQCWYOUa56C/1HDO6atNnY6393ufWnJwM0gCGyyEf2W
	 4hXru2Pa6yWpRFKo/nD6Kgh1saf14MztARoY8RCP+g9shcR4SyzeMzjFNuqf+q6Lfh/vB
	 CYqHI36a+L2OHbEJ4q9oj1MGza8BSU02R3Gb7iLwVj8K0LZ39jrrnQOlGhWYF8Z9FcQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH1BUmHd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4658606A322
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 20:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4658606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OH1BUmHd
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so15675605e9.3
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 12:42:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861754; cv=none;
        d=google.com; s=arc-20260327;
        b=BFHTt8PcVATuKloHXOcKJBmQ46kBmTEExnlOUeFdN1PcbxluipbuvQDy2Jk8h1ex4S
         7pAz2iPrTNhqhlhSyveBptBSF1cqXSY2/4lggabqiMeS5H/hH2boqmem9zKBF6TgD7mD
         nNtVg4TTPz5AFqSAd9+jr6uosBo2hkG3RkLnUSYTo7M5aNc0xp2jRB1iJRHyixAqW5fp
         1slEzNwwU3oNW1XHYPTCxzfyAceRE+G9FCvxGmPnafwyMZ8b56mGiSEEbWmSUI3sqa7V
         bVOTHmSqJeoNtyxo50GhUed8hsORSHhi9T79G8Se8zCDzn1yME6MkcEHGkmEqEU9hv0G
         jsiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        fh=1IQFNLZ6sFkjrcJMNQ3xOhb2tl6csGjC5jg3PXu76uQ=;
        b=GTbUpM5UXPA5PxP8ysvkbbQUZZrLMAuZFYhUXYU1ZFJ7NZcMK9JukcdT34+LjcfXR9
         bKFvIz18psJg+WaU0jB5QpH+pcmj7j8ToIaLdpmMAukPsNt6n7bpVdiT2alttAXdQ/e0
         vgw+jSGSBVNA4bhhJsYlePsFWJuX1uw1LCuRaSrQcUNJ0XdNOS/3hZxDKMF3nYQGPlAh
         WCveRwSyEc9a6TL+ctcIhHxxdXpOJ/NPOUPhm/L0nYcjtzIN/GIcAN6t6dh39cwNyJ6o
         oqwsrkl3tJGZSdJNcf12NhwcKpZH5V6k92uAokhw7CRPW+4Msi0qS6SlNcCNZsEJIX2G
         Fr6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794861754; x=1795466554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        b=OH1BUmHdkLVvo5XqEhrxPrfinhRJCfHDY1Ua7J137Jymq0ov1k98UfeqrH98bSmMk/
         l9prjLcCD2f/CMQtMRY3T8XpEh7Q2XBigRGpf9kONp1ztl+XCk36TgtgvFZ8q0doH6/u
         IsIJ6t+TJ50L1z476FiVSvkw13iceswQlBRjSVvQGI+vrTVCz2StTytHEsIqm1iRigos
         NuNDnm/mMHuSvxgtkZ1lPfE+2QJZU+5ClgF2ZdAkYPVnqKnuIROoKuTQMHU99DzCeI7c
         zSMlQQtHNJFONlKnMN7vVYPDTY+5tJGA0J4kVVNQ0ZChtFvFdJggsx0ZRzl3Vyw/BH7Q
         egOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861754; x=1795466554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWqXxtJLKXeybdceYaRwLVhgGOYueeF5/iioy3h/sBM=;
        b=HBTRRUJJ9HR0w1Zowo722ZFBOayicSskNLBJsjlFHh4XyFIQ2v6xifrte0czTd9CwO
         Wdjrv/gpEvoRlBCtFpXM8+V6g3xCzwsEOntmnlLuirZO082KoDZgbCE2FJp/aJi8q85l
         mubiUMzreBKJq3j5w+7F3Y54YoayiYvShrUWPiyKSfpegSaSxGCPixgNix1sED1jb/R5
         GjCdDpFPPZl49/A7WO1YxoocTfg5INdGlH/OCl0BUnp6Z0Qft2clWMDXi8tPJJHLqObq
         8MGLe/SeWkJ2MAg2pvdQOYLHAo8f/B8R2M4rBptsd7FzGblZHNon2OeFdlArh3/xGggj
         NPJA==
X-Forwarded-Encrypted: i=1; AL+hErFn8r9RZUpQVHfBf5V1hhZGgkceZ/Ht1Zei2T7PYoHaNCTWANEBe6xPxE0J8ajq5Cv4ZjNZ5FYDV2uxLVsNXcA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qh7gIERNccZ74ZJ6uuhh8LFA2aqMLPvG6NeVk9LXRGwD7DMde
	8vGHmr/FJaMv9X7rkJuo4FPcIBbRmvUJ5azaKB1+pjDU7Hk3ih27Zo2N42Yuur0Wy9MOWG+UZFm
	ok36XLwMhATrG8eoFsiComD4MNZYrQicIhCyLEjg=
X-Gm-Gg: AYBFou3T23RuNEYffIqLjV/PQ/wrlSspfYO13kvoRtUL9nvi8e83ztMcONgtBpiQlbZ
	/KpSIYUFHh/8IqQxNHf3N+C+xNaAxzEJkgyA4Z4hubqC2bZ5lU+xnRLfaj2lGdpq4D/U3MqOxfe
	BEbMaJgh6CaCn02JPQpGLathzvoDRZ2qZ0AS9wl1uGI7ZyFgCFC0N4ZxedCY/0YIwzPwhAP7XDR
	WutG3tNVOJ5BgaVpS1v2g9Dxd+bdbuP3Msj39RAQvGpRDMPgrOHuGlob9xgSmAIA3So4mfTHu+K
	k4fDKGGJ/yIxI8twHO07/gvGuflcxXCYHQL3z6M08XoZJkB1Ew4AUaotLeNX4MdS1Ph0Tmo+Ifw
	f+LpRbxzvEoNlUNyIigmXcg8iGmKN4WiblKqCLtRupf+H0D5XKhTEbhHib4QotmhUCGZ0JkCgWY
	rOC2A5o360xY1NjK+7DFVQZBwPPtFB+bOAXvT7pMdGEk4hck/XVQdc/+CBDjKhX6ECH/fT8NmTi
	99a1pmvCqnOHPhwcdsl7pZFDMO78dIAxXanUck2Gy/+fnyrMiGyyA==
X-Received: by 2002:a05:600c:524a:b0:4bb:6cef:d14b with SMTP id
 5b1f17b1804b1-4bb6cefd40dmr114558095e9.2.1794861753742; Mon, 16 Nov 2026
 12:42:33 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-5-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 12:42:21 -0800
X-Gm-Features: Aa3M54p9MomemKYMLSYPkFUiZv-e1UrVLPxsl86D1ig5CGhfzaTiBH_yWzJWZKs
Message-ID: <CANDhNCpQ-fyUJRCy_6twENoAy+1yGHaWN8dHw7VbUz6Qn7wqhw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 4/8] sched/proxy: Tell the class about a proxy migration
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
> find_proxy_task() moves a blocked donor to the runqueue of the mutex
> owner. proxy_set_task_cpu() does this with __set_task_cpu(), so that it
> can keep p->wake_cpu, the CPU the donor returns to.
>
> But __set_task_cpu() skips what set_task_cpu() does around it:
> - the migrate_task_rq() method of the class;
> - the migration count and the perf event;
> - the sched_migrate_task tracepoint.
>
> For a fair task, the dequeue on the old runqueue detaches its load.
> migrate_task_rq_fair() would then reset last_update_time, which makes
> the enqueue on the new runqueue attach the load. Without that call, the
> load is attached nowhere. When the donor is woken, the return migration
> goes through set_task_cpu(). It removes that load from the owner's
> runqueue, which never got it.
>
> So each round trip of a donor lowers the load and the utilization of
> the owner's runqueue. In a test, a CPU with two tasks that never sleep
> showed a mean util_avg of 195, where 1024 is expected. schedutil would
> then pick a low frequency for a CPU that is fully busy, and the load
> balancer would see that CPU as nearly idle.
>
> Fix this by doing in proxy_set_task_cpu() what set_task_cpu() does
> around __set_task_cpu(). Tracers and perf now see a proxy migration as
> a migration, and nr_migrations counts it.
>
> migrate_task_rq_dl() moves the bandwidth of a task that migrates to
> another root domain. "sched/deadline: Move a task's bandwidth to the
> root domain it runs in" added that. A proxy migration must not do it:
> the task does not run where it is queued. So make migrate_task_rq_dl()
> leave the bandwidth of such a task in its root domain. If its wake-up
> then picks a CPU of another root domain, the bandwidth moves at that
> time.
>
> Fixes: b049b81bdff6 ("sched: Handle blocked-waiter migration (and return =
migration)")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> ---
>  kernel/sched/core.c     | 13 +++++++++++++
>  kernel/sched/deadline.c |  8 +++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 24105eeeb3c7..5d82c343662f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6967,6 +6967,19 @@ static inline void proxy_set_task_cpu(struct task_=
struct *p, int cpu)
>          * was previously runnable.
>          */
>         wake_cpu =3D p->wake_cpu;
> +       /*
> +        * Tell the class and the tracers about the migration, as
> +        * set_task_cpu() does. The fair class then attaches the load of =
@p
> +        * to the new runqueue. Without that, the return migration remove=
s
> +        * load that the runqueue never got.
> +        */
> +       trace_sched_migrate_task(p, cpu);
> +       if (task_cpu(p) !=3D cpu) {
> +               if (p->sched_class->migrate_task_rq)
> +                       p->sched_class->migrate_task_rq(p, cpu);
> +               p->se.nr_migrations++;
> +               perf_event_task_migrate(p);
> +       }
>         __set_task_cpu(p, cpu);
>         p->wake_cpu =3D wake_cpu;
>  }

So I've got a pending fix from Yu-Ting in my tree (apologies for the
gerrit link, I've not cleaned up and pushed my tree out yet) that I
believe duplicates the bit above:
  https://r.android.com/4410518


> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 3b62ee43c209..d14ce3615ba6 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -3030,8 +3030,14 @@ static void migrate_task_rq_dl(struct task_struct =
*p, int new_cpu)
>          * the bandwidth. A mask can hold CPUs of two root domains, and
>          * select_fallback_rq() can widen it. Move the bandwidth there, a=
s
>          * dl_task_offline_migration() does for a throttled task.
> +        *
> +        * Not for a task that is blocked on a mutex and only queued for
> +        * proxy execution. It does not run on the new CPU, so its bandwi=
dth
> +        * stays in its root domain. If its wake-up then picks a CPU of a=
nother
> +        * root domain, the bandwidth moves at that time.
>          */
> -       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)))
> +       if (unlikely(dl_task_bw_elsewhere(p, new_cpu)) &&
> +           !(p->is_blocked && task_on_rq_migrating(p)))
>                 dl_task_move_bw(p, new_cpu);
>
>         if (READ_ONCE(p->__state) !=3D TASK_WAKING)

I may need to pull this bit in separately.

thanks!
-john
