Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD13FECAAD4
	for <linux-kselftest@archiver.kernel.org>; Wed, 31 Aug 2022 13:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229875AbiHaNPg (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 31 Aug 2022 09:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiHaNPg (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 31 Aug 2022 09:15:36 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A876A4B1
        for <linux-kselftest@vger.kernel.org>; Wed, 31 Aug 2022 06:15:33 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4MHl6C0mCLz4xGC;
        Wed, 31 Aug 2022 23:15:31 +1000 (AEST)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     mpe@ellerman.id.au, cgel.zte@gmail.com
Cc:     npiggin@gmail.com, shuah@kernel.org,
        linux-kselftest@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        christophe.leroy@csgroup.eu
In-Reply-To: <20220816105106.82666-1-ye.xingchen@zte.com.cn>
References: <20220816105106.82666-1-ye.xingchen@zte.com.cn>
Subject: Re: [PATCH linux-next] powerpc/selftests:Use timersub() for gettimeofday()
Message-Id: <166195162905.45984.10080149464586531451.b4-ty@ellerman.id.au>
Date:   Wed, 31 Aug 2022 23:13:49 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, 16 Aug 2022 10:51:06 +0000, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Use timersub() function to simplify the code.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/selftests:Use timersub() for gettimeofday()
      https://git.kernel.org/powerpc/c/c814bf958926ff45a9c1e899bd001006ab6cfbae

cheers
