Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C87370D71
	for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787344975; cv=pass; b=OIpAZfKotiGK6QPpPrVqOJmWRCS9LrrGhv08FZ0Vh25vBaVULWVX2Ir3O2INFggQJixf2cbesa7VKdJVB5ShWwau3/FtjEOlW067z9AZKF+zXxdpfeCxQWS1rDOgfg0dSuT8bZZnVaHGWFiq3aAdhcAtbeC0i73wnVHKLQT1zto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787344975; c=relaxed/simple;
	bh=l6wuDhUu6BT/6ftVYfHdRxqOvwMTZ4xdVtf4Eo8iV5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLuSr3wlGr0pzJERgLu5978EFa+WNYn6/+sdLpCjC61PS9lx/RS/t5Sa7SxqlI1nYGXANgk9k1LurPLVFXeqsU5T8SIcQqDbZrJe42AuKQnaO/tBBNY0Sg/LfyowgrI9U8JOelxMWxE+XCJcyfweKR9pqS+rOWuDtB55BUP4eaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q30GhIwl; arc=pass smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q30GhIwl"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1523397a91.0
        for <linux-kselftest@vger.kernel.org>; Fri, 21 Aug 2026 13:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787344973; cv=none;
        d=google.com; s=arc-20260327;
        b=QCSdIyRhIBxrJDGUYWVMk3nNrlvI7WHb/RTgMiC7HYSgM/Ql0IjeNdwqQt1DUy6s5T
         bKYp7lCWxdTO5ZTujDIImU+Sx/hxNzMww+hI8WHfiVrVWOVV89rwljU2iD1rGP+SBDXf
         lGIuoFPcuAyqp2sdUy4kKOq9nRwSoc0rQ0RDDFw0beHJDRfyLZREISyfKSbeYLBTfLJD
         SRRXBvK3XYryYqM00w8NbS+LHM2TLlQeynCEjvEWqWd52Z7TcRWCV/c5NsoVandyj0RI
         SPMDgCzcE18AD5QiZCXTa85p5bXohrJDhjCAhYVJxLUHRdY43a43Wij2jpq1n+Uk28An
         WG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/MgwZLkVTATvr2P/Jrbvpgoe3aItgTPy/yeekhEPd7Y=;
        fh=4PAjfNLqeft+ZxujJ/Pum7UqsBN0s3EaPJ8bv5qjHZg=;
        b=P5wy2HuUToI2kgPkSh6eS+2C8f/P4MO2A5AH70RAHH9tZfv6YfEKJlIxgybjqVko6p
         CQeXAvNkYCKIHqY6Xwx/ayhXm2EMO+ylnlexRWWxFNfTGfb5Dkje6PsSqNiUB5r72Z9X
         GnYAyLxXkQec2AG01dcKjKQdhc+Y9ACseN1Qcl5F4Ppy8ggeU1ggGpjlOvqIzAEVG95I
         IIs0Zzzzru4xhmWLGAkQHSXMzrrUZhQt0Ed/8dawgS8GztpbuXW9y/zsROWLpK519Z26
         VaJtlWIXnzVLslWjRs9BpQTnYcVBX2smB4o80OdCBd4rAj77CXGlzq3JYyyW7tlcdVuV
         qDXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787344973; x=1787949773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/MgwZLkVTATvr2P/Jrbvpgoe3aItgTPy/yeekhEPd7Y=;
        b=q30GhIwlbY7w0OhehkQYrSbT2/35LDJBtD0EzqjSbj/XyTNBn2bO0Pkf0hWLQBO+IP
         S+y798HzyGf8r53lH2ANgGysLUu+uQA18pi1wbbVUH0b3ef51V/cGfvf/9vlot0tdS+P
         QHneoscYzfIt+TE0tUI4MAwaBpbN8zymaHZBMsFLsRJ5wPc+wNnDfM1F9YDy+dFFGykg
         RHYjr4xIPx23x4KWaGULmKh6OHfM7r0eV3kpKh9bTFCOW4WMiiiJGZ4GPvax0aPOEfc4
         /QVfGLAvoHH2lHub6uW2IK7J/qKHYECxm5eb23ahGz2q/eUabJmfp6qQA/AuDhAtkTSl
         dcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787344973; x=1787949773;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MgwZLkVTATvr2P/Jrbvpgoe3aItgTPy/yeekhEPd7Y=;
        b=lPfaMz9KhyHT9GG3thNCDizo1hO+i5P/aAPkbAexq8JVOSVzN+j85+zJCyUXfiuzaT
         /r+GJoitud2zvRKrKOrJtpwlkqeu7HN8ZBdflmgzS57ioxG7qdz3+ChLDocGgzskghNO
         ZIAhnHO7Ss3T6+9PQ0gToWqPUDBN99/q6pi3aMYncQ+LoFusbAV2ovmrJiXsgzTKfsi7
         C6JJprgmKFyFNkTz1zecvdyJRvlbnnq9sC/CDt479mFvPztHBKXpxhno0NF55zV/Y3oB
         pLGo9m6Rn8SZH2jPPJ7ukgnWV4TR7T5yuAr5ry04tqi0jANBNKHAcZxl13E0JmQxTt0h
         W/1Q==
