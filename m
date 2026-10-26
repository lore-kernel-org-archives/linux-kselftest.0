Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793049848;
	b=EmT5s9/UR/dD8aHlgPJp7GfyF/pOn90Jc7+ee6smMtRaI3X9Yrx7fiB0uA4qOAlAI0cW
	 ZSUHzp1/vASSyou0bh5R7I3h3YUjGD02h7Rr2HPjOP8E2ht40hid/Vq10VlJGS0A/cBHh
	 pN0+oFqC3kW25fSzalLzuIWDiZmKzXe4fiINH8lvFupG2T1nmZRnoS3s6btXWZkN++Fjt
	 v5NDfntOqreo+zrEhTC4/gJ3lslz2JrYWKO6jB15+X7xSMefAvAH0z+NTsx+pERv4bofI
	 pkl2TWgzeuduHs+r/zY/O0vSJtsnokRTeucfBIe5sersRVIkCmJ4koRUVmVYYhtDZ0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GKPa9M5PoAhtNnZV69xKXcRKiwNy/DZc5TLsis+amX4=;
	b=VT/8RoY8H7fUuOAdenvUdJo/JFQVxYpPn3qF8fl7LZ2jNJ9UEtcKxDL2ZuhkbkzK40a2
	 5yolH+QWorY7VPzwo2vGVAV3I7+rIMd9yUboWCb4vzy4GD4bWIz0H53PdPhyT0BSm0iWB
	 QcnF+TbFPCAuHKB4lSYfLdxppK0hY+B4xQJCKpVdlmeXekG0YFnMNtQGWTAuPdxJNP9er
	 HUmk5vi43BeOQU7q1NYp7rJaYEriz7XauQGZjIvEmh3FjJgweUhV/hmxIGrAgHnk4+Ecw
	 pA/4wgP7/QbsTM9ekqZLGmipVMlAqQwQGxGFE65X/lAL01vOobygCJKY8g+0rJwXTbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JvW9vDSK;
	arc=fail smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A0B606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 21:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8A0B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JvW9vDSK
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05da1cc1fso1199704b3a.2
        for <linux-kselftest@vger.kernel.org>; Mon, 26 Oct 2026 14:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793049847; cv=none;
        d=google.com; s=arc-20260327;
        b=H3YRu+11wt3MOpVaWMZ1G0mEiGY6J6O+mRVGTgJxrJ5DcAQ+cCElRX0Ff+VGClw2Y0
         BVhQzgGdCO+eMRW7oskjSG8z4Oes4MIR1yPeChl6q+RUkbJJNyH9Z8WEey8l9nBs8wMr
         U8xqq02gi/+eH81acK7xZHfKYQ5GiR8OgrxxHdHshEucoLDXzkDnpVWB0TZGeOWLwxd/
         atoj1hAQiRBSWW9ZiZ3fSZZPhfkNr7O2jDRnT6a/RpwBFJHVvSd3hIE+1o9PutiuE91S
         ziHmWEaMlGapc2Dx/zqtZ0wiT8h6l6Lw6wELrTB+tGkosZDGGOuSk2JyZm6JKp/icQTx
         WcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GKPa9M5PoAhtNnZV69xKXcRKiwNy/DZc5TLsis+amX4=;
        fh=Vb3rbBzXz5QYIpHMr1A0W3srDj3yYJml3ueFbpyS9H0=;
        b=Rdl2n7JVz7scxtSZHKvDNQEFJMgMLvxcy7dIFSKmiG+mxHxPI4nAXnrZIEX3H3oztu
         WVvMI/bDnmYq5ztagaZQOiFhahxTatkhTGOuNfYLPsQG4OXUhU2QQWjjhibl0Erxr6fI
         +AwiNWLSupDexArSU7jrl3Gp2SavngkkUO5+nRyQYwKKQuqxZWlXdwwIKHtTHM8iE6z6
         rmlUIXHZotksVWfOFjXgAZJXwt1npdnORk4alx02fzIKla2wX+7+uNd9mi/RZh02XP9f
         Z0Mah8SaGX/JcKW9hUGN9hs1DGIBuhWsoe5fi1avkNjv1S77NgDPTTsEcDcnnZxV9BYu
         gkWg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049847; x=1793654647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GKPa9M5PoAhtNnZV69xKXcRKiwNy/DZc5TLsis+amX4=;
        b=JvW9vDSKDQCQ/Iv5gH7W5O3cS0g69FgaSrzXh+G3mKOnwtx1dD5k2+/f8z9S5LGEJp
         qhfC119t2DQCRsdUB4RiBMCgW9qeU+bxBSK401Bk+wzfGwWxnoFATTv6HCNP19AxhKn5
         4q8CfdqkdshtIy14X3UgKdFIgmQ8I8OYThvgeWi6M5mHA5jj/IEmz5LzhYukJ5xRd7Iu
         69idP10I+bJCRRgR++AoP9HgxnDUUM1isC1kbmQG8h/snlHwe8L53Xc5dXrxDDUYZ3dW
         ov5as3DD2BB9Qd+hgBkonsm2UFAu+VwMBLKG3UrP+36q9N8IuBaXClaE+/WlNYJ877aL
         GaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049847; x=1793654647;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GKPa9M5PoAhtNnZV69xKXcRKiwNy/DZc5TLsis+amX4=;
        b=RnF/ROxmFmvefUJ0wkNLdxaSj4bqE8YgI90D0mzo0I8LZWtE7IDTIP+621bGdrMoQu
         mvZGWlmCeeyr4nfjnkUxgDpn0oyHqAsbk8kxPOMMP6OwWzUZflEYhWMC3en7csYV4Wef
         /evAil2csZrST6Sl19GAmXovOjQoDM/VsnscRCr+Y3jQmkwx+Xnl8jAIWOt87ajEDfCB
         XFyQ5EfqOiJPDRI6B4id+oyi5a4q/MYaw33PTlH5kKBWPOul2PPvBin5KuFDwCn+zexS
         YwnYZ+dV/X9k2TEsw0slFAuFFYFkfCPv5YbSKgty4AEExCElmm7tnlJHSLe4kT2FvSFo
         0KXw==
