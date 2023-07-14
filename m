Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016DDC001DC
	for <linux-kselftest@archiver.kernel.org>; Fri, 14 Jul 2023 19:52:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbjGNTwD (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236023AbjGNTwC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 14 Jul 2023 15:52:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7A9213F
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Jul 2023 12:52:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA2DE61DD6
        for <linux-kselftest@vger.kernel.org>; Fri, 14 Jul 2023 19:52:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5A2C433C7;
        Fri, 14 Jul 2023 19:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689364321;
        bh=AAO4oRkyffrQ0JEzDM3yvA5fFinRxw6xRn3UaAELxnY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=gEcaBayN8xW02HVWZnRzLm/30SrXdIIv3ttOvsCW6SoctK2ybFEo6mpBFhBUUaOPv
         QuoFX1NZ3MZHHuvz+eac7v8mM0B0u3sjgW6OqEeBhclk7YxxqB/CsZs/CS+2MVrcsY
         kbxXZkLUuU0czw9NxdKVgjmICzuER7cw93hG9DU7YKChxCkH4/d9oivqvFq3T5NTqL
         A5BDf/HLE77ANOZZwLERQGngzy4aemxUAt99Ynk51tAsfC+OpqPGE6ys5nBYQsdRYO
         bPxJCLsqXulG2TOCaS4jfMGP83Jyp++FulXu4vtAfqR4jQnuiXiHceJfiTbuDA4dEP
         JI3EvFlnk1DOg==
Date:   Fri, 14 Jul 2023 12:52:00 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Cc:     shuah@kernel.org, linux-kselftest@vger.kernel.org,
        davem@davemloft.net, linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v1] selftests/net: replace manual array size calc with
 ARRAYSIZE macro.
Message-ID: <20230714125200.716d2c14@kernel.org>
In-Reply-To: <20230714194635.1779496-1-mahmoudmatook.mm@gmail.com>
References: <20230714194635.1779496-1-mahmoudmatook.mm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, 14 Jul 2023 23:46:35 +0400 Mahmoud Maatuq wrote:
> diff --git a/tools/testing/selftests/net/hwtstamp_config.c b/tools/testing/selftests/net/hwtstamp_config.c

Please resend and CC netdev@
There's ongoing work on hwtstamp configuration, there may be a conflict
if this goes via the general selftest tree.

> index 263cc1c34165..873f4937f37f 100644
> --- a/tools/testing/selftests/net/hwtstamp_config.c
> +++ b/tools/testing/selftests/net/hwtstamp_config.c
> @@ -16,9 +16,8 @@
>  #include <linux/net_tstamp.h>
>  #include <linux/sockios.h>
>  
> -#ifndef ARRAY_SIZE
> -#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
> -#endif
> +#include "kselftest.h"
> +
> 

unnecessary extra new line
