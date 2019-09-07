Return-Path: <SRS0=/l6g=XC=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D522AC43331
	for <linux-kselftest@archiver.kernel.org>; Sat,  7 Sep 2019 17:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD35D21907
	for <linux-kselftest@archiver.kernel.org>; Sat,  7 Sep 2019 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567875966;
	bh=B009PTRLUBN8wurk7CoBAwKLSysKQ4xtBud+BIdBHwM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=MpT6cbFXAo2dht0egKtLszwlcVySIr4eBlhtBAWSDvmW4e1fhoB37BAhS44W8a/eR
	 99Wzqd0X4TGtfFmX1METbzbZkA6DIzb5MSSaEm5pAO9zb3UfssEfWn7gtHNFLD0PaH
	 r4LL87X0Pz4yNZ+eWyy+v//gYN86blIWUG4cfM64=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395094AbfIGRGG (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Sat, 7 Sep 2019 13:06:06 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46565 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389011AbfIGRGG (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Sat, 7 Sep 2019 13:06:06 -0400
Received: by mail-lj1-f196.google.com with SMTP id e17so8802848ljf.13
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Sep 2019 10:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaxRwZcXIqBCeM77ijL8A1h5NduVbQyHYByckmz1gJk=;
        b=Ldlyq4Px8HcWw652TFUFBz92WQlbW6hSwxMlCjQQ7ArJ4KZCkRlTmS1rpYbWoVnDTP
         m2fPZeqordNjkxzXe2jf1KmkqKcGf1nJr407YEJX5jdvDfinEa81A2+g7kiafJJQtJkb
         2rcL8ecVWF8zjmoPoJgLSziuzeA0NFXkftsDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaxRwZcXIqBCeM77ijL8A1h5NduVbQyHYByckmz1gJk=;
        b=eCBfJs61lklIq8U2fJu4HL0SrkDOgJk3dNDKDTmXDF68pr2N2eG1WxeZhgnOpH1dZG
         wNqw98z34/axkRlQB0fzQEptXgXJUYMmb/80gvWEKmtQ4+SwNt4vSkdMDlyy2mxaZAd2
         IOdaIG7wZ9GO6va8yrr5RPOI7Hxq5NeJpiAUd54pyHOgZnr9KoaQnHo0ENXYPLeYr7gz
         KGrgYTUHmQKWoMlPrkT6CgDuP52VApl8xZT/0CfgIxpwgJFldCTdG/OZTsWzhStMr9Ii
         rTS2GTIqlTyMbM+G1VY2DoHndQqGtW0nuj6drlqDm/YeMvo8g0OEYw5vfWtz9tTYJfhp
         JuhQ==
X-Gm-Message-State: APjAAAXUCv3lRWWaWUt2oCiN2KzWtezCyQ20vGb/t7FM8NYLITj5XC69
        fGv6os+NSv5TLknhq0RJxseMmV7fILI=
X-Google-Smtp-Source: APXvYqxkEQa+2dJfI5r+tYuCrK+KJiDG1orhE7QORh2rOhn9Nfah3yvpTqY21Dju9dmKwM2MXlUlqQ==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr9598073ljn.54.1567875963836;
        Sat, 07 Sep 2019 10:06:03 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id p8sm1546109ljn.93.2019.09.07.10.06.03
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2019 10:06:03 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id c12so7447119lfh.5
        for <linux-kselftest@vger.kernel.org>; Sat, 07 Sep 2019 10:06:03 -0700 (PDT)
X-Received: by 2002:a19:f204:: with SMTP id q4mr5583225lfh.29.1567875518853;
 Sat, 07 Sep 2019 09:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190904201933.10736-1-cyphar@cyphar.com> <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
In-Reply-To: <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 7 Sep 2019 09:58:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
Message-ID: <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
To:     Jeff Layton <jlayton@kernel.org>
Cc:     Aleksa Sarai <cyphar@cyphar.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Shuah Khan <shuah@kernel.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Christian Brauner <christian@brauner.io>,
        Eric Biederman <ebiederm@xmission.com>,
        Andy Lutomirski <luto@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Jann Horn <jannh@google.com>, Tycho Andersen <tycho@tycho.ws>,
        David Drysdale <drysdale@google.com>,
        Chanho Min <chanho.min@lge.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Aleksa Sarai <asarai@suse.de>,
        Linux Containers <containers@lists.linux-foundation.org>,
        alpha <linux-alpha@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        linux-ia64@vger.kernel.org,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        linux-xtensa@linux-xtensa.org, sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Sat, Sep 7, 2019 at 5:40 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> After thinking about this a bit, I wonder if we might be better served
> with a new set of OA2_* flags instead of repurposing the O_* flags?

I'd hate to have yet _another_ set of translation functions, and
another chance of people just getting it wrong either in user space or
the kernel.

So no. Let's not make another set of flags that has no sane way to
have type-safety to avoid more confusion.

The new flags that _only_ work with openat2() might be named with a
prefix/suffix to mark that, but I'm not sure it's a huge deal.

                 Linus
