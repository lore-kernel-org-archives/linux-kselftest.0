Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191BA33F5B6
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002698; cv=pass; b=bQ75LwhQBVncsX2w645kKeuzlCN603zhl9eIb5vmXm4hGNL5iiQyxAQInhXidPHPYGJgOaw59HydeUl0ps1phdPwm5Emvs0Jmem1aSB5JRetYBHMVWerHeMvfZE4iuw5+R+xSUETjwQgcu629qDQZNoQPD4vLbOwLH/AFhTodsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002698; c=relaxed/simple;
	bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R6Mj5kcg53dvZ/X8jkn70CC/K6hZ8sEA4jh7596Av1PT8rVtsXmTKBX/4PGBTOuuZ3GTRtoqlbOyJbF0YxWhbrLdYbHj+nbgP49v/clLh7bb8guSxZKNHijmqktYAMTxtIVKcOCOtiynTcHWYLDw8qwamgdb72CXCFhndBXzTCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STo9fbMu; arc=pass smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STo9fbMu"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a4a82aa383so10540041fa.3
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 18:11:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789002692; cv=none;
        d=google.com; s=arc-20260327;
        b=LwSzzN9g+3Jl2b1pGwHYUd0qo0+02ww0lzrwUoYamXs2G7IzmoiZ2/qnBzCf0l9nWx
         O2AbWfvR+nFqbAtuBbFVJ8vwHfwg5bckwHaJt7K/O2prGAceWfnDDp+g/2JHRAeMN3nc
         9AIyV4pOXIfroGmAvPJ+h5UAzxKRA1Eq1oOZsMjTFvc6Q9hbYDltA9ZuDB/P15tGkCzn
         wH2aR0ZBbeAsS4NJRPJ/2y0+7ltJ/OSp2JQImyMlyOlwVghmtny3VTErwyYNniNblF2u
         RZotxONk/CTY3CxtaDS9CwjrjxG/YipQcY+YhIk83r3JRSQq4W1ppICekQZ2byPBZTQU
         qcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        fh=W+Qt7L99CVub0t+hHu7RxH3AjD30UokDWWF37tMpir4=;
        b=m5nBAdjr4AjufIZ46PqKNmn8Qes/qHVqoY7L6GGUW6R8r68qBhBpTYaZZUOiIyacL1
         HThqaWarkU1Gx3NSRZv4F1Vh3vfZGKUFGrQW8e1DUyCUh6FMjeFk1pHbPMjQTke7OyA8
         IF6uQ/Kaa0eoqnztQRMyZ4XjIfjLR3BluMWvnAF2YJ3cnSvfeKB3vbXN/2VA2Vbhig2o
         wtZljM1dtG4m38IDXySHDyE4UxZFH10d6qUsx57Vv70fDbuYWT6GexHo7ZLFg7izK6Cu
         tfUY33gx7V00LNDtQxftKwoItzy6viRyf0afLrBab8IvUmm9v5J+gbfz9FppKSkvrnuf
         uH8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789002692; x=1789607492; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        b=STo9fbMuqQfrxCCADuP2rbP1sidSRyFmhGVkdu7ZbX9isK2AfVz5ahEXjjVvz43fCo
         KtENrfgLXcYtROgblNwKoaUZ0lfOXs5GdeliXIqvKXvQio/PPf6q6vNA8LXzzy18lfEv
         aV6HjMh5br12fPLfDDJCEumOtXIlSARvwO2R6sjc3/rz4asjMH8RlMFVenQWdT0fL54a
         GzQXJKI2gCrknivDOd7dPW8y7ZVCkJohjRhsqIcP5zNXbgw/a3iVh3YqMyRXQX1Yhk5e
         Isfuk0Acv/8imKGWsAQchkin2GzF63cJxyGN5C4FUXPN92q5kg4PswSobpnk3XiGm5u8
         9uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789002692; x=1789607492;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dO5xIwDGCeR2biovWV6ccb/Zfx/Tx0QVvxvkWwn+Jhs=;
        b=sFF1H26boRpRJw/I9QN7Z2KisOL/ppDgS4ompvW876tA2R3hX885GBSv1P3vMratmi
         TXg/89Nw6a55otT43z2k9z6eaW85YGf/PS5uNaE64mZCxUUIEQ2/l6U4MultJ3BgZxHb
         sEDyrGbZ3UAYulwR335BppSyCxCXFYhP0n56KuzDKV7+450f99eOsnnp6laozTRhE5vc
         ags6E6IRI0aDx8q0by3pysonyhoX+lf8wEwj3UewMcQiuYt6zMMJx4lE2IGDV6YaqTWA
         +288LUFgyM95xAt/HHQssBEMoJuIxlvURVW6MA3vHNKccqRHARNbs0sjWQ//mDYX8mfQ
         JRhQ==
