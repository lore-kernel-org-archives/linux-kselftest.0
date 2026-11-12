Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794499201;
	b=vdal9blIF4m8Y5jbMQB3aGuKSH97aiNhSxbu1vBekzz9jAJvP/J9DYUoSKUul3dPSnID
	 K4idizhuf2XyLqHXcL/JdPbJnpnKgExuKBbIPURV33c+NhXPbw0emHC4kQOy7IJG4AeAt
	 jaC/4/c+sAt/Fa9qLBg5lCpUrCG6zRRLdRG54KWqZAe+Am9U5oWIwNPr9x5ovRPL2eSTL
	 CQMhHAoVI4q87k8hDCKF25Z4QzI91C/Q1NJjxPNOl3jq4f7Cvxp1XwWaXn+1dsjFd3vk+
	 BOnCwVlenton5uvS8BTVPfbL33zn5YVydFeoT11DyPBg2xD8aPrzBP39d2nmm4AdSOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
	b=E25lFIsO2vKXtJEHm0YfGUWvkjGyd5obZmPfb1bxWThIHbSEgxwRqHZDL9VnyTmr6Igo
	 ZuExvPp0Hss589c/cIwm3WT+Hk6MZhgwR2/W5P1nPAbjKoNJMd/KWQt0TRKIY8OKLm2xa
	 1ZYYx7Y1hceU3FzD9ugG4gy87GUilPAp3kM8oLxuFVIQ7HLTX6/Ztw3XA/3m+msmiFM9e
	 rAyqN/1nZxdCUXh82JGnrsRGyT+OA4Yz2Tdy22WEZgbY8agGi9DcKvRhaetNy7rZscp3B
	 EOPSKkXMpuaguYkQ78dyWUb6T7mIOhhT0KZ5wI03Yy9Yj6qX8rVbMMruzxkXwHN88jw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VNq/TS9Y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E964606A337
	for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 16:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E964606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VNq/TS9Y
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so39372155e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 12 Nov 2026 08:00:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794499199; cv=none;
        d=google.com; s=arc-20260327;
        b=fLuAKDuWJ8s4bIPJR577ZHeKH/Egl1XmcN3tR5ne1vvRDV19KNVxk7qqvizf+Cp+xI
         CXAkncp/IFrSLkmZLX6e/2TAGbgdMgtii+WyWUkz0yYrCL2Zi9sLe3lS0ggqQAbQRqHB
         REr82WwyGizxUrHtbi1H1VkwIJ/xN9E+HweFinDMAJop8udzljXz3aIfYAHlo8j+3C1H
         d80Q1TnbPWxLtAswHqL5r9QtcHunT0TDTZqBlkTbSOS9sO/i/9xxfrcsnsEQ3/JHMYP5
         n+lBiE4mu7I7JpCZafDotc2d/uviavZ4VKbVsnwG8AFJDQlwWqA/Jmh5k14P5GfEZocY
         jkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        fh=0lHe1njlrNtnymF9/xS7qdrSnrYM8ZDTF+B90kJUABs=;
        b=NoTw0JvaDhZJr1JxuXxoYQKDdCvDQYqWL+KH/aXHKoYvFtvxeqOQqNshA2iVzS6OqP
         Zg91E5c4ltsEtCVP8I9BYucXiMl/DbMl+nkGyBB/KU4Ikw5OxAZYL2XwPp8nCXcOlKKi
         HwFTq3KP3YAdGT1TJcqfrERwbcSOeli0WGJ/xLrqwX4/BrI6WVrb/Sm3MjDmQ8NgKAt6
         wtuadrQBOaBCVNUJpPE3ZVXL4sWzgfqnBvxPmI1jxkrhrFZYZOOubg7bNpOy6K2raP9O
         MO7BsN6Gu5qkQqkWiQXfJTuz+EfwzukJIxvdTHnauZ8ktVGIq5UZLRR7wg1iso83wMhV
         iDXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794499199; x=1795103999; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=VNq/TS9YxMxpbxP3+3LmkMowYv8beN+AZb3BYPOxmeYCeq9+wN7D+1Kyz71UyEdZF4
         IkvZSUOob95mNXALzE8xn3UgGVvP1eilHuH2U+u79e5E6ebphwRqn0mF6VRmKlKbGuJV
         tX0doJRuOkq2kcmCTLV6p8qoCbmNRJKe+nDaeE5VHBDXVlMDcguz4kusAP5WttG8yNL9
         3VO7sjdZKkPWklzSyO1jeUoz0ev96lP1NhlgObkTjbJ0pR8NLBKYy+7KOmYJ4U2CmPlt
         2g4GlHdLb9s+LAr08FGs3b8IRKIIoVRwlbqGIrwvA4w3PCfbmNbrUIrHWx1ydZ4pSl2y
         z6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499199; x=1795103999;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o1Dliguz4u44qwi4R1eK834/qPlvvb9pc8ymG3pNfYo=;
        b=Vc7iSyNZ3zm3cEMyQYydJ8Cyt12kpVAaIOnTL7JPmnU5K5SPFFv7SpLu5LCQQ8iG91
         yAMtnth/nu5AbQQ6cMJZN4rAqX8aFzuKFRnjEppuFY3ApDrzNJZbnOywUPdlGRoxH79I
         lkeXQzdXQHn90/UPtObmuzl0oIHxnCFlcC62jLDUCvBPcztqAb6+lAL42wP8kZnWoJ+B
         3w69AE2NxpfU7d8f4Arei9LmvQte2NXyscsrrHJW8VLwia3c5P+mf4noYZ0yvUreQ5Ad
         8yyZXWlGSsoozd5I4n0NsKjLNIdxQpLLbUI66HlsWkBYEnpYZWHLmahI7+z0xUu0iox3
         7eXw==
