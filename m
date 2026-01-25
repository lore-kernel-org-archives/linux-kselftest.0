Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1788178372
	for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 21:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769376699; cv=pass; b=ht98aqHZ2zNCbWbAXA8cPunTLKoUH5XBjM9d28C+Objk70UHcpFF3BIymDDTIidpYmF2zB6LNyfFbh29g8EcQsyJmKZi2BdXmFWbkdRDnSF4rCxSgpzTHF/iNs+t2Gp534IhvX+pD0ruRyi8EaIlTKKCruOSUJtOwE3xQuTFnx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769376699; c=relaxed/simple;
	bh=kt+A9gkwiv0rVYfc1NFUTFQmmPKMr/qiYHx6z3t964A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFb6H3q3ubmGXCMQtHaPfBTz51spP20hTsUevcBTUMuX5RbYimTakbBRt1oK12u9L/5v+GeMSLYpbRqhjS3v9ufg0E87Irvzo6ytGoEWxvg9TNICWgagDUH661IWiiQWUDzuDU9f8ZkR6lfbsweqelFWJ5Ro4C07bfzoN+kdri8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=clPbEdOy; arc=pass smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="clPbEdOy"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56636dc53a6so662714e0c.2
        for <linux-kselftest@vger.kernel.org>; Sun, 25 Jan 2026 13:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769376697; cv=none;
        d=google.com; s=arc-20240605;
        b=E96tgL7fDs3J+OeTh55eNzaVlmcdabVmEUQ6VLF78qfs09++Fq5iAeNM+5j4vnFolf
         7erqcc2SgP+XSAS+XrePUhRWBequQwfYszsef8ylBU+OBB6VyXh9fueWhtvH0R3CbQSo
         hwTH/h2wud8oLQir588PI+9IdbqZXvU2ZvG0sU7pZ5BSLI3QUHLbS0IOvwV/TvrGLOBj
         e9HiRBj+MWKSX0tGtUceu31MBIFK/aU+tWofDjoXlgQ6YOaN+TodcmO6vHR9Is3CgGmA
         M5qLF+ix8Tgqmk98LMcub5j6ZrYHbEbplRbvbQ7Ya+wnfNeTrjKnUo3rCqkeNHPW0SWQ
         DYIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kt+A9gkwiv0rVYfc1NFUTFQmmPKMr/qiYHx6z3t964A=;
        fh=WWFUBV33nJU2CWtAo5RSSLfdXusDFYtji6EwLpGLwJw=;
        b=hgGxHBp+SYfrndxUbqwV5k5Ehmi2X+TIYDp/ixDdgzOLvMr+tEQ7XpquyEkvVic0pY
         xDsGgdk3H5OcNEu1OZz3lNSQAargTvBvuMQbbMua3upnrOFfc8j79tLA+c9Y4XO33rZj
         g+tmbXhHjmnfVaXumYf1YxH+AkPXQMzeNz7990PEJBpdvjdD3bSOpXzOExzAXoNhYY0u
         a4tIAt+TpS3B7XkmIu/ks87R6b3jw6v73VYPwPy8+tAi2jLU0dfygOBiq/ybN8IFaldg
         yZZtK4FWLkdFLpBynkOgmuQx9aEYV98X9S0kqsOSfJT6LOxRndPzF/mp/sz24owsVqIr
         9R5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769376697; x=1769981497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt+A9gkwiv0rVYfc1NFUTFQmmPKMr/qiYHx6z3t964A=;
        b=clPbEdOyHe0AFVhbINNVlDOQsryDnl4TQPQpDtppWGw2+YLOC9FAgbdzWw+71L750+
         QNGQEBYc71DrilvUbCUQGcl0BcTZn5UnVgs++g7MS1Jel+W2zKutfw7gwYsz89X5gnng
         dKurxO3Xlf7mjYt+lCyB9rPTntkaE6kERYN4b0mbYkQAgXQYlszHtiKl/0XhaxqwqFmM
         lZDCa8lb9fzuI0OSpKEkJEYP+o2zPUTuy336qQ/oBgvCQHqUJN7prsKInpE4RKnH4JMO
         AECRnVgD1EL/1ohJvKbIh4EVX3vSPi370S9AtOUjB6UpTrcGp4WqIEybit+xWed4yXg4
         PPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769376697; x=1769981497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kt+A9gkwiv0rVYfc1NFUTFQmmPKMr/qiYHx6z3t964A=;
        b=WCNkAeK/XDn2SDHgkJ9gtucqJcIYuNIof0Gyz11jQZybA8UVEcyhoPE0N5+KRaYd4C
         x33cATv4SDjxisB4R1BP61Lt0zG/1rHO+VijKq4r3zVKYJLxrK57DpMkM3IBxdpLoOWL
         /VMwPkbHnLFhncV3rjKDBPYo9x+frEu3W/ZrbCc0DdYTrS5V8z/MYRDXI9tw78fmSEqQ
         +1Er+xAOEO+ZTaFly4hTtoqcqOWgXNlpKRJpWCwUHdhXq7WloGVBO+Y8Ymdk8fNns+2v
         /c+THoWeSfV9xsOeq0+gYjHDrPq/ldvRIXs6DUXEy7I9JEOTyq1u8ZewVhbpIjZURVzM
         x9sw==
