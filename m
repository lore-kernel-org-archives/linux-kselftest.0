Return-Path: <SRS0=gaZp=AV=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6F8C433E0
	for <linux-kselftest@archiver.kernel.org>; Fri, 10 Jul 2020 12:40:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96EE220772
	for <linux-kselftest@archiver.kernel.org>; Fri, 10 Jul 2020 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594384840;
	bh=G1Zd3fMwHC2mB8xQeDxKb6Q+dLmT3gD13gUrA5sfzVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KiMsK05ptn2d9Fq1/0I4U5Df2wBkdfuC10UOeLhwrwHldPBhB5Hfc0ssWml64pdWI
	 2VNBeyd3Sq/Hp++kI9fLa7tBLtVFSzxisG8oVtkybs8rfU29V2Oi0q0f6j4Kc2W9Dw
	 IuUB5X/zRbrbA4LesZ86WPESsyvSBSBLaoR29brI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726921AbgGJMkk (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 10 Jul 2020 08:40:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:37328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726664AbgGJMkj (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 10 Jul 2020 08:40:39 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF28F206F4;
        Fri, 10 Jul 2020 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594384839;
        bh=G1Zd3fMwHC2mB8xQeDxKb6Q+dLmT3gD13gUrA5sfzVo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CvNThnL+5RDXewbvg33s7F+uhgBepJ+qyyyW1ObQDEo3nuQ3Ty1ei8UAc8ag6KywE
         iWpdLH6EnJcuBnfq416UxpCWVQ+2B8AwBh2tZMd5+wasVKh7wne6+CCB23hhqmmjDv
         eOLRvXJsktcPK2etc+gadLc6yZPNNSEJYYkmVECM=
Date:   Fri, 10 Jul 2020 13:40:33 +0100
From:   Will Deacon <will@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Keno Fischer <keno@juliacomputing.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Will Drewry <wad@chromium.org>,
        Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH for-next/seccomp 0/3] Check ENOSYS under tracing
Message-ID: <20200710124033.GA30458@willie-the-truck>
References: <20200705061232.4151319-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200705061232.4151319-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Jul 04, 2020 at 11:12:29PM -0700, Kees Cook wrote:
> This expands the seccomp selftest to poke a architectural behavior corner
> that Keno Fischer noticed[1]. In the process, I took the opportunity
> to do the kselftest harness variant refactoring I'd been meaning to do,
> which made adding this test much nicer.
> 
> I'd prefer this went via the seccomp tree, as it builds on top of the
> other recent seccomp feature addition tests. Testing and reviews are
> welcome! :)

Thanks! I tested these on arm64 (qemu) and they helped me to find a bug
in some patches I was writing.

Tested-by: Will Deacon <will@kernel.org>

Will