X-Forwarded-Encrypted: i=1; AHgh+RozzSzxJhOF7PV/Vhoz8aCyPclgHFo5ox2hJTOYD+z9Yr+lNjPfU4mZDEkkzsBV7Zih49p2N0mv1lVWMAN2Cas=@vger.kernel.org
X-Gm-Message-State: AFuF++nXXibibeEaMCHgBJOZTsY1aZpQxsuMTqoCr4YqUYE/0ok+pfIU
	3RPt6TFdbwcc1UBvuLVpue4L5/+A7LIGTy0Yj4iFascmjHM3hgrA01ckiefKx19bub9P4AZ5KSD
	jWECRrIgt5Qv9Ii3ikc6D+k5NcNsIAAFCHQZiB7Y=
X-Gm-Gg: AR+sD12+c8LY8dESx0Vls2U0TpioT/NUbSQCksidbYi4XqYv5eyoichcJAhDzR2XqdA
	NC60lnGPbE8Xa+O8cCL2BdTKEJxjBZuizEDhyvvI2dxAcj2cjge09CMna6Nv5DgVK/ezG4T3vMQ
	euyFso9fswpfuDhqnIG4rz7zh2qjCg4MrideYyWx5H9bj2N5jUiltyXsZXgFXPpU82jvVVGHRfN
	g33vBa3yihfsvEbfOegCS5WDHSjfkGd333eNJ/BVkPFF8tnb7ItR//XIKTPTt19mAEwsW96iCMd
	yLv/idSq5mpa/rFaM6JJ1FDosJ2izbxSTOVoZP96JHkw/0pAOwuMGHXeGG2Yo8AfnrC+2oQHowH
	IdZ/8GMeqSHR7ZCrCMTLk7l721o5nNWfJWhYkpZTqjNLZneCigfQbn4nBS/zFvS0MeOLFIqfADD
	QV
X-Received: by 2002:a17:90b:3c50:b0:37c:607b:2cd9 with SMTP id
 98e67ed59e1d1-395dec98ad3mr2243333a91.0.1787344973108; Fri, 21 Aug 2026
 13:42:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817130239.343594-1-haakon.bugge@oracle.com> <20260817130239.343594-2-haakon.bugge@oracle.com>
In-Reply-To: <20260817130239.343594-2-haakon.bugge@oracle.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 21 Aug 2026 13:42:41 -0700
X-Gm-Features: AcwNN1UHuEoWSQUmSf-BSuuwE8uuo4k_2z47UxfLCpiiytRmAv3YKUETWosN5E4
Message-ID: <CANDhNCoPDZeXXGn-hKZ_jgE8gkELEaufDXDYWV=hqLWxtD6gJg@mail.gmail.com>
Subject: Re: [PATCH 1/1] kernel/locking: Add mutual exclusion self-test
To: =?UTF-8?B?SMOla29uIEJ1Z2dl?= <haakon.bugge@oracle.com>
Cc: linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 6:03=E2=80=AFAM H=C3=A5kon Bugge <haakon.bugge@orac=
le.com> wrote:
> diff --git a/kernel/locking/Makefile b/kernel/locking/Makefile
> index cee1901d4cff8..240084b4abbb7 100644
> --- a/kernel/locking/Makefile
> +++ b/kernel/locking/Makefile
> @@ -38,3 +38,4 @@ obj-$(CONFIG_QUEUED_RWLOCKS) +=3D qrwlock.o
>  obj-$(CONFIG_LOCK_TORTURE_TEST) +=3D locktorture.o
>  obj-$(CONFIG_WW_MUTEX_SELFTEST) +=3D test-ww_mutex.o
>  obj-$(CONFIG_LOCK_EVENT_COUNTS) +=3D lock_events.o
> +obj-$(CONFIG_MX_TEST) +=3D mx_test.o

Total bikeshed item, but both CONFIG_MX_TEST and mx_test are not very
obvious names for someone looking at this make file.


