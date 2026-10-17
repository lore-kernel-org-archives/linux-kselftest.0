Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C360339478B
	for <linux-kselftest@vger.kernel.org>; Sat, 17 Oct 2026 02:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202842; cv=pass; b=Pwflza2lLW46oaFS2to8s5M5y7gpfUmF7HfD/NTJbEKh4x8JpzsXJEEhR4cmZuLmUl0HnAhtWnJIrJgQHlr+0Hmb+WrTq/3AnlGLJh+39oNDS3Sl+DOUhukwGgdOaOD3kUQbEdUK7lHxVCXnBTOzGGt9jTi99wqW2TYgdK1bL/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202842; c=relaxed/simple;
	bh=ucLhLRqL2N8ilt+Zi5fdpr9rjtxklnK4PIUsffaVrRQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=guWQqHNifkT4L6GJTTclQgI4IpbxLXuqlPgH4by1lL+Ag6hLqehOBb3E8kMPqV0YnNk/G598rc/5o4u9RTDEJvD+X2zqM2+uUe34gDhhJ66OcT/SN4lgF3zaJUaDKyUHlgZ0StCUkXM9IG/ZJMnUxJPuaGmwWccHsOrxMtHS/04=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=H1pRoMlz; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="H1pRoMlz"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8aea7b7ca0cso4058717b3.2
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:07:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792202837; cv=none;
        d=google.com; s=arc-20260327;
        b=KDXO/Zj6DdVmkFgrySsMkHhc2HDo038lciuyEc9xuPuNe5rRvAVuL0k7PnmKBnFFsD
         lNThjyTbF2rBnt/Mx5b9gEd7nHqrMZRMmgXtS6Ca4ldso/mVxp0a8xDTJMlVk3R+uXTq
         GBOp0g5FU1lTf5L9EP/Ataq2tAGAgugvYEkJt4AqTcwxlwY4dCVg/hhQXoMKmP+pNmsz
         gorddiSPbSoiynF3NAnT9P5KvSrtkVnmBzNGXaQg3a7mkIqCKVpL1B5oz0OcsFzZtHJy
         SXYDAnN8/vtWY2QulCW/lZNkGYwNpydBH4nu9p63RHt/Qj8GlA8Q/O4DWfl94kIy2Z+/
         u4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        fh=SIXm10U0XCrZgQxBorSi+HTORsMpdRZz93hpRAbY3/U=;
        b=riKXG2j9/dvAIq3TshHGEMbFtdtEwo9xZnjyaqPpnoMl8YNIToPpzZOlMLx6vRe7RC
         1yMJBoftGUbPqcNPAj/SGYQOFRn1hrrIZ66GCw9AsZnsGAU9+BnndECtQW8wu/hJcrTt
         qTXUjA1d5jA3W6URTvKZiQ3uFcNWYYYlKlWatyUlbVWR8r+twxvIbr52pcQqHDLpeC4d
         Lzd8G8ISRvErUgCDAj2iXUVRP2Fn9ICfjfwzOnE82lphf2Kr3nDAtUwwBLUHsumS71hJ
         jfIa9st/Ww4c7McfyQhAVkDklmx3gtbcMebLSg9XL9mvZ98bpfGOC4GXVSrXEkiuGmjh
         KaFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792202837; x=1792807637; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        b=H1pRoMlzueVrol4qx0l+oT9cmGk68zNnu32dDTC8JnWWYjEoRwOrO3KdC/IXEToUSI
         bdy/U/OxQW9VR7l1mWrHLbrb4hwENywuM8XJp3iqGJsuoyZzjNH4e4qvHyDCn0GxseHI
         h5OKeRDakAaK4ix7JOJP/j2VKyu2W0R92X8oRH+oDqnjJpLiQbSXS2CCWrwiQ1+5WEUZ
         YJeCxzRX6E+i6c9MPfaVJd46qSCEI9eNfTmZZYntPSwitmGRPmnNRHKbOwieJcjFqyVl
         wM4FVz1XRTWz5HoDlpxUp4jglu2QVZUwPV9oDzyePr0brpH/pt2QGtpaTXrwwAziOm7o
         OBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202837; x=1792807637;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rt4iW6eCLigRGcM8uSRJchyBda6OwJVbeGjzxJgrzQQ=;
        b=H4yEdyWKtUG4T8vRM0EMyVS3m4i2PGyzfosOWQT+GRxXOzrb7CNOo/o+xKAaDjXqkY
         3c3d0M88YRMaNukjQCOe/07RAm/vnt3E8YXo1hHTQCwpVAW/G9YZhftDotIFdq0f4TUP
         eiS+VKN0EJvbygJPBHyNO5huF34DfXaARz4OtvaUwAMay7cM27Hk7iS3X8vsd5oSqTRj
         kmJdLIDztUhPupu7Xh1DrKNzT55ntQ8iBPp6lySf43HK3UCaSbTQ4bn55S4Y19x3MXMc
         U39Ap193VIOkas88kv/kUx3R0sQ8njW/mcHm7A1co/f7jX/L2IwZuoI1/NaDa792Syed
         sXyA==
