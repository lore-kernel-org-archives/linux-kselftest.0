Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E37C433F5
	for <linux-kselftest@archiver.kernel.org>; Thu, 12 May 2022 18:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344070AbiELShm (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Thu, 12 May 2022 14:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243033AbiELShl (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Thu, 12 May 2022 14:37:41 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED70169718
        for <linux-kselftest@vger.kernel.org>; Thu, 12 May 2022 11:37:40 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id j6so11899134ejc.13
        for <linux-kselftest@vger.kernel.org>; Thu, 12 May 2022 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=llEoX+p/O6HR36Ljgn5NZ7PhsoLdAcO1wdmtCWdau7g=;
        b=GWYIpBLPjk3riEZxwMpIDYkFGs7dudx59bqS5MYiUhPdqqxKzzIlgXrIfotpgYkiOX
         BZxjfCoxnp7YzyxVh+yhk4lj7jvDrrHCJ5NMPiwh1pskbQd5bgfBOy6AewOr0M4OdbgX
         KUGVM21PAEUZK+Vp605oKDgY4lgGckHAUwQRRFwwbyfveKlk48rhK5LDncAsYrpWKLoZ
         qmi6BkwKypyNgFuBA+q97132Qx3obxmbHKhzJ4KnqpMLLUficrvw6z4Vger/GRJEWXDn
         hC9+yh9JWEbmwC6Wx7/jHo/3hidA0DtTN4PhMUuQGZmBK6iKHqzVCX/4xluzXBJY7395
         i1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=llEoX+p/O6HR36Ljgn5NZ7PhsoLdAcO1wdmtCWdau7g=;
        b=jOKafFcqaUNTKyJyOLDU9sGDQh0wMekHYatSTNkmziUgkraFu5IFNT/vx4QUmMBPY/
         +qkXjmKFqxdjKRkiF79QIIxkiXqs7Jf++hFbFPpM8Rx72N/vtAZqWox2YCXA7y8wqg6a
         n+T7itXPgooFjHAxvDxq4NrMHEzVx6ZrJAnweyK2St3R1PKWFcsDrD2a5fBhjyczk9bU
         /KJZPJ3zYDrf+HzCDSwge4Jgsn7JdEgKrE7hsU510FfWPT3Da6Y3L9T6d4K90L4Zn/+e
         ebsytuQddhkHbfjFWW1ggLBixbgSOSSpOshR3Fo1p2dA/sdhx/y1Yx2yX2IdQoZKsSGt
         dZfw==
X-Gm-Message-State: AOAM5324af61azXv/YdfYL7yLapqha6bYU0vRCCdo1ktPXIiDOGEmBhF
        gt03PWKY6cBVr/UDc033FpwG++Hg+DPIvYKwotJqgg==
X-Google-Smtp-Source: ABdhPJzHo4KdWRRPsWLy4avgwSNbcyEMs350bXnr/6GJseCP3F4Ws/i4Z8r8+0XnLpYcC/1Qa2kNdVM0M6ApRaCJgZE=
X-Received: by 2002:a17:907:6d0a:b0:6f9:b861:82b8 with SMTP id
 sa10-20020a1709076d0a00b006f9b86182b8mr1124352ejc.478.1652380659345; Thu, 12
 May 2022 11:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220509204909.2464496-1-dlatypov@google.com>
In-Reply-To: <20220509204909.2464496-1-dlatypov@google.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Thu, 12 May 2022 14:37:27 -0400
Message-ID: <CAFd5g45RCw5S4MSSerqtxWz9kkaf9K1+GwT-2_aD6jB4oGfMOA@mail.gmail.com>
Subject: Re: [PATCH] kunit: tool: misc cleanups
To:     Daniel Latypov <dlatypov@google.com>
Cc:     davidgow@google.com, linux-kernel@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Mon, May 9, 2022 at 4:49 PM Daniel Latypov <dlatypov@google.com> wrote:
>
> This primarily comes from running pylint over kunit tool code and
> ignoring some warnings we don't care about.
> If we ever got a fully clean setup, we could add this to run_checks.py,
> but we're not there yet.
>
> Fix things like
> * Drop unused imports
> * check `is None`, not `== None` (see PEP 8)
> * remove redundant parens around returns
> * remove redundant `else` / convert `elif` to `if` where appropriate
> * rename make_arch_qemuconfig() param to base_kunitconfig (this is the
>   name used in the subclass, and it's a better one)
> * kunit_tool_test: check the exit code for SystemExit (could be 0)
>
> Signed-off-by: Daniel Latypov <dlatypov@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
