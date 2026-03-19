Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1016D3D8111
	for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 15:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932948; cv=pass; b=o90SB1xlLjVatB00K9ERuOdoxMxf7vCtkGSR6Jahb071ty3EL1Py/gukW7/DGyjU0bjIZov4w1rJM6nJLJDQ2zdgBXux2nwEyG2xL2gfvQJxDDczHBdIpLJiKjPsSX3xHLsTSmXG+koeHh6/YEW08msrljPvja1b9z7axKRCefk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932948; c=relaxed/simple;
	bh=DqybgczmthZBh+KRCCZ7NVFiFkkZovfdbMNP1BBxjxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3nHq6F76zn0O0qmNns3QfZPxc9II0aDKG0o+aKyD1Eb7mF42a5L8Kutm9qyE61d6ym+IhElWxwu32snXYrUq2T5WWzkugn/mYxTX551SA+m7k+6AMdDHED614YmJiX0QoZ6jRqItmDN1kZFTsBeU/osTzVvZyGxcySNFwTmRhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZReFeBY; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZReFeBY"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7927261a3acso9414997b3.0
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Mar 2026 08:09:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773932946; cv=none;
        d=google.com; s=arc-20240605;
        b=Ic+5tOvBhbA1V0Eg1T31uWjg0jz5ygz4ZrxVTiwsOrVjYApOxgAZzTp6LmJ4Mc/0IR
         vPMbpusvclOXojSEVqWMRH0xfF+JvXOoBvQ8sbW7DUBNnwbq+klgmBAO1lD572h70AYL
         cGbXuQpg1Q6HzEBQcwTf8/XYHzW+oPCX5pTHlng7lcsSE5MOjCOMpieIJnUQLWWo9fcK
         xDqdF82i71eS3HrhBYKF48TzEdPrnduZ3MBDFNf2XpBv/0aTKz7PUJAsFxgmgMVsO/JR
         kuRxofEMdJlaPPEzDL1AN8szLdi6yhIm6yoQYpnKrxjyqUDPPMoF+ZmuzUv+Eta3bG0m
         g/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DqybgczmthZBh+KRCCZ7NVFiFkkZovfdbMNP1BBxjxk=;
        fh=zkWopt9CAG8OX1dhekSwT+C9KfFxDQcPHLcAj3h1FZ0=;
        b=VLMkfKl1BbBvRt6g0N0GJgpjWBIgd0c+R1nTa3FNs49JHUW8CqdaBb9OqhT0si+5mr
         WHI1L4JeMpB/47VePQzzCqMNl3+B8l4r+Co2rjQqZycBkhe1wmzF3iHEdvHNUpW/nRtu
         b0C/eR3+WnhffAMAGXvKSfCtsIYgiud6vzlWu4Pwso3tUDd56O82LTLxAvan7qFgxwLQ
         oKk9pOW+dpE3FwiParJ+KIE7rC7NrXB7ovODvtnK8xfvfI1+DmbJXGSi4jwhuQq6QPfm
         JQkgN+Nc3c+gbPe9oxVeX6wHdwahadxQDo9o6QHrjsTcklsClQuQEdy3w+a7x46JKjkz
         agOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773932946; x=1774537746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqybgczmthZBh+KRCCZ7NVFiFkkZovfdbMNP1BBxjxk=;
        b=NZReFeBYyGB3h/uD0Cei/eQTmzD1BNGWKgNQGeSaJg4sAAqrwe9Z5t4U1r5GBsY5Rd
         w7DU7IrelQPfaKyyD3Uf/Vznqzqx4OJh0KrFdkEULAyKNb+SuOONxl0uyk6GHRl4xqpf
         1T46w0O1U+36IJr8Dh0EuMYTea9N3feu9gI5RWqtUT927WrPuSCJuEQC/i1cQ1XH+EaL
         JOpI2Anc09eFc7pHPssJ0EQC9BZ6hTjxLHXYkkzSBYnrFM3HAQpNYX3A/xB7zJAiwoyx
         iKeiIQZy/XjFMsdMQd8UyZ0dcM7yXT0x7fyZlqpi5BiFfk22hHbX7SVqQaxE8eso/1jg
         l9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773932946; x=1774537746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DqybgczmthZBh+KRCCZ7NVFiFkkZovfdbMNP1BBxjxk=;
        b=bLH/mAyETK3a/GWk/21ITAkI6Y9IwUtdUs98Ek6U9UyIps+6vkM/weDxA3arM6TQdd
         tj6tQEUeBrfPK/K9GgDHXvy++3nf69hQbig0rY3bz3+s2b5Ub3ivoPUOfBgHYUyNp2Ro
         X8tEIkbR+8G3rw4iqPnlZ60brOhxc62wCHBfILTPnV973T9JbiF9gLzd312A3MZvdTfE
         0FbtA3W6QR9PL9GwlzHdcCv5ERNE5Lsbow501+PL8VPfn+8fLu5rlE8VbvDMMS/BN59Z
         oUrWm9smCf5EESofi/TUt3ZDYo2tWIVjMriLwd/yIeul+ZmgpozEzjApw8zdZs12oVXo
         FMJg==
