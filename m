Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526225A321
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 01:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673468; cv=pass; b=lqbUhiLhYRy2LhqKvxNowOfdeYiaMCFWkA+ZRN4BRTifJfivRiY6HP/oySTHv3nqH1sVlOkMgHmZLJD8Ogsd9wWnb9a8ET4gc8ZDHqSIOTFfwifvCL4MOfK8oScEY5DnSZz16prBPI0REcK3oZizz39ydvIyKpLketfs/JCxsO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673468; c=relaxed/simple;
	bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V4/Kn3i1YQU7v3845DE1Qokq0q4JpAXnGOd+NWxVWmvbUe5NNdGb7CIWJDyrP1fWlG46Y+rrhoMA9bwqKjYOaJEi2+IL29OugnwCDlLBZ/R3QJzdMmBV902444E0UPeaZfP3MG4BnvOnIxu/H8KWuSINVpLnS68EKDb5t/xoR9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qo3hxI7k; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qo3hxI7k"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-67f94c078e8so14004080a12.1
        for <linux-kselftest@vger.kernel.org>; Sun, 24 May 2026 18:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779673465; cv=none;
        d=google.com; s=arc-20240605;
        b=WFQsmpstk7iK7X3SkkjDm6XbT0jhqzmpMI3aLFteo08LuYDqfmmpmkrzqcZ9P837EH
         sX/ZcguQzUtLhrpaDXdYk+koT95QjtqdZrfZJ55Ssw1xcsigonuaTHOipiM7uF1Ev3Zn
         peXFPJnjmkLREtQqS/M+nhrT+A1QRCVDGG5RxTz1EZwdo0AxFBuTd9sG2PiM07FrR2Ug
         8Io2WG5e3EJA+bNX3RS64+dzN5euLWQIBLhwR0Z2oMn0XLr+FoNXDQCwojD3uKx//96c
         MognU/P5Z5aUj1QHaqTm09VpfdoD0MEsJowDODYKhQ0PHRgW5mwlpLKirfRPNuD1mcue
         GjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        fh=GcmS63rNIz4SErE4dX4r/xKs4IT/cRzmW/8wAP5cIzA=;
        b=bD99zCencnY4BN5ATKjOrl+3UGdCPn8jQVpGKKenijRLojD0X6UG+RXqJZXxpmx/oL
         ktXeb3fEZRP2RjtJRk49tc4EzA9Ql4nrfIvawvXOY2VQOsJ13gevpPuDbV8XHg0lh33m
         HnuhB0BQAVO3pUi4NZrk9mQOC4V7aRlDUB0hJX3VomoaU1QLdaHxXTaP8k+gDDTMCscK
         SfkK5Gm1LJ62+Ij0JLS2Uc4Yipa6aVhpI+soZYEiQOWiSpYDK5e08vT5IdH1AA5Bqh5J
         xVzKmCVq4DrV9KfuR7s3KIG2/ec8tK1a650bi/pUpKCP+ySyHWYvAoaLoYX9+/SwN55j
         X19Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779673465; x=1780278265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        b=qo3hxI7kIAHe5a62AcbYg8rwNyPCiVI4Gn0xso13TrfXAIrUEKseZRaUOK7lDCehn8
         QYr5UGYILoUUzuOQF4lelENurTL77H+qTIXsvK07mJovCYPXMprYhqt36ugQx94ZWsAV
         yd0c4iQyS5gxuy/EZXEk3rpsB41i6vUF8MgdSJEMCpfu4qgcfLZvREQ+jZyBom79fZHN
         EUCNWwb3viaAvzARBsXwMgQMumYSG0F3zibzirFy5Uqz8XmdUarswnjoZtQY79SJlnwa
         EZiShx9NpACCPMMLrjX+Y/NGn+KR183vDSnJLIiyDniv4hm5fYZIj6VgX/mbpUmCKhnH
         YE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673465; x=1780278265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncKtSpXu7pCHV+FYMgLpGNtvZ4E7dz2d54nRBRZMz6I=;
        b=JP3wOXJKdn6QbLdnpbpYcnpgckOyqNjyV8P6vtyilhdQr378jLo3p+dKBf31cMJTG4
         ckcGZ6vpkHZmSCcjjrSH8SmWB0sbjDuq8hybgt3UhI6yPMad8vXn8ZJfRg8FyHYgXzvB
         2mk2zxWKkrA5X0cxq8dYAtNKiBpNwng+yaXpWH2NEpRn6qkAo+jyVE8VcZ1kssov7xJy
         IIkwFhNn6GSWuhX0WNTMayHtUEK8apnz3Z6gthiBw1/U1LTxQGun7UOY1WOUQdDp1PJK
         d+GLGximUE8TmCfo2HX//4okbrbne/Pu84t6mkt/svZXwyFEMkzHdkrZJSCCZepVet5q
         oHkg==
