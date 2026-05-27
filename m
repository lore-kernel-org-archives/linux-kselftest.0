Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E88C47B42C
	for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 18:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779905681; cv=none; b=nBfdmtVgT7oC2l7GNRlAvQVkNSJrgJk8o/nF1yUUbk5jDBxcVtSBhzJse58MJMWuPUveokZmOdvobU1Qn4X0MPrjdxEYwE558kesFvqJ8GHcZkCDsS1l8OIVTAXWmWC1gg4X5j9hD8ialBVw9GmCgcVLw9TDlCLIlqUjAAru3N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779905681; c=relaxed/simple;
	bh=rLnY/r9Ruahq6JSCM4QZVx42p/ohIgGGx2zoK296gjk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W6Sgl5tfes1RBS/9AS8JxUiu1ejidOkmjyhD/JGRjhbfmEiswvThAPvqtvy6zNDCW0wdHGJsTvkg/7zEG81egbvf9z9IAFgBybowmSdl2auslq2fga17SQVFtD9s0NhkR1w/cM2SaOxh4QRdWNw5AqgQzninRWtqcIGWlR1ulMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O2pSL1pv; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O2pSL1pv"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c82bd90afbbso6121026a12.0
        for <linux-kselftest@vger.kernel.org>; Wed, 27 May 2026 11:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779905678; x=1780510478; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ae0JUYZnH6PDq++BeF1nOUuxoe4YC/dX1lDQosSPY5o=;
        b=O2pSL1pvDX8thkRVNHwtx6tiCGHu46WFdXGzHz5pYVytNpdFmXhhiMNldwVvJV3QGp
         AL5BIifeaTuu+oJ5+uHRAp2i1gvfBnlMSpBT1Tcuf/bz4kKcDxohNgjzGIoxOLQCgMsR
         zC5d1HAH7/W6GHWfCQFWejWhVTgIdIA+L5uaHV3HAdLzB2pDG8BmIscKRk7yJ50Xu/kw
         oE82qcnpdXsNA9ZrwQbQ2z40JxvaQKvVBdH6Y4k+DQXj88nDzhq4oVrbMTyqWT6S0BmE
         /oWHnCN0eQuMl9uoZbDgyfGW7Enko+zfzo7KahgXcvVMBbDJdwet2ZqA6jINjDdoz/CG
         a0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779905678; x=1780510478;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ae0JUYZnH6PDq++BeF1nOUuxoe4YC/dX1lDQosSPY5o=;
        b=FJtTMkksryEdWhR46ytFlGYNz9Rm+xBGwSbDpmEpW5FF3QgrMuGnVlAMO2g75GN4s/
         hVu+ChcaDVgNroaAhmGLV5r8JSaDSSVoII4DzCOOFygfolCmKr2KB6h+k2R50e1Xz+5C
         sKLRLgF2SaHDePR6PPZECoXRe2uRQ/TZSDBZbY8EuNwm4eXqim9EHX1Kv2WE8hbVTc9C
         IdNkxp0OpFLs6apMd9C0nlROM+S963Zg8EXn520QK9Ee7SLRhaX4Z80euFlj7d55dm+w
         /kI1J5Db4axTSkOPfyVcUFzhyGcZw81vfaa++W1YO2I4lLYuWmb7FEZdhdU7FcZU8cg1
         x9BA==
X-Forwarded-Encrypted: i=1; AFNElJ+s6Ys3C+COLYR6Zg+70QDtjyO4lda0JiSD6QnZRXk6CbY/YGaitKDXxq+ezPuxGLBxeaOfxZQRwemokg4bEfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW+lSB0JGjXt9XW1QkoavXeqoz5E1WpnNRRdQtJfYE8UyMpRM
	2PiwLeRFDhMrQIEgJLDUNUwC4ZvIxRpCOQyPRyK5ybwDFZble7Mh2cEeH51XOFQyP2P2H5aICzj
	agyRZDg==
X-Received: from pfbey25.prod.google.com ([2002:a05:6a00:38d9:b0:82f:4183:2832])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9084:b0:83e:b443:965e
 with SMTP id d2e1a72fcca58-8415f2dd96amr22258784b3a.3.1779905677512; Wed, 27
 May 2026 11:14:37 -0700 (PDT)
Date: Wed, 27 May 2026 11:10:14 -0700
In-Reply-To: <20260523111857.195396-1-piotr.zarycki@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260523111857.195396-1-piotr.zarycki@gmail.com>
X-Mailer: git-send-email 2.54.0.794.g4f17f83d09-goog
Message-ID: <177990517478.4120439.17004463221573645730.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftests: hyperv_features: test write of 1 to HV_X64_MSR_RESET
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, 
	Piotr Zarycki <piotr.zarycki@gmail.com>
Cc: vkuznets@redhat.com, shuah@kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sat, 23 May 2026 13:18:57 +0200, Piotr Zarycki wrote:
> Writing 1 to HV_X64_MSR_RESET triggers a real vCPU reset; the test
> was writing 0 because the host loop was not prepared to handle the
> resulting KVM_EXIT_SYSTEM_EVENT. Add the missing handling and write
> 1 to actually exercise the reset path.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: hyperv_features: test write of 1 to HV_X64_MSR_RESET
      https://github.com/kvm-x86/linux/commit/5bd0387e3b56

--
https://github.com/kvm-x86/linux/tree/next
