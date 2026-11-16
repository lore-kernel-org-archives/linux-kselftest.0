Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794870995;
	b=sbSlAUqUp8YafhhpGS55AiJG1QW/n2ccWUK89jZkFocrEBaPG1q61CwxFMdVLfQndDXF
	 MgUNnSyplWdDsqdD94gtnfxlVSayIUaTxxhRxuP57qO8b/jWUY6W61CQGwmiEg/2WGYM9
	 nsObwXElbtw8p74RdGgPGgjJGkR+m+/jdJ+HlWaBvvNh8lxN9tHk0a9Xl3Zctl62ujb53
	 YBSyvwSzE6LV+N6/knzRFpnKhlkB8VEZWRDnDxAX5VJTdcabscuC4L/BNLgG9mhVickj/
	 5xe1ZXENfaYfCE4+GsNwVg79kFb7/jlWkMm1cB5tPLvYlC+GdmCmorcyQsOjWnCYsfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
	b=fCWds1Iox5pHHB7KYaWPI8Qb/YaFdXJmqzBTgtIT/EQo9FNcQ7iXg737YTYBTf4Tm9QQ
	 0suJJP5Ub2sVcHqwnFmZjJyfavoyLzzbKaI5L4ZwL96W0obp9HDWftTjGZ/trDuxAs9gu
	 8pRX7HDagP8QnlOtJPF6NWuRFJBFZBqW2OU1ZbB5LYc+yxK6kVt46f6ZoPqEZDq7sihYw
	 XT04IfSQKX1bSEQj6wkEUlTJZFnMTYVXUg2eL3eFs/AeEBntoRDcrDxnngjf9AZ1KmCIi
	 Due+B9fo5XM8vdSghxV249CrMTVNCUy3HOsdOB5XKUYcmTouhY0U3Q5UD21YuBKY/vA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEJu6Vgq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9091606A329
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 23:16:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9091606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XEJu6Vgq
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so42111855e9.2
        for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 15:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794870993; cv=none;
        d=google.com; s=arc-20260327;
        b=Tdr90JSIVn0lK6fwKQtIAzntodPBQA+XEZiTZGuAOOFl4ItThuK7yOU6P676Lnqa6/
         77r76EqYdtOiBdIslpHmgS/XE960cbL7eEMg0BpkXyFydFDmrYIAK2SznisYx+Mqs28L
         h9KB4XpCmdTxScbs9nbiP4IB+LTdE+HzrQf/+vKbQKcALcV6GUckg6FzHBM+qNbr2E91
         dnDBbH0OLWl9lFAjoKRcHecpgCevFJ+0on6dEP90b6Da3fl27FbxzJn8i5C5WYabTjTy
         Rt16+FI7aWNJxwMcpDdiVR9qFJcVmPMfRg/IEmRFcvTYuEzsKCSLUTiKmGclT4VguMnp
         Ui2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        fh=xeuPX0QyxoB8yT1tt/fItuhod6KMPkspY43GUf36988=;
        b=XAqOWW3MPCXGL/nFYCMlY6AyBzBYOJtvR2g4GiNwGJhslLwzg3Exsy73qBfM6FSH4H
         kRYsJaIgm//jV6HRoiNw0Iy3+dY/CucKj+d5NaMp+R4ERHEwpFCbf/E9S5XyM+ONfbiY
         V4fGSFsV8VqIDtjHFyBdjXHHJyNBKOIUpu7bmXv/czWjbiaqcgR0f8O2WRd+rP9l4nEU
         Pfw8pn65+0UwOS5bIubhdPNMGisI38QZ4t7oY9Yv5AoOV2qpY/+pZGbBCjLTI2LXjUdN
         vXerxgvZqo3iD9MWYRWBUxDLQvOx3KPVT5Kd221vFVZZrASkk7IlkfaMQZMdsywpdrIo
         RupQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794870993; x=1795475793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        b=XEJu6Vgq6a8m6xRDvNfiVqpbRzDn3rAhU/kis0zvNll3T2jFlFuwz84cvXfATuq0UT
         zfsdFxo8ypw/jilaF6CUL9GwsiXi5q+JO+E2HzoRpzHlQWY6jhkkgfh+kxJVK29dZP/v
         iGsGtC0vLmJTpgYos44CNVZlu/Qtl9kpnzt2iKaco0eY/yB1Kvv0hG9c4PX/WG8xEO6z
         63jSboaDqN1Mn32Ya0wbz2T3DlSma32ejWtuRnmI5SIC+y4LP8phhpmmBiSdMcEG4ZZV
         8UoxwrJG4h3vhGqnHtvp8cSUsPnw3XTnFyFCBjq46FS6stqN9+YMlkEwsRqBswMSgYYH
         npqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870993; x=1795475793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xi9A6jTZQc89xroMn+ogssGHpjD3EJxZB5+BMpfqrZc=;
        b=e/6j6xAaXGlfTcZiH6PlXoJG2W0qgZucAy8ahefk2+iALXiaxWc1vcjQHlTccRDWP9
         nZ1tz5c8Yr1jIBqhu3SNSCY+v0PNfk3fTgsnbegFxvfJpYHGzRqvhqxkuyv94NJfj9So
         KPibj1/5pYVe7FebDfEizdDuBTBBSQi6fhiMEoQ9xHqC65Gesr4yZ70mUjgoCI3EKnES
         kJZEmmBE6M8CTyoIgTEXamff2aez78KVs/pj6xypnuwHvv8qw56Q7yQufj32QE65Ys+Y
         wpK+W6Yo+ogCWqWFPm1oo0jY+k0425CS41o2G9WTrOV2+X/ul4LrbCmpdCIB4beIbEkX
         ETOA==
