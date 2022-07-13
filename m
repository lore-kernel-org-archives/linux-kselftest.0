Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A32C43334
	for <linux-kselftest@archiver.kernel.org>; Wed, 13 Jul 2022 21:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237299AbiGMVDH (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 13 Jul 2022 17:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237251AbiGMVDH (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 13 Jul 2022 17:03:07 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0006032B97
        for <linux-kselftest@vger.kernel.org>; Wed, 13 Jul 2022 14:03:05 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l42so7160544wms.5
        for <linux-kselftest@vger.kernel.org>; Wed, 13 Jul 2022 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RE8IpT0EbD+zikgdgGwj/YsTGC42mNfwGCljsqFQGQ=;
        b=p8UcNprSsjajY/y467Cc7+NJUUdV0ERBggqcph9FOEfVNFHl4H+H8vxqXR3v1xZzjt
         pK6W16sAreb75A9vaznnnvu93IANTnp33ZNAA1zwX6O3cCRKLMgvLMOdDCftMz+OH9uM
         ehflCksWAbFZcQRfcR6Trv/6C0YyOHxLhJx2qD30/txfFtNzpx0jiaLOz1scyc1tTPke
         seTQB5v/7o3XF6f8wmqMXxEjyUFEV3+KwiTAM+vNn5TsacfEoQCFmG0BcoWpH/NqfaN9
         BFIKF1O3xtchPogBDLwXk2UswASkuQzyDgh8ZP37XR183L/VvOzkEz6ompKwojJw2H0j
         0r/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RE8IpT0EbD+zikgdgGwj/YsTGC42mNfwGCljsqFQGQ=;
        b=QmrMuAX41jbRUPTPgHaopnNZ1rOeTRlW+dmpWOkz+OXCk90mUb45jCbKraIHQMFg6H
         9fAQnkBEhep+X0NlEb1oDNydVbXq/b5HcVYAxil8EcrqL3VLrfFUH3lcLqnfs+paGXYf
         XiEqmoE/1TYN0l37DA2QQOZK9gd4ycPR9fEtABxISrYq4BePKs12siN5fp8rprxQiClN
         oVr4Lf6olDJLErxwBg5wFxU7LK10pURJTnF5SieKSXcF62QjsNi6vV2//JsEFCeC9jrR
         y+K7s/ut1hkj1CJn+QDTZGQhuO/0wkduwFY4imRIdvQoH1IdMPAhKYtyKAJRCh8UfYrM
         lBKw==
X-Gm-Message-State: AJIora8F91+tTHMk9jx5D869uQbcwm4j5Kwpwa75tzbNHxzsN9v5Ibmp
        P9da6StD3qJgHXC8kFJv41E5z86bBFJKge8yQy5y
X-Google-Smtp-Source: AGRyM1vejqT/tSdioS1eQS86Ms9UekbxWVJYvavZtfgP/tqiiD3MrMqFpuWjFXK6vEArUHpSe2aruoP8qUv8kHn0unM=
X-Received: by 2002:a7b:cd0c:0:b0:3a2:e864:98b8 with SMTP id
 f12-20020a7bcd0c000000b003a2e86498b8mr11477902wmj.200.1657746184461; Wed, 13
 Jul 2022 14:03:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220713204623.5443-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20220713204623.5443-1-wsa+renesas@sang-engineering.com>
From:   John Stultz <jstultz@google.com>
Date:   Wed, 13 Jul 2022 14:02:53 -0700
Message-ID: <CANDhNCp3KhGjXSrS4xmqrdPJfxStZOOn+FQxJEEoiXZ39CxDpg@mail.gmail.com>
Subject: Re: [PATCH 0/9] selftests: timers: fixes and improvements
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Jul 13, 2022 at 1:46 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The timer selftests are quite useful for me when enabling timers on new
> SoCs, e.g. like now with the CMT timer on a Renesas R-Car S4-8. During
> development, I needed these fixes and additions to make full use of
> the tests. I think they make all sense upstream, so here they are.
>
> Patches are based on v5.19-rc1. Looking forward to comments.
>

Hey!
  Thanks so much I really appreciate the effort to make and send out
these cleanups. From the initial skim it all looks great (though, some
are slightly embarrassing :), and I think some of the extra config
args will be quite nice for others to use as well.

Acked-by: John Stultz <jstultz@google.com>

Thanks so much for submitting these.
-john
