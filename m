Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C91C1C77B7A
	for <linux-kselftest@archiver.kernel.org>; Fri, 26 May 2023 18:52:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbjEZSwT (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Fri, 26 May 2023 14:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbjEZSwS (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Fri, 26 May 2023 14:52:18 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 930A3125
        for <linux-kselftest@vger.kernel.org>; Fri, 26 May 2023 11:52:17 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f6c6320d4eso25101cf.1
        for <linux-kselftest@vger.kernel.org>; Fri, 26 May 2023 11:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685127136; x=1687719136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR4oeJqmOlTeZziilw2pYUhae8MRA2mQQoVrekapX1Y=;
        b=Qz+BYl7aT9JXo13xkBr+cg6STdDW/DISzgnu/3q2a7KyoW7PWXvRA5tR1QExlGRTMe
         dstv/G7jyoflL/mHoOp0kVBZwuvRLpIh57Sc684zPHJl7dYwyPE2eJ6B6NwhlvLyUZJc
         oCmeRsJKn8TkUAR0kPTPn7Oz1RPZDVjb+DbTlQ3PhC6IKW1bawvX6xZhoFwJcSUSKKDL
         j8RV15cRmPe4W6k17A6IBv6xodfpfVUFAmA/gK7L9CiIlcCk3qDkelwDFoKj6VNT4WLf
         5Zn2kSD17s4VM3Td2gDFJaEiJ8W7f1b7G/TYc9G/rkYTu+vH4ko6RDMRLg/C1DCc0yEl
         Zy6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685127136; x=1687719136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR4oeJqmOlTeZziilw2pYUhae8MRA2mQQoVrekapX1Y=;
        b=AmDlVHlclpnvK5sM1UY8o73es9F2zKD7g+UmWAPixUGUYGDI5jLEm6hBnVDLrsa/+V
         xxY68tes5GR+IEFYFzc73QcN2W6L1avmWiBDSF4iQvVoEPvmGRBOHjpROUjF0nUSHLd0
         fCD10p8PYjiHKMlM8h393H3Ys8+ouyrEdGIhdIWFhovr0Wceu9OyIrNbw+bwUNt/A10V
         +u27CUwtfKvrvXZXTc775n/sr9PRq6teGtv/OjkP+86V4xEAX84qkVUSKcdvJVlaZ/uI
         CyrvvabfqiMmlqiyDoyH6xuj+qQh+nKKJFs5N6+/l5eydZXI6fyh55+Q9JjzfCJqdndx
         6ISQ==
X-Gm-Message-State: AC+VfDxpE70tm1djNYdRuwJeHuh8S/OjE5ExpBMgFfXWWqagLymOmxtl
        Y+jNo8rwezT7dEmfIjk9/JrLe9TERy2bhvLAGexcWA==
X-Google-Smtp-Source: ACHHUZ4M8DEI0Tdun8SLqksnPN4JKE0wIBIzq0MYbMAD1vEq1DPyQajDwvrOFQryT8+84i8dQvJP2sY44u/hWQ+/3Ck=
X-Received: by 2002:a05:622a:2d4:b0:3f7:ffc8:2f6f with SMTP id
 a20-20020a05622a02d400b003f7ffc82f6fmr22879qtx.28.1685127136612; Fri, 26 May
 2023 11:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230526075355.586335-1-davidgow@google.com>
In-Reply-To: <20230526075355.586335-1-davidgow@google.com>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Fri, 26 May 2023 11:52:05 -0700
Message-ID: <CAGS_qxqJeMDXA1b_MJrHSg8rGEM6K2UXqaxNVmwW_oQEFwQ1Xw@mail.gmail.com>
Subject: Re: [RFC PATCH] kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
To:     David Gow <davidgow@google.com>
Cc:     Dan Carpenter <dan.carpenter@linaro.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Rae Moar <rmoar@google.com>, kunit-dev@googlegroups.com,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, May 26, 2023 at 12:54=E2=80=AFAM David Gow <davidgow@google.com> wr=
ote:
>
> KUnit aborts the current thread when an assertion fails. Currently, this
> is done conditionally as part of the kunit_do_failed_assertion()
> function, but this hides the kunit_abort() call from the compiler
> (particularly if it's in another module). This, in turn, can lead to
> both suboptimal code generation (the compiler can't know if
> kunit_do_failed_assertion() will return), and to static analysis tools
> like smatch giving false positives.

Another thought: this impacts
https://github.com/Rust-for-Linux/linux/blob/rust/rust/kernel/kunit.rs.
They're currently calling kunit_do_failed_assert() always with type=3DASSER=
TION.

This change would actually make things better since they could handle
shutting down the thread themselves instead of having it happen behind
an opaque FFI layer.
But we'd just need to make sure we get that code updated around when
this change goes in.

Daniel
