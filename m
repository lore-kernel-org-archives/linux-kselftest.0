Return-Path: <linux-kselftest-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD9DAC433FE
	for <linux-kselftest@archiver.kernel.org>; Wed, 20 Apr 2022 11:16:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348105AbiDTLTQ (ORCPT
        <rfc822;linux-kselftest@archiver.kernel.org>);
        Wed, 20 Apr 2022 07:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352495AbiDTLTP (ORCPT
        <rfc822;linux-kselftest@vger.kernel.org>);
        Wed, 20 Apr 2022 07:19:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DCC7433A02
        for <linux-kselftest@vger.kernel.org>; Wed, 20 Apr 2022 04:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650453389;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=eYQ5+gQn7GgDwXMrKTQdbxlVk3vOnJ023pTMFMvtqkfDkZ7g8qSHonLDMkSqIzm3RbkvtY
        0nELFOm/47OdNwWXv/KVMEaVpFF+CffEY4zSmb44C5yI49zXtaeLVzm8VTazVmIK4VXEoo
        WDlgVrWUf4vdTew7vW04kdYucw+Ewi4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-601-jKVHNw1HMJWOlZ4SBx9stw-1; Wed, 20 Apr 2022 07:16:24 -0400
X-MC-Unique: jKVHNw1HMJWOlZ4SBx9stw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B9A8185A7A4;
        Wed, 20 Apr 2022 11:16:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DEB6112131B;
        Wed, 20 Apr 2022 11:16:15 +0000 (UTC)
From:   Paolo Bonzini <pbonzini@redhat.com>
To:     Thomas Huth <thuth@redhat.com>
Cc:     kvm@vger.kernel.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] KVM: selftests: Silence compiler warning in the kvm_page_table_test
Date:   Wed, 20 Apr 2022 07:11:09 -0400
Message-Id: <20220420111109.1145821-1-pbonzini@redhat.com>
In-Reply-To: <20220414103031.565037-1-thuth@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Precedence: bulk
List-ID: <linux-kselftest.vger.kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org

Queued, thanks.

Paolo


