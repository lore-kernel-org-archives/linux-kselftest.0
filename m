Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8B3340A51
	for <linux-kselftest@vger.kernel.org>; Thu,  9 Jul 2026 13:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604718; cv=none; b=Uw5hFgjCakb19dFYXcrkF7HUhhr6ZB6Rx3fk5WC+greUJMEP2YfCoPNr+W06iKBC8pdCkvSUGEPyJkIFSQB8lAtj9bhx2ECp/MS91p5EMEkkxLKps88tfWEzH/Oe8qhwYso7Qu+UtVxvYwNGKNqvM9TcKt29nED77yS/6Cb9HW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604718; c=relaxed/simple;
	bh=hV1txD3s0gTLfPiS3b2/9sZVWfKgrmrE3xMhHxL2XQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+B168wQ3Pa8UDYRqcp+cOk4agX+xhhiyFoy4ym3s9DhBYWWhwr8ZngnpDlhyb6V7qN9+5/LlyzOHGXWGbr10FCaZ3yY/szVazcbxcp3nbQSAIlFif1GoXz7B+BbvA/CPyEBC8OhcpqVIIsH6gw9ReiollHAdsRWUDU34IlLgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IwgnlJU9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=LOntyHXA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IwgnlJU9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="LOntyHXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783604714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0B2CCHmIqiYi2OjZQM05i6RdlCsyGmxI7RbfTKwg3sQ=;
	b=IwgnlJU95+rGFjvHe95zZCH291Ar5tNWTijTvK5FBbFV6C54h+ahWIV1OTxEXr8MISO8Og
	a82SEwGSpOi3T49Wn5DAUimoVGm4KAC6FJ0sJzvqCbePD6TVyFBsT0n1AcydC33NtxJuT/
	S8e6sGyadORdpRxknIlRbRAx/pYb2wg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-TcLNkf-0NiSEm4xYWdnlEg-1; Thu, 09 Jul 2026 09:45:07 -0400
X-MC-Unique: TcLNkf-0NiSEm4xYWdnlEg-1
X-Mimecast-MFC-AGG-ID: TcLNkf-0NiSEm4xYWdnlEg_1783604705
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e6a2f5995so139726585a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783604705; x=1784209505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0B2CCHmIqiYi2OjZQM05i6RdlCsyGmxI7RbfTKwg3sQ=;
        b=LOntyHXAiZrtud2uZP7sWN49TGh+ZRBTc5d0v8HDoTKwKJBzwF9Ma4RMASqFVza5R/
         HNp8ANMbNbXRcIre0TJzUdMGPM2m2LVnsokqBx1IiWTECtywQD6JDd05TSip63Ddrc3N
         PSpBxbyZdkaJN1GGRo5q/JBp1VcMrPJvvLTfqffqtkSoc9kjnM7N6KcwIp3UTkGFwlyi
         AwqFsCgPW+UaW+JWnCg+bqPnWLExHonHb8CrA7K6MjeMv1CMd6AVNprnhwaEo20ixN5z
         7iprXONBeF6+iAxwFXeiBLuf+aBG0OT7vj582dPd0N8TJbGfVXRamzGYgIYeisOfzMnt
         3Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604705; x=1784209505;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0B2CCHmIqiYi2OjZQM05i6RdlCsyGmxI7RbfTKwg3sQ=;
        b=OLm4+bjT1RqeTZbvmPLQzoXe7lTjkWkyO+3PUrAIJiZyaOIfN8/7fiHCxm2SLN0sic
         Erpj/C8DOWx42z6ntxsTr0ty+qV5QI21N0shjseSTB13qAqEwoLKJqjYfCiQfGfjaxcM
         u+jAPcHWbRiW8gL6yioskGp79Zth4/F2vMNLxm9qeO0x2ECdLjxKj7de39f+bVMmMjdW
         guqMCa9+fSlpyd/QMwq5db4g1T9s2iaUTzzL0+3oHU9tSe/3O+BHIDozGGyiRcDOZEeH
         zQrHbAfNlgfmM3XX/Tcb1d6BjzR/e5v//EEmmSj5aS/AJs5ImW58F81uaCfTAuLiXBJM
         Kflw==
