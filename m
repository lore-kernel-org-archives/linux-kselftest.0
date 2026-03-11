Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4172A2BCF45
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 06:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773211683; cv=pass; b=VWAH0k6b+cfWuJ2caHK8lxptVWwTrTzF74l5tUpx4/r1HQOUnEXGL9FalfSzdtJNd36QOcL1G4pDvHftSyUsWP1IjPo6NZQItWTnDaxm4SjDxoD+kniOSTgZOkh3GLNlyOKPo1NjFKxFMzUdV6FNAoiLITllhAHiTZZgPkotB6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773211683; c=relaxed/simple;
	bh=OKXK+AfEjKGL373gCNOhr/hDVfV9JLNvK7zU7xw2I2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h48939JZsFy+Gwu2kpjJ0ffbyN7bDRA4BzEOCBJU+K5GEOxsC+QHgv6KicqAnLJEiPBUN+cfCUQ6HVkbaxhZA+hum35l+xPFrIluSSwrBV7HMgkjEpsqWZQuqxN3/OrGsIyfzV3qy9+l5chclI7JlgVimlwd6Ql2Rf1bn3+02GA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+tBFTQC; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+tBFTQC"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7986e0553bdso130032557b3.2
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 23:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773211681; cv=none;
        d=google.com; s=arc-20240605;
        b=WtGpfi3g05gkaoQsF9b7b5N7OuIFfd4tkgRmuXG41EJRXHrBS95DF7iR/beZPgOdeM
         BvintLomhRjbfAHiLbxstqfI9snAF2h8q7HtH6dtbIvzz/FOTekzWCqFe1vhr9TT7gUD
         +3W4HAg0HmJx8o4XZSuTu7QIZ0DHndsYcf7f+7iBj2bsdGFx9VjqsZRvkKhl7JUoXrPD
         YdzxEUu0SJDuHTRHje5tltHpNys1r+Gm3wOu6Tz+CBwxAvhrE9VR4bigGiiAg0o2J7P4
         b9r6sYIX3oDK+LTSrPGD6mtotN7WiUf174MfAY64l1nS3Nmp2EmmlRkNeDEyMrB+7c6i
         K01Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKXK+AfEjKGL373gCNOhr/hDVfV9JLNvK7zU7xw2I2o=;
        fh=O4DObNteGTysctcPs1NclgbmGsszYFIWFmjKVZyccGE=;
        b=BnIrhWT2RRoGB2isiGBkVSZPDPkuk6jZmCMXjZg7tyR9u5B751uso5JNZiY7vDIr0G
         HhdsztC8H7lo8GctNJPTzzN46AL4gj5E31pALw9Ki5B6RE1V93prOVvu4RquEcscyMjO
         Ep9rGWL36bmwdB8bBuv7FsKWFIeNCfxrlJr4E2R/0sy3IJn48+ODhTjhQC+LgiM5+Am3
         v02uaKzSmAtWoO6+HRQC9sCVa4Ra6hj3qZcYA7ai4Brhp4IUAiRxc7+y1qRwrv+makWS
         S8/AwZfqXJVU9tzVVX9gL4uhkdVT4JbN0kwVO5MyjgrWoVwWaj9KdIJRkb7E9UbK7J0T
         MZHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773211681; x=1773816481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKXK+AfEjKGL373gCNOhr/hDVfV9JLNvK7zU7xw2I2o=;
        b=P+tBFTQCpXokaIBjlT19U2drGIr7a+MPdJAy659EZpYIAqqqiwukXUpqoKH0IkRhtm
         cAAXnOZjWyr3l+K+2t8aNGCMTXNjS19iXE75yVy6kA+y+vbcVzm2kJrs18z6Cxwo+Bz2
         cBsBHUhz7TA7rtGIG0dJ5ZNiofopXdScke5ipRycjmUl4AotwlAlRMMUXkgqO/UvKplz
         kTQHLzORAOuXJKqJSTjG16mm9x8FyjQSN87W0BDXtpMgFo9XWDChpP7IoMkGKhmrgtAM
         dYPJnbBf8qZnC59552MK8DuRlmX0EO6GK9yT5J0XodfXfzZJx++haQA+dDBg/t89Udwm
         Ix+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211681; x=1773816481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OKXK+AfEjKGL373gCNOhr/hDVfV9JLNvK7zU7xw2I2o=;
        b=P9+YsOdfbnfK8+rVZNRIum+vnfVL0zcht3o5RzP1N1Huu5vSnbZYpVdbJthYckmbR2
         ZSrKUgYNi7Azq2/W9sY06dsclKWvxZJoE7/R2dagUp3uwX/oLEAFeLMjsP/JL0C+FoZD
         iIvbdQn3qlyJcKhpS3KqM4x8U50rdn1wudIrF36m3w4rD0+WruwggtQG0Ko4OVE2KRo/
         89fP0/HEEwcRkUw5fngGHMRRHXq5s6UIXy/QulK7dLPmVPJJxbM0nMOINx7cztQ81hqy
         b0iuOCg0JIQdfpd8+1wUaeXDKRKIuvktLSbkm9X2Jpz5EHqLej2xk7Y4/E8+4UHehoPu
         PahA==
