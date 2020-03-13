Return-Path: <SRS0=HnTg=46=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C302C2BB1D
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Mar 2020 19:42:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F01820716
	for <linux-kselftest@archiver.kernel.org>; Fri, 13 Mar 2020 19:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584128574;
	bh=UgiGwZnqvFJ0MMge0TYASmmbZ4Ljx68D13SDUCrgFAU=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=zGg4E/qKoKsGrJx6HEm3hZFjd4xaUxxk0/0NMuS/JKsDSplKSlhL7Lnn7mFz8JKy4
	 DpgGqa73K8dQ1Y461egQrTSTAr+ypvmeTVqUYQra47rquzABm4eCCumLw6lEvzz9XF
	 OUhjOzrdMnjJUMJGNS22sFIAxOI0L6oRjlzTcBxQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbgCMTmy (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 13 Mar 2020 15:42:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:34390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgCMTmx (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 13 Mar 2020 15:42:53 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3C26320716;
        Fri, 13 Mar 2020 19:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584128573;
        bh=UgiGwZnqvFJ0MMge0TYASmmbZ4Ljx68D13SDUCrgFAU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=kg6tJAQSHwMyP0W0u4sYk8d1BzZiIfXEy6P7u+BfATcNuqkFyTwbhHFIPEE6VZbtM
         z9XbSG8XCzpAF+w42BGy+IXAOa6W3h0h/naU0f9FOcvWnC/PiYNoruKBcCb1kU4lzS
         kk5M9vlfO//VGz5RUcX9mhM0rSG8x0ieSiKN2gA8=
Subject: Re: [RFC PATCH 0/1] selftests/run_kselftest.sh: make each test
 individually selectable
To:     Hangbin Liu <liuhangbin@gmail.com>, linux-kselftest@vger.kernel.org
Cc:     shuah <shuah@kernel.org>
References: <20200309101256.868-1-liuhangbin@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <632a1803-cc62-7d54-69ca-88fc13d72966@kernel.org>
Date:   Fri, 13 Mar 2020 13:42:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309101256.868-1-liuhangbin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Hi Hangbin,

On 3/9/20 4:12 AM, Hangbin Liu wrote:
> Hi, this patch enhanced the run_kselftest.sh to make the tests individually
> selectable. I'm not sure the if I could add the reuslt in the patch commit,
> as the log is too long. So I just put the result to the cover-letter:
> 
> Note: I use `tr -s "/-" "_"` to cover the path name in tests to function name.
> e.g. networking/timestamping -> networking_timestamping. I'm not sure if it's
> legal in Makefile.


Please add this to the patch change log. Please run get_maintainers
script before sending the patch. My email address you used is very
old.

Please include how to run and update the documentation as well.

thanks,
-- Shuah
