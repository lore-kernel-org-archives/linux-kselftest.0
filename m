Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3707732AAD3
	for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 18:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540346; cv=pass; b=Mx4QYXDYJpS4m5e8dpwVEvE6NXSk4qHGUvS2ZbRcYeOdjyMKulnxYDpZPH1fNm59aVmfFrw/7Tpu7QG/ZCvm0PzpzRS4mvdf6kjiJlx9uHUNbLv0IN79vZJ7ZyCVYkJ4z7aXhkOtcvWRtU6JapKbeV4Y+f2JoKkxZhymSPLeHSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540346; c=relaxed/simple;
	bh=IIBGupSZWERssUHAZyAUJFNeeyb2xu/a6CxX9EN2hx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODezQrDpWvc3ax70+Oif3RfOcUlepBfaObc/jiqJHYEYpd/NsIcsUd8wQh3PN+nqbEZ4FmoWf0F5KD28ZuE+MGr0GQ93DVQoLhtrzs/P2ndzBISoZ8q+ocg1WwXVPAl1A2pX6sKLiGiwwe+8m3ZIh4bpKIVsxt+xtZHCoovlf8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2CIKXr+; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2CIKXr+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so5072368f8f.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jan 2026 10:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769540342; cv=none;
        d=google.com; s=arc-20240605;
        b=MDeZWyHLqDhVHQFhORzaGlN7OVScafP3Wh2zYiVT9k0JyZPZEfH9SAz3T+VOqgXbI/
         6vh1kMTuV6+jAnh2FLBxbj/v+9Y5RKwSfN8WTKQysKs3G6+fvQQPbURDJRIT0qZ5QU31
         RpkjJj24Ifoib1U2VkAN7chwNGedH5rPsPLh4oS7iWDGN9LtqYoy6n0W2AHlS296CFR/
         oJvogffDUFkQLCMB/7g/TwC+CHexz2DukuihR5bS4J9/Ko0P8oR2MeSsl75DC8VOqFRu
         F6a0K9GCwFZxx0KoEKO+mygZaj9DAMHqmyRIle98oDkIwRZVDcnKOD6+6UY6dVRVaR9n
         bX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aaSznZP67F0WuirhSjihADlmmfi+xxar5nLBaqaHWcQ=;
        fh=Ik0fEQ4JhHgrzmdfmTefb+wEr0kqGIvOndPiT33enrU=;
        b=hBYbBXmlYUPUONI6pocud+ZCIuXEn3wI28iYXStXGDwewVSQN9KqgXyCTwaherY34f
         nOcu4aW4ZdopwEglkdwbUEqxXh8NU9a1wbA63/fMowgZgKGbrOChVzCbJULNVj3H+pOi
         1wIKg4cdyaHT0x+VXVRvGvWLFsb9zLqBULHk8nASWbg9YfocmL/3VlNPvpx1twXvxXIn
         v800pu/bH8fOCS+p/9qH14GNeBRwYg5Fw3wa3Q789Co/3NMM7xiDEy6FKjVU1tlwOSfG
         1bjZsYV2L5qmk9Rn2T0Sev8Nne82iTWfAAypL/j5TgpxYd+XIVSaDxE8S0OTUZkqDGTP
         FS/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540342; x=1770145142; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaSznZP67F0WuirhSjihADlmmfi+xxar5nLBaqaHWcQ=;
        b=P2CIKXr+DhqD0FZDzfYoE5uTwQ7aNQFdLpJ3oZegOvdLk4ERVHdgl+m5CwVqaInd9n
         S7ACpMrKclFRP4CjIE3zE2eeCC7JRIuoZyRlx+NJfSVYb24Lq9d8oJAxK9oR5oL+dS0A
         ROvGV28YzXfvsVa4aHZYkAk9MQuhjT+6vJV1TK4BTmWN84BiOg5JTInNMWQ/UqqN0Nuy
         vQP+N8BCv7Nlptc//6d81GWCuGjSDQ2J91NhivjGupXj9kaWkREcEuGwz+kOUFTfn+LZ
         ywfWpgeTrC/oy2/hXxvaIpMIdDgenu4zEoZhbJDAndZVDe/DtaALtgH4TknHFXSUuLWt
         lWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540342; x=1770145142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aaSznZP67F0WuirhSjihADlmmfi+xxar5nLBaqaHWcQ=;
        b=BwqEyYYRuRZu+VBPQ0XdXVr/9s51VIDIbGsr2gjSXShZQ0TJNmt7qjfzsmVOHZ8H2j
         V6ENh0ifdvvmXF7Bm1ro6AvkgkK7hwfRbmOzF3U0lhXAs+Cfps6EpfLzwAjm4KnA1802
         QI54jgN/EbRyzrEDEppcA80ICB1aREY/0vjFVxUowohT+xZuLGUqlppRED/XbfJY6SxW
         6jjMrG3HjPb8bPJBWLDCthSBF+xoulyYSx8r7x3+02Ij/X6HxUq4fKQpVsU56Gm70A/2
         J9H/qPfNBEz2CMTH0rlamTjDBaYSviFm13qk562eAraoCc/jhcn53A3FhFWxHJMhfCWi
         i2/w==
