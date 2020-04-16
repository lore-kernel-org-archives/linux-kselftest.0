Return-Path: <SRS0=pmI6=6A=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E406C352BE
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D6E322202
	for <linux-kselftest@archiver.kernel.org>; Thu, 16 Apr 2020 23:12:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="n9LgZ0jV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgDPXML (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 16 Apr 2020 19:12:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgDPXML (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 16 Apr 2020 19:12:11 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7302C061A41
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2020 16:12:10 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id g2so217652plo.3
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2020 16:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qHnZMVe5Y7EDy73UocFbOqkOic/ITzFdjJim0WbrCVg=;
        b=n9LgZ0jVDeOIG0dfjM08EFewOl7JGzK1/ZndCN6VfuY6rsSsFEtpwkN3C6cLgd1uzQ
         aEZqc4K0sm8GJmecM+3Pc/OF6Ym6gj18zcOl5Qo7H1p/2YUXyuT6WzJAuvdd4mpm3S1b
         ccnvtOaThM3rMC456ydHEv88YQQa+vz/Cmocsa5AQb9pABrf/zoniuCCNIcFgzr78p1A
         Nq+ALGXBXXZB4F/OGrqGfbQ6Y79gvKlk3qY31sBqKnHGDKdtqNtax3gK5jk9YB/6bX1s
         TRo54mCyR5uuJ38KnuIY9bC2dCmr2/cWYJet3e9gzl7rinBbfuAzIYLDz/rp2NnTGOf9
         BI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qHnZMVe5Y7EDy73UocFbOqkOic/ITzFdjJim0WbrCVg=;
        b=neAUfauXCLkEAJz5r4XaW7heg2/orToXa86066FnD51l7v0tUZsHZi8NcT7g6FTdAD
         AFXrM796uIJDiYwWwnoWN5oJbPnJ7GYmaRmeT3Z+1Hco/fMS+Owfdi07VeHB7RDhqoCS
         SNemCJ9Q5SAF/3bM1wN3H2Tdl9WQ24+R8Grw+EG1KHITLwV3wMSenVT2BTLgi6m+8UaJ
         LBYfvyD64ei40nhQCzorWTLU/Y/Aa91eNa8D7p2AJfaAzdACk6bgS+BRDviuDKJ6ycl0
         dDGakPpS0KdJwODkSrwWV6GFQ3ZQYpgHKQC9q+5AHOT3w1cJENI7+ZngO9oOyKlt263B
         bi/g==
X-Gm-Message-State: AGi0PuakZ7W/GQyvM5pE0pDw04wTpj6WpkI9O9Y/6FVA9FitnpRG6PXh
        gzP4/rLXo80H8JF59TjOIS0t2lK2z0GQ5vHwHv5sFg==
X-Google-Smtp-Source: APiQypJzSIA7M8WieLTPiRB0Atlxe05VI645b6MAkDHdrAbIL8/iKZz4Cfptd+4ZR7WHMXeYTkLG5HT32gZYTfR/mK8=
X-Received: by 2002:a17:90a:3568:: with SMTP id q95mr852976pjb.47.1587078730154;
 Thu, 16 Apr 2020 16:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200414230950.83665-1-vitor@massaru.org>
In-Reply-To: <20200414230950.83665-1-vitor@massaru.org>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 16 Apr 2020 16:11:58 -0700
Message-ID: <CAFd5g47CaeEBiJsiSUtihHQF+OGpfCg76dS2ys2mwy2qn_L5-w@mail.gmail.com>
Subject: Re: [RESEND] kunit: use --build_dir=.kunit as default
To:     Vitor Massaru Iha <vitor@massaru.org>
Cc:     KUnit Development <kunit-dev@googlegroups.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Apr 14, 2020 at 4:09 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> To make KUnit easier to use, and to avoid overwriting object and
> .config files, the default KUnit build directory is set to .kunit
>
>  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205221
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
