Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AE2C433FE
	for <linux-kselftest@archiver.kernel.org>; Wed, 11 May 2022 13:16:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240682AbiEKNQE (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 11 May 2022 09:16:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236619AbiEKNQC (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 11 May 2022 09:16:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6FB02B194
        for <linux-kselftest@vger.kernel.org>; Wed, 11 May 2022 06:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652274960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=847f8b3CFwEu71lDLQ1QNvWqielD+SKMP+eCTO0iSpA=;
        b=Pu5MEM+cjaluyElAa07PgCw18PMXTjekeWaUmBsV1LHpko3mrIT4Jd7jmTahkZs6xCESMx
        D6O5F5++aFU4I8NiHCCJN9+AigKwSFwfY2Bp0M/vlY/md6gG3/ip/FE6vX2zxrD0OUbr7B
        nDrvkgiT8giouLcsQSOx8eLUeRKiXVU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-S5jWUM5jPiWmWOmrUpoSaQ-1; Wed, 11 May 2022 09:15:56 -0400
X-MC-Unique: S5jWUM5jPiWmWOmrUpoSaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0479B18E5293;
        Wed, 11 May 2022 13:15:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.115])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id AD44D400E57B;
        Wed, 11 May 2022 13:15:35 +0000 (UTC)
From:   Cornelia Huck <cohuck@redhat.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Joey Gouly <joey.gouly@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-kselftest@vger.kernel.org
Subject: Re: [ARM64] status of MTE selftests?
In-Reply-To: <YnuwtXBxIEqivZfV@sirena.org.uk>
Organization: Red Hat GmbH
References: <87wney4svy.fsf@redhat.com> <YnuwtXBxIEqivZfV@sirena.org.uk>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date:   Wed, 11 May 2022 15:15:34 +0200
Message-ID: <87fslgb47d.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

On Wed, May 11 2022, Mark Brown <broonie@kernel.org> wrote:

> On Fri, May 06, 2022 at 04:50:41PM +0200, Cornelia Huck wrote:
>
>> [1] Command line:
>> "$MODEL" \
>> -C cache_state_modelled=0 \
>> -C bp.refcounter.non_arch_start_at_default=1 \
>> -C bp.secure_memory=false \
>> -C cluster0.has_arm_v8-1=1 \
>> -C cluster0.has_arm_v8-2=1 \
>> -C cluster0.has_arm_v8-3=1 \
>> -C cluster0.has_arm_v8-4=1 \
>> -C cluster0.has_arm_v8-5=1 \
>> -C cluster0.has_amu=1 \
>> -C cluster0.NUM_CORES=4 \
>> -C cluster0.memory_tagging_support_level=2 \
>> -a "cluster0.*=$AXF" \
>
> You need to set bp.dram_metadata.is_enabled=1 as well.

Aha! Indeed, with that set it all works. (Too bad that the config
doesn't moan when it's not set...)

Thanks a lot!

