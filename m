Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D364DA9A0
	for <linux-kselftest@vger.kernel.org>; Wed,  7 Oct 2026 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396458; cv=pass; b=rmKmWtWEsrXG5ZTJaadLT4m23LTt+c30Wzg9uWfCyActkmRMNqZEWaSYu7vq9rdJwycbpV2GFYGhfELHoFqmQn0I7W1nmLqh/bC7PBmLf15mXFPY9HmWZzVCtuoZ5wjmoQErP7U+ROHb2KDciug71qN15jNV/JacWvAVWo/0+Wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396458; c=relaxed/simple;
	bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpSML7viu9zHKCalIbU/hhWd7ExSsskBnMA7ICaJtCOKYimKcBWYUj2mmZWGbS7jcT7U9ykH3stJiWLcPOjhohHcTmL7X7fP9ZAr0v/8CDtz8FbHh3uSDYSPgXSP/dGpf3G7tK2xhJK/mJ5J85nq2wsFzm0piJdkeANOzy3zycw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z81olt6W; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z81olt6W"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487048857f6so1794090f8f.3
        for <linux-kselftest@vger.kernel.org>; Wed, 07 Oct 2026 11:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791396455; cv=none;
        d=google.com; s=arc-20260327;
        b=jMKouY63/QLRbeEcym7vp/bmJ0V5rkg5Ea5wz/tM8XRgyf4CT8/ZU4QKz5kKT9vypZ
         FrHsZDcT9nql+5BhdNHLESxy3HmuamMoIGCI0oV3jogGoSQDvs5ZqM9HQ705g16jYrHT
         TJzTN32lviOYk4XF20g1ob8fXNU1jyvFl1hR38sJswWYwJm7FwesoA6Kdn1N3Ogb8HOs
         Qx/SnlDGH655XAhD+mJV/sGPhYN8wtn9047tSnBaDl4Cl18zAY+qNCFuMBwE8QQvFXM2
         jp9VwSumZ5DotkrgwDa9ITRf43Irk8LuirjaTbuHZPSPzliC4pYnw3abCjVFpTBP8Obe
         E61A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        fh=NNW1dJr0aG5W8e0c7P7CLSbZ7FIX8+TadKaqeR95XAU=;
        b=kZZa1U85QmVuDSx3pi1QvKvbZccYJXobGCuKvP1gMk87Tf5BVnGTVWHxzL7wuFiFxZ
         GAkKQFH3T3PAVtjDKxeQFNvfZ9vl5xtOT2c66X+oZoi1Yi7TFd+nYMoSH0vTVAil4fT1
         uWpXJol3UtGK9NyIE4MPfFgOhSZtTx0tNYoXSQHJKdt9WjoOxFeStjeXBfKm2RIM4Clw
         wB0JxLBwGQqO+A/CiwF2RUGYvJP8y40PbTRZB+vgxptBrFw+6b8v5ELp3GHq2gO6CtXB
         WZYx7trbokkqfIeEpVc/GINvDxP8zYdFvX7vEtxfgzIORG+rE083hT171BNIDl0H2pcl
         fp3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791396455; x=1792001255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        b=Z81olt6WwsaUy4Pj7lM0m9mtwN9m1K10WWJh2uSDI7d3M/a15jhGzsoAfBfXWNkrV+
         YxcQlSFYA3BBKy7b0PLPuiNFiHaOg85XIRRMdgROnNSty/0rQr/8B0OYpd3jtHSMKrbk
         oXSdIor6kGoBGm525WPNfhve633f8CaqwhbndXzIYkvEvTDREnHPJvAjOC+Jh1mEZ5mo
         WNJ8JKWAAqJnIfpOR7/hETxUU83sPSfsHt70kq6AF+XfoW1oHQMovH6zU1FhadJ6zF7Y
         PL5y+5XC6F1pF1SMsz8RrD41csn+Dg3B+fYbzq7qdCYaaCs4j6/mXi0TGC3NDhKXYibX
         gMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396455; x=1792001255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L7Qw7BUJ1VimfFbY8Sn93Ko7KHTCveBYAFOoFIF3XJc=;
        b=I5oW7bq4C2Dj5Zeivwoj3fETLgiYcwK6dEAQ1eLCndN8Df0A8nW1rt+6RbePZ/vXmi
         qTuoBxeLsN+z2hdK8/cI6SZRt6xl3OWu70ZcWIgRp9xOahWIX+5o9JMv0nqG3P9jg4KY
         57C1lqjeOaHeB5dL8ZcRt1cSQyiUhuI1yCV7pstXreygqwNZKIp6KdYUQB4DVGJWdZTs
         nBLTkcYeZE9zwd/pcQ9O6IzI9m2th0pwVVU0MJLnOz4iCZ6cSwLMrc35Yv6Fly4i0YT7
         rTm7NRJUVluXzDuItBa3b+4+86KHoxg1EvNLr4LpgCtVGUScpDM+077J6MkhifEV2ccS
         Yv2g==
