Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B692C35F61A
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 03:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011114; cv=pass; b=BBXKHjwEbkwEZjGrXD8SSc+UX7SLf8m/xvlnHaKkeena3CNAgAPU72NpX6K3yEUg2T6CRW1Hojuxp6UG+DoO349A8Md9izd7tvClNoJUDadNwhdhnViNvbuJIAE4VFXuwEx5MQmw3EAu84mv+QRaoBamOT3FCRq4DkwTJ5p3lQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011114; c=relaxed/simple;
	bh=0qt2KD45sI21gJA6Y8we2ZoaTqnK0eJ/2/8zs7rPg2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRD14nQI2QuQ9EpKoQNU+zLCBs8VaxaFZy6NWUPoRw2s+XEucJ7JrJAs0G6l/oVon2veA/4CybOF91OR/YQBdj94bTvF33wXT9xfrcC25IdkELznHdgHlZYY9mxD73GZ9HnA9jkrHfqEdADuBKKFuFqZYMWE1ahKLm5UlLGEK5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ms/EPLff; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ms/EPLff"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c86945164so68333081fa.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 20:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789011107; cv=none;
        d=google.com; s=arc-20260327;
        b=rv+8Xl6ROfdAva9RA8WQusU2LUoJ/hMH50YKKAyy2F9BXKkLwZchgsVzPj5K0RlwUI
         76lADqdgwrFLEwY+lEzIyV0FFmdahfQEy4Qwu8gImnt3VTpGjPzHea7MbxE+dI/yiLB9
         NX2j0CR9pAeNYqetdI+5c7AxpoJIst93NjjQMGqExE3SJsDPUEbrrpVjhC5CRWtNScgz
         Yn2zJflsIfWHryw2PogIlSF+95vQvlTaMtZrNXDbg+wib/Z1TEkCxlpq20PVBb8coMW5
         Ik/PxeOKMbRIqFrbInelfWgQ4ZkxEkjLyLo/jnjnmBaJtviAhfw6y/+pmuIR3e/NMpHy
         YL0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        fh=9ZmFgkk45rAz18AY2xGmmPZqQD/52haLthg34c/z3J0=;
        b=QF5A1N4Cm49gOuBrPCTWkeKZCU6l9mGlQBOGX4x5wyHOmYv1d7qhml5eOT9Ee5CKYN
         d6DROHr3tNUbqqjtMxXIsldzomOtW9TDrzX4iZwEK/i6QDPC2nN+89JdbHWXTWLTq5+Y
         tOYPf6Sy8CblS2MPtmzvM/NaR4GnGG05+P2Qn+la+6GXDEzbz5l6mm6SLjMG6DquqOIG
         Ae3/ObeZjjyFxNXt+uk0gdcQzFyZh9zLHq+MY4eMcNgzT4r+tYwpFm/k6E6xADhd/Kpk
         ct5UzZAO09YAjnU3fMRdu1U+djtFUw0XqZqqv6A4grcwpOsoQUsPmwj3th+LBoVyV4oU
         guKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789011107; x=1789615907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        b=ms/EPLffD8msIzR/FUmEaJnrQRF9hnxnPWGpwvvs31pd6RlZ+LSWy1IFRMoA15N/QL
         jTkyQp2K+dZcrjSDFzuWkB8b1sKcc89/skNv/4ttjdWhYE9AdX7CsUYlaH1MpE49VN7E
         0wZntLhmZJQyol95sc79m02KvRwXEW1gkzCMJ7ir9kx/kLUEKwy7D+sVSgNdKTV3kV/i
         GmIh9uomugkXyVar4NrPq3em1NFO87+HrFLFYb8Xcq4DEaIYt007ykC5Mv3tfla7oWQK
         f+BlykiyoVI9DpnrfR6o5cUUhRGvawNjTG8EvKG4I99PtQFPXHRH5DpX5YRH9bD0L633
         SIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011107; x=1789615907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgbYbe2QCz7HfqnzJM/CyQ0tUDugBwRoT9qoRJLbqws=;
        b=qw667YNK7Vh3WOkvXp/dIJeXjF5IEMnpvYnLbSVSeaww45r53Rc3TToqhKP6tUmpQS
         supNi7dJHaCkxL4wz1juchPLC/DgXmf0kP7d0MZtl9kfycP2f0/Kh/Yjhko9TIe/RwT4
         wxdI8e8c4Qh2XJO52jIhl62UhpAc2L213NG+B26G9OtLWg+WtW8jWZWKiV8YeRq5y5Do
         TS0BhXPZNUWMeJuyiY+W8ASqcmOSXqCy7mXG7+XV7eeUwMczTCY5oe1S5vSzELHCQIEa
         FcnxeaDCEBS7Vnys14DY8VlveFNoHk/135JJuvrJOI1IVOnATV29qF6brXDJIoOmMGJS
         0PqA==
