Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D118D19E819
	for <linux-kselftest@vger.kernel.org>; Tue,  7 Apr 2026 01:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775525697; cv=pass; b=AOIAh1Q0/Du++0VQgsNKHDwRzHTcCRhlyaEL6qj42HkeqUW+8LZbNiqvvz/oS/N6Dfso7tpId2KkRSg8TCm556Vp+sS+Pj7kZFLKN3YPWWqhWYdFSdTGUOB0XFrSzeXz41kq4xRSGwFeprBnKGc17XBq5+s0NflRJfySMiP1x28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775525697; c=relaxed/simple;
	bh=CdjNKl6RvdEAH7DQmoeHpr7AGXr1Jb08XVC3ztHNxVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AXqPhjzLqXYYwRw7mtjV0tlSDkELmctgxbvYDxDuSs2aFoRg16GKYmz8jylS9vMxE3A8zIcqVNeIqJIo5pjMqZWQDuCtWvjPnYk8ykU77+w9eyy0J2LmF970AiBtf5e0Bh9IBV2YISjsXQ3hx3/x4Vi/6M81KDWr33a6yMHe0gY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dcWLxV+c; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dcWLxV+c"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-7a469383e0bso28924367b3.2
        for <linux-kselftest@vger.kernel.org>; Mon, 06 Apr 2026 18:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775525694; cv=none;
        d=google.com; s=arc-20240605;
        b=OeXSkaX53hh8TtKG4QkItW+suYvCJ+F5+H2ERU/IHYvo2ee4+8wJlNfBatXa7Eh67u
         XJ3NJIdtJqQH3ET5DdmVXoC6YmH8X/V8ZE+2vt+TiO0nSTzn6B8jCs+QNwhJLaFl+PQv
         hew8kckSlAnl3hF2hqmhas0id/L2IFOleyZL0+4NUnYoP09saoLS7uwKF0+wG3ST1oFB
         onjN+3jOi50q2dl2fSF14Qtbrqkf9VsBkMgJHtk1lHtGMxIVGjkljfE3I3Bz8UmpLKF6
         Lx55/kKeGF7DQ7nVUoWFnf1qgAzN6gs2er5h6sZauxz+x3RtPsL9zJIRGQqkrKc9LVtm
         fgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gOQ/7d8DzPMY6Lf5FjM6QVlbxIIMJf+rrNRaxjRBQZo=;
        fh=9Cr4AHm0Rby21u/NzJpnBdVewK44AjtmkjE6+TPyrxs=;
        b=AsePbv/6+acpB/bzJmb+6KhACm3AYeuN2L0Iq+SrSiPx/z5f3ef8xPzPTqPKbW8Nmp
         sQfH7FOmdajoqRWwFjdveqbGv+GW1f8XQ6fVzOEP+nos0zbbQb3ynDnzZ3QHHXVIFMg9
         NQDUSXBqCMxHgmi55jFHA+Dd7VuOy+49nQM3+4OAEto1xYzMtcBHw8PW9qZAUQYJgEFe
         fuJJB3EsV1inUU/euUZNfVZv8MPQ7QxNM1bciHK9yqyokWvtbhekClLDSP8iNX5UghI+
         1xv8dblGt8efp6KASFIl8mT0OWrBA8HhddhCjGnASx5B/tIm/MDDebgSfcDHycScMZ7q
         QwJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775525694; x=1776130494; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOQ/7d8DzPMY6Lf5FjM6QVlbxIIMJf+rrNRaxjRBQZo=;
        b=dcWLxV+c7sNj1Mt26ZSPDjOh4nvp5U4/4gsLwSnif7FwaixOHnG20msivSBboeTKwI
         sxPtLOwtpFiPHWaAr/MUYqm3pf5MvCNvb2nuTGi7V3uGs7k/BvePNR1MCJOuhP/JD9J2
         W0qqn6ZyKdu25WLmmEF+tL5qrYnNf0fpgeMK9hnqo/RaJMiPzjCeh6fNxfNaDtU6Wr7/
         aw+oV6RBXPeHe3OL9uXev9n448WFQMjyRTTgd9c7JBCHLMLxbJVsvnCf4RH2PXYWsiDv
         8mug6B89myCUQoZJHWXQDGaQUhdll8eRNSWZkZf2oF8eDbT8FppW7JcqNF50Vv1mCzes
         HKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775525694; x=1776130494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOQ/7d8DzPMY6Lf5FjM6QVlbxIIMJf+rrNRaxjRBQZo=;
        b=QjfHbxfh+EEb+1MIShhJsl6Cx66eMmRBENzhznvH+rP28Cb0o90RKinZNbGQJN8QJD
         C8vyTvZ5RT3o2V7mGsp22e9PAJl5Jsb73/8kR8MeqObAvFFbbcSVtqKENYP3ZEQkBo5a
         h7euFzjxVzdihkPVS4cg+igJ2Npof8TQihXlyD7BfS+VXaH1QTsnnx3pZOv7BcAatoFx
         yF2m/SCEX0L60vChMvcOTKQRO3zYhzA3GliTZ+5+72YzgJs/xlI4F1sqesjCBMsSAGC6
         OjFjBXekSWt0Imr/kYXppHaWIV4J0b56qKoksLFAEg1V3XpWQsytGS/QJImsnNuLuwlE
         UL4A==
