Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4338D3FD
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598336; cv=pass; b=ilfi1PSbVvg2K01R/IP4hAb5Pum4ZjcQ+KplEvkGH7FNbpfX5oRfTdQGOIsHDNHn5eq4319jV/uMIh1A4k/A7CmblRYWvyut6dnPX9qnaFLyiaG8RqfdPVD1gtNkT4x2gR9owSxb4YMYONLF9v+mZXHXMvGhLA7wJWL0pw9IGG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598336; c=relaxed/simple;
	bh=Yc9da0wDU/GeX1+XjMTk9av+bBmiHdfCu0Hae/L1BKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AzTPBLcDBsS51h3MhoIlvYOatl5Ps6G/WVcLm18a/YOAuQv9imrBqxRzs0tzz97kI5qDMp3E9MHsWpaO+U0OkUPVTEettd4k8vnCTbBn0GEq/w+CfjDx2i4aPoCFKWawGzjRQPLlQybbVb8zqwM8Z0vUNhQbXidY+U+DAlbI/mk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bNcXOg7d; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewWkVXwP; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bNcXOg7d";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewWkVXwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778598334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
	b=bNcXOg7dgBlMSJaL1cbnPz2pmfiDmi0Ux/Rbpm1Ylaa/7uRcKDQmcv77cEY6nrAobEcAzP
	gH0eJlywHWPdSeNyCojL2r63E2JekoTd2rTRiRXZ72CfdfbTI8wdkA3Vc7vS6JFDq28BjG
	Ik0JuirZJnfQ/TwIhnV6J14RwnRzbHw=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-DiqvVk-yPZC4elOCZguXbg-1; Tue, 12 May 2026 11:05:33 -0400
X-MC-Unique: DiqvVk-yPZC4elOCZguXbg-1
X-Mimecast-MFC-AGG-ID: DiqvVk-yPZC4elOCZguXbg_1778598331
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7bd5c42192aso150080207b3.0
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 08:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778598331; cv=none;
        d=google.com; s=arc-20240605;
        b=M5sju16ZJg9WgqGY+b6yXeLo8YVgUDnNPyxtLGaOwhCwOp08f1i4c/36h/hm/sbJRw
         ajtz5SM8r8fYvQ9hmuLyd++LGUbCjhmqsWUGWqFSzzvAHEj9i8XD+M0RN6Q9Z/uc56Df
         W+IawvFpwlUWxp9dV0/vL4rngjmEpR0BOUNPJEwH485OG/Q+dBLAomjbo5lXGOht5g9K
         No8fQe3an70bbLPF66cbm3OYN1t+aRQNkKf5LkUUOSJzaRX5PK4GNE4QqZMZ7Tt7gS8I
         4/XssleE4bAsXBaMAxtGfbbRT5h4tnZRpz7Og4hlleWW/fdtsaZxO6uv0OUbO60JVvvq
         Mxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        fh=U+Mn3L03WO3CQ3p4ZHje7qDOmImfimV0Mz/50XJXMZc=;
        b=QGJjk6EgiZoz5qNOy3gkUhRRwf0B2oekUidGrdTU+nLLaphli3CjUwEW+ccU7k6XX4
         ncYvFGhmPSbjGH/io2frBfmArh2duI7SELq4CcR+0EtzfKuiaBeV/0u4jsCeTKcsYxWl
         5kmbBpS4Jp+pCOjlqCnBrx7wKXRMFxxQJ6PHY1qXQIg4puLwrCxY8VpcFNDdbLotakfq
         JvAzvafmGZYTZchw7PyBaYmj5P0bJKX5rKV8Y3DvuUdVmFUTXfxBJTXiX2yYB1m7NBfF
         ngZdLjgbGtUf2dKNj/RHkoytLJEDJ52KNfnHHpJnxamzjD53z1XsOdglvbuEiQGImLuz
         loLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778598331; x=1779203131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        b=ewWkVXwPkmCZ4XFrslMbpJ7dm1h7H9AlNeXjD4q9j5CcOAw5wxZyAyQiiUl/6HUkyb
         5CAx7JBrlIfZf/BGNlQfXZ+al6czoIK0sCFwoDp1QosILvQ4UsGQ5jk9kRs7n2U6b2a2
         H7DcviGDXUwq1RZS7elQU8cY6hiQkzUEmTOVHHDZUoUrAOPh9cKZnq5QHYOxbVLHmlOy
         V8J/jTHds/l5BMAcgyySDS2G6RBmE26ROVALfA155CQw9Dg4q2cbBvWvpVI3mTVW5v3a
         IyOJjoTjj9dtYQirRqZdbSICf5wc+NphKTtAOxyB3O1OUi33HaBsdZuMQpj/dV3DobBG
         CQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598331; x=1779203131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        b=T/Z+nZbXWWiR2P13Lh20ngbTGsTfS/Vl61MWDIkSgayuZc9lXuIM4joS7ZDlKWu3sD
         ZBHFtmJnr0qG60jvNjCb6Mgqg/wgNzlD4EJwLd0UDUkHSQ1u7tZoWd1I6u0NYYBfd1qy
         4igS6ZqE/H4vMy9+bdYCgj0sG130OgdNj1rEouVMHp8zBSSh/VfdgvzkcNT3o0/Mf8kS
         7dxZ2fXrOHzn6T5zWsSQ6w2LFnH4x26jrQryvxkPQHHbvbMM9PNboDyF7r0XtbrfXFa+
         uoSGzZAx+aFR+7ahlzrM5i6b7Fu7a+6nQCklABGCGV11W5mCJY6ZMEL5u40OVQMqgyOs
         UXdw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZD6+B0rxpmbsOlRHS6QTBSJqJM8H1I6iJECb4f48zcPOYstW18hjvHJFQsph/w3zbmacUbNr4p3LnaK80SwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLLqE2p4jgNFQnzKP/YPrBgGX/vGTupDoiA3+OcBBfcrW7DOZp
	HhDrQDzkd1VzL6yo61Tjm9lglnKbhj21CUNXi2jGHb9KlJWs5SdYR3xv39L2o9YVfmijbLc1s/T
	MXOorfXurLVWcIlGskAKSqn5xmxMfEhaE1aqLSoNnxQni4w/fDNh+MWSqaBF5k0WfHsSrZSHs+X
	4SQh473Rnxvlv8CuGS8dAyrVOOrg5ojH18NPmMIzvUa+1o
