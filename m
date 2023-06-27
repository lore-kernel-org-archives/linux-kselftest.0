Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8BCBC0015E
	for <linux-kselftest@archiver.kernel.org>; Tue, 27 Jun 2023 18:16:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbjF0SQJ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 27 Jun 2023 14:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231307AbjF0SQC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 27 Jun 2023 14:16:02 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFE98F
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jun 2023 11:16:00 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b69f216c73so40755711fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jun 2023 11:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1687889758; x=1690481758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AhTPOEOj0BqxLY9QE/JlifSVTXobVSdIih6u1SdRovk=;
        b=d4uDUmSh2G8RtzC0J/sIfGSPCQyIpCIDOmM4iZ/tiv6tkroHAePl8bIHlu3SCiYQqx
         msD/i2rqFl8sUq77Mr55UhIviSq3Hso+/3hczTuDGjB/ACfPDNgaE3u0+o08eRspLxuQ
         VDN0E6YDuS+6uab7CAfIEkyBPaWrsWGdBAJzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687889758; x=1690481758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AhTPOEOj0BqxLY9QE/JlifSVTXobVSdIih6u1SdRovk=;
        b=CKeRIgRh6JCJRgq69ihQ7J/bf+Ilk6IAneLuZ90t21fnscqV6fbHmDsDH1D537YL3b
         khC3IZRocpdiQchyidwFdWBC4oatC1+zpKuHalg91iPJ3l4wPynZyRdcFlukFIAC+U3x
         t2YOPluXrj4J0Nou5TnGlsoHg2hK8G/IQPnfsMI2rW8kbTKabyRNscBaultcXocWhy2Z
         rndLUkGL9tP7iBXvY+3hdSU9O2SRE/E/NcugkndlJW7gh7KYSRDcxlrtLcaNFAIQz1Ft
         OzWoQqfKMSotmR8VSuhBkze9wDgPMr7NybUvDqrkFUelW606wEuoWYxNxcb08sEXbQ0n
         JN5Q==
X-Gm-Message-State: AC+VfDytgwlGyR1BPIBRxsB1vdHMOQ5fhL0Ep6e7IbSgec6qGXdKxQZO
        KMxZeqWwzCKwbovbVqFIfjSQKrggq3bwny1s46PyAA==
X-Google-Smtp-Source: ACHHUZ79m0Pe2QUSqUx9WAhIu7UD326nP5342yrxGkNYV69UhSrqclTlgABK9k7o0yAZwNvciVohZg==
X-Received: by 2002:a19:6742:0:b0:4f8:5671:ed1 with SMTP id e2-20020a196742000000b004f856710ed1mr18354263lfj.29.1687889758536;
        Tue, 27 Jun 2023 11:15:58 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id m3-20020ac24ac3000000b004fb737737f9sm1139691lfp.106.2023.06.27.11.15.57
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 11:15:57 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2b5c231f842so48969321fa.2
        for <linux-kselftest@vger.kernel.org>; Tue, 27 Jun 2023 11:15:57 -0700 (PDT)
X-Received: by 2002:a19:4f5a:0:b0:4f4:d071:be48 with SMTP id
 a26-20020a194f5a000000b004f4d071be48mr18541427lfk.14.1687889757421; Tue, 27
 Jun 2023 11:15:57 -0700 (PDT)
MIME-Version: 1.0
References: <b0bb8387-9216-0fe7-61e9-7e2daceeef20@linuxfoundation.org>
In-Reply-To: <b0bb8387-9216-0fe7-61e9-7e2daceeef20@linuxfoundation.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 27 Jun 2023 11:15:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=whvD6pq-7vp-cCMEnS+EOp2TmLxFKPS3Nw+Ncqt0XZVGw@mail.gmail.com>
Message-ID: <CAHk-=whvD6pq-7vp-cCMEnS+EOp2TmLxFKPS3Nw+Ncqt0XZVGw@mail.gmail.com>
Subject: Re: [GIT PULL] Kselftest update for Linux 6.5-rc1
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     shuah <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sun, 25 Jun 2023 at 08:42, Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> Please pull the following Kselftest update for Linux 6.5-rc1.

Hmm. I pulled this, but it causes multiple objtool warnings.

The cause seems to be __kunit_abort() being no-return and objtool
having not being told about it, and I'm double-checking the fix for
that.

But I'm unhappy with how clearly nobody seems to have looked at
non-fatal warning output again.

This was why we made the kernel use -Werror, because people would
ignore build warnings that weren't fatal. Now objtool warnings seem to
be triggering the same laissez-faire behavior.

               Linus
