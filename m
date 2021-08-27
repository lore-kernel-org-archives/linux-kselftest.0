Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36613C432BE
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23EEC604AC
	for <linux-kselftest@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245411AbhH0NX7 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:23:59 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:48723 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245212AbhH0NXw (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 27 Aug 2021 09:23:52 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0lB0y5Yz9tkd;
        Fri, 27 Aug 2021 23:23:02 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shuah Khan <shuah@kernel.org>
Cc:     linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
        linux-kselftest@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
In-Reply-To: <20210326064808.3262568-1-zhengyongjun3@huawei.com>
References: <20210326064808.3262568-1-zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] selftests/powerpc: Remove duplicated include from tm-poison.c
Message-Id: <163007013895.52768.7064716282025160989.b4-ty@ellerman.id.au>
Date:   Fri, 27 Aug 2021 23:15:38 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, 26 Mar 2021 14:48:08 +0800, Zheng Yongjun wrote:
> Remove duplicated include.
> 
> 
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc: Remove duplicated include from tm-poison.c
      https://git.kernel.org/powerpc/c/6af0b5570b59ce8dd1608a8e48f59eff3f4bdd04

cheers
