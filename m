Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A48C7EE2C
	for <linux-kselftest@archiver.kernel.org>; Sun, 28 May 2023 07:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229483AbjE1Hmo (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sun, 28 May 2023 03:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjE1Hmn (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sun, 28 May 2023 03:42:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D909BB;
        Sun, 28 May 2023 00:42:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 97BEF61708;
        Sun, 28 May 2023 07:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9054C433D2;
        Sun, 28 May 2023 07:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1685259762;
        bh=2HV0DemBSwa4vfAMp0bGOrOse22IQYWVe40pa2FzY1k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e3m83mS21WtdATtdyB34EOj+l6oh5i9kQC9PTZMA/vVoSZ3M40azuh6TJVuspI2jt
         mUKTkiAvIe9Gc7vyaJfpio7pB9ATwqzuA13PExRkc1kMkbX3ukDDiYdXTYLCDfpo6Y
         VxI5aqWuz6GF3y1+7/M4nH6W5hPWbSUFIoHrZi64=
Date:   Sun, 28 May 2023 08:42:34 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hardik Garg <hargar@linux.microsoft.com>
Cc:     stable@vger.kernel.org, shuah@kernel.org, jeffxu@google.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        code@tyhicks.com, niyelchu@linux.microsoft.com
Subject: Re: [PATCH 6.1 5.15 5.10 5.4 4.19 4.14] selftests/memfd: Fix unknown
 type name build failure
Message-ID: <2023052824-dagger-retread-2325@gregkh>
References: <20230526232136.255244-1-hargar@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230526232136.255244-1-hargar@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, May 26, 2023 at 04:21:36PM -0700, Hardik Garg wrote:
> Partially backport v6.3 commit 11f75a01448f ("selftests/memfd: add
> tests for MFD_NOEXEC_SEAL MFD_EXEC") to fix an unknown type name 
> build error.
> In some systems, the __u64 typedef is not present due to differences
> in system headers, causing compilation errors like this one:
> 
> fuse_test.c:64:8: error: unknown type name '__u64'
>    64 | static __u64 mfd_assert_get_seals(int fd)
> 
> This header includes the  __u64 typedef which increases the
> likelihood of successful compilation on a wider variety of systems.
> 
> Signed-off-by: Hardik Garg <hargar@linux.microsoft.com>
> ---
>  tools/testing/selftests/memfd/fuse_test.c | 1 +
>  1 file changed, 1 insertion(+)

Now queued up, thanks.

greg k-h
