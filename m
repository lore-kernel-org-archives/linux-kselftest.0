Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F755344DBD;
	Fri, 14 Aug 2026 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723369; cv=none; b=qmgA/cki2D7IYFFSQ/3ewe30ZOM9HKGsrTm2FysyJmHORXRu1QCarz5PcKx4R4PVfnvoZgiUHSBSwq2RG3KovwKdR3cIBUsUACuSda6UBC+hg/sYZ4Hod5DyA7esHHW/wgOq0C30hCHoL7J2UGY7IFSFsM+TqoKheazD0mcZQpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723369; c=relaxed/simple;
	bh=4DhmFCCrZMp3LPJzlo6ibRO70dQC0LtKTDZbmc3S9OA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jMssYMKsiC4iJ8LOO48Qg53tn4cdqNuHFfXptYC9BmQO1IJr7ByI/EA+RHQwupgCjLAfvuqdOL7rf7QK8EeBNu/wjG3MV1AM/VqFxX/gq6ZqdZLwTmkj/MqVVoEFdG9eAlfQkm1hT9ghvRgQwdv3NhtBC7mtr+H0sWUs2MnKd7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HHr9AgrM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHr9AgrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675E71F00A3A;
	Fri, 14 Aug 2026 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723368;
	bh=urLv2ur7qP+KwPTpG3ROd8W/hAModDSK/i6Sukki0mg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=HHr9AgrMP3y9/c5hdVQl9CBtNSfSS6jpAK1AaVk5+niqNTI2D/OCQD7WHKKPsdc+m
	 8GQw7sxb5PDv6/pWtGFdAJ1g56qBo9kboab54Qy+bCExO9DpWQX8ojOKF3SH+YF3hL
	 lgA9KroCIOwQMPtKPrFNnwkyG+HeQ+gMjF14+HZdwHFsxXcl/Rput6AP8A54s7HtFe
	 7KpiYz9hLkCGs/MnNu8+o6PV3I+iEOjVYKjDq9MkvKQaIiZdi7CS7wDO0OxJ6VbNHR
	 kM0nNauBe+q1YCje3iy2zbq/XKB5/ZnZbISwbt0W+DXUoWPzKYFzYcWf2Ql2PS99hM
	 F4J+nhH4xKzJw==
From: Thomas Gleixner <tglx@kernel.org>
To: Usama Arif <usama.arif@linux.dev>, Dmitry Ilvokhin <d@ilvokhin.com>
Cc: peterz@infradead.org, andrealmeid@igalia.com, dave@stgolabs.net,
 dvhart@infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, mingo@redhat.com, shuah@kernel.org,
 shakeel.butt@linux.dev, hannes@cmpxchg.org, riel@surriel.com,
 kernel-team@meta.com
Subject: Re: [PATCH] futex: Avoid hash-bucket locking for mismatched waits
In-Reply-To: <87y0e8lmih.ffs@fw13>
References: <20260805132831.2852771-1-usama.arif@linux.dev>
 <87jyq2dji5.ffs@fw13> <f4eaec7c-39f7-4040-b668-946de9c70941@linux.dev>
 <87y0e8lmih.ffs@fw13>
Date: Fri, 14 Aug 2026 18:02:45 +0200
Message-ID: <87v79clmfu.ffs@fw13>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14 2026 at 18:01, Thomas Gleixner wrote:
> On Mon, Aug 10 2026 at 13:17, Usama Arif wrote:
>> On 07/08/2026 16:42, Thomas Gleixner wrote:
>>> On Wed, Aug 05 2026 at 06:28, Usama Arif wrote:
>>>> On Tue, 4 Aug 2026 17:07:59 +0000 Dmitry Ilvokhin <d@ilvokhin.com> wro=
te:
>>>> The above data shows the significance of the patch.
>>>> It provides a very meaningful improvement (22.4% of time spent in fute=
x_q_lock()
>>>> will be significantly optimized and will also deliver second-order eff=
ects)
>>>> and has no measurable impact on latency in the matching path.
>>>> IMHO, this patch is a free lunch.
>>>=20
>>> Not really free. The user space access is not exactly cheap either
>>> because CLAC/STAC are memory fencing to meet the SMAP guarantees.
>>
>> My understanding from 86e6b1547b3d is that STAC/CLAC =E2=80=9Cend up ser=
ializing
>> execution on older Zen,=E2=80=9D while Zen 5=E2=80=99s AC renaming =E2=
=80=9Cimproves performance
>> of STAC/CLAC a lot a lot.=E2=80=9D  Architecturally, they only change th=
e AC bit.
>> They are not memory-ordering instructions like LFENCE.
>
> It's not a memory ordering instruction, but it has to guarantee that the
> AC change is effective when the subsequent permission check
> happens. That's true for both STAC and CLAC.
>
> So it _cannot_ be free by definition and the penalty depends on the
> micro architecture.
>
>> I am currently testing on Zen5 which could be why I didn't see any
>> wall-time regression in futex_wait_timeout.c from [1].
>
> It's not relevant whether your ZEN5 works fine or not. We are not
> optimizing for a particular machine.
>
> A trivial futex bouncing test case with two threads degrades on a ZEN3
> by ~20% and when looking at it with perf top clearly the extra user
> access stands out very prominently.
>
> The below variant does not expose that behavior and actually improves
> the same test case by ~5% on that machine.

Bah. Included the broken version. Fixed one is below.

Thanks,

        tglx
---
 kernel/futex/waitwake.c |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -857,7 +857,21 @@ int futex_wait_setup(u32 __user *uaddr,
 		CLASS(hbr, hbr)(&q->key);
 		auto hb =3D hbr.hb;
=20
-		futex_q_lock(q, hb);
+		futex_hb_waiters_inc(hb);
+		q->lock_ptr =3D &hb->lock;
+
+		if (!spin_trylock(&hb->lock)) {
+			ret =3D get_user_inline(uval, uaddr);
+			if (ret) {
+				futex_hb_waiters_dec(hb);
+				return ret;
+			}
+			if (uval !=3D val) {
+				futex_hb_waiters_dec(hb);
+				return -EWOULDBLOCK;
+			}
+			spin_lock(&hb->lock);
+		}
=20
 		ret =3D futex_get_value_locked(&uval, uaddr);
=20
