Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3A5357CE0
	for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 14:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900323; cv=pass; b=vAric6rUi7gbf/vukU+kGEHfD6zhSI9q4WWiOqrxPDJCLksIvGBryx/3OLeTSQ7PgZu4jbvhh5gqy3ukXWuql3kHwjvwlQM4u9PU4oujilKUlY2rmt93RXiAEbD1JqbZ4sdQYfTlU70PxAooh4JkVNgYrF+b1wEo6Ouiy15Mgi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900323; c=relaxed/simple;
	bh=efwpqbn4KqWJ83/+b8Z3Sx2CVCm9Kiqp5MA7PhTFAxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kVWrFuLIyCVWWHjI6X2oBB5HiOnwUGLvT6YPdOVDDZATaE6TCa+CVyGcmXVOmnC/3DWtVO4uKDVkxKrXv91nh8wxPkbE/FUx8lloALl8AY3IABTpUbXNX1tj3jqJVU29js9NoD2RgC+210Qd/vLtyD+4g4xnV7gBQtPv9emmFrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OILuzQQN; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OILuzQQN"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92ed3993c1eso191484685a.1
        for <linux-kselftest@vger.kernel.org>; Tue, 13 Oct 2026 07:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900320; cv=none;
        d=google.com; s=arc-20260327;
        b=ca7mAD0OdVIh0vij/HkZwRlDU1DpzR9O3mdZktZDS/MXjNso0C6kJpKMeHhAY2W3ld
         Gvxt638ENYtbKnIRlpfmJFmMhttWAc9CaiaCpC0PUpAJef6HEeAke2c0Twj/tj9sYej4
         4ZV1Q6D3fqESp0i+abL11UqYDCNazeQromkthJGysXOmfkV2mDVqMbX8YamWOD9RzIRy
         DwoazmJI+4yR5aNdd5K+glj4PJKMtT4K1pMW094ja3G+jQrhA3bMmaEg9HiPcTceY5ta
         eAFm/Z0O198RIy6wvgVYpH17iI9cV2GZVKDYeLX5tdVGVrdex7U1gBRMh1M4cf6uyOfG
         gvZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        fh=h0r4GsLZykFU8icr/tfaUXPpF3GirlQAHrhFWWk6/t8=;
        b=RwKLP0KjLLv2DjUnb90rLZvTpjGcHg3T7c6NvJWprn6fMU2YlMFp0xw8hS+PaRi0bz
         DgOVXk5P87vo9yGjw/VKdQo7ExNUpkV1/yU/YefwMmn5q656PJcT+tX29fkPsMoTgI6A
         bmPN5L6xyW9pWqxgB1lfkaxE1wvMDUW/AhnNzGUf26mIM710FXvXRnwhb7IpoShOoS1W
         a1IoCv9gqnyLyrIUSHnFTWpqzKVwqu1bFChlv/20jOPacQWu3D4PFFbSbLnYH3Z1KIgV
         cJ0m7pW0YX+UUu6JoJoCczbcPwPNJp+cAfDrY+pj8N5UShoGMmkLbldEZkO68p7IyNvK
         6AtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791900320; x=1792505120; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=OILuzQQNGHitUqKN6lSOHQRrLS5lHihOw7H22eT0VBoJwPqFgkweGJNKLeMOqKAjf4
         zvfkgJfM+GXapEQwdQkKBKXeJCp5lVdeKdkQnQ8CeODyN6OfoFsrNvgqGBwLJndNn3yv
         lsdEd0lkmZcaMkxR7sHIQeCzd7PdTPDXo5C8Z2oelqXgQbv7VmWVf94YaXpUjQD9N/I9
         VlniGbbz3zrOHWwP2aVA8tc5tsr72LpZ7gfdg2fJlXEhly2gmVTsSLGJGZfwpb5dI321
         pwTxc8xC7xTcvLqstvZghpwoK/b2LINceM4Sla6EoH8sec8hDHYlfhL1h1W8J28OVIG9
         71iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900320; x=1792505120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPXKi2ja3hfSSIKvSqSAyf4VTe85ag1sZhdhO7l5KOM=;
        b=mM7tB4Ai4TENQPA66RBeqgjOk0lxNwrmXWHWWT3nDmMD+uGNAz5bnPuroHxIydH0EI
         8L+2s8BeiixC5dZHASB7Hd0c+fH7ZXrPI6SY09zqgqQSoeGHOOjnzb7nTCptKeEvtymU
         tNI49b6ywU2EhWLSTPpIxTvUcwF7LkX9tAVQYuYLb4NPP3Gn6jxtcRrIvdOUZ64gvSvP
         qp6E4D7gsSM1/NowHla/6dKtMwjp9RRQjAAqg7qe27EQOpEZWU1YOhqOBBsum7fMGFxW
         wf1y7g1itE3aIaF63myL2+fksROs1vIvEXn/lwy/NBGMvCOXVDXX6vj8NF8bbdhNawNG
         ryig==
