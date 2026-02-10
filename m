Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607F13168EB
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 10:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770719937; cv=none; b=S3MqwaePtyCrUCTwO4jhzhR4f5jM+gGiwqI+Cz3xoSwRd8nrAfRNBgR38AY8T+1ocv53Vhlxf9VDXJpmy9oyHGAio9sXmVf99FWnGF/M4GZq0U5jQdVmeqj2TBd2Q7J0nX4+hHNLOoxMyQF2lgIcZ5MykDrp10TQKq0zqqnYAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770719937; c=relaxed/simple;
	bh=94aHYOw2nX2XxrPNHDYFWnWPEoP2v2C9z1A5yLmc9Kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C7MO0V2VARguY9h026yJ6a4fGq2TR46CFlTFc7Y52+M8375eZgkDKCkrPfwQQCyslOXO7/rvJVXSTFJcJfhG4KFZM6NIzEEzNYHHwOLOEw/VBrFkps6GJI2/ESOAzhoJzTchp8R0m7THyT4XJcoFuRP7usR3d3tn1X0YVE1I3NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9489b08c211so310315241.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 02:38:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770719934; x=1771324734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxTZChuQvYnYAfchI6rKnpLi7lD4JzDEprV4DeGLhBs=;
        b=CxRg/3soG5/lUnKqUMa9fxFB8N5U09xxCTo8eHpDj6YLJOxja0BHq2QiAPMcXR76/j
         iS5Hv7dyaffTJM5UQ7Xl9+GV/jUnvDf068rO6ZNXyzLKOHH1D53r5AP+am2bMg7KByfc
         1IPpoNlGOIdhLkTS6WemTlvTN0s4JNm5opq56f/HnwOwCrDFRJQ5C2nu95DRMsdXBbNz
         t2qzyFGgoqdU7igh8NH9s6hnRe0hl8RHJMg6RG+d3nF0nmiKPkNPU7didj5y+kEoZOMX
         R7McCIVkNBT42658hfeCA8JVh27qBl6vKmeVel/lE759dwscdZp7FxoDMcayMT7PzdRL
         dJ9A==
X-Forwarded-Encrypted: i=1; AJvYcCUOTz9aOfydY7EveNjV5KIjdu5Ut1CLFX62Z1OlwKZQVneADNqmvUseWF0FpHdCZLxQbEB6609W9smro+ZmZ+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8B0g5WBaEcSx8/1AB66pKxatNowuoOqlBBg52RIiGRzKI4x8k
	pDg5x5NJ836CjhQlM0EiGN/KccpumFGYubNI0sdMgv4ENsBAIwVV9E+SwzjbceNM
X-Gm-Gg: AZuq6aIqL6j/F0BAkVPPZiXdSHrNVhHI8M972ZtpwZgudFOUcWPWxRF8YwCYTCeglWZ
	vLZhW45PpEbaLBSBvwflWvaM/OEeSVXIn6MJM38v+fhGB6v5bZz/kXnNnHcp7OBnqRXibrwQDDk
	DH/RAeQS+exQiyZCJ65brxjj88k/ut5lpr5ebjRfR4V5VziwTQHJITJohWEYO6liO57XVWiVpxC
	dv9okwfvgVLl+bgCgh31wDtR7GYy7t3gZwLZJKz4xKcswRGnpj3haLoADDAc55xLq6S5FOF9lFY
	5xTsiJIoKtm0vWSZ6TiuKhcacicqxBW0/xZQ1HOFM9ywHcPTSuRvKvFBuT6o3GvmKw9ug3plijU
	dOslLXG0n/posBs808BO/8TpDskBxrvA1JmPFpppqC2jD6F0xF9J5ibsBhKjsLZQvLEsQGhBDOp
	RCAhRo5h/rGAajT4sgy0pkmeP+dy54z/IQRmp8a4bQbY3Axp5pj7L9DQi+s/yRN0cnyeosO2jFM
	FE=
