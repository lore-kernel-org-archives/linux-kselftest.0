Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C79CCDB47E
	for <linux-kselftest@archiver.kernel.org>; Wed, 18 Oct 2023 16:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229456AbjJRQzz (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 18 Oct 2023 12:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjJRQzy (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 18 Oct 2023 12:55:54 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE03B106;
        Wed, 18 Oct 2023 09:55:52 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC8DBC433C8;
        Wed, 18 Oct 2023 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1697648152;
        bh=6Hk7cRZC8TgK8G/kxiYzsGWB7/fl5io/F1SVkvui04I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wm4nKJwnmDHFE8qeQ0f4/A9pUJJ3LalkQzT9hhfEGDZBNcFUbGV/iXAWb3ccTGzta
         cxMsOXqtjz0Ns42jm5rhFtFCrcsuZznpuJLAq0/Z2TfXJeICK6VizaFPtzA3mijUDH
         WK6eyJWbJnfIQ8poRiMDIUUGtJ9sFzRcA0JvxeMU=
Date:   Wed, 18 Oct 2023 18:55:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Francis Laniel <flaniel@linux.microsoft.com>
Cc:     linux-trace-kernel@vger.kernel.org,
        Masami Hiramatsu <mhiramat@kernel.org>, stable@vger.kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 2/2] selftests/ftrace: Add new test case which checks
 non unique symbol
Message-ID: <2023101836-comprised-wreckage-77d7@gregkh>
References: <20231018144030.86885-1-flaniel@linux.microsoft.com>
 <20231018144030.86885-3-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018144030.86885-3-flaniel@linux.microsoft.com>
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, Oct 18, 2023 at 05:40:30PM +0300, Francis Laniel wrote:
> If name_show() is non unique, this test will try to install a kprobe on this
> function which should fail returning EADDRNOTAVAIL.
> On kernel where name_show() is not unique, this test is skipped.
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>  .../ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc  | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>  create mode 100644 tools/testing/selftests/ftrace/test.d/kprobe/kprobe_non_uniq_symbol.tc

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