X-Forwarded-Encrypted: i=1; AKwUvBxRo76ciAPpF5IfCB3YoUAEn6Z8v5fqhp0T62uEHrh7oeXWYAO3/GPOIQI5+d/xjGT3wxiSlfEewBhjhES5rdU=@vger.kernel.org
X-Gm-Message-State: AFuF++lwtvplVuqH0nhvISuUdcH25j7vo0rabdNVm5agrVtraSih21lY
	mDEoWsduzLxq7os1hKFDgorykeMAGN8d1J7bic7/pwvQCeQ/sNnGa0onq0BvGlR01q5Rm6V6Ukt
	1eoZTEl6Ago882roCT0f0ATMQd+cxaEA=
X-Gm-Gg: AYBFou1Sp/n25bPXkCVxW1FaHHM6wnzeVZ+I0OBn+KmYOVQ04cCsYS0un7Vm/2o3NjC
	PX3vux1WKpWtqzMS7Aw22Ww3vQezlc5dRkdunu2X3AciQJXisLLV6Zj2WHIQ8aivQJNBmEq7rGZ
	Egsf4UJhqjsJTMjzmaeD6nIAPJ8P3QsGcKwvlTLiOnXPUGzRjmdS9iYuDWGJW2ny24lfyVD07Jc
	szbYsD/vjVuJgn/IG6f6ANPDWRshraCX+vidcIPRdbPHp5CWQ1U1h4X22TqMfhNmOamYwCAFaN3
	GwF/F2Kv8GfKW5uZjvknJ9b4xPEaj4bQFUI1pGc8SneLQFtgd4k4/J0Vfzl/SxfWWFOr97+GE8Z
	xot0JfTt/ceQ5oq8fGi1eNdqUCQsC+Tzsqq+rQFEBwQ==
X-Received: by 2002:a05:6512:31cc:b0:5b0:eda:de1c with SMTP id
 2adb3069b0e04-5b616f01f40mr7098978e87.5.1789011106564; Wed, 09 Sep 2026
 20:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909013401.14408-4-sigefriedhyy@gmail.com> <178900489529.219967.8506896899151263500@kernel.org>
In-Reply-To: <178900489529.219967.8506896899151263500@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 12:31:34 +0900
X-Gm-Features: AcwNN1WCpzOJ3A2y6-ht_UAZZ89UGnGJrkAmcH1fBbpeWT9y7b43gmj6FiS8apU
Message-ID: <CA+7S2vJuhbghvtYi7T+rpDgkXKG0Ls+kzxYnprZWHMVbYHsejg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/3] selftests: net: test AF_PACKET multicast dumps
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, dsahern@kernel.org, donald.hunter@gmail.com, 
	edumazet@google.com, idosch@nvidia.com, kuba@kernel.org, kuniyu@google.com, 
	nicolas.dichtel@6wind.com, nickgarlis@gmail.com, pabeni@redhat.com, 
	sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, sdf.kernel@gmail.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 10:48=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wr=
ote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 1
>
> - [Medium] In the new `dump_mcaddr_l2_check()`
>   (tools/testing/selftests/net/rtnetlink.py) the non-fatal presence=E2=80=
=A6
> - [Low] dump_mcaddr_l2_check() creates a netlink socket via `rtnl =3D
>   RtnlAddrFamily()` (rtnetlink.py:125) inside the temporary netns and=E2=
=80=A6
>

Good suggestion for the test case improvement, will fixed in patchset v4.
