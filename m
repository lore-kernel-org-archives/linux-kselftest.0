Return-Path: <SRS0=GpS6=XP=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FEE7C3A5A2
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Sep 2019 16:51:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A5B8208C3
	for <linux-kselftest@archiver.kernel.org>; Fri, 20 Sep 2019 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568998312;
	bh=Nyw5aGQnqiBN1bUzXu88HP2HpKPdWSNMWN8vpL0WnQI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=yJIfpYEui4wekS7O9t0WI3iLZgWYgHYOxvoeG8p/Yu0d8axuO8bZY3TlQ9jPth/NE
	 Ba0/QusM0JCwgahLMyQo2Yoix2mZfNTO+P1JUeZM37rre2sthgaUFUxwFNR6B1Yuqs
	 Z3NknIIZ7ntTpvc43ie53Phstey1deyntkUVbFIA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404530AbfITQvv (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 20 Sep 2019 12:51:51 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34486 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404113AbfITQvv (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 20 Sep 2019 12:51:51 -0400
Received: by mail-lj1-f193.google.com with SMTP id j19so6257130lja.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Sep 2019 09:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+7PTgM+rmvcNSmgpDn3Z1VM5gzT4aYWFasiNPbOBn8=;
        b=SfCpSBhMbBk4k0YZN7A/wTNcmEx3XjOb6aELxqYXCViy/ELntXAO7/OS0FK9prRUHS
         MvrUywNKZIJ9lC0Q57KVN5fqLjlisYwYqbiS9S1v57ZkC2ngx4EAHnYNviAuFarLJwAq
         SIoVtonfBBzt++dwxCTZGmuZ//kfwc51HXH3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+7PTgM+rmvcNSmgpDn3Z1VM5gzT4aYWFasiNPbOBn8=;
        b=QZriYhVvldTZkskDLVB+stydEqhLA4w1Eqc/LpkOBiYqqwcHgUJ9zxhH01BPO299Kb
         np2F8vteUvVkZir6lyR1O5vkk4q6dHcfu6hXZUGw282ldLbfTUZM2M5WHc0FM4qklImo
         e7IsQ4yu4lFyF36+fS+D06WW9SCn7FwROrzltgL4SkzxTNBmOOMc9RDqPXEFvTTntBT8
         MJgjHygfEhRV+EgPCFY4NovjB/mFGT6DeKq2LyejlzsNapbh5MBeeOgkkTT3Zm+Mdct6
         IPqqaMzrQV3sles0xD/qRmJ+64s7PDFzF0C6QGnt5qjNtn4xFXM2z2MqBX9WyiN4Yv96
         aTeQ==
X-Gm-Message-State: APjAAAXV+zMSmJcMubFt7Bd2OAaspa/rFxPmQAM/ijfAQjSANUBlgq/j
        zU+dE/ejGOA7uXgnPj5Kq8iafznx9bM=
X-Google-Smtp-Source: APXvYqzernmU9XWijpgWFLZeERwk1sGw6A/2DU5ppNJP9J+of60O3d8glxBwmLUOWoWG+x7dBJaJig==
X-Received: by 2002:a2e:890c:: with SMTP id d12mr6452433lji.85.1568998308756;
        Fri, 20 Sep 2019 09:51:48 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id b63sm574386ljf.38.2019.09.20.09.51.47
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 09:51:47 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id j19so6257034lja.1
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Sep 2019 09:51:47 -0700 (PDT)
X-Received: by 2002:a2e:96d3:: with SMTP id d19mr465327ljj.165.1568998307274;
 Fri, 20 Sep 2019 09:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <be8059f4-8e8f-cd18-0978-a9c861f6396b@linuxfoundation.org>
 <CAHk-=wgs+UoZWfHGENWSVBd57Z-Vp0Nqe68R6wkDb5zF+cfvDg@mail.gmail.com>
 <CAKRRn-edxk9Du70A27V=d3Na73fh=fVvGEVsQRGROrQm05YRrA@mail.gmail.com> <CAFd5g45ROPm-1SD5cD772gqESaP3D8RbBhSiJXZzbaA+2hFdHA@mail.gmail.com>
In-Reply-To: <CAFd5g45ROPm-1SD5cD772gqESaP3D8RbBhSiJXZzbaA+2hFdHA@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 20 Sep 2019 09:51:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgMuNLBhJR_nFHrpViHbz2ErQ-fJV6B9o0+wym+Wk+r0w@mail.gmail.com>
Message-ID: <CAHk-=wgMuNLBhJR_nFHrpViHbz2ErQ-fJV6B9o0+wym+Wk+r0w@mail.gmail.com>
Subject: Re: [GIT PULL] Kselftest update for Linux 5.4-rc1
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     Shuah Khan <skhan@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Anders Roxell <anders.roxell@linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Sep 20, 2019 at 9:35 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> Sorry about that. I am surprised that none of the other reviewers
> brought this up.

I think I'm "special".

There was some other similar change a few years ago, which I
absolutely hated because of how it broke autocomplete for me. Very few
other people seemed to react to it.

Part of it may be that the kernel is almost the _only_ project I work
with, so unlike a lot of other developers, I end up having muscle
memory for kernel-specific issues.

Auto-completion was also one of the (many) reasons why I hated CVS -
having that annoying "CVS" directory there just always annoyed me.
There's a reason why git uses a dot-file.

So I just have issues that perhaps other people don't react to as
much. And aggressive tab-completion happens to be a thing for me.

               Linus
