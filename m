Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385188;
	b=Nw5dVOt+EmaumaVgcuHg1uCme8HmztZ/eAvxShdSod+IMKx1q3jPvh5aS73htl+3E+pD
	 0jZdDn4W5ySQFqZBIVWV39QxtT84LWFmMvNun3Z785kIynpC/1S3/MONQTKoDewxyHr1O
	 l0g7pu3gEk0g6LBC9FcMq3g7Wdz8IVjaZwGfIePqkP2+MxM8enwvMqd7HqKlXoj6zM1Cn
	 I2Wux1zF8daH5xD0YMNzYaCFryfj7K5WNPXkNB2abRjZ9f3G8Nat12MnTs2EybUhVmwM5
	 rdw8Ytza0+3/Q2OM83YexbeGWlrSQK0/O0kCemE2cKhV46dqzYyFCBBOvgvg+a+Xe6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
	b=0gPktVANr0JICAjHwnN0oYGx32CHd2+VWwgaRW9iLp3qM24EX4/FIv/78UcVVoJ0Yez+
	 3kKyBbcrtnAy6HhdylcKlOHvler23K/3am5pfp30D0IBHTRhZgVoLiBMyyqx+3C6ppPVd
	 oUuhvUTCMYE4T2CTTC6ZfoHZ3RVibXVqzeqott+vP3BIwzZaFQw44DxThHyl1vy8jcFvA
	 jLNIJzmKwJYk1Mazc7kIY0+/41aQUr0G8iACHVHlpp2qb1TR8mWUTS7k7D9XiqrZZVKwl
	 fcVVica+L+GO6+RTO6WvwlbmqKUoNqa/g5dwKfQ5HP+DeeFVgWKB3FlhNBK/OpyAGqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhYb4R9K;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24642606A31E
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24642606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xhYb4R9K
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a07078200fso491283b3a.2
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385187; x=1793989987; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
        b=xhYb4R9Ke1pTbYaBTbVPzyJbfQ75coDEa6uWXn6/sNo3GzqjzQKUd+RPmOwaU1Pchd
         9nvrvbd6PS/ug+Rjmsp0eojNT2kGZH48VrRb0EaRVtDJXVh98Mu8UcrFXr2QZEUiobyT
         Q/NgTTE2dK5NxejmA519jIBnqvIWmXWAtePFO3DhA934zR47V210H3H6JfE0Eq7c/bYT
         LhIM79VQi3YdewhRCSgcAbOLlSLvc/jj+w+vpKjx+qnRRYJs4Y2b54VgpS3zei/sStzd
         eGKvDygp4jzAZPeVNSc9uykE9p0BKQ0dgJOeOsDOvgbki0BjaDXaAXQMm84dTghXGs9D
         0soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385187; x=1793989987;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LqwO/tbXEMHl9nOAdKfhCSfefmnSAVqYf2mSAzV9dbw=;
        b=qcRk2QIv2q9a0fN/bB49AWP8t5GIrrGkEtix+ODh8CaGAAd7J11XwwLr+EOI1RjXyc
         qRMXupi0rapP+QgiAMXOD0vUPQF3FAT8odrpJ8PLXtxx8/xZCmNzgruXrJrmz+3kjq7t
         moTg5VPU4usq4N4na1iDKMXavhPldCfQhQYClzslaMxWd8D1dNGRoM1l+enrk4GYN/+T
         LhVFyteDJBxLs5oQ8dHaJy1vEo9d9KBAoc2kydglHUaUW+z5NVCWj1JI3WUje1NGkHYg
         GYRGLB2zXeWK/oSzn1xjZmVy5C/x4v5DpVGW0+jlclOHTXNBPvYiPXIPwFfh5JipZLpG
         UWpw==
X-Forwarded-Encrypted: i=1; AKwUvBw5Tf0FNiCLg327to2T4tOg29ABznZ6feoQ9H/0N7YvmNT/qiQRJe6GxQ+GeN52w7uO8MqLzDlVr2EAa7Bxowg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhoLyoSX2D4k9/Xbara6JkJfFVZP53raMIm+4xRjV9Pr9fkOCh
	2XO5a89fA4quDu5PceebENebTGTZQsfup+MLUgWBGJdj22tjHnfWmcGs