X-Forwarded-Encrypted: i=1; AJvYcCWJyJ1d4tV1Krjrru5hPHnOGlWNuL3RPAMaf5Y1VQeBG2iC0JZEMldS1oWWRy/IaaMdDZlBCld7ipVwL7/ogNU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9N4TIXzCr1K1s8x8bxXVwxYMd5zbuCMwGUO4hyGMLHx+5GwdX
	P87osVhMyJ0Yh2Kks0kI3cWCSR/2xd1AQopVEgF8KKUmVOlahoEAWlDZSLUWX2EHnYrS9eFpMxL
	Y92oUwJNdXHrGAyQlFC19tHJqzWPPkMY=
X-Gm-Gg: AZuq6aIUwmSg+EC5p115FGZTin1VJPT7M3zBUnY/bMbSHtvWBLF2lFINKt+4qtY3dfO
	2AVqx9RxZD/h4G4eFKwPxVQooTBqSy/QjOHM6hK4JKLlbbW+wpmhx6XXRJ/XXsVtzmvLZ5xwlst
	vU8rt9e0zhiaDAX5ujJ//HeTCyUaV9jmbIO1WESgp24w6ED/Bkfij8XXNvK8wuEp9mz8uz7aTG9
	irAv4N42zDdVFUGNznysfflllGwsRAA3Gxic3sFRrETAviAJZT8rZf+SG9uEumUjsIvv3GN2MQ9
	xDc0XY18ka5ycabPrGnKB2D4osjLLv747IPNy65AHJEsZ+cJFKTtnbSxMut4VrdyM4TX2r/n3MS
	r2XJjIczZtJ8YUg==
X-Received: by 2002:a5d:5d10:0:b0:430:f5dc:d34a with SMTP id
 ffacd0b85a97d-435dd1c1d6bmr4100001f8f.29.1769540342429; Tue, 27 Jan 2026
 10:59:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123-selftest-signal-on-connect-v1-0-b0256e7025b6@rbox.co> <20260123-selftest-signal-on-connect-v1-2-b0256e7025b6@rbox.co>
In-Reply-To: <20260123-selftest-signal-on-connect-v1-2-b0256e7025b6@rbox.co>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 27 Jan 2026 10:58:51 -0800
X-Gm-Features: AZwV_Qgzk7qCM0zvtA5MeIGgCCUqqQ7cMiI-0ZvBSVb44FcPjsYIcO86olVTO6c
Message-ID: <CAADnVQL8wV1iPeMZ-ZvN-34o0gJF1xGYu5ZtLuD7GBgtj-ZNuQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Add test for connect() racing
 sockmap update and signal
To: Michal Luczaj <mhal@rbox.co>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 8:16=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> Attempt to trigger warnings/crashes by racing connect() against sockmap
> updates and signals.
>
> Follow-up to the discussion regarding af_vsock connect():
> https://lore.kernel.org/netdev/20250311155601.eui5j2lta3q46i6u@gmail.com/
>
> Suggested-by: John Fastabend <john.fastabend@gmail.com>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
>  .../bpf/prog_tests/sockmap_interrupted_connect.c   | 200 +++++++++++++++=
++++++
>  1 file changed, 200 insertions(+)

Not sure why, but it seems to be causing reliable failures
in what should have been an unrelated test. See bpf CI.
I suspect there is a cleanup issue with this new test.
Pls investigate.

pw-bot: cr
