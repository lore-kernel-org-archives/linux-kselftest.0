Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903683859D2
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716036; cv=none; b=qMTgxsO+O6Cz0pHui3vJkyGgN55Eh90i0l5cjaub5EBc86V2KpFVE7Os8CqRXRx2w3ZaGVj+yv6kv+RbONEbvlYu/B11eYoESHpqQB+SHquunO+Y7tfshoImdPZ4TPQE7CUVbDLHO3t2NE2Rohy5+oeYT428KnbsS8N25/rk3pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716036; c=relaxed/simple;
	bh=yXjR39UKYmK7Ftm8JdxQ+BfSkZzmP0FxKPmu/ezlwIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AxhdMJMnLWz/zUbpX5hqg/pf5jr0E2KUXGqWxAPZoNnQ8rwNO6GpX7V/xj8fEj9dhyNh7RR6X3Fos14xiJapIT+HQ/Dohi96uBY2rf8HxBZOeL30ns4RRDVg/bSn/sjmn3ju8pVobi4tJmvpvxSeeYEGrmUXhV4qcvNYVykKEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImC4QDd9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImC4QDd9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DD41F00A3E
	for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 13:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716035;
	bh=yXjR39UKYmK7Ftm8JdxQ+BfSkZzmP0FxKPmu/ezlwIg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ImC4QDd9N/qMM/+EsFYKpOHt3uAn6d7BfNVhkArLzzNSpaIdyFpSVCAGB6tC9IMUB
	 1+Edf3Th2sM4TMGdB28fxYVFvtH1yGvCwrNkGe5rH2Yyc7+KS0AItEa0R8O/prbaxs
	 fV35iBEvqUH44iWEU74K1CJMdY0pASB1I2hRZzCoHyKliVhYp0uhkPhSj01RUcU3c6
	 j0RN6afeWRuap7GolLcynsFaLmBDqBMrSczmzOapHXsD5JY5G+q6/6zwmF/ZUoHJgm
	 hTs8WTr4Hz1sGzFc4a44rwKbYdrAYR9++vf3xvzXhMUcwqIk4EgGtGP5JAmclc6u87
	 h3+IpGXoTS59w==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8738c178dso8428104e87.1
        for <linux-kselftest@vger.kernel.org>; Mon, 25 May 2026 06:33:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9c6CYhVzBWIHHuFTyvxNad0KWmvWP1KLsN+pRy2BbcdF5w6FhF/HhPNf2eGVg7y/WL5pExlj0p3CLfIrRyUr0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySvSslnyrq/NGXwJVDKZm8E/fPc4d6yQupgXfGTm90u2yoPPlG
	vaFx8bqlyLP3bJ/1zXcprQzwyWcvONfzq0mAqSEZh6SEEUd26NbF7VlUQAUyyae7NRRS7pBxFzi
	McBcNZKRajq3xS7bUmPxIbAXKJhDLCzU=
X-Received: by 2002:a05:6512:31cb:b0:5a8:eaec:7567 with SMTP id
 2adb3069b0e04-5aa323e0206mr3807272e87.35.1779716034141; Mon, 25 May 2026
 06:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
In-Reply-To: <20260522-gpiolib-kunit-v3-0-b15fe6987430@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:33:41 +0200
X-Gmail-Original-Message-ID: <CAD++jLmvNjH3VR_NtYvyxZCC65erLTwE+6C=FhD8BwR+zj4ozQ@mail.gmail.com>
X-Gm-Features: AVHnY4La1m4efgg6hiAwQ80txwuh9ZpKCSnT1M4A29KgQlSeCx4QcGhOal7zcFE
Message-ID: <CAD++jLmvNjH3VR_NtYvyxZCC65erLTwE+6C=FhD8BwR+zj4ozQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] gpio: add kunit tests for GPIO core
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 3:42=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> This series adds a first batch of kunit tests for GPIO core. I intend to
> gradually add more coverage for functionalities that can't really be
> tested from user-space with the existing kernel selftests or libgpiod
> tests.
>
> Merging strategy: with an Ack from kunit maintainers, this can go
> through the GPIO tree for v7.2.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

The series:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
