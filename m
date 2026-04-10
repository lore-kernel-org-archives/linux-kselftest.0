Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D93009D6
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775802711; cv=pass; b=LrvtSrHCjLOc5OZ8PND/qdnNDBufmt2FH7ErkobelBoYSpx+p5A9qp+LdQ0IA48F4aSc9ID0NC7Nz5TLzLU8tUMnZ80DVsArgOnqZDW7lpyjpjVhw+7EVRS4zg73DeOPvZAgFyoVpFiC5u8XoW2NY4qB9ONrCfK93C8ydNLf3sY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775802711; c=relaxed/simple;
	bh=QNv3RhMQ22/HNGeiFea3mpb5rv6rCJ9wjpXVgU/MM3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kSYLh01K2wC7t31Ti0lgeKczzQfWRTKVLG63EsdDxI/y4ByAFoo8kJxCjxN+ZgvqWGy/LJUAVBZFJDnRrk/8FXXXiFjalYNw4bdXakZnmVH8ohGzTGkqk+pfFnCMBG41iEBb5vou1TGQ4YhxAsM5s6qVAKb6/ns4huAmxAr6zUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wtaspdkx; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wtaspdkx"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c19d23b19so1679301c88.0
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 23:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775802709; cv=none;
        d=google.com; s=arc-20240605;
        b=iS1PTaeL+WAzsP0gCa66MFIzF521L/Wc4MHkzSFVTBZw3VXfUx0GOYZFi26Ar/W3/s
         bVsnbk2ypfMPTuxoSzuywmaf8ImK3Q/s+ojGt7FhU/ZA+7u9YoPpqAWFORIy8BihjdCg
         GScd5psAo5x0mH1cHjn+UxXgxyu5E2I225bnGqSczYCJPBtgiKhmorRGbwibbLcTejvu
         wEgEcp7R4odqOuGuHNFZ8W6ydMSKeNus5UJx9dxI3D0SuFd7msuUVk6ahSeyZFLKCItn
         OvxxnlifDGr7TmZDWhb3DfO2Qupuc4NtE1YcoYLmwYtgc1LQWnqBBX6pM11zAH6sfoma
         GcZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QNv3RhMQ22/HNGeiFea3mpb5rv6rCJ9wjpXVgU/MM3U=;
        fh=2QoTQ/Wt+FG6YvrluO6bF1xR7o7Cvu43EhJTCWAtRlo=;
        b=fCjQNTEnPhDzdoDNaRu4fkaOUbPfy93TKPTgLQHpCeUVS89XZyb1H0BUdeIVLGJP1R
         okuF4V2uxfSX2eSFZ2kQ44cB/IzNAo+1NfOvSirsHu98C8AxnGojREl4Fizid9GfmEjZ
         6JB/4u3zBvbkJnT+E2n/I1SzIo/3zhug9ajwCjQ2Nmx5t3v62+8Aamt6vst9M42B2rMQ
         UIUIWSdMd2C8mn+13OlvlTMk3peYCeN/A49R/4IlOeKun6S3BvmjSsqG1CQE1/n0NZTL
         rSlYRDe+B/tjvkYFNbv5YKrPE/FbskPtbrssG4sFnz76wOZmr2IDdlR3TaoO/FQCT+Xx
         ZTng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775802709; x=1776407509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QNv3RhMQ22/HNGeiFea3mpb5rv6rCJ9wjpXVgU/MM3U=;
        b=Wtaspdkx9/vcBf79AFYMLvjDEB2yDlsDRwG49SpclNsrxpl4Ygcus4Y/SiVueLVcF3
         M82n8BdxhBvZah3jdkyvofzIoH4sboXAh/H6AWHIryo7hKb/dCooueBu5tV2PRzvTWQf
         yQFZVJAbCWOcTZcYrVAzEgnuPv1fKr425rM+E2cIH+7lykZtXgCeKZJeebDKuOwHyqHh
         +KryBrV2Xv7qI/gRlpHgcv8O1coQCaPuxxzEutOXjiL0Rvdxxbbia5a08W+DbV3i0FBx
         wo73MJ90sNH5zJTJGK0YAWoNRh2g19mCDX+N+yR3ojl/DxhM+z3jO+PzrLo3MZeHjKm2
         2eTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775802709; x=1776407509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QNv3RhMQ22/HNGeiFea3mpb5rv6rCJ9wjpXVgU/MM3U=;
        b=q9U6Nmiw/DIfgH/mf7gyDx9uStmNBCWTdwtkARm9si3Agy5+9DnOD/117/d5Go/605
         f7eBY49+WPqyAOv7fQdc4Z8mSig/v9jMhFVklIdhmcTyBECtenIbWrON/Mzh2JHNzklY
         n9+m5LiPlMQGyCMTbfMzHMjO8FUyiVE1KFLCNC8iWXCKOMYq3n6HDykSOl6+idEN4kam
         KjJehpCZuza/OZCF1w87ihYm0ZTU+aks4f5nsvFsIgAO9PUSg2f/cTKzD8A5rfRzJ4Of
         6B3lMTzmhAw1LiIYA3kLjht240f8WgR9/ncpZtqvF4nfY0u6cJdQisKHWqT5/ciKiTcV
         QXCw==
