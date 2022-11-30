Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C2A7C4708E
	for <linux-kselftest@archiver.kernel.org>; Wed, 30 Nov 2022 09:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbiK3JcW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 30 Nov 2022 04:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233960AbiK3Jbk (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 30 Nov 2022 04:31:40 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE23A654C7;
        Wed, 30 Nov 2022 01:31:33 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYqn2hJ6z4xN3;
        Wed, 30 Nov 2022 20:31:33 +1100 (AEDT)
From:   Michael Ellerman <patch-notifications@ellerman.id.au>
To:     Shaomin Deng <dengshaomin@cdjrlc.com>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, shuah@kernel.org
Cc:     npiggin@gmail.com, mpe@ellerman.id.au, christophe.leroy@csgroup.eu
In-Reply-To: <20221029094643.5595-1-dengshaomin@cdjrlc.com>
References: <20221029094643.5595-1-dengshaomin@cdjrlc.com>
Subject: Re: [PATCH] selftests/powerpc: Remove repeated word in comments
Message-Id: <166980025336.3017288.12475821517637584733.b4-ty@ellerman.id.au>
Date:   Wed, 30 Nov 2022 20:24:13 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, 29 Oct 2022 05:46:43 -0400, Shaomin Deng wrote:
> Remove the repeated word "not" in comments.
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc: Remove repeated word in comments
      https://git.kernel.org/powerpc/c/ad8284ead833379fc57d90e50dbae1352b116c2b

cheers
