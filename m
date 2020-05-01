Return-Path: <SRS0=F/8i=6P=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB942C47253
	for <linux-kselftest@archiver.kernel.org>; Fri,  1 May 2020 14:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B25424954
	for <linux-kselftest@archiver.kernel.org>; Fri,  1 May 2020 14:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588344578;
	bh=vmg8oLbieQL36THlZVllbhhPULp3mmTUxjf3PvQedas=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=O3x4gu1k6dOnvnbqTL1G3bRnwt4RQh3pYtCc+IVb1EwaEkdT4gRo2BIO3YyY0w06j
	 HDFFImqOakWjRYR1w6s0LOqDI/0VnU5d2gFhRzOjHLkmPEwfFqcKOjJkYznM7Ilp/h
	 S51Qj/JAqYEuscXxxvUBWsf7sjlUHPeYh+ZvAv78=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730619AbgEAOth (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 1 May 2020 10:49:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:56142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730614AbgEAOtg (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 1 May 2020 10:49:36 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3028020857;
        Fri,  1 May 2020 14:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588344575;
        bh=vmg8oLbieQL36THlZVllbhhPULp3mmTUxjf3PvQedas=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LuZU8oudtlWtg/Cva7tIQRA1bwJgU7ydeHDIMbLSD1IuBHzHtb5q8cwJSsB1vhz90
         KHkUH5kS0ZVFZzkJo4xEuk9pdNKvwU2dan8hV9QTJ4kEDvWzRRYqTUFQanxBZzVWqZ
         xxbPwAskurumJp3/mLusWvSWcV+/Zjv1x/abzBMI=
Subject: Re: [PATCH] selftests: introduce gen_tar Makefile target
To:     Veronika Kabatova <veronicca114@gmail.com>
Cc:     sbrivio@redhat.com, linux-kselftest@vger.kernel.org,
        Veronika Kabatova <vkabatov@redhat.com>,
        shuah <shuah@kernel.org>
References: <20200428123841.2953099-1-vkabatov@redhat.com>
From:   shuah <shuah@kernel.org>
Message-ID: <529c2308-0840-a794-fc09-d44272066b08@kernel.org>
Date:   Fri, 1 May 2020 08:49:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428123841.2953099-1-vkabatov@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Veronica,

On 4/28/20 6:38 AM, Veronika Kabatova wrote:
> The gen_kselftest_tar.sh always packages *all* selftests and doesn't
> pass along any variables to `make install` to influence what should be
> built. This can result in an early error on the command line ("Unknown
> tarball format TARGETS=XXX"), or unexpected test failures as the
> tarball contains tests people wanted to skip on purpose.
> 
> Since the makefile already contains all the logic, we can add a target
> for packaging. Keep the default .gz target the script uses, and actually
> extend the supported formats by using tar's autodetection.
> 

Thanks for working on this. gen_kselftest_tar.sh  a while back before a
lot of the install features went in and Makefile supports it fully. It
makes perfect sense to use Makefile drive this.

> To not break current workflows, keep the gen_kselftest_tar.sh script as
> it is, with an added suggestion to use the makefile target instead.
> 

Not sure how many people use this. It is a good idea keeping it around
for now.

> Signed-off-by: Veronika Kabatova <vkabatov@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> ---
>   Documentation/dev-tools/kselftest.rst        | 23 ++++++++++++++++++++
>   tools/testing/selftests/Makefile             |  9 +++++++-
>   tools/testing/selftests/gen_kselftest_tar.sh |  5 +++++
>   3 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/dev-tools/kselftest.rst b/Documentation/dev-tools/kselftest.rst
> index 61ae13c44f91..3fc559bcb597 100644
> --- a/Documentation/dev-tools/kselftest.rst
> +++ b/Documentation/dev-tools/kselftest.rst
> @@ -151,6 +151,29 @@ note some tests will require root privileges::
>      $ cd kselftest
>      $ ./run_kselftest.sh
>   
> +Packaging selftests
> +===================
> +
> +In some cases packaging is desired, such as when tests need to run on a
> +different system. To package selftests, run::
> +
> +   $ make -C tools/testing/selftests gen_tar
> +

Does this work in the case of relocatable build.cross-build cases?

> +This generates a tarball in the `INSTALL_PATH/kselftest-packages` directory. By
> +default, `.gz` format is used. The tar format can be overriden by specifying
> +a `FORMAT` make variable. Any value recognized by `tar's auto-compress`_ option
> +is supported, such as::
> +
> +    $ make -C tools/testing/selftests gen_tar FORMAT=.xz
> +
> +`make gen_tar` invokes `make install` so you can use it to package a subset of
> +tests by using variables specified in `Running a subset of selftests`_
> +section::
> +
> +    $ make -C tools/testing/selftests gen_tar TARGETS="bpf" FORMAT=.xz

Does this work in the case of relocatable build.cross-build cases?

Please try these cases as well and let me know.

I would like to get this in for 5.8-rc1.

thanks,
-- Shuah
