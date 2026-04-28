Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC8147B42E
	for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401987; cv=pass; b=EJyw+YZQJKiE+WDUEXmJ8J7531LO70cSEhVzPlSydIzKU7I4jNL6Q/8xd97IbxZA6whlQmUtkUTVR2uT1Aor5BMgzBqQUypbzR+Q+ASewU/F5RwrDMluclGw9N9FER8V2nx+Y1XP4FQhNdIPyNUIyjWQ6AXZ7N06rryveSbU8L8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401987; c=relaxed/simple;
	bh=rEtiQB7F3yfpKTXtDE6xOEkZoEUEpURybsk0EzNN1vQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bn+IYm5GenxHHGocG1v6QUoJVP/xr/EAm2Lo4GrnbuVXjY8wNDIyNyo32kjvuXvudny/DRExQ+NJhFxUIgXa3u/0vZSkEvLzez8VtXBQMoijf0Ak59DtUthxaLYsc4IJcZyRGt4Pc8jw+5uBhLIIoiM9nxB7YzZ6gO9OYVM4OvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nly10/IP; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nly10/IP"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12ddbe104ccso1967353c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 28 Apr 2026 11:46:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777401984; cv=none;
        d=google.com; s=arc-20240605;
        b=H9USlRbzghL/6qhrR6O0pmiTsP+60FAJidEKxiMoVpyVebEOW85Mp1/B+esbxH6E8v
         u7qtr9N4P7edzpiyW3wxLl5trpvbO5rBJsc+rM2gFy+tURT91NMV9shU4MNmUIW2NLuV
         k7nM+lYNmj7yQgKk2xZq80RxcYNMeJ5xjcsaeE8I0Johx+nBJiI885hyFREgPa/pu6DD
         tSQrtPt0HPubR6M2yDiLhfRQtZwhJN7zw/DI3ZAw2EE+EOXgNDQR5Z8GNxVOHE0P1URs
         bT3l55FFcsOpS5MH+cEg9//3Q7dz/KofIl8XmyTcMiFhoh/pqPTPxfZIGKzGU5bwtrDi
         wS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtWL2Nmofu08jaaEHqPK+HWLFx++QkkniP+LH/qTdYE=;
        fh=VHsfkV4riEte2lT9HwseMNuhhOPHZpyV5MNjeVAvNy8=;
        b=J4YgOtsIZltOJhRyIG4Tt9oMsQ4yLZAjVdGgy170jCBe77UwcXXOyANmOYYMncKYlZ
         Xdm/7gBmyR5ETkb/PQUXnZHSPN4l/2ve/SHFp4PBwXcwfkdKSZYuL1VtpecvO+NF+YpZ
         x12/ksBBPAit1KRK0LCiTik16frYbg3l+A4ZZJIwFmmnexocwpHWT3KI6CRHDjOmHvlX
         kCt25z7O4134VPH3PiRDBZLXWSiVJk6j5yrJfpQzh6ssQ08C1oLmK4IHgVE/PGQCryKd
         VjnqXBxkapzBJ/i2Ij4Nj6wBNh4WNYBo2IDRFm91qQSueHjFpkv4bXc85i/543rXma0x
         KrLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777401984; x=1778006784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtWL2Nmofu08jaaEHqPK+HWLFx++QkkniP+LH/qTdYE=;
        b=Nly10/IPrXGK0xUIyGHWhiMIa0B70CRVp4Yqm+ey7CL5w6LEtPzKz+TX3E8UjwQSKF
         thFpdCUgYEFoK/4PuJhdCrpGUkqki59kBsf1vsMW8zxufiDZRi2yNu1FD9AI3HeaAwQL
         tov0T//mvg4Z/L/J702qfseCMaQzFWiuuRTr5Zk0H9QbJMskp5iReiuvy5Rzo7gBsWhu
         2btWboWQfpEAgow/HGf4eYzxLVB3DkRNtUsiok+x2bpjTkJszmwYsHkiN2xksjaNTV6y
         CDVvGg+UR9CSLBAzGBTIYUq7s70zp9Qld9IDaTYaaXf6+dCahLo5DsCkQsdQsu51IML3
         5Wug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777401984; x=1778006784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtWL2Nmofu08jaaEHqPK+HWLFx++QkkniP+LH/qTdYE=;
        b=Jj2St2JAvYSsjm+FWf1o5+to0LAVOIxQ05iW3333UYs+tzlIPOMkFlYRd15ryeTC6n
         CifY1gIl6qylCEHAi5kxM7jdUO5yhm6EmVRh4tC8EXiV+3AhZ9lBOtmoNefHr5hXwi50
         9i+cZk9gFX2vE+BDqeUUAoTTPV3AyVFPhD5ii+/z35Y4088VjMfuqFvQo4xTc80PIcZV
         lp25IbJBR0Q6BYeXAbpS0w+NPBsdXOYzktXsXlzjJVFBsxwizAxGuB5QpWl9/arQtowy
         ETGoN16tYo9WanGQiP/DS5WgzBGDO8vuwY1CST27eXWMyQ3ceAGy18TDLFHMLxxjcR1l
         1aWg==