X-Forwarded-Encrypted: i=1; AL+hErEGkLt9kQuy3mdv3G3RTzzOX2vIm0bGRAT/4e+fXEl1o8ObG8zzIxL6jBPJOCOKgi9RD18xGbI/u+JQXX2/lfY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MZpxo5Ic0WHpSFOztFIe1CKgXtnzvru485OyoB4FKc+yy61nL
	/hmfgdn5G5IEk8Z4lvZkyNRrHV65jQtyHPq3Ct5hnxdrVSQ68IANZb7vTOJL9teEPTBf2cZy7MC
	l3fhOFktvFofyPBTdUkaGsu6PeclqPNA=
X-Gm-Gg: AYBFou0KMt3v6VeYF7sqo+H7rloUV/HbZQtHOOB+GvcWZhCWIrP3st0lW7CS4yEDbbF
	hHeXQrFVF/k96J1abpT4bWjnnx3b0UBftC2bB0U6iTda3sg1nzJUbdfYSxx6+T2CSiiVI6RFcRU
	SqgbSLg6j8shP9nKkFjwjwb3nUzCqXP/TvKBTpOKIdODP4CZoYLkv0XA4CA0dkYnjub16wZg9pd
	KN3lvpXc6LAuyXntmJSS2vQuCUmiDVdqGevrtVWgcOy4GkZGBL6yfSGWefvYBkCaBWBjmW43BAO
	JRc5qBUPmRljGUIYR3cytDFdCPF278HpLCwofEWCtcl66RpUKdtFZDhZwmjT8oA5W7qrfcp+hrn
	mYZjUEg/TEkg3YuaJ5Ggj1p94EeFEmpGukSZINPd4AXuXrVUbY1bG8WiS5Cq/LSOKYuXVyQ==
X-Received: by 2002:a05:600c:e558:20b0:4bb:4b30:8042 with SMTP id
 5b1f17b1804b1-4bb4b308088mr61967275e9.19.1794499199056; Thu, 12 Nov 2026
 07:59:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
 <20261104165504.2430480-11-kunwu.chan@gmail.com> <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
