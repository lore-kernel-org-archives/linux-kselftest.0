Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A4026ED35
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771573962; cv=none; b=IFqfJ0NObvTSm1LC6kC1MZIswiqWwNSwDXmQ+ZRTVWtWVOZhDjfj0S9LE20dzlB1C+BFu70QrcEiTKNEOInhX4XprIQNIbUs+LxOSJr/7Wioxi6KerNwKSUv/ShE3DBTLCzqefvTJubbBoVDXMf0TH75IU0Dn3bxVn2zHpiQx20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771573962; c=relaxed/simple;
	bh=ZvFkcJLivOp2iVAg0ZWGZsCmTD+LulZ19WaJ/Q/9qBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCIvSHfWl1ItOlRIrV603B32dG4vx/B1ufU69+sdwWto/ToosfriuS0ShZwYpV6WnXI0iVa3lMfLAX3e0nY9oGQCFQrE3R2C9cLxMWZgMIAVoPAOqoFsJ/ASsBcU66d1xOpYv/NSwfHQ4y5nffJblPNCCNkRJyOs1wBAbDJ0UWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nhsB+300; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nhsB+300"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 055BEC2BCB4
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Feb 2026 07:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771573962;
	bh=ZvFkcJLivOp2iVAg0ZWGZsCmTD+LulZ19WaJ/Q/9qBM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nhsB+3002I9S1G44TUNOHYOq/fB++64xJ+b0MTcgj9Zkjg7YSHaqvx6BzGMnkk27m
	 7qcavhlTsf8x580QnGfpkoWP9pxnaWBMBGqsWBcZWRpH61r5UQFS9kVRJN30c+1tK7
	 cEJF9FE6x1qnlst1zipXGpxYK9d4vhrcumdT0ILtINPgiJIjRyBPthSy81OwUytIH1
	 4N13KEEh9a9B9y7GLrl9u8YaaU2fsgFjKpTxTRp8U5cc6TZ3WMIEJ5vAWBM9rxtXiA
	 ZifVo4cQxZ0YPcwA7Kkix0IadETkuSYypGomG80FoU7D9i+/z9w3iMRs5VOeclMcqB
	 XjdUGr/9bHM+Q==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7980ca83937so11056997b3.1
        for <linux-kselftest@vger.kernel.org>; Thu, 19 Feb 2026 23:52:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1pCwtX6tPcgvx3deqZ5KXxbpRr0XvfoeOldomOe7scHQ0L0oXc4qpKqppVtysrphcFCAnhTEeQBvPQWBPB4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29J5YezbxklDGoZK02uwmV/QCrg48MEoO0maBl1Aj0cGNkRug
	UStDE8cx9T0XyP7r+alFFGD4ciKXNy7Uye84y3XfgdwLtMkZtxQRR31/xS3MlMTUXRM/Ir9Qfng
	fbShIa5/nt3YQQ2XmZB29LAv0RxWkCWg=
X-Received: by 2002:a05:690c:e3ef:b0:794:8d58:cac8 with SMTP id
 00721157ae682-797f717afbcmr59640777b3.4.1771573961174; Thu, 19 Feb 2026
 23:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213092958.864411-1-tzungbi@kernel.org> <20260213092958.864411-7-tzungbi@kernel.org>
In-Reply-To: <20260213092958.864411-7-tzungbi@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Feb 2026 08:52:30 +0100
X-Gmail-Original-Message-ID: <CAD++jLnt4ZAotu-Y+cRfHC70xEWrA1ju6W+jcqqW0-F44jrsTA@mail.gmail.com>
X-Gm-Features: AaiRm53edGRzCfqwU5UbQpWqL-jocagaezgjXnfOAwrpFDNQOjvLcwz4--ELe40
Message-ID: <CAD++jLnt4ZAotu-Y+cRfHC70xEWrA1ju6W+jcqqW0-F44jrsTA@mail.gmail.com>
Subject: Re: [PATCH v3 06/11] selftests: gpio: Add gpio-cdev-uaf tests
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Johan Hovold <johan@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, chrome-platform@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 10:31=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:

> Add tests for gpiolib-cdev to make sure accessing to dangling resources
> via the opening file descriptor won't crash the system after the
> underlying resource providers have gone.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Neat!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