X-Forwarded-Encrypted: i=1; AJvYcCV6tt82lL0xh9LgyorYpGG59r5deZnTPrnLCL3CWDOUg1AG/tf6Ipyxwdqu1TcylOLGGJ9cVPJYA2D1rl/PhZs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuqWRnmXnjwYPaCW2Dm6YGXSI+IWjfTiufj1fiNRz1AtQ9O17J
	4P0tudMnfBXvZ9qAKBftqZsG47POZbgpjlRIVhWBAWWnbQB6SFtqRBvbC1XoD9WafrND3+lPgcM
	UUFaHXXGHSU29OKgWAlNaKGkZMQLUp8k=
X-Gm-Gg: AeBDieuAOBW9WUNHYAy0k7AQhITgWpPtCd1vRR3mTNhHaVJsFnMC29cwFJZhWb6y7Eu
	bZwjgt0TgIWDD163VyD87rhNSfJ0aI4NB8MVnGb+6Wcjqz3nkAiGpMt8Ml0dV9yORr2ZDsin0F+
	gjLeus2Rmimxe1C86Ry8b2nWkwSvAoQS0vTV8anxFclKWAZ9Kk3t/eKSPTdsKE2K82Fc+8zCXN7
	rZtJrtHJ3KFmrCLfSG/jvuiDWVnQjvHuAMl6Hq7HrS7TFylbnAI85Xca26KBE6eQFNyGLBeRPxf
	mSgi9BjPvIStPeJ1pUDfMHC/QOoQM2WEwjJpqY5LwcRyf/9Pf9Y=
X-Received: by 2002:a05:690c:4806:b0:79a:7ff5:93c4 with SMTP id
 00721157ae682-7a4d6b311bbmr150352887b3.18.1775525693949; Mon, 06 Apr 2026
 18:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260402160147.215499-1-sun.jian.kdev@gmail.com> <202646183934.lJx5.martin.lau@linux.dev>
In-Reply-To: <202646183934.lJx5.martin.lau@linux.dev>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Tue, 7 Apr 2026 09:34:44 +0800
X-Gm-Features: AQROBzDEHcZwUn6RnkKIGl5W4d3QSCPFqo_CJP6vIqbrvoH3IIXffE6vzY6oLWQ
Message-ID: <CABFUUZF_CWQZrRk=L9cNxO=8Z4iSgGfXi3J=hpzeyTKDbfE2-w@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3] bpf: reject short IPv4/IPv6 inputs in bpf_prog_test_run_skb
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, shuah@kernel.org, 
	syzbot+619b9ef527f510a57cfc@syzkaller.appspotmail.com, bpf@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 2:58=E2=80=AFAM Martin KaFai Lau <martin.lau@linux.d=