X-Received: by 2002:a05:6102:5493:b0:5eb:fc32:935c with SMTP id ada2fe7eead31-5fae8a24711mr3983018137.3.1770719934224;
        Tue, 10 Feb 2026 02:38:54 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-949016c6851sm3969746241.9.2026.02.10.02.38.50
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 02:38:51 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-566390e7db3so547121e0c.1
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Feb 2026 02:38:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVtyOacSqcOrf+fwnviLiTYX1Pc4ztfAcBnP4X//Owa733TiHUBRmapeQy/LzEhRaFlbV5PnM7aJFQ4Nitmgw8=@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:5ee:a03c:8782 with SMTP id
 ada2fe7eead31-5fae8c05a23mr4360465137.21.1770719930578; Tue, 10 Feb 2026
 02:38:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118091313.1988168-1-chenxiaosong.chenxiaosong@linux.dev>
 <20260210081040.4156383-1-geert@linux-m68k.org> <5c4bbbea-d68c-4089-b3aa-adb4b05696ba@linux.dev>
In-Reply-To: <5c4bbbea-d68c-4089-b3aa-adb4b05696ba@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Feb 2026 11:38:39 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXBBCzWK8HPQ8zQYJ1_Pxim3_ku4_2-CnWXm3M4ysnQ+w@mail.gmail.com>
X-Gm-Features: AZwV_QjCZ0dsEnS1lBtbxtndXEm6HBL8E2zwBOjjm9WbKYhgkBIIkBh1X1XBuDg
Message-ID: <CAMuHMdXBBCzWK8HPQ8zQYJ1_Pxim3_ku4_2-CnWXm3M4ysnQ+w@mail.gmail.com>
Subject: Re: [PATCH v9 1/1] smb/client: introduce KUnit test to check search
 result of smb2_error_map_table
To: ChenXiaoSong <chenxiaosong.chenxiaosong@linux.dev>
Cc: bharathsm@microsoft.com, chenxiaosong@kylinos.cn, dhowells@redhat.com, 
	linkinjeon@kernel.org, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <davidgow@google.com>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-cifs@vger.kernel.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	senozhatsky@chromium.org, smfrench@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com
Content-Type: text/plain; charset="UTF-8"

Hi ChenXiaoSong,

On Tue, 10 Feb 2026 at 10:53, ChenXiaoSong
<chenxiaosong.chenxiaosong@linux.dev> wrote:
> The KUnit test cases are only executed when the CONFIG_SMB_KUNIT_TESTS
> is enabled.

... which defaults to KUNIT_ALL_TESTS, so if KUNIT_ALL_TESTS is enabled,
the test is enabled by default, too.

> Making it a separate test module would require exporting local variables
> and functions so that the test code can access them. However, exporting
> local variables and functions would likely make the code much uglier, as
> it would require adding "#if" conditionals into the production code to
> isolate the test code.
>
> Geert, please let me know if you have a better idea.
>
> I am also discussing this with the ext4 community, and we all hope to
> find a way to make the tests a separate module.

There are ways to restrict exported symbols to test modules only,
see EXPORT_SYMBOL_FOR_TESTS_ONLY(), EXPORT_SYMBOL_FOR_MODULES(),
and EXPORT_SYMBOL_NS().

If it is really hard to convert the tests into a separate module,
you can add a new kernel/module parameter, which needs to be specified
explicitly to run the test. That would avoid running the tests when just
(auto)loading cifs.ko.

> On 2/10/26 4:10 PM, Geert Uytterhoeven wrote:
> > Thanks for your patch, which is now commit 480afcb19b61385d
> > ("smb/client: introduce KUnit test to check search result of
> > smb2_error_map_table") in linus/master
> >
> >> The KUnit test are executed when cifs.ko is loaded.
> > This means the tests are_always_ executed when cifs.ko is loaded,
> > which is different from how most other test modules work.
> > Please make it a separate test module, so it can be loaded independently
> > of the main cifs module.  That way people can enable all tests in
> > production kernels, without affecting the system unless a test module
> > is actually loaded.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
