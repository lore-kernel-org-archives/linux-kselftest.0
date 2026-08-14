Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C833542F8;
	Fri, 14 Aug 2026 16:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723275; cv=none; b=AesyNrO2Td8x8/fjHa/ZXYztmJZxV1I7e8cPr3MJYGEkawQOU3SHXp8S0HFD97sTqB0xdQ+dbLaCL/aTfrV2dUyJFignogTwDHwD5HBZFU2waMQEqj5h/OnE08rfdCXh39DYf0R2fWluiYb7s4e0sOpAyPLNODAvkhMUzBr+vBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723275; c=relaxed/simple;
	bh=E6H9JgIDjNnPBa2NnQRSYKmQrPVU+LXEXNTnD+ofDE0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bd19McQ1iKViq61PUxqqaP7Fne9tpwJjBks6Dhqf7Hcr1X8CB9FVQNY5bVg/6bFtPUrgsawRi93PlKeCi9b5NwBR+vnxYGaeoqBPjh5tEVFO7Tp2XrZ1Ht5fhRTblmeFTv7qAz7UK6+Rku1NaR9S9wPJFNCtRX0Y/KMMV4XyW2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WR73J3Ii; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WR73J3Ii"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C507C1F000E9;
	Fri, 14 Aug 2026 16:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723273;
	bh=t5ZpcWPCrbo+/IAaKfavsxiow49yJO7tJokstSnNDBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WR73J3IiRgtFLrHgpHq2c1A95OMO2XlLZ2hsj7RWkvoKyiUbF++axbQMgbbr1gxoY
	 Km6IpyHomxEUJ+B1MikusETcViOWOIeTEdUkfPEPRdz+LaJpeEv+DkqRXbAjDe+Hu5
	 if4SEGvHvNTizJkUUWYjZva8Xf2e3EZU/2jeNzPPIJeB+NDQRBgO7TdLEtxVP6FBC6
	 wCyqN3FYChU5GOZztwJFG8hoo1WRsbr9UdxeXp7gM30USAV30c3/bL9cS0VABKsE62
	 UgR21GYVu3AqXpa3Zp41jMueQ6cZzuGEHbdky9IeM+IMh2UCfKMeGulnZw0xHldy++
	 vswfgsZLgPeaA==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: peterz@infradead.org, andrealmeid@igalia.com, dave@stgolabs.net,
 dvhart@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mingo@redhat.com, shuah@kernel.org,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
Date: Fri, 14 Aug 2026 18:01:10 +0200
Message-ID: <87y0e8lmih.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10 2026 at 13:17, Usama Arif wrote:
> On 07/08/2026 16:42, Thomas Gleixner wrote:
>> On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
>>> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wrot=
e:
>>> The above data shows the significance of the patch.
>>> It provides a very meaningful improvement (22.4% of time spent in futex=
_q_lock()
>>> will be significantly optimized and will also deliver second-order effe=
cts)
>>> and has no measurable impact on latency in the matching path.
>>> IMHO, this patch is a free lunch.
>>=20
>> Not really free. The user space access is not exactly cheap either
>> because CLAC/STAC are memory fencing to meet the SMAP guarantees.
>
> My understanding from 86e6b1547b3d is that STAC/CLAC =E2=80=9Cend up seri=
alizing
> execution on older Zen,=E2=80=9D while Zen 5=E2=80=99s AC renaming =E2=80=
=9Cimproves performance
> of STAC/CLAC a lot a lot.=E2=80=9D  Architecturally, they only change the=
 AC bit.
> They are not memory-ordering instructions like LFENCE.

It's not a memory ordering instruction, but it has to guarantee that the
AC change is effective when the subsequent permission check
happens. That's true for both STAC and CLAC.

So it _cannot_ be free by definition and the penalty depends on the
micro architecture.

> I am currently testing on Zen5 which could be why I didn't see any
> wall-time regression in futex_wait_timeout.c from [1].

It's not relevant whether your ZEN5 works fine or not. We are not
optimizing for a particular machine.

A trivial futex bouncing test case with two threads degrades on a ZEN3
by ~20% and when looking at it with perf top clearly the extra user
access stands out very prominently.

The below variant does not expose that behavior and actually improves
the same test case by ~5% on that machine.

Thanks,

        tglx
---
 kernel/futex/waitwake.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -857,7 +857,17 @@ int futex_wait_setup(u32 __user *uaddr,
 		CLASS(hbr, hbr)(&q->key);
 		auto hb =3D hbr.hb;
=20
-		futex_q_lock(q, hb);
+		futex_hb_waiters_inc(hb);
+		q->lock_ptr =3D &hb->lock;
+
+		if (!spin_trylock(&hb->lock)) {
+			ret =3D get_user_inline(uval, uaddr);
+			if (ret)
+				return ret;
+			if (uval !=3D val)
+				return -EWOULDBLOCK;
+			spin_lock(&hb->lock);
+		}
=20
 		ret =3D futex_get_value_locked(&uval, uaddr);
=20