ev> wrote:
>
> On Fri, Apr 03, 2026 at 12:01:47AM +0800, Sun Jian wrote:
> > diff --git a/net/bpf/test_run.c b/net/bpf/test_run.c
> > index 178c4738e63b..300e2bfc5a62 100644
> > --- a/net/bpf/test_run.c
> > +++ b/net/bpf/test_run.c
> > @@ -1120,19 +1120,23 @@ int bpf_prog_test_run_skb(struct bpf_prog *prog=
, const union bpf_attr *kattr,
> >
> >       switch (skb->protocol) {
> >       case htons(ETH_P_IP):
> > -             sk->sk_family =3D AF_INET;
> > -             if (sizeof(struct iphdr) <=3D skb_headlen(skb)) {
> > -                     sk->sk_rcv_saddr =3D ip_hdr(skb)->saddr;
> > -                     sk->sk_daddr =3D ip_hdr(skb)->daddr;
> > +             if (skb_headlen(skb) < sizeof(struct iphdr)) {
> > +                     ret =3D -EINVAL;
> > +                     goto out;
> >               }
> > +             sk->sk_family =3D AF_INET;
> > +             sk->sk_rcv_saddr =3D ip_hdr(skb)->saddr;
> > +             sk->sk_daddr =3D ip_hdr(skb)->daddr;
> >               break;
> >  #if IS_ENABLED(CONFIG_IPV6)
> >       case htons(ETH_P_IPV6):
> > -             sk->sk_family =3D AF_INET6;
> > -             if (sizeof(struct ipv6hdr) <=3D skb_headlen(skb)) {
> > -                     sk->sk_v6_rcv_saddr =3D ipv6_hdr(skb)->saddr;
> > -                     sk->sk_v6_daddr =3D ipv6_hdr(skb)->daddr;
> > +             if (skb_headlen(skb) < sizeof(struct ipv6hdr)) {
> > +                     ret =3D -EINVAL;
> > +                     goto out;
> >               }
> > +             sk->sk_family =3D AF_INET6;
> > +             sk->sk_v6_rcv_saddr =3D ipv6_hdr(skb)->saddr;
> > +             sk->sk_v6_daddr =3D ipv6_hdr(skb)->daddr;
> >               break;
> >  #endif
> >       default:
> > diff --git a/tools/testing/selftests/bpf/prog_tests/empty_skb.c b/tools=
/testing/selftests/bpf/prog_tests/empty_skb.c
> > index 438583e1f2d1..d53567e9cd77 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/empty_skb.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/empty_skb.c
> > @@ -12,6 +12,8 @@ void test_empty_skb(void)
> >       struct bpf_program *prog;
> >       char eth_hlen_pp[15];
> >       char eth_hlen[14];
> > +     char ipv4_eth_hlen[14];
> > +     char ipv6_eth_hlen[14];
>
> The eth_hlen_pp and eth_hlen needs to memset zero now.
>
> Instead of adding two more ethhdrs, just reuse the current eth_hlen and
> define it as 'struct ethhdr eth_hlen;' instead of a char array.
> Add 'h_proto' to the anonymous 'struct { } tests[]'.  Initialize
> the eth_hlen.h_proto based on the tests[i].h_proto.
>
> Also, this test does not actually reproduce the reading uninit memeory.
> It needs a bpf prog to actually trigger it by calling bpf_skb_adjust_room=
()
> based on the report in the "Closes" link. The test should be able
> to trigger it without the change in test_run.c
>
> The ai-review has flagged again that it is missing a "Fixes" tag. This
> probably started since the bpf_skb_adjust_room helper was introduced.
>
> The selftests should also be in a separate patch 2 following the patch 1
> changes in test_run.c.
>
> pw-bot: cr

Ack. I'll split this into two patches and rework the selftest accordingly.
