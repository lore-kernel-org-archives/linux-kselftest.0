Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94413377541
	for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 19:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356332; cv=pass; b=qeQGDpQC2/mOYYrvvSoScD8TIooa3+kEfvzTsOBvcwwSTBZCjGs8iMXpLV8XQHHLAPYgPqv2RPMyvuqelCYXIgJJsTYiHSHN3KlD2nG5KO6Hb+I20BXiUiQL4nIifEEIlkInnmBJl2nS/1qcBjmjkawYXerK2yiNQbsht/DeEzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356332; c=relaxed/simple;
	bh=CwHGDX0I/MtzPYs24hZSqz0/ri7iZjm7LIBdNw2JZ84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TbJD7IDgeTSICWskqxF3hKtM5U/2vF/usxw6P/Vkvqoe8z+dUc8xPMJ22bKhNXdKzoThyg1OI9LkN+JDCaZABQxzKn+mwykOy254EuCfBnXdYrVJvHGaIk5F/w6A+Z47bISAkJg1k+bC5faF6PFz2iBYo2+EHPkb2V44KvFUeP4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YLUQdFFs; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YLUQdFFs"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so10195e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 17 Feb 2026 11:25:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771356329; cv=none;
        d=google.com; s=arc-20240605;
        b=Ew1rZ9UeGLVwsRBMSRwEaLBUnsElCjiObgdbXbjTmP+L84sW/keSIKvb3VkoeIfND8
         OHCYr5774kE2t/rHxBLukdm24newQxyD1/qybymHGm07EUahmoObA4dqfHyirRFl/F0u
         grbEHQgMZgn+Mvbq97v+obBvIE3eNyaxQpUGW96db13N1o0wPTlrxLlYLcfA8WYzH0qt
         jWcG8WNAhd0s0B7ejg0ghXTMKfy1RYuWexGbTipoF+NLY7Z3U6OkOa1Qmun6W8Oyzx9f
         yaHU2tMJBcuiIr5ovzgd8PGhG71S4tsI8Hs5sqVbjeAe0Wj5pynGFiiLnGaLsNv6uy5L
         fnRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        fh=Boryy+5eqPOO4OSimF8+c+dWvmKvP/xXbOkG0hh3Qbo=;
        b=TSoX71yiE1OauVYcvsgI6wweN9r1vzLrI+beZk2PZ5k9F+OyuoTI84FrRVm/8x9tz/
         EPYVn932zLAeunAWOWtrnkqQuj39smJ2G8XOTpy40juT6cHNOy2tqrtDmRAIskvFMyS0
         NdrsUXy9rB/jY5+Mi+RD3338Cf6oQM5w6UFIutNYel8OYJJTnxuQAxROhbOVdkwOEIpp
         4cSvQBxPOWUp5LGIWfboYyAY3oAWy9MveBPdOkCR9ByggALd+4num3y/wyMRV2NL8Z3E
         SRs2nbjP5gpsd2gxm108JFWqMA9GAb7HG3tcXZHeyMPnJrONB6TFMAYzsvKpRrwT7+y3
         JlwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771356329; x=1771961129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        b=YLUQdFFsTyOXTrY40ew8BHIq32mcq6K5svfB4COvXtVEpR7uq4sANs8O554Mi//+HO
         F3J+SX+s8cV5yD8cvWlXpNCpnoF8Oqb1jSgvJ79E9yBdzxOTG/fQ53/oG7H9U/aRDHa4
         jYVDh/x4xzU71NXig28Vp7g77AS4ajvMozT+AiD+j2jaFyiNVGZ8KctmdyBAxCrLndNY
         m2wtTnV3Gr744evEQSiqaMo70ylJ0aB8np754/Zav+6LLiw/Rn8f+UdBUmELWQJUVkC9
         1TyOh9OadTT2DF0hxIQ1Ak73zggfZP6iv/rEekM4TwZ7XO+WP3By6l3t5JayW5oVP9bZ
         j5vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771356329; x=1771961129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=agcE7U0hHa2jey3GOzRKRM6iuQj3YGWAyKNtM05bfZQ=;
        b=KlLyGzwEwmf/iUbw6lwatvc/03t/8qP/Uo+KCPlImbpMCr6PHil2U2Qu6azKkt7Xm8
         QiJdqAvRclLKFDsHtqFaDsYCz8802khl8wu3/cBMSu9OnjqeMH33B6xZYpo3Z0R3IWIT
         /dUl7vX5q8GrfZbVzMbX54Ao+UAERmfdtVtkibeivsFO3P5+jdyE0MEzF5rWQVYCU27l
         RrEfnpLaPU3J4ExxBoou5dc6ywJV2UCZV1Pp5ejPuQ7VGGMoaesiznVdC07SJWHD+6V1
         g2+dEK9K06TArfx7v5B+uItbaEIXAZQxJn8oTG/RSTPA4sze8OckYYuDuQhESKClGe11
         qrCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCBA8T1ECM+Z/rCNDLRgtiMVTnlfq7FBnIgYoj6lppM+BdmKVujfVxjECztJSqF1cr1NyWxGKzwoasBN1F528=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXrQyMVYSiffLrJNoadChJHupzMZWhU5xk+N9345P2eVcNn2GC
	QSqoV8zrja+vlXqHl0ybfT09hdpR4s1MWtqHVudllsrGih7zUVbAhx2mE0YcFJaSbGvhI9xoUD1
	6pJEygFrVp565AN0tWBRdeL2nIfW9BBk4p3/dJxln
