Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24482D12F3
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 23:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788306601; cv=pass; b=P3tnMfuxq4C95z1uT/qDSeH8kx8p2Mk3gNwROR/E0N5qltNYUcpWtIyADSs9ij17wm6mWmuqgOgff0qFG8EOOfaG212vYVe81PYzcKGJd1LUo4sf6jMaAzjWpVI/2nA1DSdKPPgErFz4D0R3Ym0YBfZ+fLz8/iDcN8E0GEo/Cic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788306601; c=relaxed/simple;
	bh=dPJzEanQqyrmBG/zbi+dCASFIgPH8fUESOEkGB/bC1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MVwvZjfgdiciImB1A481Jy4WAVqrHO7Yryl9gejxZUKCya1/bwK+sjIKqy7795ZVX2S1T3otdt+MHTwGwI288viXtxHOExeFChljpCItIGTe3BlGGa14DfQPIGZT4YQWfnkqpNjQqgZzWMoaBHFWDFuKPPm64qamKOcGr2OlP3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IGJQI6YR; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IGJQI6YR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-381b831d535so681116a91.0
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 16:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788306599; cv=none;
        d=google.com; s=arc-20260327;
        b=H4mqy+dNl69R5IAsciqnC98zBkrB/7/tyDXgD0cQHikBIA+PTbk7hJABlMV9mRizWm
         TCAX/gMVknpZWrAeNaFg9HTdaqsyvGCswZ3mGZIwnnhT4GUpxPDzwu4rtWZfjDa0yD3P
         t3gADwE+x2oi1T5IvGeG/huLT6cdskqgORSUPbkfA6ZPBhAhiyDduNHXovfeDsQq1Zzc
         o7HHBX9subJwNaeBoyqULSUSkwEWYdLW005/s91zrN58MjHykYuBcO+pw2V2GI2VO1+v
         RiIV6KeSPg0huCWrTwYl9z9UmJn5mQtRABmNoV4jwFyDfygwMN2lfpoCSScHXNasM1XT
         x4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        fh=EHv/AhAAgqawI9FHOtF7sicqBXfk+jRUwFtszHyPGaE=;
        b=lNnukL9kgaZYZP9Jh+QBq+wl3W8YPgT8swnvO6+qL4lchtgixkA7ANqg85f35G6Lrs
         V/4tFnvumRRcF95p4D7Uz1BAG2XG0GQxVIcX3rgunQojFvcPTYq3Z32U3tu+kB4bgJFP
         6zNKNJrubpEmtYtSdva8vFdJcTM3JxftGz3Br8BQLdhMJeKy725sSaPuF2JigVaI+h1z
         s/2RaOIMdeonWrUFYPAX6ACPBEvyTgaKEE4kldE9D5NwWxlXkWPq6PhW057MnOGVQBvC
         rQaR9H9nVvs8V9dE+4QoxcKff2P7W6S9fhDChHeLHIOUC1ncM4byshU05nu1wcUgLL/e
         +OwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788306599; x=1788911399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        b=IGJQI6YRlQy/pKXfvM/g+PUGBxuhUPekFm45GWo1CqsfcWqPF6g9zvqPh172D7S2IE
         ke2C+9H06aISVT5w5F9Q6HoOLwZNPQEMmTon2Oj87wBkmoOr2qyMMomAXBuqZek6WC+l
         onDLXhscb0CU+QmDUifq/dJQu7m4LRCn9aFb7qgzYSIhR5m3akfTO1Zo1Mpi/RlC10dS
         /6I5Hf92tAEh8G5oTMS//Q7xPvOBIRAbszV7GLudJBCoigIpbD2yodX+V3y0/x6vdgcR
         S+Vkl1ljW+lVaADe7yF6RJui5UGECs6W5S4IfrQiHoXPGO8mRMk8X96zfxlG50hng7Qb
         3utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788306599; x=1788911399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGL0K+rHEhP7FLLFplrMez/ZNMi42ddY2XdwsA06r4Q=;
        b=rJSieS4GAMB/R+OC5H9EWs3jrjq7fjVIDTnMy/BhkDVeKyWYRolavKxkDJfbGZBjYY
         cU9VNHELV1y/yiBtiUhuxhutaQWo6m/xfmh7aPxTJrbIibVuFMJ5+LwNobYqV0M/BR8q
         09FnmFJzs7tvcwq8JQJzKttGr/CpozaI+PKv/jEPzMT/nABv/kEJM4dV4mW1CZIlDJmR
         KT//ZVnSVT3Cg+zae33OYkn+vfNY6285LSbsqxV6KQorobs60e4x2izrnXvjkHLpiB3q
         yqnvYnM9gFcu5p4GD6zF1Ir28esgL1dco6RI/586qls7+PzhCaBknLEsnmEXVgVd51zn
         nP/A==
