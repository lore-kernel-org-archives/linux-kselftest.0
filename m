Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FCDC63703
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Dec 2022 12:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiLHMux (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Dec 2022 07:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbiLHMuW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Dec 2022 07:50:22 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C1E8C6B5;
        Thu,  8 Dec 2022 04:50:07 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYsB3cMNz4y42;
        Thu,  8 Dec 2022 23:50:06 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shuah Khan <shuah@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <1669862997-31335-1-git-send-email-yangtiezhu@loongson.cn>
References: <1669862997-31335-1-git-send-email-yangtiezhu@loongson.cn>
Subject: Re: [PATCH] selftests: powerpc: Use "grep -E" instead of "egrep"
Message-Id: <167050320175.1457988.16657172776968236622.b4-ty@ellerman.id.au>
Date:   Thu, 08 Dec 2022 23:40:01 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, 1 Dec 2022 10:49:57 +0800, Tiezhu Yang wrote:
> The latest version of grep claims the egrep is now obsolete so the build
> now contains warnings that look like:
> 	egrep: warning: egrep is obsolescent; using grep -E
> fix this using "grep -E" instead.
> 
>   sed -i "s/egrep/grep -E/g" `grep egrep -rwl tools/testing/selftests/powerpc`
> 
> [...]

Applied to powerpc/next.

[1/1] selftests: powerpc: Use "grep -E" instead of "egrep"
      https://git.kernel.org/powerpc/c/5921eb36d2a1b276b16a24e529788550e6a65449

cheers