X-Gm-Gg: AYBFou2VqJ/Goz7V+Lf9PZ+kiV0bnrnh9wVRVMwweUHAeLRjis8p7G2bCwQ9DfVzSpu
	FBsHRYgoDPJcl9ogGjmVqFdLCOZst9CCxwG+SEHYaNuZIUhMNXqFiqt7zb8hG7CUyLFN7ix9wxP
	qhZCmSe6QCCWfAPhwoYTn3TQEb9ccsxjYCnWHASkx2GbuvudrJ3JF+bdoF2/e+fZXp490jIHbgt
	zt3bDFK8sX2S/O+LCCtkpch2Ir021DC7vfoLTuejLwKfhrwHeiJqhtbbbEVpAKunEDFiR0QLCK4
	k64lsij/hR+JOuJTD0MpFzaSGjRyAn8AmUS4fWf6DBiWeXB0O4/v0wBFQ25J45+kYuSGOdNb8Ku
	huMWhwp5qAvKI/9rqqDZjqoByjhHV3s7dHSdN6tMvbFNNiO/phdDJivaZpavo0ovuVnrENmGMnH
	LgkHuJI5LyVwmA4X396Jw8TrP91rpOzL3mI7QivvBev+w+QrdRRBSnpQy8qb3qE6UtJ2a4P2oix
	NcWn6tDyfbrOis2G+aVFhUcEo4XwL0EXkd+WicHS3MBvKNXFtWraSnvyxakS6KTgk86+HhhkcmT
	qyNn/CoXvr8LyIFbwjgDBjiIzyHrhHiot8HseeEOGmiVsX/vfJmuoMaLPEi1YZQ1eSHicqXiBu1
	cte62lT+Wa3Y=
X-Received: by 2002:a05:6a21:2212:b0:3e1:d43e:367f with SMTP id adf61e73a8af0-3e9290ff9f2mr3005488637.73.1793385187421;
        Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5d10:1794:f0d8:db5b? ([2620:10d:c090:500::4:1201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadaf86e6dsm336098b3a.57.2026.10.30.11.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:33:07 -0700 (PDT)
Message-ID: <727459335119599b851b7a1ed72dbe6220e14571.camel@gmail.com>
Subject: Re: [PATCH bpf-next v3 11/12] [do not merge] bpf: Track low-32
 scalar equality across narrowing stack spills
From: Eduard Zingerman <eddyz87@gmail.com>
To: Vineet Gupta <vineet.gupta@linux.dev>, ast@kernel.org,
 daniel@iogearbox.net, 	andrii@kernel.org, memxor@gmail.com
Cc: martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev, 
	john.fastabend@gmail.com, shuah@kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Date: Fri, 30 Oct 2026 11:33:04 -0700
In-Reply-To: <20261020161907.2115379-12-vineet.gupta@linux.dev>
References: <20261020161907.2115379-1-vineet.gupta@linux.dev>
	 <20261020161907.2115379-12-vineet.gupta@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Tue, 2026-10-20 at 09:19 -0700, Vineet Gupta wrote:
> A spill narrower than its source stores the source's low 32 bits, so the
> slot is their zero-extension -- the mov relation, in the store direction:
>=20
>   r6 =3D ...                  /* full 64-bit unknown */
>   *(u32 *)(r10 - 8) =3D r6;   /* slot holds r6's low 32 bits */
>   if w6 !=3D 0 goto ...       /* not taken: r6's low 32 bits are 0 */
>   r2 =3D *(u32 *)(r10 - 8);
>   if r2 =3D=3D 0 goto ...       /* not deduced today */
>=20
> A store never sign-extends, so BPF_REG_LINK_ZEXT is the only kind that
> arises. save_register_state() copies the source whole, including bounds
> for bits the store did not write, so the slot must be truncated before
> the kind goes on it -- otherwise the first sync_linked_regs() intersects
> the correctly rebuilt low half against those stale bounds and empties
> the slot.
>=20
> Only one order pays. sync_linked_regs() walks spilled slots, so narrowing
> while the value is still on the stack narrows the slot and the fill copie=
s
> an already narrowed value. Filling first does not benefit: the fill is a
> mov, and a mov drops a zero-extending link.
>=20
> Posted, not proposed. This is the direction asked for, implemented and
> measured, and the measurement says do not take it. Against the ten patche=
s
> before it, on 441 cilium/katran/fb/sched_ext objects, 1467 programs:
>=20
>   verdicts      no change at all
>   total_insns   102 changed, 63 worse, +84,450 (+0.34%)
>                   +59,616 (+57.2%)  104,160 -> 163,776  test_file_open
>                   +19,784 (+89.7%)   22,053 ->  41,837  rusty_enqueue
>                    +2,688 (+40.6%)    6,626 ->   9,314  layered_enqueue
>   total_states   64 changed, 63 worse

I'd still prefer to keep things symmetric.
Instruction budget should be less of a concert for 7.5,
as far as I understand.

...
