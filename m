Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780A13101A0
	for <linux-kselftest@vger.kernel.org>; Wed,  4 Mar 2026 01:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772589122; cv=pass; b=FwM/dV8d6aGFxd5K1C3JxvBM6tRs9Nf8zaayXiYRkop4ZBXJ4SQnR2nwcVXePb8zO7G9+DtzfuFRQelnE3zzTWDl8cFD57eFU43csug6qGFzgVJLPZBLgJj2o1l17b16InG+BwiLjfVTktI0o/j4NN1g59iPNa93ur4CLGFPdvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772589122; c=relaxed/simple;
	bh=QTscViB8grxAPCOC78xs5ygdoQOVpxF68NTIhCjZGd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qrk/gO0rOHUH/fi7HCyGyw66uSs36r5aKVWEVwwRE55JsSQdgzAYhKY/lWhc0vLisQh5aKODXcu9UOAfsaJ902dGB41xqnUZ0i1CdgGJjnd6qnAjHVXQAtGVGspzu8GvMiBW4fkpfLbLn63P5Mor25AlQ8Am5mTKm/VHvlIgjoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmMYle0/; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmMYle0/"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-679ed01869fso2454886eaf.0
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Mar 2026 17:52:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772589120; cv=none;
        d=google.com; s=arc-20240605;
        b=OT0cas1ri1P7RVdGUfQew/V6S/5YeBDmyCGDObIRB6JF9G/4Zfg/c5EXZ9K6HlAQcX
         8syKjre3lt4Rw+ZmE7Eix2qEDnjTqU6xT+xb9/YEakzsIm1LgwCcvXtGp+ypGyUYUWwI
         vdf/FUJreOkJK2jJj0LXCxubmUrWIU8VAoEp2M0Bzw+JKtcCKkhbx7O6D71BZzljzc0l
         l9vhLWQ8bX4TClRflB0f+9Efbe99SUXU57nwZCK3zY/4rTpmMy8beMeby3M+FShtDbUW
         RXFMQGC4QzgbsuwDGy1vFXmrydtW2NdXeLF6reQ52aflZI/bA7wIGfeB2SvWewAfx+QD
         4jUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M6DDwwLbvNw2aNPI0sJJsmh0LIhfNj8P7L/0HpfFzVA=;
        fh=COTkYFdOYxSFOEIto7GPfbDzJgKjU9KR+H/MTW5SRcY=;
        b=Pxtx0zJdLcDMsoZB6bGG0cWg0RKf1O9uWKAwxEBJQeMyzCb/R9sNuGiwcaECsNnX4O
         v/ltbjaOmpTedY+EBy4r7uT8oFq+Hq4pw049XnRP6lV7Y8mwYgLXKs7lZcojjaZtRcdP
         GPqt7gEfmrMUVjh6wTGIOcObgzSnQwvHbUEq2Qg3PAbRn3YHRjA1ecx7dqV4i7kQno8N
         yLTwr9hDy1XGiIwM79kdn/ItGkxelMyEkCpF7M9XoDYywgr/mARrrvp9454r860sURV2
         K3AA/cyvBlbpGFxvTyJbPrfbkVIsa95y5T75bHrmtaZqdn5JCIVd4Xd4fdNCPcWvA/6y
         hA9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772589120; x=1773193920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6DDwwLbvNw2aNPI0sJJsmh0LIhfNj8P7L/0HpfFzVA=;
        b=bmMYle0/IHWlDUnHnDZZuuGRBBgdaH7No47+rVSbx8RxH+htECLHCuEnoqenVUOCLT
         cC1eGTP6EBz195pxJbin/CPALxLxO4feJ+Fw4djgHNRn6y4h1hKXC0rZuhViFR2CXsYh
         t7iF9RKKDxHyk1qJcAhj8u1vrDUlkwgirE0bVt9theGI1Hr8VkBJI/A1ewsIt8ck1FD4
         cwHRE6odQcKcv+0yCX27RTe+yLtSmkhrvVYqi/UB5rGhFgQSzBChAcGS8BIShTrFClzn
         yn58r03OdaDZHu+n4FRVC1eChWDrI9PxjSLMwVmnCjwKM50TAKHVtp1kd+iOtnjK6xmL
         WZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772589120; x=1773193920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6DDwwLbvNw2aNPI0sJJsmh0LIhfNj8P7L/0HpfFzVA=;
        b=oO+WNqtdnOI7maf/c6QWIYWjemUlsQIS5oJIfx4BzE79EmySscQtbR8L7qns/LUqbA
         /whb3D9qCfFvACKdV1dfTQGmaoL5tkUilXIxMa/EIKVy2ZhN8r1EGo8g8JrMQ/kpRYbk
         eTS1AHVpmVOd/XMRcNptb4HmvYWTAEAfB24KtnhMP0HbGXPsikTh6wIq0jfxKGZKw9HY
         N5lLfV3rL/W2IRKYccxDE2deAcOLdWEOKckggbiVq812PyAPjbKzl72sTeHy4VySd4VW
         Anqw/9uEorI+93txDiFLmV1iGMfdrlNMytO3A9oVPa/prIXs1rFhUYNtl3fGFP0JS3t8
         9Ajw==
