Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E153CD8AF
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777299232; cv=none; b=hrYuhUiuznUzjJZCWSq+kTPSv5G2BQvj7ytzYL1yszcFTtDS/Tl4awQDLYJFkpbH6sM07Ab3DCvrp7lugcdwzkaKSMSBBR7/0H1haMItvDuMMycPmQ6rlQ7Ul0Kb8Aab+AsExEZCHzwPaE2sgPrRhjVBgJGyhYUFoG0VN2TXYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777299232; c=relaxed/simple;
	bh=qLzwO8OUrBcbSicWoFk1sRnTUDK6pTn7gwEERvmGTGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LcCntqWPhaBVYLxI0XCHK0aA8Y6kaBx98rtKhZpgmFxN4ch0MpStvqvNseGptVER9huvE2hSXJG3P+97A7Wzlo4pphiZbdMulJFqUIwmKvvCOflxW52jrE5/D8HZkMc0UFNNUxaPzONCVzEBDUcTQVm3CyI1H8Rxo6tTtIXJE2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwObmfH6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwObmfH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A366C2BCB9
	for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777299230;
	bh=qLzwO8OUrBcbSicWoFk1sRnTUDK6pTn7gwEERvmGTGw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lwObmfH6iqNrJwZVI7acHyfKt5cFUcANvX2VtZ5Y3XWSd0ohXFwbQRG8vc3MuFKBV
	 EyztUqwO4ncRa7sBtEc+UsUCiS2tpffLxRvrvdTJXo6j94U7a+NqdCydFU9wAuQB+s
	 krHdGJBoCLIPcfD9ooQrJnXT1WlN2tL7rQyZbyFv9f5UvXBVM4fWpukrHF+USCi2UF
	 akSoaZ3RjUjPX6a81Dyvt/XIrSfIYx9FZXNRuqLr/N5ic7qN7uoNZ0CpAtFDfCDW8i
	 uX7Xy8cUgofNOWdx/tgL/mNq9F903tg6VO1Jq4VsmTWIxhZ2AQlq8GOc6AeNKzRLir
	 X9fpyEuV4NTQw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59dea72099eso11287685e87.0
        for <linux-kselftest@vger.kernel.org>; Mon, 27 Apr 2026 07:13:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8QZVgQLUzhBZoEzumhCMM7WWTM8WQ40Ie1AhSeGu/uZemn0itgZ18BfzZ4bDbUX7dWQP7M5f8f+CWnrgYhNtk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWqU9SnwjNvME/bDtBUHH8io3P8J1zEIAo8lnDv/SUButn7Zjy
	XMX+t40HvgQBl8vwSSSNOM0ezGeTZMV5/9xRVKmNCsIrzKaHj1bO6XzBV6Pv49WZciynjEVOiCA
	MAGaykCeO4xKz4AWxYo0AW4WsCmCiCpUv88XjGmwh/w==
X-Received: by 2002:a05:6512:31d6:b0:5a3:e605:ee4a with SMTP id
 2adb3069b0e04-5a4172e3196mr17485635e87.44.1777299228688; Mon, 27 Apr 2026
 07:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
 <aepWdKzd8GPeayNJ@google.com> <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>
 <ae2TMiUFAFd0-VuX@google.com>
In-Reply-To: <ae2TMiUFAFd0-VuX@google.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 27 Apr 2026 16:13:36 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdR+xKCP5e+RiF-MvHvD9-z-Vxno=0B7nmOm+1oS6TDMQ@mail.gmail.com>
X-Gm-Features: AVHnY4Is8uMh0u0DwWBO9FyOj1q1VAxRLgjTv2wS4mgvG41HNICSK2XQinslgZE
Message-ID: <CAMRc=MdR+xKCP5e+RiF-MvHvD9-z-Vxno=0B7nmOm+1oS6TDMQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on release()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 26, 2026 at 6:24=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Still please check sashiko review - I think some of the concerns about
> error unwinding are correct.
>

Sigh... I hate the walls of text it generates. Can we set it to
"caveman mode"? :)

The first part of the review - while valid - already has a precedence
with this function. If someone allocates the platform device with
platform_device_alloc() and assigns the address of a static structure
as its platform data, on release() we'll unconditionally call kfree()
on it. The user must not assign platform data directly but use the
dedicated platform_device_add_data() helper. We could consider
providing platform_device_add_software_node() but since there are no
users, let's cross that bridge when we get there?

For the second point: sashiko's right, we need to bump the refcount earlier=
.

For the third: I need to look into it deeper. I thought my second test
case from patch 3/3 checks that use-case but the review makes sense.

Bart