X-Gm-Message-State: AFq9FYIhTd6pOBCKayXnZTrjmoA44aM6qQxxeAEEIbAkseM4JB3T/HaN
	dYGaZvNCeQ92QP+t7XgbJLrsBAHbfSd0pxSYSaEEtGQkbTvc3ZDlVQUoDoqpI39uBEUjXNo3XM/
	gAzd6NjbfQ4W06RXFjDzcLldAWEkcdoxzr6HZZwq5nOS9pd/UWd2ueMM=
X-Gm-Gg: AYBFou34SI2Pn75cCYbxARxH7OLnNdynnn7Ye406hJdK3A5f/Pj+FDyY0/tQKeVca8W
	LWu/IHM5m9Na7FQa/z5keixHCTF/XMgY/NFPk96M7NyVq2DCTFSxGYD1vObeS7X0SE7a1JjK+M+
	7izQhPCqxsgLmFFN/FtrJ/3LLS6myHQIHy0PVokYM57RcnB26jcQ9qtjn17FyRew1ttgz4AGkUV
	GwB2rsEINEBftRexUrkDP2Lve0bQhaCKMY8LQaxBCF/aAIW2WXrVmjTULREQZ2DraEqN52oCY6c
	Z5fxsl5jWGAo2PD+HneqT8DBA2yVe/ji8KUJ1w1oEBhWhl+qdAgBnOpeIUe8+1N2Cg+aT27kxaj
	bsffBP447JgoEU0jmXpW/8cYcxjRWiv0kBK1SYkHoZQQ=
X-Received: by 2002:a05:690c:a4d4:b0:8b0:a7d5:8592 with SMTP id
 00721157ae682-8b0f2056466mr5190937b3.7.1792202836817; Fri, 16 Oct 2026
 19:07:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
In-Reply-To: <20261002-breakpoints_rtc-v1-1-a3b6542a0fdf@oss.tenstorrent.com>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Oct 2026 21:07:05 -0500
X-Gm-Features: AclHuK8RuFJnIf3a20iamJ5FM0dBZXzdMrAy_kqn8gXFOTDJuXIEynXWTKXUKbM
Message-ID: <CAEev2e_aPeO_MF4k2ScHB5OmyOsMQe7-uz1cxD7vOAO8ntoXmQ@mail.gmail.com>
Subject: Re: [PATCH] selftests: breakpoints: Skip step_after_suspend_test on
 systems without a wakeup capable RTC
To: Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, Oct 2, 2026 at 4:55=E2=80=AFPM Anirudh Srinivasan
<asrinivasan@oss.tenstorrent.com> wrote:
>
> This test puts a system into suspend state and uses CLOCK_BOOTTIME_ALARM
> to wake the system up. This alarm can only wake up systems that have a
> wakeup capable RTC source. On systems without such an RTC (for example,
> most RISC-V boards), this test puts the system into suspend and just
> hangs, requiring power cycling.
>
> clock_getres(CLOCK_BOOTTIME_ALARM) fails with EINVAL on such systems,
> so add a check based on that to skip this test on systems without a
> wakeup capable RTC source.
>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  tools/testing/selftests/breakpoints/step_after_suspend_test.c | 11 +++++=
++++++
>  1 file changed, 11 insertions(+)

Gentle ping on this.
