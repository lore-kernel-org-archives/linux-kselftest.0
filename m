Return-Path: <SRS0=xq1F=WC=vger.kernel.org=linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0C8C31E40
	for <linux-kselftest@archiver.kernel.org>; Tue,  6 Aug 2019 17:51:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 565FC20717
	for <linux-kselftest@archiver.kernel.org>; Tue,  6 Aug 2019 17:51:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=brauner.io header.i=@brauner.io header.b="QRDCdElF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbfHFRvB (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Tue, 6 Aug 2019 13:51:01 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42580 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727549AbfHFRvA (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Tue, 6 Aug 2019 13:51:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id q10so41889938pff.9
        for <linux-kselftest@vger.kernel.org>; Tue, 06 Aug 2019 10:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brauner.io; s=google;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2EETmRt9EOQBbfhEIb5t8mf9LVzodqT5JEXYRBL8vQs=;
        b=QRDCdElFaPyPLEkU6mKIuaw9r9hA6R9E1UgdMFkhvIow1uFsx15Hp7vXPoTETEsexl
         6Gu7cM0C7sYqiwR3/yCTW4Jf7dp/0Eq82n3Uh9i7+TL9tA3NtG709ffpdC9ozrmH1whR
         W26T1AIHLYKpwEkkbKkzlwo4msUA1SJMcl+wspZv/gHsQap3qPh1gC/MyvMTOv8UTI30
         0uXHG/dJyIvWlmIjfD4OwzrSTWSDH6PH7yIhfxURftS4k745t/38kWutkxl9dYVlpHg+
         ReDTsneBOh5h+iejRB0/tT9GTrISZoOzBWKW57/SFUOoqxI/ZPGEldfoiznDgSO70+LV
         T0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2EETmRt9EOQBbfhEIb5t8mf9LVzodqT5JEXYRBL8vQs=;
        b=ao4QtTIqTlWmkJElkzenjvjr6TVPnCOS9+1vGkmrk7O4b8ijXXBbOKg4WrynQm0+1P
         CNXf+q5q1HvAn/GSZAzU8E6znxikFVVL/rsQ9qg1Rq/Ph6ZzuE6P77DC53ScavWe4hVH
         41jhKfV+8crQ1w0wZ+g1VqealSBFhwVulJK9Hu0Cr1JI0uB56lr7utcVX9j3jAj1VJHV
         N4kp+fINlkgO4IffmPKBDniyU4ZkBCuTpkZ7psAcsGRW5zUVbrDZWEXkL8OrNTdudwov
         KPlQNV40M1UnAbWb6HN3h6q+4yDTrHdz02Dm8JyQgi77Bh0I0QRZ859BWeuBvzXBZ2Gq
         iNVQ==
X-Gm-Message-State: APjAAAUfX1y9tJdcbh0FQmxEBsEd8dqd9ug0TctM7uODK2p7cHXvebNy
        SFGAyPOZpnrxASGkp1aSVI94hA==
X-Google-Smtp-Source: APXvYqzq2kp3YRopoRLloI6d6xMJCf6nH8yiSo18UYl4X0l0Jv6xYG7hv6ysNLGHZSOp1xIn2UIu5A==
X-Received: by 2002:a17:90a:28e4:: with SMTP id f91mr4238337pjd.99.1565113859962;
        Tue, 06 Aug 2019 10:50:59 -0700 (PDT)
Received: from brauner.io (c-67-180-61-213.hsd1.ca.comcast.net. [67.180.61.213])
        by smtp.gmail.com with ESMTPSA id f7sm85627592pfd.43.2019.08.06.10.50.57
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 06 Aug 2019 10:50:59 -0700 (PDT)
From:   Christian Brauner <christian@brauner.io>
X-Google-Original-From: Christian Brauner <christian.brauner@ubuntu.com>
Date:   Tue, 6 Aug 2019 19:50:56 +0200
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     christian@brauner.io, arnd@arndb.de, ebiederm@xmission.com,
        keescook@chromium.org, joel@joelfernandes.org, dancol@google.com,
        tglx@linutronix.de, jannh@google.com, dhowells@redhat.com,
        mtk.manpages@gmail.com, luto@kernel.org, akpm@linux-foundation.org,
        oleg@redhat.com, cyphar@cyphar.com, torvalds@linux-foundation.org,
        viro@zeniv.linux.org.uk, linux-api@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v3 1/2] tests: move common definitions and functions into
 pidfd.h
Message-ID: <20190806175055.pazfyeyhbdbmuh6l@brauner.io>
References: <20190726162226.252750-1-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190726162226.252750-1-surenb@google.com>
User-Agent: NeoMutt/20180716
Sender: linux-kselftest-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Fri, Jul 26, 2019 at 09:22:25AM -0700, Suren Baghdasaryan wrote:
> Move definitions and functions used across different pidfd tests into
> pidfd.h header.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Christian Brauner <christian@brauner.io>

Applied-to:
https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/log/?h=pidfd

Tracked-in:
https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/log/?h=for-next
