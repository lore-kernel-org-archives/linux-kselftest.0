Return-Path: <SRS0=3G8P=ZT=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82164C432C0
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Nov 2019 00:38:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5393420665
	for <linux-kselftest@archiver.kernel.org>; Wed, 27 Nov 2019 00:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppixaEv/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbfK0AiV (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 26 Nov 2019 19:38:21 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43714 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbfK0AiU (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 26 Nov 2019 19:38:20 -0500
Received: by mail-qk1-f194.google.com with SMTP id p14so17956956qkm.10
        for <linux-kselftest@vger.kernel.org>; Tue, 26 Nov 2019 16:38:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a0TC2BOWpRh4jYit4Ff7nyd0NTPThxNCifAyq6VLObY=;
        b=ppixaEv/ZRxvIbeaY1I1rjFRFd0l5mns4YfUBJ1NISqWh5QXd9vsCZqXQUT0TlBRjf
         Qz+6h/1BR1j10vMNebskoTcAq7rco4kZovQgsIw3b9Xw3R9xLOvH61yBx17KptnUL+1p
         puINXZtlsm7B7iMdn3ATMjDx5YpruIQOYJHQih4dBZbeUgK+hylqbiUVBDJ9tCtgQbkg
         zpyvxDrlBB9JH4qUKi77kGbIE0pYLqm+rTFGi1BA/CPpuMHEqLR+v3QHuM//jjxnNDyw
         H2puBRyb7hllPJqhf1KIPeEgqgsSz/Bbstks9g/VgtA855Jt/mDGJe2Vtkd4jzdWDDZD
         Ngtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0TC2BOWpRh4jYit4Ff7nyd0NTPThxNCifAyq6VLObY=;
        b=aptPZGitjLMK/oi8tLuX3c24o44Mdv5PhhZCshS4PPh5ImQz7ycvMOfSlr9WBoQWjG
         ZxqREq5XOSozq0fjMNjINxIehbwz3Q2aWOPRujJlOh0QsEWq1i7i3DdMWHaWUtsVZAhE
         bwnQX4MMfV1LG8IA8rmt/sOPRsGjESGZQTCwIbMlWg0uAFR1+bmJoMDx1fKeWS7ScoBR
         5T5U72d21NqWPasLVnOpEWbxDge2pX35fF1GjFZFOke0qYmCXtwPnrpyDYsEUfN9pxzs
         Cml5Vz4vkfOyeXkPbr6OyDwUK28xVsME3DH7dZwlfRJt0xPy0p8wzsHFRqKxVa45lot3
         y7vQ==
X-Gm-Message-State: APjAAAW5GdlBpNAF+YKFdMDgbkAVwRtBY7Zyx8Co/vmU0Lp53NvbM65O
        WjQ6A5oXQD41VxioElnkxlc+wajnoaFNjCQKFXOK
X-Google-Smtp-Source: APXvYqwd50hIIUjXB9u1GvjPuBYiICwBU6he4Q0g8dzGlaIMtfRnNCdana3sq7r1R35RMD+GO39gy7puNNeu+A0J0qE=
X-Received: by 2002:a37:e30b:: with SMTP id y11mr1538390qki.12.1574815099644;
 Tue, 26 Nov 2019 16:38:19 -0800 (PST)
MIME-Version: 1.0
References: <20191127001023.63271-1-yzaikin@google.com> <41d22ac8-7907-6bcf-883f-27518506b87f@linuxfoundation.org>
In-Reply-To: <41d22ac8-7907-6bcf-883f-27518506b87f@linuxfoundation.org>
From:   Iurii Zaikin <yzaikin@google.com>
Date:   Tue, 26 Nov 2019 16:37:43 -0800
Message-ID: <CAAXuY3qJKDOQumcpwPuuWRa6aPTZNm2-doNy20M45J-1zT8XgQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ext4/inode-test: Fix inode test on 32 bit platforms.
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Brendan Higgins <brendanhiggins@google.com>,
        "Theodore Ts'o" <tytso@mit.edu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ext4 Developers List <linux-ext4@vger.kernel.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

> Please add Reported-by for Geert and also include the error he is
> seeing in the commit log.
Done