X-Forwarded-Encrypted: i=1; AKwUvBzDB49RbR9KWCF6KvUmCR+5GE011T6BPaDHq6RBRmdxythW+Qn5eL6atIVdrEkEzLjRKpaBTvTlN7q8mhIf3R4=@vger.kernel.org
X-Gm-Message-State: AFuF++nlPk/W1IaA3IwXNR4nCwHCgMyoeYivl6HlTGvqO23GGQAQrD6s
	4Et/qX1EXGlWEM9qKvMG5CqVNoffCBm0GORJef7NLFVxEVckgYFVG1iUXcj5haBzE1/Q8qtsPxy
	TEkUgIvF8IgIg/uhq1zLQ2D/O0YJWUaPapeWVtYzG
X-Gm-Gg: AYBFou1YJuHqr3qtlgvoM4FnlHi9ojP+KUfXSNb5/9mC4b7Mn7w8bunMl9I6MqbkQlL
	amBr4S1doPO2cKaNYiJdQXBEe39DUrtJSga/h9gHOXj3QTtggPrJhOhHc0Rxgpg1Pw3VqOqVYOC
	axvPwPbKnJlLGZikHvjE2WRIIMXYi+xlMDO0nelYRgSxXtS6lGAk92nNIcsFDS5nWvyvZl8bseR
	jTZHpf67CLr1J3CyWXo80KKIRum+hxaZxKcEwJbBK5UDLupSW4svu0iaoiBfhxWGisfnZpOjhNk
	KpwTgm2VyJoSx+JUKSTLwpEFY/irbio0Lp0KqfJ+kIbJLOrkGtzaCsPwRLUZn4vE6dkxrns8Hc9
	La7mmGO4/vV+5F9qAehV4rmg2i5x2Re02QAAg+qd29Bx9wpUQVa1KrApMbuZavJjl2ecgra7XxV
	59g4dyoHj4U73cwc6NoATRjQ==
X-Received: by 2002:a17:90a:d887:b0:398:e1f4:bda1 with SMTP id
 98e67ed59e1d1-39aee260bb4mr810754a91.21.1788306598706; Tue, 01 Sep 2026
 16:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
In-Reply-To: <20260901071353.3302900-1-nagachaithanya9911@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 1 Sep 2026 16:49:46 -0700
X-Gm-Features: AcwNN1V39DVBrPlGQ8m1cLB-dsHFTxG9CBDxkaJp2jJkfWx9OsqVRWRq9rtEpp8
Message-ID: <CAAVpQUDd-HeM4XTufJsBchZq_Lb0in188aawzZUYPjRAGEzZjQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: net: ipmr: Avoid memcpy() from NULL in nl_add_rtattr()
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:14=E2=80=AFAM Chaithanya Lagisetty
<nagachaithanya9911@gmail.com> wrote:
>
> nl_add_rtattr() unconditionally does memcpy(RTA_DATA(rta), data, len).
> For zero-length attributes the callers pass data =3D=3D NULL and len =3D=
=3D 0,
> for example the RTA_PREFSRC attribute added for proxy MFC entries:
>
>         if (mfc_attr->proxy)
>                 rta =3D nl_add_rtattr(nlmsg, rta, RTA_PREFSRC, NULL, 0);
>
> Passing a NULL pointer to memcpy() is undefined behaviour even when the
> length is zero, because its source parameter is marked
> __attribute__((nonnull)); it is flagged by fortify/-Wnonnull.

It's not flagged since NULL is passed via nl_add_rtattr(), not directly
to memcpy().

Also, the behaviour will be well-defined with N3322 in C2y.

Given there is no real harm and we do not bother revisiting this,
there is no need to change that.