X-Forwarded-Encrypted: i=1; AFNElJ9cBeR7XlspXSi5znko7Nx2AGeIhap06u6Wmb+ovtT8MRttVb95wHBVD36X3QkP39ZD146mE7lsXblIbQj74Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzj/K/Gu1XVdgMKNSokZw75intt5ua2ub6wXKKesiyCURS8p5SU
	TIRUd0H+JK5GIa/gYqMxcvpzx6RG6RcpkwEGxbiEfjr/Drp1N7m6o/bUvXKVgbUnfNERhdHzgzx
	KtozHqfdqHDHrjZ87R4X8n9h7WZcDxy8=
X-Gm-Gg: Acq92OEV42kyi5+kNPoosbKTuOXPOKjUBC7f3gxGBc9IQm5mGMX6gTNyB0lJzcchs3X
	LdOuEJtIqWUTQ7zMnRi5e0EDzAhmLLlxpmen6VY6tnJ8cKitVG8RfC5VLjFsW41Oc7WtJEicYD9
	TRds+oCr5Iy/VwLq+5TMLY1DjNqWr1dSLwwuH1oFBfhh3tveh49cHqZDis2LgFxGgrDmIMqhuy3
	q3sLul4fyS4cbxMHT1oUNlWUlFNwotdx5bvHfh5sdmCfcdVH+o/I0HUOCJhIGN808KF5wydLnp4
	cwKpVRmKueolECjFceoZ8urQJMSJp/iC3hobEw5M6g==
X-Received: by 2002:a05:6402:370a:b0:670:6ff3:6d23 with SMTP id
 4fb4d7f45d1cf-6889c431257mr6615752a12.7.1779673464584; Sun, 24 May 2026
 18:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-seg6-mobile-v2-0-9e8022bdfdb6@gmail.com>
 <20260505-seg6-mobile-v2-1-9e8022bdfdb6@gmail.com> <20260519033151.b01e47a877b01d3b68931abc@uniroma2.it>
In-Reply-To: <20260519033151.b01e47a877b01d3b68931abc@uniroma2.it>
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Mon, 25 May 2026 10:44:12 +0900
X-Gm-Features: AVHnY4L_KWEVlSdlGhMUwX9iTXuQg6B8YX1-k5ekXIJ_K-F3-WVsht3luuuTJjE
Message-ID: <CAGCJULO5HR0J7pD++_--epSEnzqO2p5Mn=UQ3LPbsYYPGydM7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] seg6: add End.MAP behavior
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Justin Iurman <justin.iurman@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, stefano.salsano@uniroma2.it, ahabdels@cisco.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 10:32=E2=80=AFAM Andrea Mayer <andrea.mayer@uniroma=
2.it> wrote:

> The commit message lists three drop reasons including
> SEG6_MOBILE_HOP_LIMIT_EXCEEDED, but the code does not add that one.
> The likely third reason (SEG6_MOBILE_MTU_EXCEEDED) appears in
> patch 2. (Flagged by Sashiko, the Patchwork AI reviewer.)

You and Sashiko are right. The new submission will only list the
drop reasons that End.MAP actually adds.

> Nit: As far as I can see, Link: tags in this tree usually point to mailin=
g
> list messages (patch.msgid.link, lore.kernel.org). Other commits that
> reference RFCs typically cite them in the commit body instead. Same for
> patches 2-7.

Will move the RFC references into the commit body and drop the Link:
tags in the upcoming submissions.

> This single reason covers several distinct failure modes across the
> patchset: wrong Segments Left, SRH absent, SRH structurally malformed, an=
d
> HMAC validation failure. An operator seeing this drop cannot tell which
> check failed. Using separate SRv6-level drop reasons seems reasonable. Se=
e
> my cover letter reply for the broader discussion on drop reasons.

