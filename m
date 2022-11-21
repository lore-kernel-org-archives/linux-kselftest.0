Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B9CC4332F
	for <linux-kselftest@archiver.kernel.org>; Mon, 21 Nov 2022 16:48:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiKUQsj (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 21 Nov 2022 11:48:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbiKUQsi (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 21 Nov 2022 11:48:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CD2711A1A;
        Mon, 21 Nov 2022 08:48:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 19556612FB;
        Mon, 21 Nov 2022 16:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E00C433D6;
        Mon, 21 Nov 2022 16:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669049314;
        bh=2qqZfRHqBdFQnMIeP8EPNZcR8e39Yg3Paf1EZ84e7ag=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sPuTr9XbpPubrA1zaNq21UzzrAiW52c6aV/Otp66Mz5drIiIzuEA5OYhKzBa5IapX
         gmeHBftBsWkwB1TBZgnkz3e6zggFNeD6nG5xYxPKqxch0bjCFnFPqOIoK5GXueBsxN
         d9YI1Gc3fO0HN40H8TulHBYxKCnLjGhqYdm56ANpNwYAzgq8kkKvXRN8gShqnCIm8q
         1zvocnyZimmAHWOudkZ00W3bM2DNUFKu1rkJ+HMu6g331Zdpg566tbAMIeErf0p1+Z
         MyapqErmHnoUqNtt6/rYCj8vu7AZj4wO3sOBUOCv94rnGK9Ya0bW36szlkdXS5qfZj
         wd/47XkPSmoIg==
From:   =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        =?utf-8?B?QmrDtnJuIFTDtnBl?= =?utf-8?B?bA==?= 
        <bjorn@rivosinc.com>, Lina Wang <lina.wang@mediatek.com>,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next] selftests: net: Add cross-compilation support
 for BPF programs
In-Reply-To: <CADYN=9LxMhccyx6wncjO99am7z+8wNWoMzV3DCSyCdJYktGevg@mail.gmail.com>
References: <20221119171841.2014936-1-bjorn@kernel.org>
 <CADYN=9LxMhccyx6wncjO99am7z+8wNWoMzV3DCSyCdJYktGevg@mail.gmail.com>
Date:   Mon, 21 Nov 2022 17:48:31 +0100
Message-ID: <87edtwb6e8.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Anders Roxell <anders.roxell@linaro.org> writes:

> On Sat, 19 Nov 2022 at 18:19, Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org> wr=
ote:
[...]
>> Now that BPF builds are starting to show up in more places
>> (selftests/net, and soon selftests/hid), maybe it would be cleaner to
>> move parts of the BPF builds to lib.mk?
>
> Yes, since its in tc-testing too.
> Maybe thats what we should do already now?

Ok, so there's three BPF builds, in addition to selftests/bpf. Do you
suggest moving (cross-compiled) libbpf builds (for bpf_helpers_defs.h
generation) and some kind of clang BPF build-rule to lib.mk? Or would
you like more things there, like resolve_btfids?

I guess this patch could go in regardless, and fix the build *now*, and
do a lib.mk thing as a follow-up?


Bj=C3=B6rn
