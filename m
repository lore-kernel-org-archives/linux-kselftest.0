Return-Path: <SRS0=aVlM=ZZ=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F47DC432C0
	for <linux-kselftest@archiver.kernel.org>; Tue,  3 Dec 2019 23:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 024D62064B
	for <linux-kselftest@archiver.kernel.org>; Tue,  3 Dec 2019 23:05:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IUFc8UxN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729302AbfLCWuW (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 3 Dec 2019 17:50:22 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35526 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbfLCWuW (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 3 Dec 2019 17:50:22 -0500
Received: by mail-pl1-f194.google.com with SMTP id s10so2285051plp.2
        for <linux-kselftest@vger.kernel.org>; Tue, 03 Dec 2019 14:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=s72VU58n1uZlGbJBRTu2xgBYvYdIHK25ECXlG0jy3sU=;
        b=IUFc8UxNwCnljk1TUZeICIsFef5PK+xyx1Cbp5WCC/NRyAH/tbCYjBIAeLuROBwikS
         7ZJl3nv42a8U9RgG63oQnfjnPKIovit6eCqoPDdhkLgzn5hRk1/nRxJt7ld9HCyyhMlk
         JILbzRmnm3Y+5cdd/BwZZBnNhnO2dK6/enplmbtWP4BBQol0Ci2cwRgE+JclK44wH0Mw
         ysEBvJVUVGDWQIELvgX4F94BvuaB1Sa/wk0WN9TVAehOEWdcUBsOn+qYzcqu8cpkUMhu
         vttwNNE5r1wOhr9igAx4QihOT1fd5iRS1B7bEO+mKA2grij7zGOPJU69UqyOw6P7TKu5
         SvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=s72VU58n1uZlGbJBRTu2xgBYvYdIHK25ECXlG0jy3sU=;
        b=EEoEhApe2+hCj750qfikzv0V95+0rtxiD+kCcmfknbzJ4hIAyPfFj8oD5URAeq+xnL
         GVQsLI8QqxiELnuV/Q7pz4KyKv27PySRlbIgWORvL1XWxrElFIE7a+blZ4275TL0wHZj
         gEgNrG4vFir0gHLM706g8R/Gex0/PDYdGOaG2xNIu2WJUv6Whd075V7abzL/9rWq7Si7
         wwkZS6OqowbLPCrAO9dMcnVfeqUoORvfQpnuz1t/6s7+bRRZ+sEFsyp47XlVd6eTVkDT
         0ghVWS+qxtug7nnfU/Xpi8YbHIw7fkQlIau6GzoAwD41Hw3YNWWJdDQJ/xXTr8P6ZL4M
         z+fA==
X-Gm-Message-State: APjAAAVimb1PGjWuOcvTC3vfc2vEVIg3LHYpibrcgNGJTwrG6EkXLNdv
        cZli8hJg3VR6rC1665U7D80Jkkm8Id434ac4evregw==
X-Google-Smtp-Source: APXvYqwiLcG4Ak+RbWUBVrzm1Y963nmdTKtkyVteu+4h4xn9QeAIwv9XGtBGLGW8JW3XRdI9kKo1W/hNsqcZZ8MX+Ho=
X-Received: by 2002:a17:90a:c390:: with SMTP id h16mr8324726pjt.131.1575413421318;
 Tue, 03 Dec 2019 14:50:21 -0800 (PST)
MIME-Version: 1.0
References: <1575374868-32601-1-git-send-email-alan.maguire@oracle.com> <1575374868-32601-7-git-send-email-alan.maguire@oracle.com>
In-Reply-To: <1575374868-32601-7-git-send-email-alan.maguire@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 3 Dec 2019 14:50:10 -0800
Message-ID: <CAFd5g47y8t7ZveLvgiTBVBkFE4-zJmPgMykjPNkm03X63Aimnw@mail.gmail.com>
Subject: Re: [PATCH v5 linux-kselftest-test 6/6] kunit: update documentation
 to describe module-based build
To:     Alan Maguire <alan.maguire@oracle.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        catalin.marinas@arm.com, joe.lawrence@redhat.com,
        penguin-kernel@i-love.sakura.ne.jp, urezki@gmail.com,
        andriy.shevchenko@linux.intel.com,
        Jonathan Corbet <corbet@lwn.net>,
        David Gow <davidgow@google.com>, adilger.kernel@dilger.ca,
        "Theodore Ts'o" <tytso@mit.edu>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Knut Omang <knut.omang@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Tue, Dec 3, 2019 at 4:08 AM Alan Maguire <alan.maguire@oracle.com> wrote:
>
> Documentation should describe how to build kunit and tests as
> modules.
>
> Co-developed-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Knut Omang <knut.omang@oracle.com>
> Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