X-Forwarded-Encrypted: i=1; AKwUvBxRgfBXBmGyq7P21LLUvpDF0Jy6uzHoaASAW8Ry2n3uK26rIOYaumoWWdEzQ8HPBR3A49bCysgzSriiCs56PlI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoWIO9tcYX8CFDB6Oz2v3XBH96r3tB0dB9ZvDF5Hd6mDHmWwvh
	fiRKQQrjf7AM/VD919So+g+oTbir8n2aNzxuD/9V3u4PXenl8VrI8oZI8DA+Jma6WCt0t0b93mS
	KiYwtkXn9uVgSIBMsgqK6bt1uYEr/9UU=
X-Gm-Gg: AYBFou1OYBnu7wYis4+sgjIMjAi8ySkSAu8g1b2D9+lNKf+JLWu+tGK3/ycqCoajuiE
	V0tkF9qinbjEjcCr7lh5el5dLorIepS1DkrsxTaBBc8jBCCZ3pzItmZ4Ao5igHFazzlveDjXUqO
	3Ke1oQm12Vs0vERDPvWmbA1pr3HJtnT5TyuMKXt13vtYn8QQbUvg+KuelwT6w5HDPMhIsS0uHjx
	XSPOWBX2InBtgB8mutJ8j5bO/R7V5Zo2G4Ay4px3pmGc698HufRgtQ/Fvc7Iqn6ePr3WL/RHru7
	NA3T8mR1tHlfTHEFmY6S5mOhD9/lV8Zgwx9ivR7WvivaLG8bgFrUFDfohA7ywMZgDp8BjEK9Woo
	n7hkdtWNaqOOpIcEa7P2czwdi/4FbTgnpwqmTCgao09uMakdqnp3u5OMsfHMNzw4Oa1shhC8Cgd
	Q71GjtRKBh5hP65xVBcsOXCBvgmPphlH5dmw==
