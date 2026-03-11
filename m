Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5033B7775
	for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218992; cv=pass; b=CIZCe6jSUMXVWUvTpJ5ydsgU7nqWFvgGJiDkMMNSa9Hm+I/fvLYTMZpTdZgCKAlvnjXrhoCltbhLJnor3J379h9+nVYSQqloQmY+UuGYqhar62LHh0Xe+zxk5JQBsDqHjBCkpwe6dAhsskGDs2kZUOP8t60zoLypHD6HPd8+aVg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218992; c=relaxed/simple;
	bh=Qo7WbD1QbdNemF38QHPtSbMk0ng5osXjI0DVE3wZsWQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=CSwyWZ5MNhYkZubp8QHH/yIG9crLbYOE2jMcTLln+3pnT/jXQJvV1kWCcIps1mxbq/hGBOfBrMdDr4SmGKQR0zvImXKiaaUr2pyskh9HJxCuRfalYMjGJLXh7HkMW3ksx54ePkL6l+NEDX4yVGPkMvhVzftdx3CU+0EHiSN8u/0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WxZtBfmn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Jx1JxbEt; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WxZtBfmn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Jx1JxbEt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773218985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=Qo7WbD1QbdNemF38QHPtSbMk0ng5osXjI0DVE3wZsWQ=;
	b=WxZtBfmnJf6oXUj9VnlnNZ64RVE4upyHGYOxpWap+eyL8hpRzPN/f42ryW+zFLFtDkbGQw
	hOYv6BIPZXevEbiq7Clap9WXEAclI74ZWdXAaE9I5LAxvVfZ8Lh9RGuVXh9D/g2iPWArxP
	NG27aOChB7hjyhB9tllFZTkn/HzXb/k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-4Tst8tWXNbuh38aDIUni-g-1; Wed, 11 Mar 2026 04:49:44 -0400
X-MC-Unique: 4Tst8tWXNbuh38aDIUni-g-1
X-Mimecast-MFC-AGG-ID: 4Tst8tWXNbuh38aDIUni-g_1773218983
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b9415f0c4e9so606948866b.0
        for <linux-kselftest@vger.kernel.org>; Wed, 11 Mar 2026 01:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773218983; cv=none;
        d=google.com; s=arc-20240605;
        b=FAECTTG6ay0U5C/ygeeeeKbSB3vTgoAw6kXZWJXMAKhUrjuVyfsIwt1Az5wkG0mJiX
         5vVaymEIFB+KtAPEtnF8YhUnCJygOrR5CbrDsj0r1spgkK8ogHU9vN76RCKInDpYfPdS
         x/Ub6CEixIRIiZBlkpxr+bQcEG+gn4zW2sGBDKrlFNR0ti1v39HFbbbJd0YCbFev6QAv
         /1frnltw1yY0RpVq5eWD9+lpAG+SYa5WMEGgpALrGlOp4oSMZw5JaQXeGjlKA8oF0x0M
         sRcRlJPq8dQYWTfyTxgEWP+ztUgR42O4iqgWgcoJ15kLIz4X3b8qzL4UtQm2uv8zKtuC
         MRPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Qo7WbD1QbdNemF38QHPtSbMk0ng5osXjI0DVE3wZsWQ=;
        fh=q59Ie/wbpu7AIwSY4Vr7nCnOgt9uJ2ba+wwW01J2eFI=;
        b=aeyxEO8x6kHMORnuSsXdmY0n/SJm1tACMO6gAPQyEL+833AUhQgdO1yEcP99iMQn09
         oUa0r/yNOgwZrN9lRmg1HB813QO4QpTMbClupZAdypcDSslly+SxLum/cW5s8RNfLBQh
         E72X3NzqkmxE9av4Xhu8xf7JE7WufcX/Sc2e+2TWK4AcYfHtbe9Chc78KC3iCHcxnw7L
         0RrLgaaHRKyhukYyqznX80wA9exRNZTeQNTh6j553jwyJ0qbXQUeLHBVPNxDfs+ftcZX
         L5HFuht1zQgZiT+YzNL8Er4taWrwS8WPqqeJ/Jg0D5BYiK6dhv69FgiyCApLzmGJt1RN
         /QPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773218983; x=1773823783; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qo7WbD1QbdNemF38QHPtSbMk0ng5osXjI0DVE3wZsWQ=;
        b=Jx1JxbEtayeQTehXEH54bsK86pZWqev2rU6um8eTOAbSz0uoimGasPOOKgei3F24+w
         s/fc5eiYlcpES34v8cZJxLlt1F7TOpndwd/aeOBoF4pSdXBfWlb7Tohqbc7yKqzVy2uZ
         2EUnkQv32lzW01TCIPgX39FlOP8uQIis/VBFk5aDQcLox0L/AX8+iris6JtkWX/YNWvr
         Fv1weR8ZPVfbIaUZy7/rUNuoVT95Cgls1nUcAOV9GAJvqYGofov47b75oEDDbtxghGhb
         vmFZWN6LL2XdsqguKVbUVmhukAqXcQr+VNttA7y2VekSkyV3OMvjK7pRpizUr6Dv7WiN
         CTbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218983; x=1773823783;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo7WbD1QbdNemF38QHPtSbMk0ng5osXjI0DVE3wZsWQ=;
        b=f6FH/Qa6bo3MILSqjXLG5q/QNRFnbGdhN6g+4RfdX4ZPxKPLNLQV0OkrL848VUhhvq
         0IjQTOJzDr+0Exf0J2mCbvEntFP96yHTr8/3SxcOB06TPNsX59dydz18JWzPWk8feW0y
         giSGAZe+EqypM/FXrAZ8rTMr3V7GSWun8YoMqeeTdA4mJHMItDvv06tDLmPybRJqCPO8
         btu86/8Sjk9QxotyuM8QOgeVi/UAE9GQGwEPXwbnyhhKCh/GcuxNXG5aS4xpWFqVWgnv
         eVmorn0S3R1pSDST4ehXTsgadpmP+1jGJpecVADBwFlhtEB8v1SPqrD0KBY5dGQ2IgDF
         X9bg==
