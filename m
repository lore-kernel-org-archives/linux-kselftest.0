Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794805718;
	b=c1IwoxpWKinOIRnNTB5pky9AfoiSyspVjSYRoltWD08nNAIYPklgLnrW0+Znt1dBd5dD
	 eCcyu8gw4pvU9MmoGzAXRn6fCcoXk54z7jNYDrG0X1K+N4pIEqEjLxKGS8ltDbxrDKCKI
	 9z520obi3t3e+3cb6NgTALmzxMA2unJ24AAq8Zn96XUlbqRGykWncMzawnw6GBLBw9uyy
	 GANi/gcNNuuplWfylTGbIchoXukEdcHK3Q12u8JgRidEaVQVGqV22+DxXdvDIiqCfR7XP
	 9LYsmHTGRGe+Rm1WnyCXc9myQ6fMofQlTV3dw9kndToOVohipSulIbgTzUVNELvSCtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
	b=OWueUI1R+np4jOVD59v9rFBxikZm8EOgdIQvqaglAC/8Bfw8s1uk1/W6jOQ+r4QrTM0O
	 jE8KJ6hFbd9ez5m1HfS7QiKT5kt/l6Aca1SLwGY95d9LmGqlUZgEHS5zuMDduBk75sJbE
	 kEgFdXFlIBH9yehO/EY6cfFaMqQSlyIYgsGyx4XALWdHk9U/7Qet2QpZVijDfURAVF1Bz
	 ZwMDTRXeeB4Nxz87lHr9Mrk0xXOHrBQGePu5HdyKAZOw/2ifbbgRYd0cJBseeqM8ZMxHa
	 RxFOWfOTjGyaFdDCtPG5ylDWvpRnm4DR6trps+seH6S1FVGt/gjv+Z9bf27c05KsYcA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b="TSy/b/JZ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028E606A32A
	for <linux-kselftest@vger.kernel.org>; Mon, 16 Nov 2026 05:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D028E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=TSy/b/JZ
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so33843481fa.1
        for <linux-kselftest@vger.kernel.org>; Sun, 15 Nov 2026 21:08:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794805716; cv=none;
        d=google.com; s=arc-20260327;
        b=ZGahjwvUFUGHRqNUuFJ/0y3iRxglSRXD9WUqk/PG5sMyLUA1ZI9m8ARkEmfQeQftgR
         cGBSob7Usn5GW09ALRfOZHeyjxUz72hRSp9Bom+ynwh7pnkAGPd7QtYbbm3dnW7pOz0q
         IOZQFI1i5j5NEngc8farZSeERVAICLzhNmdmXneTDQDIMZgxMeNronCYpJK1PHtuxN1V
         yBhZrQv792n4uEUtNNX+7hqXF3r3hDjcjRBfbm4RPP2A1WWaJXmE3aY3Cp0wQIFY2+Vx
         fWXpmE5yInVW8F5RnoNWnKbyzgwMzSuHLBjnkO++EB+y4cuWnVPcxmGN5YaI82aR2KS3
         QkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        fh=g2NOZINxon5hPaVv6GswyAU2gsNTYiSnMK71YVUKe1g=;
        b=F424Vctu01awotngLKSSQZICnqr7bZXYBhLaNiPtBnRI8ixUEE16Kpn9noTfamwmqw
         47oEYmLRrLmX4si6Vgw/GcKc7O1oeUlcacl9ODav46CXueqrNmJbVSUEtXRGqZ20cvFT
         RplLyyRm3Yc1QX31Wf8pGsl5r/jKTX59mxfWLvQlBH8YdQfTKd4jDvBpZQmvqECl9M8H
         qYmghxhFRnXdKuDYdNWZvurnC9170Qv1sorXm60zCKnCLP+NH6xR8TOrZLj+KJLwzM0Y
         ISEsoDIJWOwjC1lUTzcL/kgjCwXRx2KSq59vcoZ66/q/JSqgPXDon0Jugg15FNXHt+Iw
         ++qw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1794805716; x=1795410516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        b=TSy/b/JZ2wjrU2kStbBSWztm4DWLTNtNkuEVQ7pOSonZKkWP0IBhO40JXqIbv6xtsH
         e45tsQPt0CQtbimH33l84TjBbWKqZZwVJaaoirP1b3P4tlG8NPWEhZzxnFoadNR/RSQA
         HbZvJUoOqPIo+01MoNKSbPbdjJ+cu4o4wjkR0tdTx1DHFUws6d310scHTpOwOFlSe5P1
         Bzi0iE3iqbbdP7ibe0LJItvBOj1voUJ8QBqUrMqT5lzFHsub1R1Vz3x1uAmSRscWngJb
         WQs/5c9W8fruwuYsuoTcldvxDHd0rKHjibZeF2KfunYBHPjGXPLuUefltnycSX/n2JMP
         1ruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794805716; x=1795410516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6PFo0gWJ6YoLoXoUQd+pgr2q8m2qzjFGTHMpGL/07IE=;
        b=jE2GpNEerZjP2nnAL7WHv+NvZ3wG4mL2CGzsVytU0CU7Dac1Aen1VoQb+BVGSbi8uu
         oN9nImusFJ7Zuis4ajCwfxXapL2ozpQj7ELu6gqcl5lsmCwr13xc3Z9t6uu+Fg18KZxv
         MTQxtItMKDkP33Rd53qD7/mUfscxbt1E7/Y5T7FRcBfjmh4znT6WRg5NFHvNBKTMJePg
         ycVL9EWcGUsgWNGZ/HKum2/PDYTRr81jr4ENd4u+AYnfqniCHJAzQbdhECeA5dfuQy00
         HaEs3qZqV/Al/bbdkCZ5kCcKccvbmJZgYKA3OQ+TsYS9AcN7hQvL4Ba0y/QmltSv6JQz
         ALnw==
