Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A472C433F5
	for <linux-kselftest@archiver.kernel.org>; Thu, 31 Mar 2022 01:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345339AbiCaB4n (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 30 Mar 2022 21:56:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241393AbiCaB4n (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 30 Mar 2022 21:56:43 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7EC55BD2;
        Wed, 30 Mar 2022 18:54:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F070DB81E45;
        Thu, 31 Mar 2022 01:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69061C340EC;
        Thu, 31 Mar 2022 01:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
        s=korg; t=1648691693;
        bh=EP4YVz+eCDf1UV7+6jf9BNNSvDRpssv+/m6/4AB53MQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=a65NfolNsP2fTeM0VZLl4vGDuceNlt5t4+sytWAtGJpU7uo8AV5ReTs/4eDuckfCA
         nBm9b1hOo5WsrKNFAlVLwkApI2jUqEizWyVDZe0Y9AOTSReuwzf9E4VKLvWFnHCOu9
         heaj387zzrWLyB23AfPFb8zfxGInG/wBOqG9s9AI=
Date:   Wed, 30 Mar 2022 18:54:52 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Sidhartha Kumar <sidhartha.kumar@oracle.com>
Cc:     shuah@kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] selftest/vm: clarify error statement in gup_test
Message-Id: <20220330185452.fe989c38280521356e55d944@linux-foundation.org>
In-Reply-To: <20220330215257.112029-1-sidhartha.kumar@oracle.com>
References: <20220330215257.112029-1-sidhartha.kumar@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, 30 Mar 2022 21:52:57 +0000 Sidhartha Kumar <sidhartha.kumar@oracle.com> wrote:

> Print two possible reasons /sys/kernel/debug/gup_test
> cannot be opened to help users of this test diagnose
> failures.
> 
> Signed-off-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> Cc: stable@vger.kernel.org # 5.15+
>
> ...
>
> --- a/tools/testing/selftests/vm/gup_test.c
> +++ b/tools/testing/selftests/vm/gup_test.c
> @@ -205,7 +205,9 @@ int main(int argc, char **argv)
>  
>  	gup_fd = open("/sys/kernel/debug/gup_test", O_RDWR);
>  	if (gup_fd == -1) {
> -		perror("open");
> +		perror("failed to open /sys/kernel/debug/gup_test");
> +		printf("check if CONFIG_GUP_TEST is enabled in kernel config\n");
> +		printf("check if debugfs is mounted at /sys/kernel/debug\n");
>  		exit(1);
>  	}

Thanks.  I don't think this is -stable material...
