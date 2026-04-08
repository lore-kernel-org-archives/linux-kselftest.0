Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91E376026
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Apr 2026 00:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775607171; cv=pass; b=Pydv+IdbyZILZZNEgM4Lw5jw/wqU7y9kHrRr7uCdtFW0q169eU0oRiJ09c4uwttOjjgGAA2JhbAMJUREDrIM8MeB632MS7QFOZpOIUEajtxM9L53vwL7bWys+JOMiA3RACpkaj7ahGzKM244xuEar0JrA9c3bi/owhvEqkePGTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775607171; c=relaxed/simple;
	bh=Hq5a+9Z7xklW4vTTDEilr89dxjbEY3dhoQCa8Qpb0FY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUp5cx6IpOuZbidlKLxAGTbtAy1kZNNDvrJ8qVc0hhX045tAa9N184qRqX++x+c91V93Jt5fAhlI1VhrIAMQLVY0Xzy+sr3CTk+pQ+XSYvvTmqN+fAXiMFUBErwq1ey5CY6xCpgdfDsjs1g0WCnde3Dlrl5wv5DSYngPs2ArBYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pdVGUQkX; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pdVGUQkX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b0dc690bcso2795a12.1
        for <linux-kselftest@vger.kernel.org>; Tue, 07 Apr 2026 17:12:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775607168; cv=none;
        d=google.com; s=arc-20240605;
        b=d6E+YSJ8GvCw9v7tFvE0EqUGczb5iqttv+7+lutZS0u8SrWMUX+vj7QrUpBY72HoQk
         SVlBKtXzCWcAncPM6wMrEvaLWmHIp3pdyxuDwbxfwpsgaeCnGfDfn3p8zKPkBJMXIDTg
         W+JvFL5LgWbWx+9hMTDwqAOhnweey7mbwwIWmUvJdFPCEPW68yszUh6sGPGh29puA58H
         v9E1mItyh6WR1hDh2+reqpJVVPUE9Wrwk3179g9zxLAVUohWbvoVMyHjR9DDfHQypFFX
         Zb+1RhNNd77hIAm1FVgTUcVwnueCNQArjrjYR46PQAp9BwQdqnjeF9WVhRVDzq0Y2AEA
         6MdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hq5a+9Z7xklW4vTTDEilr89dxjbEY3dhoQCa8Qpb0FY=;
        fh=n28Zx5mvR36/KLGmnG/MPZ4kL7392grYAzABXvVaMvA=;
        b=MTEvFveIsbZh7OIDB6O75viQokVlx04oElQogqdXjyqK7lhR4o3CC6YjTbpivYA+oQ
         hxNBwzddWM+qGWgohdO5Vs/uzhRt5zeMWSc8unNPHtpOX8oGpHCZGkqjgIA0mjLDOaTn
         VPmoabSoma2XSftvienUJWe5YNVRuPm9nQTPqDpc+uArstAnHavUHPD/2uhliBGNVWfT
         TTr7n8Fy9qJoOplxKyY6GEneQ4/FB7NxEgoZ6+tgnt3zui6JQ++fzD8brs7f3ckLvyf+
         wrBw1A1gU3c5MCQG7CBdwUliNVZNb8y7Tk+Nv6Bc9Ci81gdS44xNrz2/jBn3OaaW1o/6
         psyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775607168; x=1776211968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hq5a+9Z7xklW4vTTDEilr89dxjbEY3dhoQCa8Qpb0FY=;
        b=pdVGUQkXDMlo1yGRpdb/bvNUZbVs/vtDUnnO3ETpz8E+rUYIWI2g7CioMICQovsd2g
         HH0OwNEY072akA9bXKXb70za363CrdRKi71XPQ5kMajEx8DJv/Y6V5AQfqBrAfBTPFlC
         FhwUgcLzJAalDQJc+4x8gKINq47KiKOT6KHPU+0f4pRsK1nrGyTEjfJzgzI7YbIfoqkb
         0iTpv/6YXi1qIItHFW6wKVn1QnMONLdtgYls+AlldbRqCCxJbsauK7QwmeP3+XkpPaUe
         TkirifTxX0sc/8GXAPMxP8fB1rI76NgHzqwl2CggngyCDNyiolgZ6EnJCsMo0gxV/gq/
         /EzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775607168; x=1776211968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hq5a+9Z7xklW4vTTDEilr89dxjbEY3dhoQCa8Qpb0FY=;
        b=kaeqYOxXyfM/HcWFJ2y5dUhaR6qQLs/2lL+LyI3ss+IML9wIJJ2TrnDOfOXHtGS6qB
         2Kq6kKfxW2Y3aaiW7xyMcsGIbuvMW0vETuNITloxjacCFdH368dCLzUdWfH97ZGPlyjC
         Zp2/PzJvHOayWCh71qLVBD/R/ujr+TovFickhdZF9rpHRz1qN5NQDc6ncIXIANXuf1Wm
         eU6swjFovesqxBSO5RjVUHfVbzbfbU2nA7eDuol3jiyf0Jt3T6ONYm9MdehPVzch9V9f
         G+YK2FnDRL1muUt6gl/HyZEsWH/m+r0NWHkRVVknURrbPidhcDAHaP0U9NU0AndEOTVa
         0a0g==
