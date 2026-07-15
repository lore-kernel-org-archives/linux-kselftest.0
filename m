Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095F2435AA2
	for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784108203; cv=none; b=LvPaf9EPjGSN92HG4fu4bOTD/hB6c5D+BZTpak/x4TfVXyGdzKChyIGMM0khMHIQOFcTiNRtxCOVYgsCp/+ZrSD0xHHLw8dduOiuU0RqIFVPeEUDjR1VW16JpC4quddqcy64sE1HSSxm5pmLGpO22ot3DZ9YlMXHnxASR2/uDJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784108203; c=relaxed/simple;
	bh=RbNCtiPz5Mwa5Td8hXh/+B4DFH6mFTZx9EuRAfA3MKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkiLffFdP7VenYl221EyvuJduOsbNcep1ivAFaKKdoJZYVP+HBmBpDpBpjTSwWvayrqllOPDsXe596WBqAdrEJC3namVgqDdJsPXSXl15d5GAdo2XOINliO2qGPhy+DZgY0hs5hxepz9RIAKBZ0ma1jZVqdgvzpox74mkRTx6Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QK4w1n/z; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QK4w1n/z"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f3e6cc44aso2748632f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 15 Jul 2026 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784108197; x=1784712997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbNCtiPz5Mwa5Td8hXh/+B4DFH6mFTZx9EuRAfA3MKM=;
        b=QK4w1n/z34eIYaU8kCpl4NfzDYIb7ErMJUXiTNqLdUF0pykqJBx1el++1WZHjhOYLO
         mFoVAe0FNwAAQEVVPUNuLZkqKwCLVh1mSuF3HzNsB3ewm7XS2/HMgzno7ix6zPhFLxsP
         DDd0DUg1Yw0BiblR66jOKQ6xEKvNV9A1PxaUXl8H2BFXRYnLRhre4WVU7XI0evIkQTJ9
         +hzogwEX0nZYn4Ju1k4aD2JdqIxQgn05Zmo9SLv9sbM9fW/yM/fN9KYmBHDazIURCjZh
         E+0+4Be+X24J9InYLe7undA+EU5mzf4y8W23P1ZlEA9Nshu6fk/OO0g/1goTrZ3TLPCS
         LWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784108197; x=1784712997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbNCtiPz5Mwa5Td8hXh/+B4DFH6mFTZx9EuRAfA3MKM=;
        b=N6VWQKKvR7DdqGcGYmwH7UxhtgW/zTsOtGJUeYCSRBPyFRBFEB4K57pyLiXxZQ3ZoU
         ejzrs8cdTx8OFR40DX67w8Keec5szpYtenr7k0nrDlGZ77NgPqL5N15uymwTmBaBgi4Y
         PaOaydx+k8ZcdwZK9ymbAssOtFzmPafixoQMwLiePjdxUK8HidcLtfvVArNpHq+/9qbD
         iMfEOpTEY5fwNd6W9YAUV7ZbsHOTVe4I1EGgwcCulFk9guMloMGvS1IUmEp3oLghezOc
         dnbZuTU6M+PL4vFfyBiNndx3IGOOsosQ+8C1oZblWs3U7CpmFP1LCcKalxf+YgEGJ4/i
         1NaQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZGDgKWsgZ7kXFeG42uj/B0sVSJlWFmHUBTkRGrFvmceTV8JJNhYZ+fl8/sSgcAhQk/v+oE0bP5raQ4BQxY98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2q2VB2LkISL5fan7lSweL+0S2t+bSShulwl02klu6s9UwJ9aY
	rJnIBN6Wke8PWVKZpAjlofec+oR18yHIFkRuTyygxN+1CiAxg1QGp+YaMYBwLm0qaHc=
X-Gm-Gg: AfdE7cmwOG+UDQHQcAX7khru2QKsozdDrIC3KLkajtOOmKtvz5xozmjpto1Y61w1nEt
	ZNm+TnlxwWNEHbUUdt6QMgTNAKpfbgCkvAz6oraoCuCGfyXVmdprnrG9wgNaXnbNmO/PSP1Ozb4
	1LNFsLufJLzJ2kiWcPQVAAXhXZdl7Hnr7D6rhdhNpB7u75nd7fVRqca/X0buGufG7YgF8iytTIV
	yIOGYjSd0+2YogozFh13dUWBK6ol5AHzGkQ/nF0nO2i/W+MZu6xug33zQY+ADQtZm7GG79J8Dcd
	/ALVtrl7se5OapfNODvuVsIXLRn1HuLyi+JFv3glzdx9vmkfqScFf/T6Mszlpb4yGxeutvTulOg
	JKzKHfO+djypTSaPOAwiL3yeg+VBNTZng+Nl4cnezS83XD9reBn0SI17z5QzhZDLKF/plTvEptF
	3cHMcuCd+RtTDj0jSB5FyNahWqpv+JPRFs4I9IAA==
X-Received: by 2002:a05:6000:461c:b0:473:506a:e47c with SMTP id ffacd0b85a97d-47f4886399amr7394061f8f.26.1784108197277;
        Wed, 15 Jul 2026 02:36:37 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c30a9sm14495687f8f.31.2026.07.15.02.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:36:36 -0700 (PDT)
Date: Wed, 15 Jul 2026 11:36:34 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v2] selftests/cgroup: Fix intermittent
 test_cgfreezer_ptrace test failures
Message-ID: <aldSsQAboD6g2Sso@localhost.localdomain>
References: <20260715035446.565625-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5ueouq2lhiett7pq"
Content-Disposition: inline
In-Reply-To: <20260715035446.565625-1-longman@redhat.com>


--5ueouq2lhiett7pq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] selftests/cgroup: Fix intermittent
 test_cgfreezer_ptrace test failures
MIME-Version: 1.0

Hi.

On Tue, Jul 14, 2026 at 11:54:46PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> It is found that the test_cgfreezer_ptrace test of test_freezer can
> intermittently fail on some architectures like arm64 and ppc64.
>=20
> After further tracing of the mechanics of the test_cgfreezer_ptrace test,
> it is found that the ptrace(PTRACE_DETACH) call will spawn another process
> to perform the detach=20

I'm reading kernel/ptrace.c and cannot find a new task creation.
I'm curious what is this "another process"?

(Or is it referring to the child_fn() process from
test_cgfreezer_ptrace()? Then I'm suspicous about the transitional
unfreezing of it after PTRACE_DETACH. Wasn't it rightful expectation of
the test that the cgroup remains contiguously frozen?)

> by temporarily unfreezes the cgroup and then freezes
> it again afterward during the detaching process. The reading of the
> frozen flag from cgroup.events is done by the main test_freezer process
> running probably on a different CPU. As a result, racing is possible and
> the intermediate unfrozen state can be read leading to occasional test
> failures especially on architectures with a weak memory model like arm64.

What state would the task be in during this window?

Thanks,
Michal

--5ueouq2lhiett7pq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaldUnRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgBiAEAtibykYvZC+3Kxm/NzjT1
GszMpvkJPqiA7qKlwDnJvMMA/09aHmm6drkw1dia2aCU7YAPAnNa8o0FUlrsoBBC
gs8E
=tW7/
-----END PGP SIGNATURE-----

--5ueouq2lhiett7pq--
