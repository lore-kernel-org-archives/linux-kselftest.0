Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CAB1D416C
	for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774096462; cv=pass; b=HWRc2vUusI6V1tXLQX5sHGT89Wu4bWyFUqSFs88X19Sd9jtG5MSi9wg1xP5pwpV3lSMmAK2efuvAq1DKpCCAsD07Sja1y4GwB4SCJjumCh2ZGFwue1F+eMhs4hwjmjIWOJljk/UFI4IzY1vmPciTVbvu8RmoPlDKeGLdSUaQxE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774096462; c=relaxed/simple;
	bh=vAOxLc/iYSbulqsSrn9p0RF47QF7jBTSEff5apcZ5J8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=doLyn+/MVujAcdp5pCZ0ki0bH6bVXwi2LlSSLT7CV1vQGgdVtKmULlRpCVZ8NyjM59gfHLneabFR8tnJxEijriryDnHzxIfc3VSEOJcCMsEz6zomN8L5Rgyjqgg5y3ystRxotWHcqP/BjtBxXNIgMfxlAoxHPDGkG6vRTcY1kBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRDQmd9Y; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRDQmd9Y"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7982c3b7dfcso25796907b3.0
        for <linux-kselftest@vger.kernel.org>; Sat, 21 Mar 2026 05:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774096460; cv=none;
        d=google.com; s=arc-20240605;
        b=g9bsHMtg40acu3E7LOuhC/ff60I6T047NXPxgCmnZd4ytrz5NXXBSbita36lQ807/u
         2P00Q4bKzNsS5SGVOZhZ5Kj6W/Iy6kQ88Yr8YokcCnkeNJ+ycbq47XDDTGUg0v5BvYPj
         Fk3wG4wVApAGwZbhYFaaY6itMEFHkkEynn0uuNPf3oiNYq5Uz0eu3mU4IyXvobrPJorB
         8AJBlw4CW4G2HGHbc9QBnnsUHGV1oR/1687XN//qGYNMrkLk0T9MQq78GEb25vc8Y4uL
         6WpIctffZAHVP7gf8BGRVB/sUUglu5kGkyjIj/jsi8qG1RhNcSZFKRYIEZDdnMYs4kPg
         1yAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        fh=8IxpjvLrwdbZnMxkT9vClvcAtzQ9t7R7DVmjOf7IwA4=;
        b=c0NeXW6CxTWAnWT37Srxlo5e4oAETtwzdqkxan7nB+G09uOcugdKXnw+R1+TtOo5BQ
         KQ7GtZNlX7eWmVMGduvWRoUv8Wjz3ws4AvGlBkN0vkCw6GT6ag3pIpQ2maBrTqwWIbjl
         eOMuHZpp6hcn8sfSkNdqthboE2bUuGFJUcziTnUlUzVaK0ZQHV+uvIeKkDTJP0tjUd8V
         7pNtYpGbML1nkOizorbm1Zt6EIUrIt/inEQGQtZCIQI9Ub8Ojh1aAtLLRHErNmftVR5L
         ++Xcilz8Yj25R656uDJu/xFyksP3/35ZBg2P/QL7OShqx8XIttxo0/kMzLOko4oAH+Cs
         WDww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774096460; x=1774701260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        b=bRDQmd9YnCxRcgOmFCMYSRtZpUAiAcjJdog4xBtuXRZn6QoVWo9HjflJwUiBQ3akxZ
         RQRXh1k7Z5OG+PTByTdvIyET/twQSBB5VixOyH67/21boqg/ZV+DPa+9SsjCLguUnseD
         rMltPTg2tSXTUBTANgLmeSFxMbg3wQx13iN/ZlsgUekY5jgPdK++fNtU5w22MVBfjB4X
         y3vyH5bHOIMudoVDzm09apmuU2lK4nAK95BGm+wQqF1sGeJAzFz5kL9sPJUxFU85wKzC
         Z5013IHkzoNG3md2N/BCtMLXAlwPnJafsPfgtmHoQP5cVRYCaWn6Wbh6xUvAymHoMk33
         DzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774096460; x=1774701260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rNCB/fNUc/FK23+8KOYdAudgq7bzv4Aj6mVALRVzF8U=;
        b=CpC/S05B57OnWFF75r7vhUoJduNOS5M1tR8NVU61LQ5uI/qlpDLWB35sOeQIZQ0/gh
         IfdrSWvoaUjeh0SovbUXwhaSa55ToRhrR905QooupvO5LV5AxuLLdzRUUbMAFPGTfcGz
         na3rtH2/P4kAaeBQmLg1Q62HF9NHNBmq0eLUxMRcd4YshPc8gU2hINszOPV/Y3fNUUWD
         2CDJ9QtTV2jzDn2roxD3kT0pzWmbdbse1XmRymQxmgcA/FipgS9XyCZmJ8x/mAxg4nxn
         0GtPxeBbefvnPN/C/GEEORNFNyHmHaLPBkKLSWyMpaJojD+p4U5lnSKSKhnnot/Ah2Re
         1vXg==