X-Forwarded-Encrypted: i=1; AKwUvBwk8ODEx0blCnMmDuq4AYU4qIJSZpRIvj6xw4R6LxtwgISUaGqdgg02OSoky962yGLef0xBrB/bjjtcLTkkUbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLXnnhbPHEeFysX5SqI2ydZKCnIEYnLXRuxoJFzaqN6uehCpCo
	gEsh2VrKpxNvpxKQUl60YtRAC/2PWC+2nU8t3WNw/K5LDeyHPMXl5BE6dUfhHFde3DLDFuXyKwg
	OBScIb5l6esorjSHxLLRofZzDD7Dfg+Y=
X-Gm-Gg: AYBFou2Z4QmZsTcC/R5mJscH1oHhLYsq8bpD4Y72eIhsUjsOgcZ1E2r7Pia8Xaaiv6j
	T4UNABSmdiXhpUAyNkhvCPiDwggurgbKY53KU2MPcUuQolxD1vwP5FgpL4H6L1+kquvxkbypnKC
	AQHh2lF2OXiU1J/Q5+YpY8wMBzPRaYJIc//T2los8JAd4is3hzc3YPo1vkToBdK638R733UGhsW
	DSb6afu/VlHKYtsMaOXfulz0OwqR6tJbIFW8Yl8SpA2YBlrof5FR65ijWIDuNs5BhALCZ5nnCP+
	lSZxTXSnNXx4A4d4zDUntpdIkpcDA1pIGCWF87Ml+JubdZD1jFCKcSXT9h+j4zfMaDaIiqW8ESD
	0oD4TeCU95t5ege8G6Z6VC0c=
X-Received: by 2002:a05:620a:3947:b0:93e:78b7:fa4e with SMTP id
 af79cd13be357-93ebd24b2fcmr2220976385a.37.1791900320079; Tue, 13 Oct 2026
 07:05:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005171529.1378809-1-kunwu.chan@gmail.com>
 <20261005171529.1378809-9-kunwu.chan@gmail.com> <as3aMmPdCHCXW6Ci@U-YXDQC754-96.local>
 <as4ooZSWA2lAIceu@tardis.local> <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
In-Reply-To: <ef3fd68d-f35e-4071-9523-0cd14396d860@efficios.com>
From: Lai Jiangshan <jiangshanlai@gmail.com>
Date: Tue, 13 Oct 2026 22:05:08 +0800
X-Gm-Features: AclHuK9Y6wjNtKPnooCMgRZOapMzF0kyKCufRscUU_wsuFWoqVB6jP59bjMM3m0
Message-ID: <CAJhGHyBd5wuLO9H7bHJDO==2=z8MGQ3ehvszLiB1brztpRXu8A@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/15] locking/lockdep: use hazptr to wait for
 dynamic key lookups
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Boqun Feng <boqun@kernel.org>, Kunwu Chan <kunwu.chan@gmail.com>, paulmck@kernel.org, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, lianux.mm@gmail.com, stern@rowland.harvard.edu, 
	parri.andrea@gmail.com, will@kernel.org, peterz@infradead.org, 
	npiggin@gmail.com, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:04=E2=80=AFPM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2026-10-13 08:48, Boqun Feng wrote:
> > On Tue, Oct 13, 2026 at 03:40:36PM +0800, Lai Jiangshan wrote:
> [...]
> >>
> >> This breaks the forward-progress argument used by the underlying
> >> hazptr implementation: after removing an object from publication,
> >> there should not be a continuing stream of new readers acquiring
> >> that same object. Here, the bucket is never unpublished.
> >>
> >> For example, let B be the bucket containing key K:
> >>
> >>    Updater                    Reader                 Scan kthread
> >>    -------                    ------                 ------------
> >>    Unlink K from B
> >>    hazptr_synchronize(B)
> >>                               Acquire B
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               Acquire B again
> >>                                                      Observe B;
> >>                                                      retain waiter
> >>                               Release B
> >>                               ...                    ...
> >>
> >
> > This is more of an implementation issue,
> I agree with Boqun about the point that this is really an implementation
> issue.
>
> If we care about forward progress in the scenario of a repeated
> address reuse, we just need to wire up a "0/1" low bit phase tag and
> make hazptr acquire pick it up and set it within its hazptr slot. This
> will ensure forward progress in that scenario. hazptr synchronzie
> would therefore flip this phase between 0 and 1, and check that the
> pointer it's looking for is not set in the other phase, in alternance,
> handling both phases within one synchronize. Indeed, this phase concept
> comes from the realm of RCU implementations.

Regardless of which implementation approach is adopted, this would effectiv=
ely
introduce a new read-side synchronization mechanism based on hazard pointer=
s.
I would prefer to see it introduced under a distinct name in the
kernel, so that its
semantics and intended usage can be clearly distinguished from those of
conventional hazard pointers.

Thanks,
Lai

>
> I think that the overall mindset so far has been "RCU does this" and
> "Hazard pointers do this" as if those were entirely predefined
> mechanisms. I think the way forward is not "one or the other", but
> rather to combine the strengths of each of those mechanisms into
> something better.
>
> Thanks,
>
> Mathieu
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