X-Gm-Gg: Acq92OH0AOyWAsQpa2qjRvF1XS83FPixAhYX0bepmGLew8a3quJ5xzoViixtgR5DOaF
	V14aREtGBzvRVekJOwZqNBCF8m7wLEiN2pSsvI3JLxj0p3IU7ZiVAJes/0Y1hojjOWuY20GKWkj
	IYzzau6/ohgr7IhyiNg7X6dy+4F3MLbrECJAwQ5uRJhZHXnM0VXOuuD/Dsv4rSXCsW5PJ7p1aBP
	28Z1w==
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id 00721157ae682-7c50f7cdf32mr36554527b3.18.1778598330991;
        Tue, 12 May 2026 08:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id
 00721157ae682-7c50f7cdf32mr36553547b3.18.1778598330230; Tue, 12 May 2026
 08:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com> <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
In-Reply-To: <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 12 May 2026 17:05:18 +0200
X-Gm-Features: AVHnY4IjDWzPTwv7Lf1EJ-4smElfrpc1pe5LEGC8untQsvEPzH-woMO9H8PAPck
Message-ID: <CADSE00LNoc8KgVWR=7Va-Phb2U9sDzS9wntWckDFm66Uz89bnQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] kunit: Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 1:52=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri, 08 May 2026 17:02:44 +0200 Albert Esteve <aesteve@redhat.com> wro=
te:
>
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
> >
> > ...
> >
> > Solve the problem by providing a means to suppress warning backtraces
> > originating from the current kthread while executing test code.
> > Since each KUnit test runs in its own kthread, this effectively scopes
> > suppression to the test that enabled it, without requiring any
> > architecture-specific code.
>
> Thanks.  AI review has a bunch of questions:
>         https://sashiko.dev/#/patchset/20260508-kunit_add_support-v9-0-99=
df7aa880f6@redhat.com
>

Hi! Most look like valid concerns/issues. I will send a new version
addressing them then, and monitor sashiko to ensure I clear
everything.

Thanks for the link.

BR,
Albert.