X-Forwarded-Encrypted: i=1; AJvYcCVS8ckr2CDnewRJPEW4XCmXVW9EZ5jQ1nuzFFH8lRoElJLo9/A6S8RDA7EHbDZWN6X1Uk43uTixdBOiNkWbOUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3MtJpgEJ89OhPAoI9kB5z34BPmwFpDezvZZFKhD4gUgy5Ns0
	lSTNWapTjpGqQgsNJhHVwOSU7pr/X/R+M01ZbCX0ASTybLVY2xz+URXZqXiPk5IAZVksXnNXOqk
	4V7Wbcey70ojmRZIpL0GMX8AhiJzLQle4uNN3eaYXI0XVhLVAV2E8LpONHETazpNBm2TXkPWtRO
	mE+yUD+UPWtaiF0kPtnEjuFhZkgsw838t7nbZ0IrdS2+6b
X-Gm-Gg: ATEYQzyoBaMY7YP4CUBLnYwc3uahrlGqHU8AfcKHKjbwsudpWx8nb/89SyynClAW5xl
	zpdTKijB2yLyI8F96tOw4q1DMv+nx3+qXsbxnvF7r1GCJdVKELe+6nhXGNr1+wHbSZ6kpAJaYsx
	/Wk4rhi8m9YHPyzL+E6k8lXWzbbtMoThZLNzCULwisQdCJ4DrqTjxAshNcDjbaKm/gerjZjfk5u
	n1JIoU=
X-Received: by 2002:a17:907:1b13:b0:b88:5bbc:3658 with SMTP id a640c23a62f3a-b972e5a2d9amr90240866b.52.1773218982706;
        Wed, 11 Mar 2026 01:49:42 -0700 (PDT)
X-Received: by 2002:a17:907:1b13:b0:b88:5bbc:3658 with SMTP id
 a640c23a62f3a-b972e5a2d9amr90238966b.52.1773218982184; Wed, 11 Mar 2026
 01:49:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lucas Liu <hongzliu@redhat.com>
Date: Wed, 11 Mar 2026 16:49:31 +0800
X-Gm-Features: AaiRm50MpBmDYcuIM3Ue2rspwscP1maHNKx8QhP8fX5PDlXRPos8qDnvink7D2o
Message-ID: <CAEnjF8FxM2CGgGC0R42R7R4=udHMtkwV9bCVcw7NDq7KTZMLkg@mail.gmail.com>
Subject: [ISSUE] cgroup: test_percpu_basic fails on PREEMPT_RT due to lazy
 percpu stat flushing
To: cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi recently I met this issue
 ./test_kmem
ok 1 test_kmem_basic
ok 2 test_kmem_memcg_deletion
ok 3 test_kmem_proc_kpagecgroup
ok 4 test_kmem_kernel_stacks
ok 5 test_kmem_dead_cgroups
memory.current 24514560
percpu 15280000
not ok 6 test_percpu_basic

In this test the memory.current 24514560, percpu 15280000, Diff ~9.2MB.

#define MAX_VMSTAT_ERROR (4096 * 64 * get_nprocs())

in this part (8cpus) MAX_VMSTAT_ERROR is 4M memory. On the RT kernel,
the labs(current - percpu) is 9.2M, that is the root cause for this
failure. I am not sure what value is suitable for this case(2M per cpu
maybe?)

