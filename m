Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF8FC7EE29
	for <linux-kselftest@archiver.kernel.org>; Thu,  8 Jun 2023 11:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233743AbjFHLuK (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 8 Jun 2023 07:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236366AbjFHLtt (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 8 Jun 2023 07:49:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95BE9E6C;
        Thu,  8 Jun 2023 04:49:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 32311619E9;
        Thu,  8 Jun 2023 11:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD65C433EF;
        Thu,  8 Jun 2023 11:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686224987;
        bh=wdFeDGhCEYuqrkF3kMaF8Wc2JMIGkWAY7ArMmPUdsZ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K2DyYhFkCj+oanovtrEbhwu56fHkkkfgEeliVMe/M6LJh0RD6+Hk5KCR6lNnOJlk3
         3xOP75dS/k+AY0s7YGsXYTNgWnGheKgaXrD7pkDXN3eU7yJqYj2SobvHroqrqeCxAP
         OhrIKKwO+i1ETd0sJvlP7AG7h9rFp84Oz8Ym/xbI=
Date:   Thu, 8 Jun 2023 13:49:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michal Sekletar <msekleta@redhat.com>
Cc:     jirislaby@kernel.org, arozansk@redhat.com,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        shuah@kernel.org
Subject: Re: [PATCH v2 2/2] selftests: tty: add selftest for tty timestamp
 updates
Message-ID: <2023060823-uncoated-humid-e53f@gregkh>
References: <c91c458e-58d0-f13a-9adb-a48a19f82107@kernel.org>
 <20230608101616.44152-1-msekleta@redhat.com>
 <20230608101616.44152-2-msekleta@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608101616.44152-2-msekleta@redhat.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Jun 08, 2023 at 12:16:16PM +0200, Michal Sekletar wrote:
> Signed-off-by: Michal Sekletar <msekleta@redhat.com>

Sorry, but for obvious reasons, I can't take patches without any
changelog text at all (and neither would you want me to.)

thanks,

greg k-h
