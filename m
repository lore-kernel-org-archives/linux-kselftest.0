Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FD495538
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781025295; cv=pass; b=MLvpYRLGuL4qNqfSONwJXlThiQyopmMd+DRTWbxQYwAr3/C2d7aXi5SeMGzuoRdyBZFFbChtYNFkijtP6sHlyrWAJOSOQLL0jsdSJUQdRWGZ9RGyTVsDj0LHd/BzN9IjVxAZRgr/lc1E/+MAv3sVpyY6j2P13CDJgvMq8kYWr4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781025295; c=relaxed/simple;
	bh=uEmI5xWjbsRJZ1CrxCtcNunqVcmNADT/o8HWSzvO/Zo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wk03LXqFLrnlxjZkkv9r8M8GuzLirupKaKoBS+KA7fAgqypksKCsNSQSO2mF6PkmOHpkRGulQZY9g4GvPKmyh96nRTuwP/hppCGTnpfqJvI6su1QqXpMeeUJPu8P6v5N8XUhkqgLl30KvtfhZSsw2JCawGDj1/pnotef6axniQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b0rMbT1E; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b0rMbT1E"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-137335bc3caso7160216c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 10:14:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781025293; cv=none;
        d=google.com; s=arc-20240605;
        b=DI1OczwKGGrtF0U9+95If/X2dswAe5T/uKypxsQ7Gj/8sUkjPW+AuLVbwLehEIIoOR
         PBtffAtQ73LOoW4mEQ9KBbLzcsA8fbCBY4UgfDiq5YCgjt4S8Bia5fUS04qItK6/DZyH
         F+jbZSPqsKjE0rHUx7lfCKQJ7uWf+z+4vjfcM4SwZC2uZF3avwXBYam+bT49aOYOBuTV
         hEprKHTpeXH7bE8iJCHs258aK946xGl7rCFOK1NvQXNjjpMmZgXHlVO2rd9kcIM/ukYs
         rosj8VnGXlT9xwd69MDq+WfKtB2HgysPOcWHWZzujhgLm2H4uxP9mkU30HQnBShfzIQs
         qfDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uEmI5xWjbsRJZ1CrxCtcNunqVcmNADT/o8HWSzvO/Zo=;
        fh=UlBZi/SpE28bXOmn44hyQeJjRJp66/vrRA5Ajs1esj8=;
        b=aY4C2Y4qFvHcPZADmQ9yQBy8Tp1zf0xujIGfaxWqPS64VbNIHRVwp2cSuaPCJzKPPZ
         LHwdrocMCG7ye4BFr5an4MuK//76Ih4rYqvcuBYKJw/zf0dHHj2gWoKL5usx+2qAUE3s
         VtvtVfT+iJVx/aDpW0nsNG66KzcWyKbPgY7OYOvVpbPa/QsJ/7KcRW5hc8ngTubjdgeW
         v3TxJCH8mrrSjyEnijowIVemdG8pqUZFpYY1Yt68QpOkJae2f5m+/Hpdq7+gAsiBOKl7
         yQHO4/YM8jH3n+4+ne3iXCc2pdgfML/enD3f265LEU6VJ+jKynJRHNfRKp4Gfn6FXHlm
         uKeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781025293; x=1781630093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEmI5xWjbsRJZ1CrxCtcNunqVcmNADT/o8HWSzvO/Zo=;
        b=b0rMbT1EYBkozeO7X4b6HKQQyaiZA6zDG9qsJym95lRSvE55qHWJrNvAccj/CtItRe
         NW5ThQElREuHxHtVPEvWDu7o+Mut2fCIduepMhZ64CReUnRxEXoudU+pbzgflpiVvE73
         X0NcHq8fA5mvA7EK9CkKajfhCQsWcEeLDXQRoKRa4rNcwd1/lrclITJFjUS30JiksLPQ
         lbx5VFX01U58iDqpppIKGtKfx8t9w31CaOBsJPP/CnKYhSeHwa9r3Cw7Sh3POhYrT1wh
         s9AAMLyM8tqT4RSuHqMulYfqqKKR+Hi10pVsAowrRJpFTZzC1TZbnyT3Xq+RfQU5cBo7
         mFTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781025293; x=1781630093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEmI5xWjbsRJZ1CrxCtcNunqVcmNADT/o8HWSzvO/Zo=;
        b=pcFv7Tkj8EwwAs8biAEsOCNnUaMuts2zR0aaytvpxnQ/sXCQg6QfamCVPW81i5sQOD
         9oG41PVt+yhANqXlr33YFuaQIq8bkhHtwFM3vTBTYjnLtP44kvQlh4Yo9XkmPw/EWBxz
         kUwSedKNC7IhxyHkpk87n6JSLAN2pReEemw0MmkWZGwSiiQnMgPQUnrUJiaFsjxAr67n
         E7/txuPQQUQveJMblW5OMsjAnzZvKrQB4NEUu77U0v6GLLTlqt8VIDus0FZ3CVBT+cHA
         8VmcifKOpyR/vOXOTHYA+MWGxKqiPa3L1ju69tSp6/KNNlrQ5osSj6iFMbgUQ43cghow
         ZIrw==
