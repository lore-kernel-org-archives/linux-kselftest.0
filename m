Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566CB3793BE
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Apr 2026 21:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775770119; cv=pass; b=guUyGVS/iD4AjGTHB7y1S4tTqo3UtgiIA+R9s+wLUd6DpFASLk3mwXNeYOLVgyu6E4D2+9IaovAU21eJ/uXMgtEc+kbkBh5FNP1/o0iX5vU6rx1jxwJ8+Ki1U3n9jzV67uvSgFsHNatowCxTohi8/qssGrUS6pjX9Iha+zroAGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775770119; c=relaxed/simple;
	bh=RaYJEZzanC61uoOdMaO3XMpqg4i/JlSZVat02vaqKxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D26Gj+2EoFK5ZmBGQvFqo8CyXsF+zmXR93TqU/dSXZEk8xxk0W7gn2vBjtqpURxc02EWNHxsm8K76Je2sKQ5AWKpOK7aai9GOwxYtqmzujJ/d3ITccC4vcmG1oWYs2FA+rI/einP5kiWJReID+GJHhvjIz+B2z+OKc4jmX8s7bo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=klZcLxvC; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="klZcLxvC"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79a2ee65171so15603637b3.2
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Apr 2026 14:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775770117; cv=none;
        d=google.com; s=arc-20240605;
        b=JkfO+AreSPksaEUOXQ7TJywrOGKT7J6GF2HzWHu+r0Q+xAnkhhKHUtJ6KgBspmxzSH
         vMtQbotw7wE/juaMA6/yMBl9yqQQHrBs2cS1Q+eNd6PLtQvOjY7Gxcl1YigFL/qZySSs
         E5zmVPNxPQKDAnKshR4U9kTVusYjawQLEqZIJHsqzkBpwh1e4+U2KspyIWcgVeXul5te
         HerXTqzbem8tQvLOerKKBM/9hhiRvbbY3n0zwR2yMC23ozo4BfzRmsSkGhTofcgwEbCV
         rhQP3ZbxovaI2BbZQAD/DukWPcrStlljoP41fgmhxyJfUCW2OTqD8gBkNwqgxgC3h9iU
         LOzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EYWprL2m9ZZ8ZynKxJB4VDW07R2WJhXHCUG9VenkIc0=;
        fh=mm40hS0QRCfEGiwTe7rh9UikX22O0yHGZDfAto/KnY0=;
        b=cer1RMQDaplsA97z++CJPLgK/btis/Gy3HkGlFCqCxyw4xT/uJ9UxhLznXUS73NPwa
         oBX9FwzzyMbZOXwhLEyNj6k6i3V0I0Mbl9GEwOuwBPnjTzDQISVbVDfxXyCW5sHxfIKm
         T0+1TVPdL9CZZezs97rI47wWwTT2E0lgTCqUgvySbZNC39QK1MOxtEn6SanAqUsDGuMD
         NAEIuuplyBKP52iLoWg/C04BtI/I8RrCrePhxOZIDBEAp4gYdQ2IeiOWIVfeeK/HyZnI
         SW39mPfBrgmmN469Gmk0eNF1r3W7Y3Fg6CfNdFTG5nHqLWlO1scYmKQp1pLhavoeqiJJ
         YSHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775770117; x=1776374917; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYWprL2m9ZZ8ZynKxJB4VDW07R2WJhXHCUG9VenkIc0=;
        b=klZcLxvCZaQDtIo71ESj0mRBvuPBe1u6K9WM5+/DHkWeYIEH2chl1MrflMG36QRCkU
         2IZNt3HMt3mHvc735eamSrIzllZkKhaSUajDOinZtjCBNLFlxMjUZ4/707gk10uRtBXv
         skq/69Jqvizf4/lLpWRYUS0VwL6yMkBIoXWq13Ws2GImaLOKOkvuAvXZNf80pLRze+JU
         cD/zH3CyEP6twLecjmojipSVRPwjDzVc+ljyzhKHRzTTgw14Qb1wbM6smzcwAd7yJ0ld
         2SGZt87DJ26iaq8UHND0eXkXJIygoFeITs+VQNvLLZqizytMbuZkYEYPFvbzm7UkZhbl
         hP1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775770117; x=1776374917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EYWprL2m9ZZ8ZynKxJB4VDW07R2WJhXHCUG9VenkIc0=;
        b=YwPPyLFBhTXi36kkOiuwNmFLL2s/oDnMyXB7fyJSCBKgpmdr5JfKVXVeamCBE/qXqq
         OESvrBVsh4R6sVPfPO59abi0ehL8Qc5IjkytjONFGJbccanVtoPRmyEi+/D5S/8V1sjR
         O1jrrS5lfbUT8uim8122uFOybQlfUyPIXuAyeDYdrrF2tSiWoVqnJD04v7nMRm+PGZtu
         6e3LdPrHd070Ayr2KzXKjGdmkVwTLlVKJC/yTI8V+VCMAowv0XwpHNQyqy4jAO4XbM0i
         w5UxfKo1/+UiEIamMeA5LTkRKqd1rhuOoTVRgsfKlp2TG4rI4n0+qywUBgzhf9sWbMkE
         MkjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXo8mbEivtRm/EHp732zEWZ3lSfTouH19l0FY8n5D0xta2qq7j8AvcpPI8hf+GUirvDMnxv+5rY0+bTelOZufY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0KK3cY5ZGMQwsk77ffrCHA9JVhW+i2RJOcC38C1TKxOHey7fC
	DqHHjkWGR7SqnoFTJMGEq6248ZoEFDQ9qZAIAspEdGVBUh5C37EQ6Fa1WGBOXrqSUTOlKJUue7s
	JjCn6b02I8yhQEcIqo5Wo8EMAFIophAE6tl0lXr+m