X-Forwarded-Encrypted: i=1; AJvYcCUHW6R9xUtCgxAmmiIoJaPI7pKYahrNl/XrgRwxwaEJafTowlX7gs9m2bOqTALDtXaODuf6gdD2ne6Nylbe6Ks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA1ZLSq564UnbddK4r/mIyP90LaxXUq1Jf6nud13rNTAFIpjee
	zpW6M/RKBCIUdIKK0ew5ukfRzfqDbsYrD11FE615h+Hxtvnh3ucquRuTIUJbihovKTFOTG6+M71
	b6gW/amlYnmE4vN9GKCfpUojDBt6xJJncDUfVGKy9
X-Gm-Gg: AeBDietRUpt/Sst7JHje+HYIrHUQ2grHmqJwkV+l1VFQUzo0xrVhAZoxYzW/LwBnodJ
	9F0yanmna92KFJnSW9E1ItSQ3JcA0FhReJRzqtqrH7eyUbb1B4n2dVARdBtAfm+/EKD1ggWtkBN
	w/IQBiLFewIjlwqLXVcbCavuzJ9nsmLy7Xu3Gc/FeKAPLDwWTDFd0QsrtHzBf91lPAuZtAaLSOm
	p2FYZw0STVoxtvqPckvYCrjUC/a2CQxLVQ9/kkgXSZGke/oSjYJYoAzjgXlyzV5cQNNPSs2PYr2
	NSYhr1M9s0urc/y1/NQgO1/5+ZaFxHI9aZx/RSEpavACZSSScw3NAH6ksp0N5OWk+w==
X-Received: by 2002:a05:6402:400e:b0:66e:e3f9:ebb6 with SMTP id
 4fb4d7f45d1cf-66f9eb0e641mr15274a12.4.1775607167874; Tue, 07 Apr 2026
 17:12:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406-teaming-driver-internal-v5-0-e8a3f348a1c5@google.com> <utlz3oebjyd4lqp5pd4qdbth2kywxo4hrlrnwcxsx3br76fwfg@vy3tx5f3lv32>
In-Reply-To: <utlz3oebjyd4lqp5pd4qdbth2kywxo4hrlrnwcxsx3br76fwfg@vy3tx5f3lv32>
From: Marc Harvey <marcharvey@google.com>
Date: Tue, 7 Apr 2026 17:12:35 -0700
X-Gm-Features: AQROBzCE4KyLZl3QQoeKiTuqJ5qKwgmhvNqAUTtOXd9q7AJJ_ruBCFl-97d0z_g
Message-ID: <CANkEMgn80UM7+mymVm21Q8yszgVeh029tvO+kHqmLGmf-2MU5g@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] Decouple receive and transmit
 enablement in team driver
To: Jiri Pirko <jiri@resnulli.us>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 4:55=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> Mon, Apr 06, 2026 at 05:03:36AM +0200, marcharvey@google.com wrote:
> >Allow independent control over receive and transmit enablement states
> >for aggregated ports in the team driver.
> >
> >The motivation is that IEE 802.3ad LACP "independent control" can't
> >be implemented for the team driver currently. This was added to the
> >bonding driver in commit 240fd405528b ("bonding: Add independent
> >control state machine").
> >
> >This series also has a few patches that add tests to show that the old
> >coupled enablement still works and that the new decoupled enablement
> >works as intended (4, 5, and 10).
> >
> >There are three patches with small fixes as well, with the goal of
> >making the final decoupling patch clearer (1, 2, and 3).
>
> Looks fine to me now. Do you have libteam/teamd counterpart?

I don't see a need for this to be used in any of the teamd runners.
Libteam should support this out of the box, since the options are
identified over netlink by their string names. The options.sh test
uses teamnl, which uses libteam, to set the new options.