X-Forwarded-Encrypted: i=1; AFNElJ/o5HSY3bKMswqbHSywRpEjmj8dSJJr2COCkLA/2zsOz4C8DFlcHzodj/tQzRZ6jLx7t3dk7WW09j5JMqiIB7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/QSZHiZfI5La88DiEd1krcE6Kt6RlxEN7qRQd3VmmDokGQ940
	2hn9haI6oWZbU+mcii9CXL9QVZ4NOUSJcyI28wC2h5f+LG91V3v24z6N0ppL7obsmKMwILqoOR6
	phNEAWt+l8KA9fFJcKchblfFaSNTES/toosFlyEtb
X-Gm-Gg: AeBDiesuH11Tr8p5r3VRnT4Yv/jsOMcKLjvX66P9VA8CqHDRUh2wyK72cLwxRu0Pzi9
	YDtEQv7u8V81a598cDlo8j/nZtJXV4edWtYiVm0tySfp+TFQM92BV3dlTb1NR+UwN7uTAi7No2Y
	raIJ/R2eUCqv/WWJ6ZyeJU91uyHKm4tcBMfmXsAZxkOLX0P86Ynb3tCfBxO8/GYikknXSowY+Qy
	Iyhm05+kD9lwEYIwohacodivDES1eWoPchPZbbajs+jdAWprLujZUsHrsOLW/WWJJ3AvKNfByWr
	4aX5Mt6XT4gH9zwsXv1QJQ23JIFzHb1qPYJuLX7yBnLzwOs/jsbzjd4YqUQqL7mmyFXURSnDs4Z
	HkqrHG5v9ZqHR/NDrHvF2pdXJ2K3WgjRpClAiT94OXdnUzoUJvj3bPgg0aug1T/WaL0W+gQ==
X-Received: by 2002:a05:7022:4188:b0:11a:342e:8a98 with SMTP id
 a92af1059eb24-12ddd8b02f6mr2077359c88.0.1777401982374; Tue, 28 Apr 2026
 11:46:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427224243.3499162-1-sharmasagarika@google.com>
 <20260427224243.3499162-3-sharmasagarika@google.com> <20260428111855.GB571865@shredder>
In-Reply-To: <20260428111855.GB571865@shredder>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 28 Apr 2026 11:46:09 -0700
X-Gm-Features: AVHnY4LIPo9NRXAYKNpP_C7ZD7DyMGfYzFjap98K_N3B6fceOtmrPZDLKWUIZM8
Message-ID: <CAAVpQUCY_OEUj8UyrAz+RYfxL1konQGs4xKZQLdRMBxW-4kqDg@mail.gmail.com>
Subject: Re: [PATCH net v1 2/2] selftest: net: Add test for TCP flow failover
 with ECMP routes.
To: Ido Schimmel <idosch@nvidia.com>
Cc: Sagarika Sharma <sharmasagarika@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 4:19=E2=80=AFAM Ido Schimmel <idosch@nvidia.com> wr=
ote:
>
> On Mon, Apr 27, 2026 at 10:42:23PM +0000, Sagarika Sharma wrote:
> > From: Kuniyuki Iwashima <kuniyu@google.com>
> >
> > Without the previous commit, TCP failed to switch to alternative
> > IPv6 routes immediately upon carrier loss.
> >
> > It would persist with the dead route until reaching the threshold
> > net.ipv4.tcp_retries1, leading to unnecessary delays in failover.
> >
> > Let's add a selftest for this scenario to ensure TCP fails over
> > immediately upon a carrier loss event.
> >
> > Before:
> >   TEST: TCP IPv4 failover                                             [=
 OK ]
> >   TEST: TCP IPv6 failover                                             [=
FAIL]
> >
> > After:
> >   TEST: TCP IPv4 failover                                             [=
 OK ]
> >   TEST: TCP IPv6 failover                                             [=
 OK ]
> >
> > Signed-off-by: Kuniyuki Iwashima <kuniyu@google.com>
> > Signed-off-by: Sagarika Sharma <sharmasagarika@google.com>
>
> Thanks for the test. LGTM. A couple of nits below.
>
> [...]
>
> > diff --git a/tools/testing/selftests/net/tcp_ecmp_failover.sh b/tools/t=
esting/selftests/net/tcp_ecmp_failover.sh
> > new file mode 100755
> > index 000000000000..f857d5db84d8
> > --- /dev/null
> > +++ b/tools/testing/selftests/net/tcp_ecmp_failover.sh
>
> [...]
>
> > +
> > +test_ipv4
> > +test_ipv6
>
> Maybe squash something like [1]? I ran the test without the first patch
> and I get:
>
> # ./tcp_ecmp_failover.sh
> TEST: TCP IPv4 failover                                             [ OK =
]
> TEST: TCP IPv6 failover                                             [FAIL=
]
> # echo $?
> 0

Thanks Ido, I completely missed the exit code.
I'll fold the diff and fix some shellcheck warnings.


>
> [1]
> diff --git a/tools/testing/selftests/net/tcp_ecmp_failover.sh b/tools/tes=
ting/selftests/net/tcp_ecmp_failover.sh
> index f857d5db84d8..8b7a2d82c442 100755
> --- a/tools/testing/selftests/net/tcp_ecmp_failover.sh
> +++ b/tools/testing/selftests/net/tcp_ecmp_failover.sh
> @@ -205,5 +205,10 @@ test_ipv6()
>         cleanup
>  }
>
> +require_command socat
> +require_command tcpdump
> +
>  test_ipv4
>  test_ipv6
> +
> +exit "$EXIT_STATUS"
