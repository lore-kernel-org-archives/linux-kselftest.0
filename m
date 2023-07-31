Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0605C001E0
	for <linux-kselftest@archiver.kernel.org>; Mon, 31 Jul 2023 21:07:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjGaVHF (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 31 Jul 2023 17:07:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjGaVHE (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 31 Jul 2023 17:07:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FAA188;
        Mon, 31 Jul 2023 14:07:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6CB29612D4;
        Mon, 31 Jul 2023 21:07:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6536CC433C8;
        Mon, 31 Jul 2023 21:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690837622;
        bh=tkAfo/j4zgsAFGvrWUpfgO1ceI/V5/Ok7moEgwD40LA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Vvuxxx2869dvOHp20tF0Bbng4rhhKfNOEuUBOlDb7tQXsuGEVrEjtutX9mQ2+pqun
         07aaq1jpqQUD6fFx/x4gohA3PqS9mWJ10YIEJLcWtw0w9RjNGmXJTzp2zYxojVRGTw
         2GEr1oNQV4TTSZ5DV9+iMEGIDCGIT04gKAcEH0gAFsX1sT3RlqkPowH/d68sJLY2m4
         MVGB/OlJnIp++FtArsaoaoj7MAQD2s5aNigllWUbb/hq2QKSloLjW6eFHxEPKwbJye
         5ykVT1AZKISv31igBf0dYrUJ4ENJiMyPIWQcZaWFJGIRCUeDFLRAg+sqotytyyYjUT
         oSGx6gbQ8rMHw==
Date:   Mon, 31 Jul 2023 14:07:01 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        anjali.k.kulkarni@oracle.com
Cc:     shuah@kernel.org, Liam.Howlett@oracle.com, davem@davemloft.net,
        netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2] selftests:connector: Fix input argument error
 paths to skip
Message-ID: <20230731140701.6c659cf6@kernel.org>
In-Reply-To: <1471f593-1ff5-902a-a045-9241feda7bd0@linuxfoundation.org>
References: <20230729002403.4278-1-skhan@linuxfoundation.org>
        <1471f593-1ff5-902a-a045-9241feda7bd0@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 31 Jul 2023 14:23:45 -0600 Shuah Khan wrote:
> I sent v2 for patch 3 in the series. Do you want me to send the
> entire series again with this revised 3rd patch.

I think it's all good. The build bot couldn't parse the partial series
but the patches are pretty trivial, so low risk of breakage.

Anjali, it would be good to get your Review / Ack tag on this patch,
since you're the author.