X-Forwarded-Encrypted: i=1; AHgh+Rrs5ik35rxnytzG2eJYZr+oaN9q8H2Am+RiexslNEJ9JYkSmP9cforQaPRKOPa3AiPr8K2hRrKbHFQXgQOUeIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoy5BFbJiAS872PuOBhYTqRlXHGa4qjgjtrJjr8/zjWGUio476
	arG4adBSn7nmkZKn8eqHzlqlo4opOVUBYOV/rbpCHH9M+xBGMzblTcqUSJrO87BWaa5FDbaLSg3
	MzHCc9gZCK14Wgo/8LjQGAX/7wGfxpMlyh3kEAbDjf8Cly2CG+FS7iQMQkHj6etIfvZ2ZPsoArr
	fagw==
X-Gm-Gg: AfdE7clM1AYMK9kux3JB/+nJBCcUIeKy2KsXeacODEvOMQdFUzVudd/y6nxwb+PC9Qf
	2M/0cSbu/w1OLSzbC84w6jmlqrPtUBWKBS1w3J5f4r3TJUASZ89sVpzQDM5MG+d48KdD1BXmafg
	nxyc6tkGpHPAPpPAPT269KfyAD6AmEePc3VIKPDqMzVwnHygoqYgQh11Hp6ksIpkAU2pLUYtWIx
	Nbehvqk2JKYkdliCYxFHyisPjwzC9fZMZTEtswVlQVebbWeGOoVjxCpZhRADUO7zAsKldzH2L30
	oi4jU4kaxHM4hdHMFPux5Xgv/fXoo0d4LynQy/ukRuCu9uB0rHGHDxLPH81csl79AqNvchFogYF
	p2sAT25SdpOzcLDIa7GmktySmb0QZRCxPUHWnyDVXa00156IGrblwZGg=
X-Received: by 2002:a05:620a:4624:b0:92e:48a2:533a with SMTP id af79cd13be357-92ecf6aa74cmr764350585a.47.1783604704827;
        Thu, 09 Jul 2026 06:45:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4624:b0:92e:48a2:533a with SMTP id af79cd13be357-92ecf6aa74cmr764344385a.47.1783604704231;
        Thu, 09 Jul 2026 06:45:04 -0700 (PDT)
Received: from localhost (pool-100-17-17-231.bstnma.fios.verizon.net. [100.17.17.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90ccdf8dsm1665479785a.37.2026.07.09.06.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:45:03 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:45:02 -0400
From: Eric Chanudet <echanude@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 3/4] selftests: cgroup: Add vmtest-dmem runner script
Message-ID: <ak-gNsQ8vi7yDJsm@x1nano>
References: <20260706-kunit_cgroups-v5-0-6c42c8753468@redhat.com>
 <20260706-kunit_cgroups-v5-3-6c42c8753468@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-kunit_cgroups-v5-3-6c42c8753468@redhat.com>

On Mon, Jul 06, 2026 at 02:06:42PM +0200, Albert Esteve wrote:
> Currently, test_dmem relies on the dmem_selftest helper module
> and a VM setup that may not have the helper preinstalled.
> This makes automated coverage of dmem charge paths harder in
> virtme-based runs.
> 
> Add tools/testing/selftests/cgroup/vmtest-dmem.sh to provide a
> repeatable VM workflow for dmem tests. The script uses vng --exec
> to run the test directly inside a virtme-ng guest with minimal
> setup.
> 
> The script boots a virtme-ng guest, validates dmem controller
> availability, ensures the dmem helper path is present, and runs
> tools/testing/selftests/cgroup/test_dmem. If the helper is not
> available as a loaded module, it attempts module build/load for
> the running guest kernel before executing the test binary.
> 
> The runner also supports interactive shell mode (-s) and reuses
> the verbosity and KTAP exit-code conventions used by other vmtest
> scripts, so it integrates with existing kselftest workflows.
> 
> vmtest-dmem.sh is placed in TEST_FILES rather than TEST_PROGS so
> it is installed alongside the test suite but not invoked
> automatically by run_kselftest.sh. It requires a VM-capable host
> and is intended to be run manually.
> 
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

Reviewed-by: Eric Chanudet <echanude@redhat.com>

-- 
Eric Chanudet