X-Forwarded-Encrypted: i=1; AL+hErFPiqv3k/ZJmqFWk5PA0aKfYRyypvMGeTJMXSiwfr465k0jzrMV/s97fk1d0jchT50bUkRaX4FBx3m84aDOIXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9VvUjJBfLyKep0WF7JBshs7UYhZoWXfHr/uhodWqZaHYoM6ASC
	hemRzv9iAAwQE4VwyX9BYVBKwltFUhLeDt/AU9kV9BBmn2QRzuBJzI/jbbkrmbRqnKni3iXSi7D
	ZBxfjIPttBkkZwQy4L3TBG8aAE1MJnncro062Zgytaic=
X-Gm-Gg: AYBFou2jXfvZkqWjeBiR84jjp+kf75srthqu56hjHW9Kf/aOjGD4CNJ1h8RmLlaWNrz
	0eK4jQaY1GEYl4G8dEmis6SOB3a54t4SEOMx7XSzAKTpeS5hpqggdXCEVxPh0wJbBZixaG1MBrs
	sKmJuZOgOHK+cl1tdgr9l3UJYGIqz+0LIazEhFsDI1uNqX4t7bgf9MiJs2lvDzE0U+Auay/KWpw
	i0RRXjgEzRLXBJHvIyZSprIDXYp4mI9sCESmlZx9uxbbKye9ZV9pYdabQ4kbGYaWuPclzfrF7BU
	lMkXk4oYz9X99ClWGX/mS70cEkSBKfiB6j8LHDAJl+pQxVuYCdqy9VFTOEf6uoGvdyD/efwF0Ni
	UfVJg47iKMmNuMdkQKS8aSmWxas2RNOdIDRSTB8kc3c97hKWANvEdqF1WiTlUKUHBg2ciEArwN5
	btbBZ8W/AU+XktpencVs6HwdOMpYo47u3GqHti46wm1BPsTZU9
X-Received: by 2002:a05:651c:a14e:b0:3a9:c840:10fb with SMTP id
 38308e7fff4ca-3ae2b423c94mr27234081fa.2.1794805715876; Sun, 15 Nov 2026
 21:08:35 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794759652.git.zihanx@nebusec.ai> <8c46325c4a433f02fdc7241c0c3884126cb502af.1794759652.git.zihanx@nebusec.ai>
 <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
In-Reply-To: <DMWD65CI6NZ6.2V1UCWL1FUM8K@gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Mon, 16 Nov 2026 13:08:22 +0800
X-Gm-Features: AclHuK8wwX3X6c9X0CotsDoQlCsd788_-OkGc6Jo0WLhdVjqKCwpL8hPjkp3rg8
Message-ID: <CAANe3eSprp-ptkLStFXji38JQitsncoBBYSypRGJ2G5SMghMtg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] udp: fix reuseport rescore fallback
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, willemdebruijn.kernel@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, benh@amazon.com, 
	kuniyu@google.com, shuah@kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:51=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Sun, Nov 15, 2026 at 07:55 PM Zihan Xi <zihanx@nebusec.ai> wrote:
> > When a reuseport group contains connected sockets, UDP lookup rescored =
the
> > socket selected by the reuseport program. If that socket did not match =
the
> > packet, lookup retained the stale selection while continuing the scan. =
This
> > could deliver a packet to a socket connected to a different peer.
>
> Not since 6.13, unless CONFIG_BASE_SMALL=3Dy.
>
> > Link: https://bugtracker.nebusec.ai/f/net/ipv6/udp.c||udp6_lib_lookup2|=
|socket-hijack||m7q
>
> That's not a hijack.
> udp_reuseport_add_sock() lets only sockets of one uid into a group.
> A member of the group attaches the prog.
> The prog picks a wrong socket of its own user.
>
> > +             if (need_rescore) {
> > +                     if (score > badness)
> > +                             badness =3D score;
> > +                     else
> > +                             result =3D sk;
> > +                     continue;
> > +             }
>
> This makes it worse.
> The unconnected sockets of a group have the same score.
> So the score of the picked socket is equal to badness, and the patch
> replaces the picked socket with sk.
>
> Sockets A, B, C are not connected. A is the first one in hslot2.
> has_conns is set:
>
>   reuseport picks   today   with the patch
>   ---------------   -----   --------------
>   A                 A       A
>   B                 B       A
>   C                 C       A
>
> Nack.
>
Thanks for the review. You are right on both points.

I missed the 4-tuple hash path added in 6.13, so this does not affect the
normal configuration there; the lookup2 path remains relevant with
CONFIG_BASE_SMALL=3Dy.

The proposed score > badness check also changes equal-score behavior
and can override a valid reuseport selection, as your example shows.
I will withdraw this patch and the security framing rather than send the
current series.

If I revisit the remaining CONFIG_BASE_SMALL behavior, I will first
preserve valid equal-score selections and test both the mismatch fallback
and equal-score reuseport cases.

This series is dropped

Thanks.
