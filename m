Return-Path: <SRS0=fgMe=BB=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4689C433E5
	for <linux-kselftest@archiver.kernel.org>; Wed, 22 Jul 2020 16:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91D4522CA0
	for <linux-kselftest@archiver.kernel.org>; Wed, 22 Jul 2020 16:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595434922;
	bh=NnybZoElq3+0KYwoEu4w7pBb4jnYvQOexyS5ysvraSE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=RMjcMCl1AFBUivAeXO0n3tctAu6s0HmiRVFzFTz2GBFiwr17hKqG6dZge4oTE9h1q
	 3EKdZOodnCrhaO263asNBMI16aZKOIRKEzAcvNixkKDDfXC4qkyGFRqpOuI5s/DS3z
	 wWrYJdQcTJ6UwliHD77raVy2TeY8ToX6swJ7N/BE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgGVQV5 (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 22 Jul 2020 12:21:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:46322 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726784AbgGVQV5 (ORCPT <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 22 Jul 2020 12:21:57 -0400
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A92CA207CD
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2020 16:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595434916;
        bh=NnybZoElq3+0KYwoEu4w7pBb4jnYvQOexyS5ysvraSE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vSXDj7y4cjPLVva9NAh9E8W8nLdAoG0KWjc1Xvn4ZFyDroZnWq5rSXVbBn7BifxOt
         7bHtlPYpQv/zqYsru2Ia0FbssvT6tN9BCNbgBUDs2+Y147IplM47o7Q3IQjPz8jxPm
         V8lO1ZksDemESa5uzI+dxZ69W6cujSFN7Y6FaZlA=
Received: by mail-wr1-f41.google.com with SMTP id b6so2465987wrs.11
        for <linux-kselftest@vger.kernel.org>; Wed, 22 Jul 2020 09:21:56 -0700 (PDT)
X-Gm-Message-State: AOAM530MjzEQGEDLl3qJ0rY1HUuw10Egf+ocTIHCyhZvj81QcAw0f+Oe
        ENelaYHMr0JoK8EEjGt7ZtDsZ1W0nBgoJlGMXp+KYQ==
X-Google-Smtp-Source: ABdhPJyEetM5mfaR+krsbN1VbThAmtrGRoGcIADpoq0lN9rBpz6OtbXdH4MYYDkEz8tY7NVo/wEe+Jv+iOx79Efg25I=
X-Received: by 2002:adf:e482:: with SMTP id i2mr296828wrm.75.1595434915303;
 Wed, 22 Jul 2020 09:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200717072056.73134-1-ira.weiny@intel.com> <20200717072056.73134-18-ira.weiny@intel.com>
In-Reply-To: <20200717072056.73134-18-ira.weiny@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Wed, 22 Jul 2020 09:21:43 -0700
X-Gmail-Original-Message-ID: <CALCETrVe1i5JdyzD_BcctxQJn+ZE3T38EFPgjxN1F577M36g+w@mail.gmail.com>
Message-ID: <CALCETrVe1i5JdyzD_BcctxQJn+ZE3T38EFPgjxN1F577M36g+w@mail.gmail.com>
Subject: Re: [PATCH RFC V2 17/17] x86/entry: Preserve PKRS MSR across exceptions
To:     Weiny Ira <ira.weiny@intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        Linux FS Devel <linux-fsdevel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Jul 17, 2020 at 12:21 AM <ira.weiny@intel.com> wrote:
>
> From: Ira Weiny <ira.weiny@intel.com>
>
> The PKRS MSR is not managed by XSAVE.  It is already preserved through a
> context switch but this support leaves exception handling code open to
> memory accesses which the interrupted process has allowed.
>
> Close this hole by preserve the current task's PKRS MSR, reset the PKRS
> MSR value on exception entry, and then restore the state on exception
> exit.

Should this live in pt_regs?

--Andy
