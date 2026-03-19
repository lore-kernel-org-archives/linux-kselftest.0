Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866992F28FC
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 14:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773931882; cv=pass; b=HwrLPqo3gB0SjXDjZI8MP/VsRixpTP7KdrK9VOg0viNkSX90dJVEWcvngfPMRDXE69FzsmETpBt9X3VKEOMMvdl9w+bY/HPMo6zCHt6IOMQKrX2zs6+XET6wwylsUhFUAjv6PskX1r8QIukFIA4jtU+r7DFxOPiHP07AflXK+iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773931882; c=relaxed/simple;
	bh=hZ+YcdvI7pBSyjQzHPG1UsK31P4QEMl0YPmeWc1BqFw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uM4ZzZSpaayoMP+ee/7OmOw/7E4ZrHsh2rHAUnO6eWtSZzZIbGkhAuhXsusIVCnyNEnJxi07baVXKmgZty1WEncU6XtTIlusMq/eeK0w4fgoJwhMlFqU3J9rBeCvjSYQh2wCkwv3dvyIS0UroOILJEcloZV9KsFbnL2uo6L3hAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lcl6v7Xz; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lcl6v7Xz"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-509069a7a7fso576191cf.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 07:51:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773931880; cv=none;
        d=google.com; s=arc-20240605;
        b=WU9/T3Pa3LLZeTXm3DLzlxEJhwdpCUfjuUqiq3phyYdXWbw3CV/k9NYVuHrs3x6MSt
         XmSoPsk/n03iQ2reEqzyHjyEnXpRJKnyc+Mrtjsy/0IUtRCwWEUcqY7t+TYi/8rQkbiJ
         B04QQL0iybMo9C8cgqHykpKA9LE0xiZiYYvvkseuQYLTpStnY6+QiEdMNsm+eD3+/VoG
         PCtKQLnBFVw9NReP4TzXgkrFNz7DXg7gniPYx7DJYk0IoNnmKZkocsSe48xXdyrWBhww
         limRsthBS3RFDpTw6r4D2PfErI7VaeEuYOpUZbL9k2lgW/QSJrlrfmLT+s6waKzCzLmc
         GUTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6bg8hlmqM/XCpxC5ovJCSr3NN2SOzHsrvJ4dE+9xF3Q=;
        fh=HuLFky2pMvY7qqoIHAno8HKVzAOzuvsEoNxhJMEvDws=;
        b=Hh2gwtaika5cqrUcy9+cGadGjHhZ/5S8b9JGdGyymDR8rUa6l2m76hIEYEiSCso1uO
         fzb31UrMKUPTqQDKHQOKMsYMgwnfTTsVSePmyHk56rnZ6Z1fM1q0POe8pcNnUDYJnxaX
         byuktYA760l+O+PxvculwXM2gw03icf/3LhVG6tjtgx0WQ/pvDlJkjFJ5ZpqGMe2B2qf
         O8508RTBRDfFnFIfS7ATv4at4xpUYgsiahb3qPxx35hjuNo58KrGK1b8zd/Zsx6vGLk2
         RYksihrX+onS2phLMCxFpGW4p0bbXIM6siC8M7dqW7u3ceOTwtajLWsjG9tR1u3gY/r6
         Agfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773931880; x=1774536680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bg8hlmqM/XCpxC5ovJCSr3NN2SOzHsrvJ4dE+9xF3Q=;
        b=Lcl6v7XzYkpoGnFZ+nuYmRytYtoJL2BCyEbuO4oraYGJzqluh2g4FjZTLUhNWWN505
         rX0dZRLEVaRq0WRL5MvQ4GXxOt5Q+HF0KvM33ZePjOhGmocARXNW+G+TVaXrwq62Zr3E
         EgFMoWeA1+izyK5v7M8vHadUcw7yTmHPR+Lkry+2/qmTNrzW4mWQKJSlbvHqSAjhH2Z+
         Oz2LoaeDpbnwGzitsBc0eLVFlWbkwQNaCocbYz+YEIQrSD9+9liQ9LDHrcUdx/+cvPpH
         qlqdKtgecbr63xsqUrMCoNtNYpRB8KYmhSdYBo2QzYOxzUnuZbJCmSt2IehI7uPEKKXR
         N5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773931880; x=1774536680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6bg8hlmqM/XCpxC5ovJCSr3NN2SOzHsrvJ4dE+9xF3Q=;
        b=e3C4pfUVjy8dxgTiBZcCvP7YW2/UeHFbChPLOH4ch9I+80myedOzJQ2YoH9q84ZL4U
         vTA8aBm87VkfM5MDKQxtlF77wMwwMWeWQbi6p9K4HXzGkVgWmY758JUb6v1G1dTb+nvp
         yL/2h+YTt7LF/nE90gzGJOAeuqj3SCrtG3fkhw1Kq4e91R1NkmAIvUf83yybgVJqrKjN
         0MdfKT2wmGuBZ0JiQfO8YDJUtW5ND9D+A3QXFkSGFC1pGZsF36eqLxZnPoEHlOtKzn7I
         G01twTwQL89JD2NYc6EPA923J0wrTdM6kX4X/O5NDTbPEs9KhI3hmUQlPuuXy3j8uxou
         uzmA==