X-Forwarded-Encrypted: i=1; AJvYcCXW8NNoDnZ4bxT3Z+ZttmU7N8HuD+xVbUQwJIPqe9aj0PVy/1Ds+4NvF6Dmy2iA6/mN3gvrOAF3gmGluhM6rEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0XMJ0emjr+jSurfr5251opC3Wt5KPdcPQGVbPyJwe9RSDTZd
	NpNXt4j71Dw4bgTBqZ2Pr1EZ/E7OzA/DBnpAD5PpO3+qXvqTNAcA0YzTYo4sP3DbpCrqR6uyDlk
	m7J6ZIat/yYYinTwwLQuh0ill+mWyUmE=
X-Gm-Gg: AZuq6aIQudiohgCCxDu5HgkdRgJNvAjDOfz3+Vpq1Slf7ErNxlLjc+29sfOGSVuU9eK
	avL11jZfA4Ut4ffGbgPHoj/70pnmb+7qGowEx4Y3roMfLJAKhY+y1CIRnVhWHSo+MO0SH21gew9
	c2idHGVe8v0HfhMtwSXpW/YqByV/c/aSpMZ60O5CsLfMJdUYX5egl9j5VSp8mrx4gu4bfI1fVyM
	SexN5gpP9MoLsV//VnuPw8ddl2C8iw8GyR41KgsziGIjd5qk3LDiTat0K5LV31vEbPjk0dZ
X-Received: by 2002:a05:6122:16a8:b0:55b:305b:4e37 with SMTP id
 71dfb90a1353d-5665ca04c7emr530562e0c.18.1769376697549; Sun, 25 Jan 2026
 13:31:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251220204811.3539836-1-alex.t.tran@gmail.com>
 <38r99s88-7pp2-6s6n-2148-34s5rrs4s225@xreary.bet> <CAEoswT3Ft=XSeogfob0aitGkUEQY2dqoYcjT1CbeGWwFAsA+KQ@mail.gmail.com>
In-Reply-To: <CAEoswT3Ft=XSeogfob0aitGkUEQY2dqoYcjT1CbeGWwFAsA+KQ@mail.gmail.com>
From: Alex Tran <alex.t.tran@gmail.com>
Date: Mon, 26 Jan 2026 04:31:26 +0700
X-Gm-Features: AZwV_Qi1Kum8pdTw00BH_Rs5VGjGZ1cdeRTWWvPi50NfigQsw5gh_9GVjfVvIL8
Message-ID: <CA+hkOd4fYBapwcPFo3HkoPr-REEZbofzACo+=96C3vtvN16D5Q@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] selftests: hid: tests: test_wacom_generic: add
 tests for display devices and opaque devices
To: Erin Skomra <skomra@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, shuah@kernel.org, 
	linux-input@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 5:54=E2=80=AFAM Erin Skomra <skomra@gmail.com> wrot=
e:
>
> Hi all and thanks so much to Alex for the patch.
>
> We tested and reviewed the patch and everything looks good with one sugge=
stion.
>
> Since the properties are mutually exclusive we'd like you to add one
> line to each prop test asserting that the opposite property is NOT
> set.
>

Sure, I'll send in a revision v3 with the addition. Thanks for the feedback=
.

--
Yours,
Alex Tran