X-Forwarded-Encrypted: i=1; AKwUvByrBh1E+ltV4TIp8tBgJTNNbQeHTjN9MqBfQ4MmMZyO9xq/jNQVp0UALBcK0nwO32Dz+7sWF5swXIARj3zP/5U=@vger.kernel.org
X-Gm-Message-State: AFuF++kjem/NuWENJyplkvKuDsqah5D7NNxshSb34L/TjkidvZQJp0zr
	kZ1qtsQ36v2sz+etuBL0muRAsWzgPAIijIyMmGwPYUQLOveJ9j5cGr5FQSued9cDYD0ORugpvjP
	yDPgl0upqUGEmmp1ml6UnKnDsWO25+/M=
X-Gm-Gg: AYBFou2KkSdaEbhGRWERRbROm1zDmZVKrA+kk/wEQuO8VRsaiPeyfIT+AQtqhODfeTb
	OOsH6/MWCbJrv99J7uCsflEa76tRfoxXF995xI3lH3/7EtzenIuRmObWbKiMi2ctxYV1bWpKu2/
	hn9oXSCDCM+U4FZ9pv4hnqZI72F7JRb2V7GZn+8Hi0kehDhf7N1i4lEHqywW4t8c5wEdy+tcBDj
	/hSsW3r/Etp1xDoc0lYYQFOu1ZVAbetnGdmgteTlBeXV07Mz7JGf+DZxjiiYxhXsbfEYHook2CR
	9yiKpi+yNucGLL65d2wXkoWSZZH3QXiTxpIwDcVQT56bxck5zDF3vGEnUqeH068ZJ0DhZ+7jgQO
	frM9I3yBeWa/XGn8F1R5ShaHBQ6O4YbzXQltDBqNjdQ==
X-Received: by 2002:a2e:bc02:0:b0:3a3:7741:b446 with SMTP id
 38308e7fff4ca-3a37741c060mr43937781fa.22.1789002692206; Wed, 09 Sep 2026
 18:11:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909133247.113923-1-sigefriedhyy@gmail.com>
 <20260909133247.113923-2-sigefriedhyy@gmail.com> <a6836306-a60a-4bd9-8173-0bd759f73dad@6wind.com>
 <20260909113259.3d061483@kernel.org>
In-Reply-To: <20260909113259.3d061483@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Thu, 10 Sep 2026 10:11:20 +0900
X-Gm-Features: AcwNN1V3nPrWO9zKa7tKGgL71iRod9c1a385A8lYHx_2U83y6B4hET2sWFNcdm4
Message-ID: <CA+7S2vLwLDd6y-u_8=SvQXXd4yjuFB5rqvJjUqYPTf7vQdAOsw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 1/4] netlink: specs: rt-addr: fix the type of target-netnsid
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>This is a fix, so the target is net.
>Could you submit it separately?

>We should just drop the Fixes tag instead
>It never worked, and if someone cares they can use the latest YAML file
>AI makes people slap Fixes tags on everything these days :/

Thanks for the advice, I will drop the Fixes tag in the next revision.
Though I think it will make sashiko unhappy....