X-Forwarded-Encrypted: i=1; AJvYcCXtykmQNxm07t5tnuBV6KfvvET26nrkfdRXOiWVWFDCDEKNIHJyqvcQViXCwqvdUd9sWfI9n6H4d/3Ld7zlxEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YySQsUy1HsqwX402vhjGJrKkfPBDWyOhkyPgMjPhitKiPKz/J3t
	ILKFiGHvQBAKC11x8tV9dJVCorhCO9+808PT7uDrg1nQLrLo6iZMmAsFSsLb+9qwvQQXPo9vbgk
	6dQWJD9Bq7mrOBZnTwBiyMW2YjSPW6+kSgd984w75
X-Gm-Gg: ATEYQzzbEH/aPJimD689bPw7Kt1wZiAsFcrczPG7rTsP+weOjc6TDX+CIZP2godLWdV
	Bf5GfIMnPko3fZmYj5q5tScMPe8WWHOM0/xOASROzvWZmFN5ZxPlSdB5HjBDvXPavJJ2HEijAZ+
	DaIZxYF9I6jBFvTokZ5zXxLCPad15Wkdqi6AZrxEFCnpOZiRympWOr78b4sTVIjvcYyLG7iKv4L
	WIhTBkImI4LYtM+wg/kVAWuaojxaKISxQY8agt2tCHTU9jP9ox2s/YJLqA7yIHgsCMtcUpTH2jw
	JlQAWRU4gyC36VQPYu+eRFmWNpTmfJNBx0u44A225bWqo1UHWH/bwe/dxvnvno9LRtTwq1pR
X-Received: by 2002:ac8:590b:0:b0:4e8:aa24:80ec with SMTP id
 d75a77b69052e-50b2558c63dmr14119311cf.14.1773931879336; Thu, 19 Mar 2026
 07:51:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317065137.1533226-1-atwellwea@gmail.com> <20260317065137.1533226-2-atwellwea@gmail.com>
 <d0ab8cc8-f734-47d4-b402-9c62ae563b4a@redhat.com>
In-Reply-To: <d0ab8cc8-f734-47d4-b402-9c62ae563b4a@redhat.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 19 Mar 2026 10:51:02 -0400
X-Gm-Features: AaiRm51mxR33jgYOwzHgEw2muxIQjYdY0oxzeNITFosPwCcA1uPkaKfbyhmFcCc
Message-ID: <CADVnQy=raqQ2dKwJZh2U-9=c_AEwoCS3i61oL7gUSASxBC1QVg@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] selftests: packetdrill: stop pinning rwnd in tcp_ooo_rcv_mss
To: Paolo Abeni <pabeni@redhat.com>
Cc: Wesley Atwell <atwellwea@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	horms@kernel.org, kuba@kernel.org, kuniyu@google.com, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 6:22=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 3/17/26 7:51 AM, Wesley Atwell wrote:
> > tcp_ooo_rcv_mss.pkt cares about the OOO SACK state and the resulting
> > tcpi_rcv_mss update.
> >
> > Its exact advertised receive-window value is incidental to that test an=
d
> > can legitimately move when unrelated rwnd accounting changes adjust the
> > ACK window.
> >
> > Drop the hard-coded win 81 checks and keep only the ACK/SACK shape and
> > the tcpi_rcv_mss assertion.
>
> I think it would be better to keep the test updated with the kernel
> behavior. Having the pktdrill tests bundled together with the kernel
> allows for tightly coupling.
>
> @Neal: WDYT?

IMHO our experience internally with packetdrill tests suggests that
assertions about outgoing receive window values should only be made in
a small set of tests specifically focused on receive window behavior.

The motivation is mainly toil and velocity. We have over 1,000
packetdrill test scripts internally, and hopefully most of these will
eventually have upstream versions.  If we allow assertions about
receive window behavior to be sprinkled among all tests, then over
time we may end up requiring edits to hundreds of packetdrill tests
any time the receive window behavior changes. And the receive window
values can change frequently. We have generally tried to remove
receive window assertions when we've discovered they were included in
a test not focused on receive window behavior.

neal
