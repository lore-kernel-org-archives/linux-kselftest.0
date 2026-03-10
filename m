Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DE33E9F7E
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 20:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773174550; cv=pass; b=szUsG+TgIx8oopdRZTMOSNBKONnQAYLIgwm2OhbZKjdBmxR8DmMuKhIy0QwUsMw9jYXIpvaOfQoZotECLZHzbAcoUlcCPbGvBKDGEGwLjsDo5QtnE21keQ6WOvMRmrDjb0RFNitmnVE9PSiK6cc5f1xtIMaVQDs/MDg9vqHJIks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773174550; c=relaxed/simple;
	bh=N6x0jYhn3luRrw5ThVaSTZxn+bTc9HcceunU96D4iLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlOmzdkLL8AC/atlLR64R9gXzj5iwD6lxito7WfucvgZJwHirKFa3DubOeh4jxde0dTWBpnOHJWWiQBgWkvnC5GFrjnchTox5ksHgzXtcMCaj+kpyObZjFHBPOCszU2dMSMlE3E5xSE5NPFJDxZp2fOTx7EzluqpUKBubX5QpoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFOiD/GQ; arc=pass smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFOiD/GQ"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso40128705e9.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 13:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773174546; cv=none;
        d=google.com; s=arc-20240605;
        b=H0ErdxyGCJNIH9lN9rp89zR616ErkVtWwrXNCxuIJZcz1wlqcNJcPoZWjs7pQCjQS7
         REjiOG+3ubZHgLYQYRfzPWlj+WhUwaXO2eJDPyfFyd2/iHpKqCfzm9AmpQot0Sm2mL8x
         DrGd3tlss1HTU0x6Q+5Y2Tlt0OzgA08YkPg0DTSmVCko0Ze42mIQLu7yutcLKzYUNICN
         uJh58P/X8M6vy9Et4r5EQQqrBkAHya8Wf/FmcZEFGBntHXuN5CCTraLQkbucaZN4RB4o
         Kt6JOzC9sh4snnnxr9kBgxTWyD8ZRsrSYPf3PdEQ4HK7hZeTy/MJV1UANXM7NYl1KZ4j
         teqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O0FEVAXmpV5gsVK5WkVg8WlCpwDU6JgtAPL7ZqJq3cc=;
        fh=YCPRhB4C5B9Krz0jxFz/coJ0YWbteuy08zQJyhpYigk=;
        b=Ar7OJWwFj0tb8OHHCRoiMBYUBwMu1zRr3E0WOQ6kZnt6mSYSC9/KFEvOCYd9S+2Vla
         KMomDeNuhDp5FNin4YQqxr1/H50LMpwArRF/DHEkMxKc4v1/EsrZf+/Fl/72i81YZotJ
         RyeHAZNULME2BAp8HZSuWCuBp5H1rhNz2aTQ1urni4HeoiK0Lcr3vR+PAGC656dCu6E8
         FBJqyUwB1kKoEO1kPBWvP/i4qkEmjN/BNTCC4akyR942ZICcCXpb5Orx4SCY1DR/A/nQ
         WwIC69HLmjstgHHyOvhtLemOd2Y/Ao7aGswyW0r0mFUlztpzaDFQKTbYSqYSaV71lGaM
         Donw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773174546; x=1773779346; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O0FEVAXmpV5gsVK5WkVg8WlCpwDU6JgtAPL7ZqJq3cc=;
        b=ZFOiD/GQkev+b8nRVdKNNGIN76DA4Nl3EnEPuX8wcQPZM3vWjK2NxqCWbIE/jyWRR2
         rPXt2NqlIU7dulDNHjF7FJ6gByLCJ8HFpGNZHMPvh6T1+hZLFW017AWCNW0mbZ9w42eo
         MXgD+vfXO5nendK4cVqzvIuswGORVzb+MBjZCe3bAkE/eIYDypkLTZTl0n8uXVKULJxo
         vJBYG9LX5C0fSa6ATyIeQFV030u+gn+NLbYu09AktCWUK+ilMIUu5BH/q1j9bMcCZ6FV
         DIiZZw0sPm8iPgMFRxHAtmSE4FUKVffa5I4rUpbL8RG9OPNKXpFVCT4bTLW9nQQvaV6K
         im2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773174546; x=1773779346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0FEVAXmpV5gsVK5WkVg8WlCpwDU6JgtAPL7ZqJq3cc=;
        b=qOAzVEpq2DFpwq24fkh1YEEgYMfXTVk1lhYVkMjL0qhxe9Mf0NacK4NEB66BXv71Pc
         LqO0HbMMz9ADvkA1s9v7QsVH6y41ItZ7SJ6RLxrxjRr/2vD2OgRlZThaG5eA/Zxw50hA
         R4hzAi0pjmwTOp5EDzvT5rvSLIQa1AFOW/PBYk1vGQLZTNCdekYQpTqNjZqNn/7Fx2y1
         FuYk7wHdDRhcMRvm3CWEEE3Xlf6wRNKayE+GdB94dCKFf2P5ayvKTmDLaKhsfjVqRo4B
         vN+syl9drYMofMFUDasCInD/QT8LGDauNv5Zhg/8E+gTN8mI96FkIEvpATMJSEN7PE9U
         +uUg==
