Return-Path: <SRS0=3xsr=DT=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E368C433DF
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Oct 2020 15:28:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E4E32087E
	for <linux-kselftest@archiver.kernel.org>; Mon, 12 Oct 2020 15:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602516502;
	bh=8dToRAXXoU/nn5Y45WiJpiOwh/TN7QJHylj+D7JpYr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=FNQCYarw0gi1WlAtd2JZiA75n4kSofgt3cF0ax7p366wJqfFZ/0g/rF9uzi4Py9zX
	 LZ9h2P5ZvCsVSOYuWOrUMVG41Z58NQiVXUVPEyLC7jhVhWlX3Y5v1QxPCg8FJyrLVf
	 5O/KGqAtmaH3FDrcjdNB/FC2n1DIbD4EGEZQKiMo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389100AbgJLP2V (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Mon, 12 Oct 2020 11:28:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36752 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388984AbgJLP2V (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Mon, 12 Oct 2020 11:28:21 -0400
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown [163.114.132.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 358932076D;
        Mon, 12 Oct 2020 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602516501;
        bh=8dToRAXXoU/nn5Y45WiJpiOwh/TN7QJHylj+D7JpYr4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=YuVeYBXKUy+zwpnEfVPw2ccZ+AkMK87EQzCkSARlqpGtigPC/D7CUgkcjr1p5yTVz
         31bV+v2W5KmtTy7dlBCh3CgtgwrG1h9oGkZusSU3++soi2HUeCpmPaICTr+SeEX2eM
         wBR1a3Vkxb9Zp/oO/UggU3dSaLOl9yX0M1IZIhwQ=
Date:   Mon, 12 Oct 2020 08:28:19 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Po-Hsu Lin <po-hsu.lin@canonical.com>
Cc:     David Miller <davem@davemloft.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [PATCHv3] selftests: rtnetlink: load fou module for
 kci_test_encap_fou() test
Message-ID: <20201012082819.1c51b4cf@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAMy_GT9hALtE9-qBU95QCR7=VN8hwRps4U=hDjsWeKzssnMbKg@mail.gmail.com>
References: <20200907035010.9154-1-po-hsu.lin@canonical.com>
        <20200907131217.61643ada@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
        <CAMy_GT-kaqkcdR+0q5eKoW3CJn7dZSCfr+UxRf6e5iRzZMiKTA@mail.gmail.com>
        <CAMy_GT-0ad7dnWZ=sVt7kZQSMeKQ-9AXdxTe+LqD4uuFnVd+Vw@mail.gmail.com>
        <CAMy_GT9hALtE9-qBU95QCR7=VN8hwRps4U=hDjsWeKzssnMbKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, 12 Oct 2020 13:56:15 +0800 Po-Hsu Lin wrote:
> Is there any update on this patch?

You received feedback. Don't remove modules after tests, something else
could be using them.