> diff --git a/kernel/locking/mx_test.c b/kernel/locking/mx_test.c
> new file mode 100644
> index 0000000000000..71d9ddc48a44b
> --- /dev/null
> +++ b/kernel/locking/mx_test.c
...
> +static int __init mx_test_init(void)
> +{
> +       unsigned int threads =3D 4 * num_online_cpus();
> +       enum mx_test test =3D MX_ILLEGAL;
> +       char *mnemonic;
> +       unsigned int i;
> +       unsigned int p;
> +       struct {
> +               enum mx_test test;
> +               char *mnemonic;
> +       } mx_test_types[] =3D {
> +               {
> +                       .test =3D MX_BUSTED,
> +                       .mnemonic =3D "busted",
> +               },
> +               {
> +                       .test =3D MX_SPIN_LOCK,
> +                       .mnemonic =3D "spin_lock",
> +               },
> +               {
> +                       .test =3D MX_SPIN_LOCK_IRQ,
> +                       .mnemonic =3D "spin_lock_irq",
> +               },
> +               {
> +                       .test =3D MX_SPIN_LOCK_IRQSAVE,
> +                       .mnemonic =3D "spin_lock_irqsave",
> +               },
> +               {
> +                       .test =3D MX_RW_LOCK_W,
> +                       .mnemonic =3D "write_lock",
> +               },
> +               {
> +                       .test =3D MX_RW_LOCK_W_BH,
> +                       .mnemonic =3D "write_lock_bh",
> +               },
> +               {
> +                       .test =3D MX_RW_LOCK_TRW,
> +                       .mnemonic =3D "read_trylock_write_lock",
> +               },
> +               {
> +                       .test =3D MX_RW_LOCK_TRW_BH,
> +                       .mnemonic =3D "read_trylock_write_lock_bh",
> +               },
> +               {
> +                       .test =3D MX_MUTEX,
> +                       .mnemonic =3D "mutex",
> +               },
> +               {
> +                       .test =3D MX_ATOMIC_ADD,
> +                       .mnemonic =3D "atomic_add",
> +               },
> +               {
> +                       .test =3D MX_CMPXCHG,
> +                       .mnemonic =3D "cmpxchg",
> +               },
> +               {
> +                       .test =3D MX_RDS_BUSTED,
> +                       .mnemonic =3D "rds_busted",
> +               },
> +               {
> +                       .test =3D MX_TEST_AND_SET_BIT_LOCK,
> +                       .mnemonic =3D "test_and_set_bit_lock",
> +               },
> +               {
> +                       .test =3D MX_TEST_AND_SET_BIT_INNOV,
> +                       .mnemonic =3D "test_and_set_bit_innov",
> +               },
> +               {
> +                       .test =3D MX_TEST_AND_SET_BIT_PLAIN,
> +                       .mnemonic =3D "test_and_set_bit_plain",
> +               },
> +               {
> +                       .test =3D MX_TEST_AND_CLEAR_BIT_INNOV,
> +                       .mnemonic =3D "test_and_clear_bit_innov",
> +               },
> +               {
> +                       .test =3D MX_TEST_AND_CLEAR_BIT_PLAIN,
> +                       .mnemonic =3D "test_and_clear_bit_plain",
> +               },
> +               {
> +                       .test =3D MX_SINGLE_WW_MUTEX_WW,
> +                       .mnemonic =3D "single_ww_mutex_wound_wait",
> +               },
> +               {
> +                       .test =3D MX_SINGLE_WW_MUTEX_WD,
> +                       .mnemonic =3D "single_ww_mutex_wait_die",
> +               },
> +       };
> +
> +       /* Select the test type */
> +       for (i =3D 0; i < ARRAY_SIZE(mx_test_types); ++i)
> +               if (!strcmp(mx_test, mx_test_types[i].mnemonic)) {
> +                       test =3D mx_test_types[i].test;
> +                       mnemonic =3D mx_test_types[i].mnemonic;
> +                       break;
> +               }
> +
> +       if (test =3D=3D MX_ILLEGAL) {
> +               pr_err("mx_test: unknown test type %s\n", mx_test);
> +               pr_notice("mx_test: legitimate test types:\n");
> +               for (i =3D 0; i < ARRAY_SIZE(mx_test_types); ++i)
> +                       pr_notice("mx_test_types:        %s\n", mx_test_t=
ypes[i].mnemonic);
> +               return -ENOPROTOOPT;
> +       }
> +
> +       if ((mx_min_padding % 8) || (mx_max_padding % 8)) {
> +               pr_err("mx_test: padding must be a multiple of 8 bytes\n"=
);
> +               return -EINVAL;
> +       }
> +
> +       if (mx_min_padding > mx_max_padding) {
> +               pr_err("mx_test: mx_min_padding must be less than equal t=
o mx_max_padding\n");
> +               return -EINVAL;
> +       }
> +
> +       if (mx_max_padding > L1_CACHE_BYTES) {
> +               pr_err("mx_test: mx_max_padding must be less than equal t=
o L1_CACHE_BYTES (%d)\n",
> +                      L1_CACHE_BYTES);
> +               return -EINVAL;
> +       }
> +
> +       if (mx_nmbr_elems < 1) {
> +               pr_err("Number of elements must be greater than equal to =
one\n");
> +               return -EINVAL;
> +       }
> +
> +       if (mx_scnds_per_test > MAX_JIFFY_OFFSET / HZ) {
> +               pr_err("mx_scnds_per_test too large\n");
> +               return -EINVAL;
> +       }
> +
> +       for (p =3D mx_min_padding; p <=3D mx_max_padding; p +=3D 8) {
> +               int sts =3D run_test(test, mnemonic, threads,  p);
> +
> +               if (sts)
> +                       return sts;
> +       }
> +
> +       return 0;
> +}

Apologies, I've not had a chance to apply and try this yet.

So this looks like the test has to be run via module load? I almost
never use modules in my test environment, so its often nice to allow
it to be built in and be triggered/re-triggered without having to
unload/reload (assuming this is not something like locktorture which
never finishes - and if that is the case, it might be good to
integrate into the locktorture framework instead of adding a new one).
Maybe something to consider?

thanks
-john