X-Forwarded-Encrypted: i=1; AJvYcCX/OxLMDlQSqOMUZdmvmDHxjU7pWoQDu3sDTrsL3fZ4H5Ki1gI5cjLVRm3SqrGaizbwIcOx1phyzeapJ6L1aMM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu69jkQ4y9B70cPWyBucOxc8xAq+4xjY2WOx0yMA3Fv0GTSb7x
	Ovuv4tuaUzhHpuSMpPGxMxLI1aqWuwy3cMSlxDUWHqXp+Ntvr3OEAHXwElZSD89ZE6tw0uEPwaG
	tMf5JInkf3FRXqxw4o89IAa9RZ9QIcBc=
X-Gm-Gg: ATEYQzxOOgrUN206A/MIiHY5A2AtYKCOmQDm5PPoS26ybFyevGpJJIX6Gnbeyw24GlN
	9yVE/SHotjxr/ptZaERR/Sm34BtTwrDNQQoK9UGTTqIz/5D7NWJAUdpj6v1eaChDDzSMZbV3h8Z
	5UHqNDAL7aDf1IssISAa1eMalOfPa+vz/O3lRaQZhZqwXa1tnm17XHzGZj36CY9v9sBlp24S3vs
	k7siZxURw1lQhELNpKffC00hsZ028LKI/qvJ4s+hRV+6kQvvKFu24wUgM7kmqDkiugUpWLGUdbS
	5NsO9+tYXwp86MLtDCVat7hYFAgknNaS1hBE5BPe+Rqs5rE+lBxcrPwdMSyHDWKFA52+hU8=
X-Received: by 2002:a05:600c:3b16:b0:485:46fd:100a with SMTP id
 5b1f17b1804b1-4854b10c9a3mr1771725e9.25.1773174546023; Tue, 10 Mar 2026
 13:29:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308134614.29711-1-pilgrimtao@gmail.com> <20260308134614.29711-2-pilgrimtao@gmail.com>
 <8f97dbb5-de94-4ac0-8b3c-e0ce890fffc3@linux.dev> <CAP01T76Nxy28ZAMi86Ez-WcCpiHKe2EBz4Y2j1XJjrRs=Qp-CA@mail.gmail.com>
In-Reply-To: <CAP01T76Nxy28ZAMi86Ez-WcCpiHKe2EBz4Y2j1XJjrRs=Qp-CA@mail.gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Mar 2026 21:28:29 +0100
X-Gm-Features: AaiRm520pPHQ4sBmL9oMqqosQfKRBxakZ30bobybTaG_1MU9wtOa6J7zkghjsYc
Message-ID: <CAP01T75XhkDAKSAGwE93H=s_h7UDNtee9neNWKirCDHU8yeV_Q@mail.gmail.com>
Subject: Re: [PATCH bpf-next v7 1/5] bpf: Introduce the bpf_list_del kfunc.
To: Leon Hwang <leon.hwang@linux.dev>
Cc: Chengkaitao <pilgrimtao@gmail.com>, martin.lau@linux.dev, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, shuah@kernel.org, 
	chengkaitao@kylinos.cn, linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Mar 2026 at 21:10, Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
