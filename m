Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228FAC19437
	for <linux-kselftest@archiver.kernel.org>; Tue,  8 Dec 2020 15:56:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D018323AAC
	for <linux-kselftest@archiver.kernel.org>; Tue,  8 Dec 2020 15:56:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730227AbgLHP4h (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 8 Dec 2020 10:56:37 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:39772 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729558AbgLHP4h (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 8 Dec 2020 10:56:37 -0500
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1607442954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zLoKOU+kSW7kZX0dODC+sT6g6ygfkbwnnbOdUP+fpIo=;
        b=YNEqf/mqLSmjBmP5ZGf5eHu12lDeWGEzyauSFZAHPkhNVHZ1/AlNAqqBPKV7Wk4RaFHIGJ
        xw+JhkXoG1lzOSOOV44QRn+kYn/uRbW0SwbEHU9i24YAkRr5r38Q6CP2rpn56gigMEdWL1
        HMMQPjUWoDQhvMK1Ejpzf6kjbKeHvGDAt2nulDNCRwCN6R+eVKoK9GDHsV/EWGPBTYQ95o
        FJaY6t3dBgA0WtPuhtS8j4M/sxcSKM3xflf4o0uEViYQ3ccAFTNoP07V4Uw9VOg5+bnb13
        m33F8u0g5ENeP//5nmPwIFr2XPcSO7wjFthT0v2C1FB67BUBOjzvq0Pl6JEYvw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1607442954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=zLoKOU+kSW7kZX0dODC+sT6g6ygfkbwnnbOdUP+fpIo=;
        b=5eK4E9Ikvqh6D2TZGskNvX7QoOS3LoBgXize7jGZM3c/9qut1GtVzf/vcoIv5MUQ/DOWqH
        HrwKMSeV0laYDOAQ==
To:     Ira Weiny <ira.weiny@intel.com>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Fenghua Yu <fenghua.yu@intel.com>, linux-doc@vger.kernel.org,
        linux-nvdimm@lists.01.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        Dan Williams <dan.j.williams@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V3 00/10] PKS: Add Protection Keys Supervisor (PKS) support V3
In-Reply-To: <20201207221431.GL1563847@iweiny-DESK2.sc.intel.com>
References: <20201106232908.364581-1-ira.weiny@intel.com> <20201207221431.GL1563847@iweiny-DESK2.sc.intel.com>
Date:   Tue, 08 Dec 2020 16:55:54 +0100
Message-ID: <87v9dc2sxh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Ira,

On Mon, Dec 07 2020 at 14:14, Ira Weiny wrote:
> Is there any chance of this landing before the kmap stuff gets sorted out?

I have marked this as needs an update because the change log of 5/10
sucks. https://lore.kernel.org/r/87lff1xcmv.fsf@nanos.tec.linutronix.de

> It would be nice to have this in 5.11 to build off of.

It would be nice if people follow up on review request :)

Thanks,

        tglx