X-Forwarded-Encrypted: i=1; AJvYcCVKqgxzvdOSglwj8uYbEG4oU5mwj38YDuKyLpTfe2sNTjT6ZurnKL6kO3mR8xOO+20Ty1GLGnGY9NGi9gMELwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqbHfZoxJemsHdYdU4Jwr17YYqyyIgE5X/tNnJc4XmwknZMJ3B
	LBKHyhlie32YeiwcsmbxTku2zRIokihxMVdjtbrm4V3kNMSodt407Lr76EAWUULmxuSwrenhsK5
	1Uthp6osopWYqbAyT0R4/JF+DIFT/TXpChPIVcfBS0ua6LvljSP0NmEwG
X-Gm-Gg: AeBDiet8vDT0ZPYEkqvMY9Mt61+w5K4QElQqW/bbwZ2LiiAyoCCD7NXXqK7lRQuFyil
	ZvnhLU5oHhLEsN8uFceYeTvlmO/S8rolJjGdOGNeiig5R60yyX+CuFz/YOeluSSVXH/5N/G0+QO
	g/HCeFZ017UO8lcy/jEaLZjnd2RkRIHolgUpyLSacBDAFRd2WDmj3H+wzIOPKx+WdArscS1sAbw
	tiTqa/5KtlHtLz+Zg9XtiGkk0zC1E82AX1CnTF0HrNR0XP8R7z///wyB3qkWbEHRy7ncsTtDey2
	R/sL3aNjSJGfgmAXt4yD2pIG5vhBHEHrbLWqHGiKhvml4bbIeZxLpi/2uWdCWa0FBC6fgbbuFOE
	2nUbxSrM=
X-Received: by 2002:a05:7022:62a7:b0:128:d577:dc21 with SMTP id
 a92af1059eb24-12c34e712b3mr1131056c88.13.1775802708539; Thu, 09 Apr 2026
 23:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409-teaming-driver-internal-v7-0-f47e7589685d@google.com> <20260409-teaming-driver-internal-v7-7-f47e7589685d@google.com>
In-Reply-To: <20260409-teaming-driver-internal-v7-7-f47e7589685d@google.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Thu, 9 Apr 2026 23:31:37 -0700
X-Gm-Features: AQROBzA8Q1_wQjFZKHsKZk5TChTM4zsOPcW8aryfLwg8I_KCeqgeADVGzy2JxF8
Message-ID: <CAAVpQUArYHi6tDXhdrDUnLxBGBZibKnqbOvRr0mJvrdfu8MwYQ@mail.gmail.com>
Subject: Re: [PATCH net-next v7 07/10] net: team: Track rx enablement
 separately from tx enablement
To: Marc Harvey <marcharvey@google.com>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 7:59=E2=80=AFPM Marc Harvey <marcharvey@google.com> =
wrote:
>
> Separate the rx and tx enablement/disablement into different
> functions so that it is easier to interact with them independently
> later.
>
> Although this patch changes receive and transmit paths, the actual
> behavior of the teaming driver should remain unchanged, since there
> is no option introduced yet to change rx or tx enablement
> independently. Those options will be added in follow-up patches.
>
> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> Signed-off-by: Marc Harvey <marcharvey@google.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