>
> On Mon, 9 Mar 2026 at 07:34, Leon Hwang <leon.hwang@linux.dev> wrote:
> >
> > On 8/3/26 21:46, Chengkaitao wrote:
> > > From: Kaitao Cheng <chengkaitao@kylinos.cn>
> > >
> > > If a user holds ownership of a node in the middle of a list, they
> > > can directly remove it from the list without strictly adhering to
> > > deletion rules from the head or tail.
> > >
> > > We have added an additional parameter bpf_list_head *head to
> > > bpf_list_del, as the verifier requires the head parameter to
> > > check whether the lock is being held.
> > >
> > > This is typically paired with bpf_refcount. After calling
> > > bpf_list_del, it is generally necessary to drop the reference to
> > > the list node twice to prevent reference count leaks.
> > >
> > > Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> > > ---
> > >  kernel/bpf/helpers.c  | 30 +++++++++++++++++++++++-------
> > >  kernel/bpf/verifier.c |  6 +++++-
> > >  2 files changed, 28 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > index 6eb6c82ed2ee..01b74c4ac00d 100644
> > > --- a/kernel/bpf/helpers.c
> > > +++ b/kernel/bpf/helpers.c
> > > @@ -2426,20 +2426,23 @@ __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
> > >       return __bpf_list_add(n, head, true, meta ? meta->record : NULL, off);
> > >  }
> > >
> > > -static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head, bool tail)
> > > +static struct bpf_list_node *__bpf_list_del(struct bpf_list_head *head,
> > > +                                         struct list_head *n)
> > >  {
> > > -     struct list_head *n, *h = (void *)head;
> > > +     struct list_head *h = (void *)head;
> > >       struct bpf_list_node_kern *node;
> > >
> > >       /* If list_head was 0-initialized by map, bpf_obj_init_field wasn't
> > >        * called on its fields, so init here
> > >        */
> > > -     if (unlikely(!h->next))
> > > +     if (unlikely(!h->next)) {
> > >               INIT_LIST_HEAD(h);
> > > -     if (list_empty(h))
> > > +             return NULL;
> > > +     }
> > > +
> > > +     if (n == h)
> > >               return NULL;
>
> Couldn't you keep the list_empty(h) check after INIT_LIST_HEAD(h) as before?
> And we don't need n == h either. You could add a comment that n will
> never match h.
> The verifier should ensure it, since it distinguishes the head and node types.
>
> Let's say the head is uninit. Then list_empty(h) will catch that case.
> Otherwise n might be NULL.
>
> After list_empty(h) says false, we definitely have non-null n.
> We just need to check list membership using the owner check, and then
> we're good.
> It will be a less noisy diff.
>
> > >
> > > -     n = tail ? h->prev : h->next;
> > >       node = container_of(n, struct bpf_list_node_kern, list_head);
> > >       if (WARN_ON_ONCE(READ_ONCE(node->owner) != head))
> > >               return NULL;
> >
> > This refactoring is worth, because the "struct list_head *n" seems
> > better than "bool tail".
> >
> > But, such refactoring should be a preparatory patch. Importantly,
> > refactoring should not introduce functional changes.
> >
>
> I think it's fine. Let's address this and avoid too many respins now.
> It isn't a lot of code anyway. You could mention in the commit log
> that you chose to refactor __bpf_list_del though.
>

Just to make it clearer, since I feel the language above might be a
bit confusing:
Let's not add more churn and just fix the issues in the existing set,
and try to move towards landing this.
We are quite close, and it's been 7 iterations already.

The bit about the non-owning refs pointed out by the AI bot, you can
do it as a follow up on top after this is accepted.

> [...]