X-Forwarded-Encrypted: i=1; AJvYcCXRSRJDyWzviJiD/n8zaDN27siX16t9xlFmA2WsTqVtjsqO5cbA+JET2pBez+20wdM5ZCntvpVJX4Ny1pnCeeE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVWNR7pKvW1+kzvunIZjNoBKI3yQTl+PbSAm9NhX5aXt0viSMC
	n06xoAR0KyGzppPGjQuUeZHK8V9LcGpoKsQG8ux6tzKsQhy7GtJqBkjKc7etC9Evf7B0CDAT5hW
	KImdxFiHsRGF7lvMGV2bFo0qayw9pc1OIgnIo
X-Gm-Gg: ATEYQzw9RGDLMFhb6FVeRD1TW6UoBKuoufaC71ldmNVPyzWWkcTeyZpBtd1gDB1Mfvy
	0h81yERvUA3V7XiK05nV/k8VYz2RBkAiwqsmLYXoBB0WexM3PhOUY4YB45VAeItoaQIgjthcZze
	EK3h/5tjstxdyKgytdWUwJerC535/hHl/t3gHOH0EHrbMdqBZ7peNv6KK+gHHgdQsBMJKIbKvHc
	O2jajEdXSmU+BXHfxrblWtzk9OugEOebFz4WHENXkbhgo76kZBG3vpx1f5SlwSC+Ge/dyFRzc0/
	NPF5+LG5eA==
X-Received: by 2002:a05:6820:2103:b0:663:40d:48a3 with SMTP id
 006d021491bc7-67b176e6077mr466708eaf.8.1772589120344; Tue, 03 Mar 2026
 17:52:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260303143750.57741-1-zcgao@amazon.com>
In-Reply-To: <20260303143750.57741-1-zcgao@amazon.com>
From: Taehee Yoo <ap420073@gmail.com>
Date: Wed, 4 Mar 2026 10:51:49 +0900
X-Gm-Features: AaiRm508utMxlCnXWm0XMHauHt_ar85nHp82rxSyqeJ69Eb5S7fy7_qQQswNDEo
Message-ID: <CAMArcTWhzfPCAz1XNv1YTTbRKahiar-W1jG6sHW2RP=74LXKWg@mail.gmail.com>
Subject: Re: [PATCH 6.1.y] Revert "selftests: net: amt: wait longer for
 connection before sending packets"
To: Nathan Gao <zcgao@amazon.com>
Cc: stable@vger.kernel.org, gregkh@linuxfoundation.org, sashal@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	shuah@kernel.org, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 11:38=E2=80=AFPM Nathan Gao <zcgao@amazon.com> wrote=
:
>

Hi Nathan,
Thank you so much for taking care of it.

> This reverts commit 7724036d4804222007689cd69f248347eb154793 which is
> commit 04708606fd7bdc34b69089a4ff848ff36d7088f9 upstream.
>
> The reverted patch introduced dependency on lib.sh under net selftests.
> The file was introduced in v6.8-rc1 via commit 25ae948b4478
> ("selftests/net: add lib.sh").
>
> Without lib.sh, the amt test fails with:
> ./amt.sh: line 76: source: lib.sh: file not found
>
> The whole history of lib.sh includes about 50 commits and considering
> the file never landed on 6.1 it may be better to not introduce it.
>
> Signed-off-by: Nathan Gao <zcgao@amazon.com>

Acked-by: Taehee Yoo <ap420073@gmail.com>

> ---
>  tools/testing/selftests/net/amt.sh | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/tools/testing/selftests/net/amt.sh b/tools/testing/selftests=
/net/amt.sh
> index ea40b469a8c1..7e7ed6c558da 100755
> --- a/tools/testing/selftests/net/amt.sh
> +++ b/tools/testing/selftests/net/amt.sh
> @@ -73,8 +73,6 @@
>  #       +------------------------+
>  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>
> -source lib.sh
> -
>  readonly LISTENER=3D$(mktemp -u listener-XXXXXXXX)
>  readonly GATEWAY=3D$(mktemp -u gateway-XXXXXXXX)
>  readonly RELAY=3D$(mktemp -u relay-XXXXXXXX)
> @@ -242,15 +240,14 @@ test_ipv6_forward()
>
>  send_mcast4()
>  {
> -       sleep 5
> -       wait_local_port_listen ${LISTENER} 4000 udp
> +       sleep 2
>         ip netns exec "${SOURCE}" bash -c \
>                 'printf "%s %128s" 172.17.0.2 | nc -w 1 -u 239.0.0.1 4000=
' &
>  }
>
>  send_mcast6()
>  {
> -       wait_local_port_listen ${LISTENER} 6000 udp
> +       sleep 2
>         ip netns exec "${SOURCE}" bash -c \
>                 'printf "%s %128s" 2001:db8:3::2 | nc -w 1 -u ff0e::5:6 6=
000' &
>  }
> --
> 2.47.3
>