X-Forwarded-Encrypted: i=1; AFNElJ+kJD6R2hRK9DtYc/42EL9dLXOW9ArwhZTVrJ7knWV34tScXMTH0bxti/IrJyCwzQja6JECTw3jfs+i59Y0RpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPDAhttiru1yW7shT7Mh7AnsVysZMmEbMiD8bmy7hVUIR0urR
	GSGCIBbfvjhGC9H8y6Mts0TcCz8HCpN+5yIk5IW78CJHASR7f6NvkH546OLnrgQykIP/ExrwMn6
	9azai40+a6yc6YuAOTW6fa5k20mK/YRptrGyS42t1
X-Gm-Gg: Acq92OHkXinuDb2gtYjMzxie3VDzs6prjnkRWdm3hd+RJIAbxMGFEGE9OUFDW4IsvB+
	dffIogyRmD7ZQZKS7VOgrZYPQ+RRzMML15pVebFqpLYE2lrEP5jiR0Db/rKFHfGnML5PuxIAivL
	5wCQ96KK0e8Zii5Jn+I3T8QA1S9f7S9g9rZTQLv+7qhEY0UZ0Wjb2Uu6VXGydH3wSCTfL2CZMyr
	aYKiVTGUZqV4pwcRF5UOOdF0He0FHOvOeCOX2PJfHID8ERji6+BBqeDgDNA3m2IeifkH6LSQ9Iz
	nCK6egJgEdns7Dn+X/NbcDr6hY4yvYWgaEJb+euYPjxLeFjJfkhKnEGfRJLWxS+7T4Sad/ZBIAb
	jAqHWX4Ziz4emr0zL+INm9I/ymfkSI8fWYUDwF4R9HIBBZfjpShlcAYZkA7Sm
X-Received: by 2002:a05:7022:510:b0:136:83f5:c80 with SMTP id
 a92af1059eb24-138066608abmr10538613c88.4.1781025292274; Tue, 09 Jun 2026
 10:14:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608125846.157004-1-jiayuan.chen@linux.dev>
 <20260608125846.157004-2-jiayuan.chen@linux.dev> <CAAVpQUDZoEVEX1kXok-29dzVHk=ZK_2MkZyZY8kRHCJCfAWVFg@mail.gmail.com>
 <DJ3XPJA746S5.NYKZWY1HBH8O@gmail.com> <CAAVpQUATP7S7OEZw4P_7fp5zmQO-T5jByxAfp0+YsjRENeWscg@mail.gmail.com>
 <CAADnVQKa2Z2HKKZMhyD1HrurQ4LTcCS0Mm0YPxtisGKwVfcxmg@mail.gmail.com>
 <CAAVpQUCJH3iknHSfNwMqvHVc_V09zNDK-YbXbqa-=K159PTqiw@mail.gmail.com>
 <DJ40JYME18U1.3RA3TUXB3MH3M@gmail.com> <CAAVpQUC1Ot9vr09gNoe+vxgLoqU8Wwn2DV+CQZYYpAJUATJiWg@mail.gmail.com>
 <f0468cb2-1b52-4216-9592-ceb204f6ea41@linux.dev>