Agreed. As discussed on the cover letter thread, the SRv6-level drop
reasons (SEG6_INVALID_SRH, SEG6_HMAC, ...) would be introduced in a
prep patchset that also converts the existing seg6_local and
seg6_iptunnel call sites. Pending the resolution on the cover letter
thread of who prepares the prep series, the End.MAP repost will
depend on it and consume the new reasons.

> This overlaps with the existing generic SKB_DROP_REASON_NOMEM in
> dropreason-core.h. Why not use the generic one?

I'll drop SEG6_MOBILE_NOMEM and use the generic SKB_DROP_REASON_NOMEM.

> seg6_get_srh() returns NULL both when the SRH is absent and when it is
> malformed (seg6_validate_srh fails, e.g. type !=3D 4) or truncated.
> seg6_mobile_get_validated_srh() sets *missing =3D true in all these cases=
,
> so input_action_end_map() treats a malformed SRH the same as an absent
> one and continues processing. HMAC validation is also bypassed because
> seg6_get_srh() returns NULL before HMAC is reached.
>
> seg6_mobile_get_validated_srh() needs to distinguish "absent" from
> "malformed/truncated" so callers can drop on malformed instead of silentl=
y
> accepting the packet.

The natural fix is to change seg6_get_srh() to expose the reason
(absent / malformed / HMAC failure) to the caller, which fits into
the drop-reason prep series and lets the dedicated helper go away.
API shape deferred to whoever prepares the prep series.

> Nit: the function comment says "decrement the Hop Limit" but the code doe=
s not
> do it explicitly. The forwarding path handles it (ip6_forward). Maybe
> remove that part from the comment or add a note that the forwarding path
> handles it?

Will reword the comment to make it clear that Hop Limit handling is
left to the forwarding path.

> Because of the bug described above, the only path that reaches the
> drop label with this reason is HMAC validation failure (when HMAC is
> enabled). Same drop reason granularity point as above.

Right, that's a symptom of the helper bug; both will be fixed
together by the seg6_get_srh() refactor in the prep series.

> See above: this only catches HMAC failure. A malformed SRH falls through =
as
> if the SRH were absent.

This call site folds away with the helper rework above.

> Sashiko flagged that for SRH-less packets this breaks the ICMPv6 checksum=
,
> because the pseudo-header includes the DA. The AI bot was right, but when=
 I
> ran the selftest it passed. Digging a bit further, I noticed why:
> 2001:db8:f::1 and 2001:db8:2::e have the same 16-bit word sum
> (0x000f+0x0001 =3D 0x0002+0x000e), so the checksum stays valid by
> coincidence. Changing nh6 to 2001:db8:2::2 makes the ping fail with
> Icmp6InCsumErrors.

Thanks for reproducing this. I'll fix the L4 checksum on DA rewrite
with an incremental update via inet_proto_csum_replace16().

> seg6_lookup_nexthop() calls seg6_lookup_any_nexthop() which already calls
> skb_dst_drop() internally. The explicit skb_dst_drop(skb) above is
> redundant.

Will drop the redundant call.

> End.MAP reuses SEG6_LOCAL_NH6 to mean "replacement SID", not "next-hop"
> as in End.X/End.DX6. This overloads the existing UAPI semantics of
> the attribute. The cover letter reply discusses this attribute-semantics
> question across the patchset.

As discussed on the cover letter thread, End.MAP will move into the
new seg6_mobile module under LWTUNNEL_ENCAP_SEG6_MOBILE and use a
new SEG6_MOBILE_* attribute (SEG6_MOBILE_NH6 or similar) for the
replacement SID, so SEG6_LOCAL_NH6 keeps its existing next-hop
semantics. No SEG6_LOCAL_* attribute will be reused.

> The selftest only covers the SRH-less path. End.MAP also accepts packets
> with an SRH, and that case should be covered as well.
>
> To expose the ICMPv6 checksum issue noted above, the address pair should =
be
> chosen so that the daddr rewrite changes the checksum.

Will cover SRH and no-SRH paths per the cover letter discussion, and
pick addresses whose 16-bit word sums differ so the ICMPv6 checksum
path is actually exercised.

The next round will be a fresh standalone "[PATCH] seg6_mobile: add
End.MAP behavior" series in the new seg6_mobile module, posted after
(or as a dependency on) the seg6 drop-reason prep series, per the
cover letter discussion.

Thanks again for the careful review.
Yuya