X-Forwarded-Encrypted: i=1; AJvYcCUV9GJbXE/8hPM1x8TbAB2Xql0zXovu3uFnwvP3pQcUQTRw+cmcx/yLD7C8hB6ctw4taLQI6QJECYNg4iN6R0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Mx5/W01h8TVpHB3NlCUY60+UF2+bv9w3NVhrZ6Y2i/rRHao8
	5RSQSCkIZ/KMyaxcBfAvi2zu2niW6hBOBhqAEl6ueIlaCrE/ltLATvrSzjaiU24ZefpDaJddpeh
	QBmjoR5nfGTKfaXZYapEs+1FT6zm0Bl4=
X-Gm-Gg: ATEYQzyUAj7vPrB+lym0gYygUlbc0Cb3Fidav6FGS6nPfOLqU39dExwZp3z6lXog0PV
	rIXXTyUG6e/XkjDx90uyKdoKM3/wJZ6cG4TGx0ZHoiGkiB63Y9CORl/3CfV+a5eUX4IeS22yomi
	p6oglbBNPm+7qLMob3oaCN5bVW51f/y/xBgKvRf3l6aTSTuzPDnj+h4i3YOXT7s6Sbhz9shTiGX
	t1/AiSvxskHXXn8DAl8Gn7foT73WuLvCAqClkSGSzt5hZeLJaCw5cPfMw/bLA9yG4Q2BdxiOFFj
	TO2Ahgc+WbKmCS7NU+tJzBevQB13VksuBi40PERHdaNsHb8=
X-Received: by 2002:a05:690c:e688:b0:79a:8dd1:53bd with SMTP id
 00721157ae682-79a90ac1347mr44295527b3.7.1774096460153; Sat, 21 Mar 2026
 05:34:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320071755.483733-1-dqfext@gmail.com> <20260321085820.GO74886@horms.kernel.org>
In-Reply-To: <20260321085820.GO74886@horms.kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Sat, 21 Mar 2026 20:34:09 +0800
X-Gm-Features: AaiRm50ubEYsiJ8QdUgGTYRZ9K8nu7fagVUr9fv4mGrb8iGhNnEk2zwf6BQK5rQ
Message-ID: <CALW65jajTpzKPAfc3nNpKeBOLbqqP7LZjaNaq6Eji1G17ZzKkw@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: add tests for PPP
To: Simon Horman <horms@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-ppp@vger.kernel.org, netdev@vger.kernel.org, 
	Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 4:58=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Mar 20, 2026 at 03:17:54PM +0800, Qingfang Deng wrote:
> > Add ping and iperf3 tests for ppp_async.c and pppoe.c.
> >
> > Signed-off-by: Qingfang Deng <dqfext@gmail.com>
> > ---
> >  MAINTAINERS                                   |  1 +
> >  tools/testing/selftests/Makefile              |  1 +
> >  tools/testing/selftests/net/ppp/Makefile      | 15 +++++++
> >  tools/testing/selftests/net/ppp/config        |  8 ++++
> >  tools/testing/selftests/net/ppp/ppp_async.sh  | 37 +++++++++++++++++
> >  tools/testing/selftests/net/ppp/ppp_common.sh | 40 +++++++++++++++++++
>
> Shellcheck flags two issues in ppp_common.sh. As we are aiming
> for new tests to be shellcheck-clean I'd appreciate it if you could
> look into this.

Okay, I'll fix the shellcheck issues and the trailing backslashes in v2.