X-Gm-Gg: AZuq6aLpjUdE0judhKIJxZr5uaEAiCOO0ukJyaJG15naME9LLI/6VZyzOlcnyes/byn
	wPmg3eqbwSUCmc7pwrjOEVlBWrru7F9nrIWD1ljuTSaF9zOjiALAT/rJoK9lhVV3Rfxa3ZVIrWn
	3f56/rHlDu1kXdzekFiQLtvpD/74wxb4KjifaYCDJBid16wHSfUagdEwruKncAaYmldXlVBK0vo
	pv8eiMT57QxwS5CbOeJiaTT6HNx2wOyAclaH89Wv1YGtc2u3yxzMv+NUaaMb4itYwCtwhvztOdW
	xBm1RYDuq42zLWB8Ef02SmfJhiz0aglrIXNIkzSpldzstb1p7ONHF46iglNBkmwX31x0HQ==
X-Received: by 2002:a05:600c:a218:b0:47b:e29f:c63f with SMTP id
 5b1f17b1804b1-4838883cf98mr866745e9.11.1771356328550; Tue, 17 Feb 2026
 11:25:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <aZQOK_xnxQn09qmP@slm.duckdns.org>
In-Reply-To: <aZQOK_xnxQn09qmP@slm.duckdns.org>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 11:25:16 -0800
X-Gm-Features: AaiRm50sXuWpunQQOD6edntmpve7h-Rlruw-KS0KVWY35EyoF20ve32-aeJ4CtQ
Message-ID: <CABdmKX0o60fP+ub4w9PBqZ8_5fR-X3RBy1x+XVzekvQP4WAysg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] kernfs: Add inotify IN_DELETE_SELF, IN_IGNORED
 support for files
To: Tejun Heo <tj@kernel.org>
Cc: gregkh@linuxfoundation.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 10:43=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> On Thu, Feb 12, 2026 at 01:58:11PM -0800, T.J. Mercier wrote:
> > This series adds support for IN_DELETE_SELF and IN_IGNORED inotify
> > events to kernfs files.
> >
> > Currently, kernfs (used by cgroup and others) supports IN_MODIFY events
> > but fails to notify watchers when the file is removed (e.g. during
> > cgroup destruction). This forces userspace monitors to maintain resourc=
e
> > intensive side-channels like pidfds, procfs polling, or redundant
> > directory watches to detect when a cgroup dies and a watched file is
> > removed.
> >
> > By generating IN_DELETE_SELF events on destruction, we allow watchers t=
o
> > rely on a single watch descriptor for the entire lifecycle of the
> > monitored file, reducing resource usage (file descriptors, CPU cycles)
> > and complexity in userspace.
> >
> > The series is structured as follows:
> > Patch 1 refactors kernfs_elem_attr to support arbitrary event types.
> > Patch 2 implements the logic to generate DELETE_SELF and IGNORED events
> >         on file removal.
> > Patch 3 adds selftests to verify the new behavior.
>
> The patchset looks good to me.
>
> Acked-by: Tejun Heo <tj@kernel.org>
>
> Thanks.
>
> --
> tejun

Thanks Tejun.

Amir would prefer I remove the new DELETE event support and keep only
the part for DELETE_SELF + IGNORED since adding only DELETE would
create an asymmetry with the missing CREATE support. So I will plan to
do that in V3 for this series.

Thanks,
T.J.