X-Forwarded-Encrypted: i=1; AJvYcCV6NVzo2Jbww80irfgwCcJagfltF6s+VO3J0FF89OeQHWatEcxRmQvu0Llo+lwwp8q/vAPb/sS5deCdKwoqwrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkbezK0+MA0JDsKegagbYQAY3eZABFaTXY+jMYgaz2HFC9UKv4
	vJaNKcbBQCngySrPUXWPiEipBEk96V43VHqny4XGvwNfLAP3BH4lzxKHYEcOlwUsdE6OrgrnzU2
	b73cWV0cP2ZPe2ksNhYYcywB1Scwr8ls=
X-Gm-Gg: ATEYQzyuMBxsul2F2p3pfCL+3dDB5VywG0zj9D2pFHPXfJhBrHbNXqFTRbGASBX0TCH
	FLsh0pVklDYnmdA6KuxiqRXCLprc2u7es+P8hNpDoTZ3MGOz/2x7sasAmMkwSkfB8I2jN9rHtZe
	b8hxP7rdyJfHQ/VPheJXDlLIFhgj+Tsu5hxoe7A7jF8eutsDYJ+8wyL5Oy75aTYxOBn5Qb8iapP
	mCd0+7fttCVRfGePIYpKfBIYcjKxrqKo5KLg8UaVOaTApTspXkK2qa75hp0Dscfp8l/5wqsqAXk
	0y+C2PhaoA==
X-Received: by 2002:a05:690c:260f:b0:79a:2e6a:1baf with SMTP id
 00721157ae682-79a7182d7acmr73759477b3.8.1773932946013; Thu, 19 Mar 2026
 08:09:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319031227.330505-1-sun.jian.kdev@gmail.com>
 <20260319040337.366375-1-sun.jian.kdev@gmail.com> <abvYVE-CJcmRypCR@mail.gmail.com>
In-Reply-To: <abvYVE-CJcmRypCR@mail.gmail.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Thu, 19 Mar 2026 23:08:54 +0800
X-Gm-Features: AaiRm53c6WBVfRJxLyF_a6aefA5Vc_KadnMdXrpCiaXRnUOmZ5z1Z9oEeTwJeRY
Message-ID: <CABFUUZFprcMMwoR0fY94EePRPM-DF4-=iVBPdwjv0r3WtrYQhQ@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/bpf: move trampoline_count to dedicated
 bpf_testmod target
To: Paul Chaignon <paul.chaignon@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, shuah@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 7:04=E2=80=AFPM Paul Chaignon <paul.chaignon@gmail.=
com> wrote:
>
> > v2:
> > - rewrite the subject to describe the change
> > - resend with the correct patch content
>
> Please increment the version number when making these changes. Otherwise
> it can be quite confusing to everyone. I believe this is the third
> variant of your v2 on the mailing list.
>
> > - resend as a reply to v1
>
> That can also be a bit confusing as it will fold the email into existing
> conversations. You can instead link to the previous version from the
> changelogs.

Hi Paul,
Thanks for the note.

Will bump the version for the next revision and send it as a new thread.

Regards,
Sun Jian
