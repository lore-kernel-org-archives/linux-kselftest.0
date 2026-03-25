Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D202FFDC4
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 20:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774470843; cv=pass; b=LNOw/bG5FAcQMeLLmSRLNlB5sBCcW5f3INbr1PU7w6geLKORaLvS8f1M9Ro868D56j6n7S9HZy8lA6CPlsFxmnTIg01pC8vsuUXg1bdn875CvfrTGBE6ToUFG8vCDI5eas/yP8DDOjyLxMCgTDya+3AxwDG/RK4ZrVbOo91+BbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774470843; c=relaxed/simple;
	bh=9Bx7O08fLm3R/wc0dHMJOEG74sKjKAWbEHkEchxKEVc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HjRk8yys+evrGymSDIa37zzlDxcUXbLCpslqWnHTnjhm7MQ/l4orHOIU8jYp10qvvD0UIkNZdWb4uwsI4BwoVR5f07V06CSt75zqEPJXFwyKnBOrBcRFwZftKUkW9LURMxBkn4HmSFgLkloLa9tGMw1uiZM8t4kc0F5zjdgD7qQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSACK7yM; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSACK7yM"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59dea72099eso398835e87.0
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Mar 2026 13:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774470840; cv=none;
        d=google.com; s=arc-20240605;
        b=amyJm0E92/ZhR0Tgmr1jEbXRqT0G6Deju43HCFmJKEWpRhq7ceBaYxhQTBRW1EqIge
         CknJkdw+Z2hYUgiuwBYPRYVOYRiz17OrZpcMp4yTkTTxHvVS6otcMLRaf49IsbjWDMdk
         BjLaxVybfftCJ8lw677/jCCI34Z+FMX6CpTiwMw/jOSAftjBXFxnvY9iwej1aUjJn9Q2
         aEhtB5ucOXwkLgAvLNsI6PBvofuAO43aPEMcfRGhzVXZQvugGNI911Dk4UCqeuJNcUms
         Z1ASvol6M1df6WxTp1FEEf94nE1tw7ja5KgFHJnJmRiP6EZwnXKQ007DxVh/fq/ZOBB+
         EhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Bx7O08fLm3R/wc0dHMJOEG74sKjKAWbEHkEchxKEVc=;
        fh=mkJYd7qmDkGibDESrurjUTv0rAgly6X/MJfWSptPiqU=;
        b=jY8B7Bor9+cJDnvs8Nrey8Lcclp2U1rTAO4zgmy9SR4+thUStJoTL8trRS0mojs2Yy
         1OlAQ2q+QciFzzJ/9G9s4TcByebOiYcTU1tFh+BXo9cl16UIgqn4pXYNEOI8aO7T5jLj
         CZzLNer1SO5/3kbhM2cyoHIgxn50TE0d6O/Ce4aGuiNPUI6Jb7wjRzzFoB4QnCCv0Pm9
         PYzWndACO0Ead7lU/KXcQb3h2OC9FXHn+KUCRBGOPOJe2f3ZICQ5keSAyABI3P/mdLe+
         BmpSk9roTB5cTuyN6EImtYCOOLv0gU1AgK84DQcRKXa+XENTNHEOZnw3iPuAlxfTZQJo
         aMBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774470840; x=1775075640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Bx7O08fLm3R/wc0dHMJOEG74sKjKAWbEHkEchxKEVc=;
        b=OSACK7yMfERarMACykwGaWaUO0+QRBj5OtFIWBSCd23fIepooZHJXhjNs5O4qeDJd/
         j873ABIxvIqTmF1HPm50K1cfyT+cvnPwps2jVHQQNKF7OrDQbbRDLQXsVsXAEd/tibMv
         EoRS+eWykcui9W0m6+yTqJPtXj2Fqie/ucCsuuCwb4UzotB6Hd215wtfa5S2BjZiExrG
         DJ+kIX8YIpZgTC+yeVJg+coBZSTCnYxApW0hbr1wA+u+UAqegNXAqV6KBmB2ibJDWOqc
         TVJDekTKpnxIU24kPorfL6EwIwQwOvaIgl6vWyOTJKGNrRX/cLRFvzoTBT6UWE79AY00
         MEcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774470840; x=1775075640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Bx7O08fLm3R/wc0dHMJOEG74sKjKAWbEHkEchxKEVc=;
        b=FGpRQaV/OiNNRj+AOJqo7Ptz5SSHqLhJ2I2m4eJjUmY0qXSD++QbicjX5leDD+e/00
         ejAvxulZBHpW/yMmm47Q6lIBizFwM22e0RWPIkEYJclUN1ltgObVkk2v5myy1FZiTtal
         QpUP3as0ZXiwsdqc3SQl0sTdWmeK3ZJ3qGB0Miz4grEEN4fPAfp6xgoT8Tc1pVeYqgy9
         A60xxtRat9GzA/ZtzJNm+pqYb+Ku2jqNZkPOLgdzEUASFcMHW8pC8vVeL54sigrRC+Vd
         ukyLSoXk44u8RsEm5v8GhwFf77gG2nDsB90nLELOGhZI72nM16GWmR3W1jQfAsgjpxvc
         h3vg==
