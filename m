Return-Path: <linux-kselftest-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2113C001B0
	for <linux-kselftest@archiver.kernel.org>; Wed, 19 Jul 2023 23:39:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjGSXjO (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 19 Jul 2023 19:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbjGSXjN (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 19 Jul 2023 19:39:13 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5AB1B9
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Jul 2023 16:39:12 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-40540a8a3bbso75681cf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Jul 2023 16:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689809951; x=1690414751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmrEfOt69YUXnEdwJv4OzNXNHr6DjdUI8qa/nWwMStA=;
        b=0WKLPir2pa9/CRXGovk0E4uvoZZE9YWDMnWHWVTl4C/JUTXTiLxiL5w8EC6AjUb5M8
         sKmhU5dQlMz/mXX9sXo4+sgGdW1LAUVTetns3CHFEdIhmt4sTzWfYSt0Gp14qZBVjm1G
         P1/d5VzxifD7nw/azv2wTdoDjah8GA/4Mh0cEtO0NhGcegpI7Q674tm7S+8Z4WN+9cO8
         r5kf089kSAfX7HN3FZEmF/GQmbpswdQxGm50dJb4qdN/kKDjLh/dtyCbcF1jB9aOU6Ui
         joEZ797Scb48278WXsqbpIqHqA9xpNdCX+t3yDLxhkXXtkW4tvf00wj5g/mj08QXX4KE
         9MyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689809951; x=1690414751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HmrEfOt69YUXnEdwJv4OzNXNHr6DjdUI8qa/nWwMStA=;
        b=M2bGH3mAq29IbC9cF53oRlD9AZbLU+TUHkjyV8oKVa1tVXHa02md7RPMbuZ5s4YDN/
         29D2MX9F8RVl6FDqZyF1yW9hfmmL4DD5UIHhjQprl1Ert1K2cB9TiaVIDnkd5Jcw4dsE
         Fog4g1s/vbJTcHjwt9cHU1FiDDKbnPferwR+rcuVrmnuyGrf6g0st52b13rZ50td/SJ9
         GzNcIMg/TzW/FpbQyKiUU4Qp8Lg3RBY4dSLsxmJUg12LFLP4ccmKgj3YASkkgrUg07gA
         b8c1/uaSVMK5HJc+h4qup/rQnkYx4IcoBMGTfhqXIG8sBp/pPki5IJpLyzuWAjcOnX3D
         6USA==
X-Gm-Message-State: ABy/qLYL2JLBLLVwqVUgNTK7QD9nPINTweAggxr2JJ/GqmK8UCIUOUz2
        e8EOJeKjJY5zr9d2mytt8T4aF7BMVIy0Sr2UEXnSGOXr4VTCndiIAyCvetK2
X-Google-Smtp-Source: APBJJlENRHebbDBgH0cBdZkRZDSVow7n9gxI/Za8tVG/FbVfhGnh/QwaqwDQdWnjN/0mBfMUalijnoI3davazs14tWY=
X-Received: by 2002:ac8:5acc:0:b0:3de:1aaa:42f5 with SMTP id
 d12-20020ac85acc000000b003de1aaa42f5mr61671qtd.15.1689809951571; Wed, 19 Jul
 2023 16:39:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230713143406.14342-1-cyphar@cyphar.com> <20230713143406.14342-4-cyphar@cyphar.com>
In-Reply-To: <20230713143406.14342-4-cyphar@cyphar.com>
From:   Jeff Xu <jeffxu@google.com>
Date:   Wed, 19 Jul 2023 16:38:35 -0700
Message-ID: <CALmYWFsusw5H6aa9Po6QyEKr7beUSTN+PmGzc0Er0tuGEmYCbA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] selftests: memfd: error out test process when
 child test fails
To:     Aleksa Sarai <cyphar@cyphar.com>
Cc:     Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Daniel Verkamp <dverkamp@chromium.org>,
        Kees Cook <keescook@chromium.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Thu, Jul 13, 2023 at 7:34=E2=80=AFAM Aleksa Sarai <cyphar@cyphar.com> wr=
ote:
>
> Before this change, a test runner using this self test would see a
> return code of 0 when the tests using a child process (namely the
> MFD_NOEXEC_SEAL and MFD_EXEC tests) failed, masking test failures.
>
> Fixes: 11f75a01448f ("selftests/memfd: add tests for MFD_NOEXEC_SEAL MFD_=
EXEC")
> Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
> ---
>  tools/testing/selftests/memfd/memfd_test.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/s=
elftests/memfd/memfd_test.c
> index d8342989c547..8b7390ad81d1 100644
> --- a/tools/testing/selftests/memfd/memfd_test.c
> +++ b/tools/testing/selftests/memfd/memfd_test.c
> @@ -1219,7 +1219,24 @@ static pid_t spawn_newpid_thread(unsigned int flag=
s, int (*fn)(void *))
>
>  static void join_newpid_thread(pid_t pid)
>  {
> -       waitpid(pid, NULL, 0);
> +       int wstatus;
> +
> +       if (waitpid(pid, &wstatus, 0) < 0) {
> +               printf("newpid thread: waitpid() failed: %m\n");
> +               abort();
> +       }
> +
> +       if (WIFEXITED(wstatus) && WEXITSTATUS(wstatus) !=3D 0) {
> +               printf("newpid thread: exited with non-zero error code %d=
\n",
> +                      WEXITSTATUS(wstatus));
> +               abort();
> +       }
> +
> +       if (WIFSIGNALED(wstatus)) {
> +               printf("newpid thread: killed by signal %d\n",
> +                      WTERMSIG(wstatus));
> +               abort();
> +       }
>  }
>
Signed-off-by: Jeff Xu <jeffxu@google.com>

-Jeff Xu

>  /*
> --
> 2.41.0
>