In-Reply-To: <f0468cb2-1b52-4216-9592-ceb204f6ea41@linux.dev>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 9 Jun 2026 10:14:39 -0700
X-Gm-Features: AVVi8CfkVjeAeUk17kjk2s6wRYeo3MTRMX2aePnQQmjsoDb5ybrS3XbXLwOcaFw
Message-ID: <CAAVpQUC=AJvJS1yppw+aAVpmRhB6GganrUKMsKSo7WUKNkZHfA@mail.gmail.com>
Subject: Re: [PATCH bpf v8 1/2] net: Validate protocol in skb_steal_sock() for
 BPF-assigned sockets
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
	bpf <bpf@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Joe Stringer <joe@wand.net.nz>, 
	Network Development <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 6:55=E2=80=AFAM Jiayuan Chen <jiayuan.chen@linux.dev=
> wrote:
>
>
> On 6/9/26 6:34 AM, Kuniyuki Iwashima wrote:
> > On Mon, Jun 8, 2026 at 3:16=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >> On Mon Jun 8, 2026 at 2:35 PM PDT, Kuniyuki Iwashima wrote:
> >>>> btw is earlier sashiko TOCTOU concern real?
> >>> Yes, the selftest in patch 2 should reproduce null-ptr-deref.
> >>> (I tested one in a prior version)
> >>>
> >>>
> >>>> iph->protocol =3D IPPROTO_TCP;
> >>>> bpf_sk_assign_tcp_reqsk(udp_skb, tcp_sk);
> >>>> iph->protocol =3D IPPROTO_UDP;
> >>>>
> >>>> as far as I can tell past bpf_sk_assign_tcp_reqsk()
> >>>> the networking stack only looks at skb->protocol,
> >>>> so modifying iph->protocol will only mess up
> >>>> things on the wire (if this packet goes out).
> >>> ip_rcv_finish_core() uses iph->protocol for early demux
> >>> and ip_local_deliver_finish() also uses it for demux.
> >> ok. Another idea... we can keep the checks on bpf side and
> >> teach the verifier to invalidate packet pointers at bpf_sk_assign_tcp_=
reqsk()
> >> and introduce new concept of "readonly skb".
> >> So after invalidation the reloaded sbk->data will be read only.
> > Yes, this is exactly what I had in mind in the other thread :)
> >
> > ---8<---
> > On top of L4 validation in bpf_sk_assign() and bpf_sk_assign_tcp_reqsk(=
),
> > can't we mark such an skb immutable after the helpers and catch
> > subsequent writes to skb->data on the verifier ?
> > ---8<---
> >
> >
> >> There is no such thing today. The verifier only understands PTR_TO_PAC=
KET
> >> as read/write. So it's not easy, but probably good thing to have
> >> for this and other cases where bpf prog shouldn't touch the packet
> >> once it called some kfunc/helper.
> > This would be useful and we could (re)move some validations from
> > the fast path.
>
>
> Hi Kuniyuki and Alexei,
>
>
> Thanks both for the discussion, it makes sense to me.
>
> I'll go back to fixing this in the helper itself, like the previous
> version did.

I think even the previous version is the same type of change
for intentional misuse.

Both bpf_sk_assign() and bpf_sk_assign_tcp_reqsk() assumes
sk_lookup() in advance, meaning the bpf must have dissected
skb, and bpf_sk_assign() relies on it and has no protocol check.


>
>
> Then, as a longer-term and more general solution, I'll try look into
> marking the
> skb as immutable after these helpers so the verifier can reject any
> later writes
> to the packet.
>