In-Reply-To: <83463788-5e18-4932-99c9-4cbf4148a213@paulmck-laptop>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Thu, 12 Nov 2026 23:59:47 +0800
X-Gm-Features: AclHuK-mTFCsu5EzH21jY8YFD-8az2xhySVKCOowInql9XH_2VCFG8c3gHLmBa8
Message-ID: <CAN_Opa-bdkVQWNHm1N7Kk-sD36SM8Z99odPkCTngcnkWwU8tpw@mail.gmail.com>
Subject: Re: [PATCH 10/28] hazptrtorture: Add 128- and 256-CPU configs
To: paulmck@kernel.org
Cc: boqun@kernel.org, mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com, 
	corbet@lwn.net, mingo@redhat.com, frederic@kernel.org, 
	neeraj.upadhyay@kernel.org, josh@joshtriplett.org, urezki@gmail.com, 
	dave@stgolabs.net, stern@rowland.harvard.edu, parri.andrea@gmail.com, 
	will@kernel.org, dhowells@redhat.com, j.alglave@ucl.ac.uk, 
	luc.maranget@inria.fr, akiyks@gmail.com, dlustig@nvidia.com, 
	joelagnelf@nvidia.com, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	longman@redhat.com, rostedt@goodmis.org, qiang.zhang@linux.dev, 
	brads@mainlining.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, lkmm@lists.linux.dev, linux-doc@vger.kernel.org, 
	rcu@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 5:35=E2=80=AFAM Paul E. McKenney <paulmck@kernel.or=
g> wrote:
>
> On Thu, Nov 05, 2026 at 12:54:28AM +0800, Kunwu Chan wrote:
> > Add CPU128 and CPU256 configs for hazptr-stack torture testing.
> > These configs exercise the shared-scan path at larger CPU counts.
> >
> > Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
>
> For these, why not instead add '--kconfig "CONFIG_NR_CPUS=3D128"' to a
> run in torture.sh?  Ditto for 256 CPUs.  These will override the values
> given in the hazptr Kconfig files.
>

Hi Paul,

Agreed. I added these to keep the 128- and 256-CPU cases explicit
and repeatable, but the configurations duplicate PREEMPT. I'll
drop the separate configs and retain the cases as scripted PREEMPT
runs using --cpus N and --kconfig "CONFIG_NR_CPUS=3DN".

Thanks,
Kunwu

>                                                         Thanx, Paul
>
> > Acked-by: Bradley Morgan <brads@mainlining.org>
> > ---
> >  .../selftests/rcutorture/configs/hazptr/CPU128   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU128.boot        |  1 +
> >  .../selftests/rcutorture/configs/hazptr/CPU256   | 16 ++++++++++++++++
> >  .../rcutorture/configs/hazptr/CPU256.boot        |  1 +
> >  4 files changed, 34 insertions(+)
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU128.boot
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256
> >  create mode 100644 tools/testing/selftests/rcutorture/configs/hazptr/C=
PU256.boot
> >
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > new file mode 100644
> > index 000000000000..079b463607e8
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D128
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU128.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256 b=
/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > new file mode 100644
> > index 000000000000..b00a984977f3
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256
> > @@ -0,0 +1,16 @@
> > +CONFIG_SMP=3Dy
> > +CONFIG_NR_CPUS=3D256
> > +CONFIG_PREEMPT_NONE=3Dn
> > +CONFIG_PREEMPT_VOLUNTARY=3Dn
> > +CONFIG_PREEMPT=3Dy
> > +CONFIG_HZ_PERIODIC=3Dn
> > +CONFIG_NO_HZ_IDLE=3Dy
> > +CONFIG_NO_HZ_FULL=3Dn
> > +CONFIG_HOTPLUG_CPU=3Dy
> > +CONFIG_SUSPEND=3Dn
> > +CONFIG_HIBERNATION=3Dn
> > +CONFIG_DEBUG_LOCK_ALLOC=3Dn
> > +CONFIG_PROVE_LOCKING=3Dn
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dn
> > +CONFIG_DEBUG_KERNEL=3Dy
> > +CONFIG_HAZPTR_DEBUG=3Dy
> > diff --git a/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.b=
oot b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > new file mode 100644
> > index 000000000000..1d09a6446080
> > --- /dev/null
> > +++ b/tools/testing/selftests/rcutorture/configs/hazptr/CPU256.boot
> > @@ -0,0 +1 @@
> > +hazptrtorture.torture_type=3Dhazptr-stack
> > --
> > 2.43.0
> >
