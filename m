Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538024EF8C
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 20:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804332; cv=pass; b=o3XS8Lt4bNis/CLXMSLOZYsqgbdujrPN1JheuDp9xTzfiVM+xcRHX+B4jAauFOLs6b/T7pDOBr00il1cPeg5IDrh4NpklXAI9+6bBd+5hPtSTFgqf5QEz5qXdu7aw+FtcM5xMfM/p4zx6cPddVMyjEg1+YVhzJF7P9ehwgV2k0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804332; c=relaxed/simple;
	bh=nnNhbflpDXd0E2GUCIfx9K0B+gy+MkR5SSCXcr1p6RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f3fOwO3Nzv2C35cOJJX9qwku8AEG6aojDQZG+EOBsk1pHfThL5ggQgKgGV+/hL1CKLuvjCrT+AyxMS9KVOqz0o+rmzc3Fod2yOdm3Vod019590NxBi3XbP6/Zjia+W0CuAFmZnWtPdyJG6HjeiPbsQvjcM5xdXRGrfbP+g53IJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WMeCeMHP; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WMeCeMHP"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5029aa94f28so20829491cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 12:18:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769804330; cv=none;
        d=google.com; s=arc-20240605;
        b=L++qIFtbwyg+YdQ+5o+8ZRKNwr3cYPirN45Em3F9w83PDymzBsZOQc2kFP96EOcvFw
         izY0x2EXDjna4NRLMQhbiL3VIY5mF1ovXLY33NxPH384yxy8x23Bybcfxrm7yXf7JzAa
         lllQfkBg/T0diCuANrWZiMmQ5jhwmvpO8KHXU9K43Ilvdp4Eoti6BYzQr2u3NdCKG4F6
         WnqCVusFLOlPMEqaHlAoi5Rh3+5cd98NGdOLrDLxrkE2Cl+T4TOpwPTh5aEgnD4VLHu8
         /DzgYRGJzLYkCldFsPiNCEFZJXuHd/t7zVPPF2R9yOsKTrLqYAQLiLKxoEeeAkL6NfIb
         2YFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nnNhbflpDXd0E2GUCIfx9K0B+gy+MkR5SSCXcr1p6RI=;
        fh=NsTGKL/4BNUziboI2bm0/IvWmSZbEYxbN6AZg953v4Q=;
        b=BGM2z9cgWoYCto/Ob1yXshiBPt+ArZayLqZO5QzVN3QHHkVzTMkyx3ygB9RrQxRXVT
         HpDuyweLG2Iw4M3aJE8pELl2JZ6NHFdQojViMgRZibM/mC76AVuLxOqYPyG2SbdBa1Jz
         RDRxFSRTUTd3MqGg7oimXL39KiUnu6kibTzn5R/wPZCVou/ixOAO75HyI4BgP6x+NYcN
         KW1JmPoiTiaihLJspxgxfvT6sCH78qLLNOlEdus+v7evWN5hNS95Xret7TXo99sTrRjZ
         6zipNF7W2BY7cWqgbPTKOr7e7JhsnKaji8wOHWeMjin5wY0AKxokKUCLh+Y+omk4nUew
         +KRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769804330; x=1770409130; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnNhbflpDXd0E2GUCIfx9K0B+gy+MkR5SSCXcr1p6RI=;
        b=WMeCeMHPrEvbueyYRJAyB2aIYAlL/x6rVOSh8qE4S4JE5TfYFjFKN1VV/OjITltDJc
         JfHaaYUpEhSrIW7lQaNNd52VCjcrGk613U5NwNQprBXr6Gf4HmCsoo8ut3wsMXykZ7Sg
         rvfGBL612zhBNme+sX9apkbdSahEjAywA8+Fqh2hWM6XPFvJOS95QIMZgPosnV3kzqly
         2kPHhWsdQuvFCjX/QTwqpVzG1aDjUPbM4W3G9N49wL04Zi1+enSXUBqrLnytS4y1cYJ/
         q2eeqfNTPEsGTq3HzBkTCbiky9MzU3y8XzgxaE0oByDPVLhRLh0AsyJTQYVg5ZxRlXCn
         NmTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804330; x=1770409130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nnNhbflpDXd0E2GUCIfx9K0B+gy+MkR5SSCXcr1p6RI=;
        b=dsHq0jgAoLQZ5pALmLgVP7Jo51LFa4fYMt++HGKxwpYh4RXj1WpSjSMO01Dvf9VAoZ
         hBxIw9Hc2Ib3tSE95d/B26O1x664+Uyo6w/UhpTCWb3vYscpeThKEsUN4j9U+s/feycN
         e8a1q1e3VSAM6IDcBCvyKslGmitUugUftj8FxFpLz82wL9KocIa108zuu6ywsSjze9wB
         o4n6hTiFA58oUHRStz9Vruzvld4v5Lg+bWT9TPkpk/UJyfD44g6Hvz18a8l7geDfIIK0
         Cy0HIa0N6P68Nsyd3dXFy/QLHxRaGxzyy304CcwWF9F0w1g9W2cLyCCxApIQK3+OwNCy
         vzAw==