X-Gm-Gg: AeBDies/+3bx5uyn0vaUIMwd4WmCqR7tX4uacaN8K+rQlhDHU3cI2Qp0o17fk39M6uL
	hcevoLoqclsf8FbfhPXxJvjqj9JcNrqxooLNQsBE0zxQHxMiDBu6CS2ui5Bzpn2dKIK0rUBBbh1
	KyGfm6og7yLDL9QTp9uVAYn38YyufdNa0pF01149QVE/DB0xbmccRQkTaTxw9k1lrR5um45z+vC
	/RwjYjtO6iPSrLwrwKvvOB3ZTA5idg6rx6Ya49KpiEpnL5LJqPEtvgDwhG4MNosRvMn0gLUjllu
	AgCTLTNdHwzioIPAew==
X-Received: by 2002:a05:690c:9404:b0:79f:b903:88be with SMTP id
 00721157ae682-7af6fceccf3mr6348577b3.16.1775770116803; Thu, 09 Apr 2026
 14:28:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408-tcp_rcv_exact_clamp_and_wnd-v1-0-76a6f212e153@gmail.com>
 <CANn89iJO5DTWeVVfMYh7y3e9Npsu+FQ_a=W9ZqbMtb_wLeBL7A@mail.gmail.com> <adgY-Yn6-OophYXb@gandalf.schnuecks.de>
In-Reply-To: <adgY-Yn6-OophYXb@gandalf.schnuecks.de>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 9 Apr 2026 14:28:25 -0700
X-Gm-Features: AQROBzB120AVgt8kbc-hZ_stDalVZW6NMlnB7ybihX5MZfdhrGorHPI8CA22N5w
Message-ID: <CANn89i+5A+J=_RTvKn9aJrJFYs13U-X9s+fXYexn-_-JDN4SxA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] tcp: restrict rcv_wnd and window_clamp to
 representable window
To: Simon Baatz <gmbnomis@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 2:24=E2=80=AFPM Simon Baatz <gmbnomis@gmail.com> wro=
te:
>
> Hi Eric,
>
> On Thu, Apr 09, 2026 at 07:52:03AM -0700, Eric Dumazet wrote:
> > On Wed, Apr 8, 2026 at 2:50???PM Simon Baatz via B4 Relay
> > <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > this series ensures that rcv_wnd and window_clamp do not exceed the
> > > maximum window size representable for the connection's window scale
> > > factor.
> > >
> > > This is most visible when TCP window scaling is not used for a
> > > connection. In that case, the advertised window is limited to 65535
> > > bytes, but rcv_wnd or window_clamp can still grow beyond 65535 when
> > > large receive buffers are used. The resulting mismatch breaks
> > > calculations that depend on the advertised window, such as the ACK
> > > decision in __tcp_ack_snd_check(), and can prevent immediate ACKs.
> > >
> > > Similar effects may also occur when window scaling is in use, e.g. if
> > > the application dynamically adjusts SO_RCVBUF in unusual ways or when
> > > the rmem sysctl parameters change during a connection???s lifetime.
> > >
> > > Summary:
> > >
> > > - Patch 1 keeps rcv_wnd capped by the (window scale-limited)
> > >   window_clamp at connection start.
> > > - Patch 3 and 6 ensure that window_clamp is limited to the
> > >   representable window when it is updated.
> > > - The other patches add packetdrill tests to verify the new behavior.
> > >
> > > A simple iperf test on a virtme-ng VM (Intel i5-7500, 4 cores,
> > > loopback) shows a noticeable improvement with window scaling disabled=
:
> >
> > Explain why we should spend time reviewing patches trying to help
> > stacks from 2 decades ago,
> > risking breaking other usages.
> >
> > Almost every time we change the rcvbuf logic, we introduce bugs.
>
> As soon as someone gives me access to a link with a bandwidth delay
> product of probably > 500 MB I am happy to provide another set of
> benchmarks results:
>
> `./defaults.sh
> sysctl -q net.ipv4.tcp_rmem=3D"4096 2147483647 2147483647"`

Please do not do this. Stick to reasonable limits.

You might have missed that we are flooded with bug reports (and buggy patch=
es).
We have very limited time for bugs not proven by real-world conditions.
