Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725157;
	b=HbMCRB/kTXCvbyoEZtVj7RpUhSNXtZDxDtSbYh2oG6m8nyQcvrxINYVjMrQ6Kjro507D
	 rbZTo+Pl+fh65VYRodp2scz/V298CS5yYQ5aaFWUw79M4L0naxYnwHzUqBbIxAjhXIRII
	 TKYRSHJEW3kkRzdP2Awo5OrgtWre5O6dfqIKg3dxcOWXyrI4z4a4HLd3/RHugQvIjjjj0
	 PSiWUSTUS6UUShYqS9FPibKG1gcrmTIRJBBoUjoEAAXUxDhckPF4/70hNkEtXaFT79ckX
	 mTLym1tTegUgQFYarO1ygfhkO4iiViNQMUwT9LtmyWusDiynk1rh1Z5vv/FwBCXeRtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725157;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:MIME-Version:Date:Content-Type:
	 Content-Transfer-Encoding:From:Message-ID:TLS-Required:Subject:To:Cc:
	 In-Reply-To:References;
	bh=wERwQjv/GeIe0gZj3XvJBtl4DMJ3FmhTMyS9uJcjt70=;
	b=bh2X5jWPG7OT7UumZ4T1is+zf3cE6IB7x7FJ9VqJIxEHz7njXVzKHfy7ScI24fTj0feC
	 GCUmhWbfejtZb3g7TCkqDurx8hAr0XZrF8kTooVdKBSm05VMWJDK21UPNkbjVVBwnKufW
	 H+zf/SOiFJt4VMfrTqK4uyOoo0/8vCIWytWjFP2D2ZiejzLCKo5LMbBvda9RCD0cT2NZ1
	 lgoTOEhC5KwitX1lCQaXrF1UCHl+Lz90BiqJa3ALIhYxglK9+elvPB/CQ+0TnSlyTDOh0
	 grWYu4I1tZN7Bnd70j98W5fdf6Ym2+uuHAbqZ2C88NX4XssLG+dWvLHtUSHuWxWMQBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Lt3RpgZl;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AEF606A319
	for <linux-kselftest@vger.kernel.org>; Fri, 23 Oct 2026 03:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21AEF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Lt3RpgZl
X-Envelope-To: linux-kselftest@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=s7b/05QJQZScXGAdNeVBlaiuXnBo6sBBtiftlECxz7A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792725155; v=1; x=1793329955;
 b=Lt3RpgZlL5wCtVniHtDG2L5TV6nQbrl/YLiOvGRnJ/yU+t1ojDjEvu0Jg6cC6l+WTLIrThUD
 ffHr1ZJ0x0ket8FZfofgWd5dFcXR4SjaRdH4m4qxOIxWyzUcOnRAqnFZYbDWzAKK5RrF8RZMLYH
 fHIp+8+y7AcPe9NZDUkOMzqI=
X-Envelope-To: linux-kselftest@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id be1fbcb0ec813163;
	Fri, 23 Oct 2026 03:12:35 +0000
X-Mizu-Trace-ID: be1fbcb0ec813163
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 23 Oct 2026 03:12:34 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <9815436fdf54d9f958b777127014b462d6d06347@linux.dev>
TLS-Required: No
Subject: Re: [PATCH 0/4] nbd: revalidate startup state after queue updates
To: "Tao Cui" <cui.tao@linux.dev>, josef@toxicpanda.com
Cc: cui.tao@linux.dev, axboe@kernel.dk, shuah@kernel.org,
 tom.leiming@gmail.com, yukuai@fygo.io, linux-block@vger.kernel.org,
 nbd@other.debian.org, linux-kselftest@vger.kernel.org
In-Reply-To: <23fa4413-83b0-45b2-b790-1bae653e3e95@linux.dev>
References: <cover.1792399225.git.liuyun01@kylinos.cn>
 <23fa4413-83b0-45b2-b790-1bae653e3e95@linux.dev>

2026=E5=B9=B410=E6=9C=8820=E6=97=A5 21:03, "Tao Cui" <cui.tao@linux.dev m=
ailto:cui.tao@linux.dev?to=3D%22Tao%20Cui%22%20%3Ccui.tao%40linux.dev%3E =
> =E5=86=99=E5=88=B0:


>=20
>=20Hi Jackie,
>=20
>=20=E5=9C=A8 2026/10/19 16:42, Jackie Liu =E5=86=99=E9=81=93:
>=20
>=20>=20
>=20> Commit 8b428f42f3ed ("nbd: fix lockdep deadlock warning") drops
> >  config_lock around blk_mq_update_nr_hw_queues(). The initial checks =
for a
> >  running device and NBD_FLAG_CAN_MULTI_CONN can become stale while th=
e
> >  lock is dropped.
> >=20=20
>=20>  Two NBD_DO_IT callers can both pass the PID check. After the first=
 caller
> >  starts the device, the loser overwrites nbd->pid before failing to c=
reate
> >  the existing sysfs pid attribute. Concurrent NBD_SET_SOCK or NBD_SET=
_FLAGS
> >  can also leave multiple connections without NBD_FLAG_CAN_MULTI_CONN,
> >  which the queue-count retry does not validate.
> >=20=20
>=20>  Recheck both conditions after reacquiring config_lock. Reject an a=
lready
> >  started device with EBUSY, and reject unsupported multiple connectio=
ns
> >  with EINVAL before retrying the queue update or starting receive wor=
kers.
> >=20=20
>=20>  Each fix is followed by its regression test. The tests prime the h=
ardware
> >  queue count before each attempt and use socket pairs, so no external=
 NBD
> >  server is needed. They require CAP_SYS_ADMIN, at least two online CP=
Us
> >  and unused NBD devices.
> >=20
>=20Tested this series on top of next-20261019 (x86_64 KVM guest, 8 vCPUs=
),
> building and running the new selftests in-guest with nbd loaded as a
> module (nbds_max=3D4 max_part=3D0).
>=20
>=20On the unpatched kernel both bugs reproduce at round 1: the losing
> NBD_DO_IT caller exits with errno=3D17 (EEXIST) and /sys/block/nbdX/pid
> reports the loser's pid, and nbd_multi_conn flags both the socket-added
> and flags-changed variants ("invalid second receiver").
>=20
>=20With the series applied, nbd_pid_race and nbd_multi_conn pass 100
> rounds per case with seeds 123 and 456 - every round rejected with
> EBUSY/EINVAL, no regressions, dmesg clean.
>=20
>=20Tested-by: Tao Cui <cuitao@kylinos.cn>

Thanks for test.

--=20
Jackie=20Liu

>=20
>=20Thanks,
> Tao
>