X-Forwarded-Encrypted: i=1; AL+hErHKsCqG9NxLXy3n/gE3Ol26rhjXfflKQX76cePCs1e7mf/qi4q++FcyXL/Z75dLaZNS2rvJN64XZQYbEagymLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Yrch/aeO9O5I1ukW94USNhs4wC/jvMynTRjBn6x4lBHUMw3TI
	+mJPlclWM3RBnBppnrBLc6EqzvVVBuqz831DEaMd7373apQGLQ8uN3kibgCb8Lnf2uotYHvOz2y
	vWZsC+HF8oeZvoXAp0bErlRMHg6w0box1u9szL6w=
X-Gm-Gg: AYBFou1hGt1NRcqiclErEDXSWi7H569GPJqers0eUV6McCJoGQWhtkj+PTh7nqCwzgD
	aCA+0ZJsmEfrCenSc7bWVTp5R4I8S2yMo5HKpcS9EJuFpytoYqJ9DpxuRQQeBoHZ3H+s46xWvfB
	gl/xrWK4PFQvLrUVJ4LklrnXqKEd6Dl/upaRwxkBTfZQFs1CVMNGpym5dAfTq5B6mFfJ/MTa9V4
	XRMggxWBoCaVHtdkrjA2KsOqWttRr1Jjy0CUEQ3w2FtA66obzfSiZ5RpNP+XWyElGI/2CF+mXEi
	is0gGY8rBytNfNAa6kTuz1QNiGnZCDiqMDslsm6+4Yv3YyBAEkA9q++5LAQXdHdedDya0Kc1xwj
	eYwHupmAdynfLwl8kEEqWLE/Wq6VG6c2MSH3FngLEmi8qrQvOBUN6m3DdoOzvtwoOc311RAXa8d
	GYAqv0k7pzZChOugeBpu7Gsg7tk9LKz1g8ywBAPJR3m/GFHrfb1Chp8wrFtclWZRJtZqe7l0Gho
	zObUyLpH8SGZ57IFMmYlBXW9fGVgHY/R63tjD0JkU8r4pMEVysK4Q==
X-Received: by 2002:a05:600c:4e8a:b0:4bb:6f77:1e35 with SMTP id
 5b1f17b1804b1-4bb6f771fe4mr107226275e9.21.1794870993011; Mon, 16 Nov 2026
 15:16:33 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192638.233125-1-mathieu.desnoyers@efficios.com> <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
In-Reply-To: <20261116192638.233125-6-mathieu.desnoyers@efficios.com>
From: John Stultz <jstultz@google.com>
Date: Mon, 16 Nov 2026 15:16:21 -0800
X-Gm-Features: Aa3M54qujtdf8fiCCJsTtiFZah3Fc_8gn2qGgDBUmxtzkkvPhblapjkovtVzCto
Message-ID: <CANDhNCoQteppE0ERWyz2LJ4PBLBKQymmzzbKwrxMwv1sAL4VPw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/8] sched/proxy: Clear blocked_donor when the
 donor stops donating
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
> find_proxy_task() sets owner->blocked_donor to the task that donates to
> the owner. __mutex_unlock_slowpath() reads current->blocked_donor to
> hand the mutex to that task. The comment of the field says that it is
> set in schedule() and only stable under preempt_disable(). So the
> pointer is valid until the owner schedules again.
>
> But the donor can stop donating while the owner keeps running. It is
> woken, or a change of its scheduling class or of its affinity takes it
> off the runqueue. The owner keeps its blocked_donor until it schedules.
> Meanwhile the donor can run on another CPU and exit.
>
> This would be a use after free: __mutex_unlock_slowpath() would take
> the blocked_lock of a freed task. It was found by reading the code,
> and has not been reproduced. The owner must stay in the kernel without
> scheduling for as long as the donor needs to exit and be freed.
>
> Fix this by clearing rq->curr->blocked_donor when the task it points
> at is woken, or leaves the runqueue in sched_proxy_block_task() or
> move_queued_task(). The clear takes the blocked_lock of the running
> task, which the unlock path holds while it uses the pointer.
>
> Fixes: 1628b25248d0 ("sched: Add blocked_donor link to task for smarter m=
utex handoffs")
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Again, I'll have to spend a bit more time looking at this one. I've
been looking at some task->blocked_donor lifetime concerns recently,
so I agree its definitely an issue.

The blocked_donor is used for mutex handoff, and whole-chain proxy
migration. The first only needs the curr->blocked_donor to be correct
and never traverses further back down the chain, where as the second
is used to migrate the entire current chain. Since the while-chain
proxy migration happens in __schedule()->find_proxy_task() where the
blocked_donor is set, it seems like clearing the blocked_donors as we
enqueue them for migration is a good idea (and cheap since we're
already iterating down the chain), and I've got a patch I'm working on
for this already.

This patch's approach of of checking and clearing curr->blocked_donor,
a task wakeup sounds reasonable, since it would prevent the mutex
handoff from potentially reaching for a task that's exited.  Using
proxy_needs_return() should ensure we catch tasks in the donor chain
on wakeup.  My only worry is that the wakeup and clearing might trip
while a proxy-chain is being migrated (and we don't want unexpected
writes breaking the chain), but I think we're ok because we hold the
rq lock as we walk blocked_donor and create the whole chain migration
list, and we shouldn't need blocked_donor after that. So, I think it
seems ok.

That said, Its not immediately obvious to me why clearing on
move_queued_task() is needed? Mostly because: why would a proxy
blocked task be migrated before wakeup? If a proxy-blocked task were
migrated away, __schedule() would just proxy migrate it back to the
current lock owner's rq.

thanks
-john
