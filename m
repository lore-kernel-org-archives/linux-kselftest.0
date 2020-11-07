Return-Path: <SRS0=cHcc=EN=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2858FC388F7
	for <linux-kselftest@archiver.kernel.org>; Sat,  7 Nov 2020 23:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D01AA208E4
	for <linux-kselftest@archiver.kernel.org>; Sat,  7 Nov 2020 23:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604790122;
	bh=eBZvp5fj1pzipZfmdY2/Lmeeb2ctra4VI9vt8SiyDqs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=WGna/QMX3AqPaDAnNytizv32zdofTupFeNT3pGIskElXTy1B24yEPjpqHfZ5Sz6Dw
	 L+Uv61Rra0gqsExPPtzoW9kVXmlE+IVXg0RPjhKLjGA6UkgV/mJ/gW3nsGbNogNYLD
	 rdj3NtPCEWCg/eu11FqeXQ02J/vH+K0TJwsVcikU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726099AbgKGXCC (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 7 Nov 2020 18:02:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:57690 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726043AbgKGXCC (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 7 Nov 2020 18:02:02 -0500
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 58C5D2087E;
        Sat,  7 Nov 2020 23:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604790121;
        bh=eBZvp5fj1pzipZfmdY2/Lmeeb2ctra4VI9vt8SiyDqs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HrZhsdRJ2yNJbVf6bJDwW2zItGxmMWkvxw6kHV8j7lofSJBs2lp6rh6EWCb9SGX6x
         9QnaiXk9J6apAGELNGKx4Ur4HpK2Mcd5jeyaKRLplv0/0jqFwz3uG8F9JPSGER/u3J
         NokVXbDXCS/uNwSlednPP6nmbAVLPISQR4H5brtQ=
Date:   Sat, 7 Nov 2020 15:02:00 -0800
From:   Jakub Kicinski <kuba@kernel.org>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, davem@davemloft.net,
        skhan@linuxfoundation.org
Subject: Re: [PATCH 2/2] selftests: pmtu.sh: improve the test result
 processing
Message-ID: <20201107150200.509523e3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20201105105051.64258-3-po-hsu.lin@canonical.com>
References: <20201105105051.64258-1-po-hsu.lin@canonical.com>
        <20201105105051.64258-3-po-hsu.lin@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu,  5 Nov 2020 18:50:51 +0800 Po-Hsu Lin wrote:
> This test will treat all non-zero return codes as failures, it will
> make the pmtu.sh test script being marked as FAILED when some
> sub-test got skipped.
> 
> Improve the result processing by
>   * Only mark the whole test script as SKIP when all of the
>     sub-tests were skipped
>   * If the sub-tests were either passed or skipped, the overall
>     result will be PASS
>   * If any of them has failed, the overall result will be FAIL
>   * Treat other return codes (e.g. 127 for command not found) as FAIL
> 
> Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>

Patch 1 looks like a cleanup while patch 2 is more of a fix, can we
separate the two and apply the former to -next and latter to 5.10?
They shouldn't conflict, right?

> diff --git a/tools/testing/selftests/net/pmtu.sh b/tools/testing/selftests/net/pmtu.sh
> index fb53987..5c86fb1 100755
> --- a/tools/testing/selftests/net/pmtu.sh
> +++ b/tools/testing/selftests/net/pmtu.sh
> @@ -1652,7 +1652,23 @@ run_test() {
>  	return $ret
>  	)
>  	ret=$?
> -	[ $ret -ne 0 ] && exitcode=1
> +	case $ret in
> +		0)
> +			all_skipped=false
> +			[ $exitcode=$ksft_skip ] && exitcode=0
> +		;;
> +		1)
> +			all_skipped=false
> +			exitcode=1
> +		;;

Does it make sense to remove this case? The handling is identical to
the default case *).

> +		$ksft_skip)
> +			[ $all_skipped = true ] && exitcode=$ksft_skip
> +		;;
> +		*)
> +			all_skipped=false
> +			exitcode=1
> +		;;
> +	esac
>  
>  	return $ret
>  }
> @@ -1786,6 +1802,7 @@ usage() {
>  #
>  exitcode=0
>  desc=0
> +all_skipped=true
>  
>  while getopts :ptv o
>  do