X-Forwarded-Encrypted: i=1; AJvYcCV0PHWILhXWYniySDZ6KZcoelwwLLkB/BP1P6/I9hZpabnlpO2rDRHlICzn7r68HTrSEyqUh+5a7TCm372Cg+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdHdr7QuEyiJD+YF5rZgROuUisKBcFxL84gAZAF5kY4YeiXtqS
	/XwVwiC0vIOlVeY8OMRG8eDeMwna3QkP806iH7ktKptI0AH3puakMZtwmnBuZdWULIXojYgQgP8
	FAN7K0UJHiqjKuSFqLi2YjMW6XyYWWIPKsNszRiXa
X-Gm-Gg: AZuq6aL0q+qifXm+/orgROeXuHP0patznSTKnGMZm2VnYj5fFmFx5Gh6NxbDbu58YSk
	7uvlYu+VKaCmblzkNZML/l8yldLG7XXFce84OogZQMi3qE12IpN4CPIzkvgXTX/pDhS1z4zL1LD
	M0iqISeOXTR2jcA+8tqTPE2DZcO+vfF5CczvvyaHE2Sosr6W2H+hHJbYPVSistVTzJMpjOBEcOm
	Dl0w7Tn7QTZ6s6uQxUQDidoO7LiCEzZkLrokSmqB57Zikfppj8jGcceuqEuVv3WhsPiib8=
X-Received: by 2002:ac8:58c5:0:b0:502:a218:1cf with SMTP id
 d75a77b69052e-505d289d77emr53380761cf.4.1769804328557; Fri, 30 Jan 2026
 12:18:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-net-next-mptcp-splice-v2-0-31332ba70d7f@kernel.org> <20260130-net-next-mptcp-splice-v2-3-31332ba70d7f@kernel.org>
In-Reply-To: <20260130-net-next-mptcp-splice-v2-3-31332ba70d7f@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 30 Jan 2026 21:18:37 +0100
X-Gm-Features: AZwV_Qgee0kWrUcrGSbV870oEmI0azfGZzvyJVxkG1CCnUqUQKho8S6iTRt6gAQ
Message-ID: <CANn89i+kMpgCa2F0c+Y3av0OfbW3B0gf=TEMQD2r_cEVixEpqg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 3/6] tcp: export tcp_splice_state
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 8:24=E2=80=AFPM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> From: Geliang Tang <tanggeliang@kylinos.cn>
>
> Export struct tcp_splice_state and tcp_splice_data_recv() in net/tcp.h
> so that they can be used by MPTCP in the next patch.
>
> Suggested-by: Paolo Abeni <pabeni@redhat.com>
> Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
> Acked-by: Mat Martineau <martineau@kernel.org>
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>


Reviewed-by: Eric Dumazet <edumazet@google.com>