X-Forwarded-Encrypted: i=1; AKwUvBzQvqPil37t1OW1/QLasRyZ7Zv+53bLQ6l/Adg1hykAMBokMUx1GvTdx+w1F+stXv9mkhFQjyAew8/FueHIuAY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh0WQaNdY1lPFT44cvipEHIH+kfcyAwNzJyzprAVklOefli/lR
	+PqYNt+TqnIjGMkqqfmJQr3B7UXPFRqXsfoT/duWhAINWCN5DvOPc/WNPlbsvTMa2IOyxtKwpv7
	A1yjboB1QVvk6n0rDq9LU6Rcb4c1Bz7UBWfwc+Q1MK7vblTW5BVv4Iwjx1A==
X-Gm-Gg: AYBFou1X2FCU/GYbE4aDmnUc+Mh+z8Sh9S6Ea9OjcuNAxD3mKW6luJTeR+w8Z6SUdRE
	KF1eZHsWz6fiyshl6KGTeGocAuCaSJGwSNf2O4sNLV3VQEKGzPolQFDQLSI1wRtui7tRQt//aA0
	hzZ/uLBBeyEiNaMPcDuaTs+nc8BllELWWHRv8QTLnoWbCTIxMjP0LmbBJck0yYkfKRbyAIK3PBX
	2HThvoycZ32+1yzM0eITv1p1lziaf77ok9eChhitr68wP4zrtKlufuJL9Y8WvIrye7XJFlDx0A9
	nzIQg1bpoW/xBxUVFz6zE239T7U/Y2DFfDeUDnAGqKTBrh+hxIyWKtnO2JETGHb2BPRHlz31zRQ
	pigUNx2/sJWIhCgX2al/IGmI133ZnlwF4yyd0YYuFvgOa/kEQpC5TLg==
X-Received: by 2002:a05:6000:4552:b0:48b:68:592e with SMTP id
 ffacd0b85a97d-48c726ed2femr4094458f8f.4.1791396454825; Wed, 07 Oct 2026
 11:07:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007111611.2086-1-syauqicode@gmail.com>
In-Reply-To: <20261007111611.2086-1-syauqicode@gmail.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 7 Oct 2026 20:07:23 +0200
X-Gm-Features: AclHuK83fJ3voPI9vV8BU4O6NHyfYbWWNtcgnngue0EPEkR2NkI5EqrFbTxaoe0
Message-ID: <CANDhNCq4G5VwNDBj5ZbZpWCQwmmgUTgBrMYdHPbK=s3NqKNLnA@mail.gmail.com>
Subject: Re: [PATCH] selftests: timers: skip raw_skew when adjtimex fails
To: Daniel Syauqi <syauqicode@gmail.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Shuah Khan <shuah@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:16=E2=80=AFPM Daniel Syauqi <syauqicode@gmail.com>=
 wrote:
>
> raw_skew reads frequency and offset data from adjtimex() without checking
> whether either query succeeded. If a sandbox blocks the syscall, the
> test can use uninitialized data and wait two minutes before producing a
> misleading result.
>
> Skip on either failure and report the syscall error. Preserve errno
> across the newline printed after the second query.
>
> Fixes: 51f91cbdf545 ("selftests/timers: Add clock skew estimation test fr=
om timetest suite")
> Assisted-by: LLM Codex
> Signed-off-by: Daniel Syauqi <syauqicode@gmail.com>

Looks reasonable to me.
Acked-by: John Stultz <jstultz@google.com>