X-Received: by 2002:a05:6a00:12d6:b0:89e:3742:3e16 with SMTP id
 d2e1a72fcca58-8a3666af17cmr6585603b3a.18.1793049847178; Mon, 26 Oct 2026
 14:24:07 -0700 (PDT)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024120627.837568-2-tim.budding@gmail.com>
 <179293012722.3134.13316596865856977030@kernel.org> <20261026052706.187296-1-tim.budding@gmail.com>
In-Reply-To: <20261026052706.187296-1-tim.budding@gmail.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Mon, 26 Oct 2026 17:23:55 -0400
X-Gm-Features: AclHuK_mrIu1EVf0x2dV3mIZYP2JHGyJuazQowznGXy4YPuBCm1N0ChSU-JmIKI
Message-ID: <CADvbK_du=-oT19kKBKYSjFKYscnQSH1mekRKMXgmLPMXTEH_=w@mail.gmail.com>
Subject: Re: [PATCH net 1/4] sctp: purge abandoned I-DATA fragments by stream
 and MID, not by TSN
To: Tim Budding <tim.budding@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-sctp@vger.kernel.org, marcelo.leitner@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 1:27=E2=80=AFAM Tim Budding <tim.budding@gmail.com>=
 wrote:
>
> On Sun, 25 Oct 2026 12:08:47 +0000, netdev-bot+sashiko@kernel.org wrote:
> > > +           if (event->stream < sid)
> > > +                   continue;
> >
> > [Severity: Low]
> > Each call to sctp_intl_reasm_flush_mid() starts at the head of the queu=
e.
>
> [...]
>
> Agreed. Walking each queue once per I-FORWARD-TSN would be a separate
> change. I could send that to net-next.
>
> > > -   /* purge the fragmentation queue */
> > > -   sctp_intl_reasm_flushtsn(ulpq, ftsn);
> >
> > [Severity: Medium]
> > With the TSN-based purge removed, what frees an unordered fragment of a=
n
> > abandoned message that arrives after the I-FORWARD-TSN naming that
> > message has been processed?
>
> [...]
>
> > Should the commit message also mention the lost rwnd and receive buffer
> > space? Alternatively, could these fragments be dropped when they arrive=
,
> > or when the cumulative TSN moves past them?
>
> Correct, and the commit message is wrong to say such fragments stay
> until the association is freed. An unordered fragment of an abandoned
> message that first arrives after the last I-FORWARD-TSN naming that
> message, with a TSN above the cumulative TSN, can't be reassembled. It
> keeps its rwnd and receive buffer charge until a later unordered skip
> on that stream with the same or a higher MID, a reset, or teardown. At
> the tail of reasm_uo it also stops reneging, as any fragment below the
> cumulative TSN already can.
>
> One late fragment is enough if nothing after it has arrived: the
> receiver then delays its SACK for the I-FORWARD-TSN, the fragment fills
> the gap within that delay, and the sender never names the message
> again. With the last fragment of an abandoned three-fragment message
> arriving in that window, that fragment stays queued (RX_QUEUE 1232). A
> duplicate can't do it, as the TSN map drops the second copy.
>
> Before this patch a later I-FORWARD-TSN covering its TSN would have
> freed it, so if another message is abandoned later, this patch keeps
> it longer. Without such a later I-FORWARD-TSN, this patch frees more
> than before: in the same test, the TSN-based purge leaves the
> message's received fragments above the New Cumulative TSN queued
> (RX_QUEUE 2464 without the delay), and this patch frees all but the
> late one.
>
> For an ordered message the same late fragment aborts the association
> instead: its MID is below the next expected one, so
> sctp_validate_idata() fails. That happens on net today as well. I
> could look at it separately.
>
> Freeing fragments once the cumulative TSN moves past them doesn't work
> with interleaving: a live unordered message can have fragments below
> the cumulative TSN, and freeing those is the loss this patch fixes.
> Dropping late fragments on arrival needs new per-stream state, the
> highest skipped unordered MID, which must be cleared on resets and must
> not go stale when MIDs wrap. I'd rather do that in a separate patch
> than grow this fix (question at the end). Either way, v2 will spell out
> the cost in the commit message.
>
> > >     /* abort only when it's for all data */
> > >     if (ftsn =3D=3D sctp_tsnmap_get_max_tsn_seen(&ulpq->asoc->peer.ts=
n_map))
> > >             sctp_intl_abort_pd(ulpq, GFP_ATOMIC);
> >
> > [Severity: High]
> > Can this branch still flush the whole ulpq for an ordinary I-FORWARD-TS=
N?
>
> [...]
>
> > A later patch in this series, "sctp: don't treat an I-FORWARD-TSN as an
> > association reset", seems to address this. It drops the max_tsn_seen
> > check from sctp_report_iftsn() and makes the stream reset paths call
> > si->abort_pd() directly. This patch is tagged for stable on its own.
> > Should that change be folded in here, or should the two be backported
> > together?
>
> Yes. At this commit an I-FORWARD-TSN whose New Cumulative TSN is at or
> above the highest TSN received still takes that branch, and
> sctp_intl_abort_pd() frees every queued fragment, including those of a
> message still being received on another stream: the same loss this
> patch fixes below the leading edge. If that message is ordered and in
> partial delivery, its MID is also skipped, and the association is
> aborted when its next fragment arrives. With this patch alone the
> ordered and unordered tests pass and leading_edge fails. The later
> patch fixes it. v2 adds a leading_edge case without partial delivery,
> which shows the loss directly.
>
> I kept the two apart because they are different mistakes in
> sctp_report_iftsn(): the TSN-based purge, and treating ftsn =3D=3D
> max_tsn_seen as a reset. But they share the Fixes: tag and the
> symptom, so folding them is reasonable too. The later patch needs
> patch 2 and the new pdapi_seq patch (see the reply to 3/4), and
> neither of those needs this one, so folding would mean those two
> first, then this patch and the later one as a single patch (question
> at the end). If they stay separate, this commit message will say in v2
> that the leading-edge case is only fixed by "sctp: don't treat an
> I-FORWARD-TSN as an association reset". All three fixes are Cc: stable
> and apply cleanly, in order, to the v5.10 through v6.18 release tags.
>
> > >                     sctp_intl_stream_abort_pd(ulpq, sid, mid, 0x1,
> > >                                               GFP_ATOMIC);
> > >             }
> > > +           sctp_intl_reasm_flush_mid(&ulpq->reasm_uo, sid, mid);
> >
> > [Severity: Medium]
> > This is a pre-existing issue, not one introduced by this patch. Does th=
e
> > new flush leave unordered partial delivery stuck when the skipped MID i=
s
> > the message currently being partially delivered?
>
> Yes, and that is the next patch in this series, "sctp: abort unordered
> partial delivery when its message is skipped". At this commit no abort
> notification is sent and the next unordered message on the stream is
> delivered as the rest of the skipped one. The uo_pd test fails at this
> commit and passes from the next patch on.
>
> Xin, Marcelo, two questions for v2:
>
> 1. Fold "sctp: don't treat an I-FORWARD-TSN as an association reset"
>    into this patch, or keep it separate?
> 2. Should dropping late unordered fragments be part of this series, or
>    a follow-up to net?
>
Please try to fold it into this patch, and leave the drop to a follow-up.

Thanks.

> Unless you prefer otherwise, v2 keeps them separate and leaves the drop
> to a follow-up.
>
> pw-bot: cr
