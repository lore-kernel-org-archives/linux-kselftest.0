Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3732DEB64DC
	for <linux-kselftest@archiver.kernel.org>; Fri, 21 Jul 2023 08:47:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbjGUIrW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 21 Jul 2023 04:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230506AbjGUIrU (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 21 Jul 2023 04:47:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81C40273A;
        Fri, 21 Jul 2023 01:47:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EC599616FB;
        Fri, 21 Jul 2023 08:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA2FC433C9;
        Fri, 21 Jul 2023 08:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689929238;
        bh=FEKthsGCfhaEvehaNkfvwG3DLwk8goiFrf9dyCAABYc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=oV/1WyP3eeXWRIvqYmFo9pbkUYA88uMIYF/vfFmzfqy+AT0Y81JajLaPh46YYjth9
         T2u7rr3ngVPRMdkrNkOAzz1PKNELYK+rcsL0PcliUF4YbBQURoPpS256yFcBRO5lE6
         t+a9F25kZcZeWCWy0KGpy03UROHpL2kLbnapHFanwnYX0C9DuXhtBFs08pRAH9Q+xH
         IXuiniBG3AHfBRLUsO49RdvTxk8tpnz4VJHWNz+Qq5IEs9stME+SRAG3QHhCmtgQyT
         cveDUKwMPP9UU/uC07PRzp7p9mcb8VdizvzhCx3z5dyKWnOozLDf4qq5QfAVf5Pu5n
         BcbAARG5CcXFw==
From:   =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To:     Colin Ian King <colin.i.king@gmail.com>,
        Magnus Karlsson <magnus.karlsson@intel.com>,
        Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org,
        bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] selftests/xsk: Fix spelling mistake "querrying"
 -> "querying"
In-Reply-To: <20230720104815.123146-1-colin.i.king@gmail.com>
References: <20230720104815.123146-1-colin.i.king@gmail.com>
Date:   Fri, 21 Jul 2023 10:47:15 +0200
Message-ID: <87sf9hfy7g.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Colin Ian King <colin.i.king@gmail.com> writes:

> There is a spelling mistake in an error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