X-Forwarded-Encrypted: i=1; AJvYcCX8u/i6NN/HvjGAB4Zp7JXCINQUB4aLH+tKQOuV1LYUqf4KV0r1UzIQ1cgSP/E29sEAeq4GyUWQyOJ/giodCsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOnmq3AeDjNwJOsQjf8doJXGtpVEIAAVp3HOPjey8ARkaT3lWQ
	jXDUv/gZDB8vIpvc6Ka0pB/IvUShp4RYf+MIqfnP1P/B4IlbmPLw/hiksTzqTneYucZ/0hPcoXj
	1Ag3uys1sO10SBpPvvHUAAh2gHPDuSdQhK7J4h5wq
X-Gm-Gg: ATEYQzxFLmploJNhfQzpW9H3BwQsqpGUo6VMSjF67GnN/olXYFlJvcTs1I5c2A2HMLc
	Qb8Dyn6cPeyNm8NCSpRiNY10VWaqwxDZqT0oRX4kvALv7HxIElhRDnhcYKtRWRlHzEoYZwzQuIu
	JWX8bBzA5dllB5kirlth2nvD9is7vYbfUj3e/v+DSfBM4nhpeN0FavjzuMY132fDDx0OZXmqH97
	U502d1zKDLK/Bti/4Ho152SrwWvMHjYT9yAFJvIBA9LSYyGR5sFAYjnzvAOZHMAJRZxS7lFJXgn
	k8t/LwA6
X-Received: by 2002:a05:6512:108f:b0:5a1:3134:923f with SMTP id
 2adb3069b0e04-5a29b99ef33mr1526971e87.40.1774470839740; Wed, 25 Mar 2026
 13:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325182026.467307-1-pasha.tatashin@soleen.com>
 <20260325182026.467307-2-pasha.tatashin@soleen.com> <2vxzikajacgc.fsf@kernel.org>
In-Reply-To: <2vxzikajacgc.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Mar 2026 13:33:31 -0700
X-Gm-Features: AQROBzBIp18gRPLcKPfh3wjTKZUVHHVImeKDpRy0cS80NjooMtufSaZyOa4m9uM
Message-ID: <CALzav=eybgJwMQEtvSi2bUv8u7cic6d45r4wFZdZiKFFrrLJfQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] liveupdate: prevent double management of files
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, linux-kselftest@vger.kernel.org, 
	rppt@kernel.org, shuah@kernel.org, akpm@linux-foundation.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, skhawaja@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:20=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org=
> wrote:

> For memfd and hugetlb at least, we serialize the _inode_ not the file.
> The inode has the contents that we care to preserve.
>
> So if two FDs point to the same inode, this will break. You can do this
> by first creating a memfd and then by opening "/proc/self/fd/<fd>". Then
> you would be able to trigger the preservation twice, causing all sorts
> of problems. Same on the retrieve side.

> So unless I am missing something, I don't think this approach will work.
> As much as I hate to suggest it, I think we need to move this check to
> each caller so they can find out the object they need to serialize and
> check if it already is.

I think LUO can still enforce that the file is not preserved twice.
HugeTLB and memfd's preserve() functions just need to also check that
the associated inode has not already been preserved?