X-Forwarded-Encrypted: i=1; AJvYcCUB56+wm/8b6CR8PUZn4we0CnfmQw0oVC9AWArtuC59WsTuMoHE/OFwSjHqr35pB4J5/DIPaR5VA8rtg+tkZ2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ5UovzXiavFWP304aD6ArMs9sNIVOmiRURGSirvPFFEcry5zZ
	P9nboWBsxG05dp361EZpC3wxmftEoTI/rBhAgjCYviHWlhclNTOTur6briPfofT90w41WhOtf48
	TCeHw9j4QUExiGCsX5HHmrAbqEtyjOrw=
X-Gm-Gg: ATEYQzzGXQHBmQ+fITtD0XojPBD8ct8ApBdeBCPHJRCqn6YwwMBOeivXfiAHpM8ku0z
	GNN6iKeywVWYJJmv/WpfQmCNKBJLUO4vfp3CYzV8BR8wKxvpwjdW/xOHstdGUsZzSZsvDCv5djN
	abUk+sUBFCmw49PjbNXWPGnbnqJ3JCJBZPkM2ht0a3RWw16TsxTwshP3WUJ87kZE+MjVOTVzoiS
	Hpd7U3A3woS7fnsnaU6JDaLkFNBlYPlLqqof3BTlVftmBQv5elEfVORJAaCUVX5kNjtGioCNkt9
	zmjo1Fx2BSSPuDpH2uk=
X-Received: by 2002:a05:690c:ec5:b0:798:c347:ccfd with SMTP id
 00721157ae682-79917e7d546mr14270177b3.11.1773211681221; Tue, 10 Mar 2026
 23:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310102145.857810-1-sun.jian.kdev@gmail.com> <6a914824-178a-47c3-98f7-f3c3086ab831@redhat.com>
In-Reply-To: <6a914824-178a-47c3-98f7-f3c3086ab831@redhat.com>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 11 Mar 2026 14:47:51 +0800
X-Gm-Features: AaiRm523CVkghIJYxcXd9XHd57e_PPHvDTlrJgjOm0NBjaIeqf5GatFWIHLuD-k
Message-ID: <CABFUUZG+fDw2eETsmEs1RZ-vSZ07uuxLuZDYp0KJqTX_6via0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] selftests/bpf: Fix read_iter buffer termination in test_bpffs
To: Viktor Malik <vmalik@redhat.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 8:28=E2=80=AFPM Viktor Malik <vmalik@redhat.com> wr=
ote:
>
> Does this fix any real issue with the test? I can see one very
> hypothetical false negative when the uninitialized memory would contain
> "iter" but that seems very unlikely to happen.
>

Hi Viktor,

Thanks for the feedback.

Even if the probability of a false positive is low, the current code
is still incorrect:
on short reads it NUL-terminates only at the end of the buffer, so strstr()=
 can
scan uninitialized stack bytes. That makes the helper potentially
non-deterministic.

Terminating at len makes it deterministic and ensures we only inspect
data actually
returned by read().

Regards,
Sun Jian
