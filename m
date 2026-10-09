Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738A03B582F
	for <linux-kselftest@vger.kernel.org>; Fri,  9 Oct 2026 14:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791556670; cv=none; b=A+wdvso5yLQ7B6mQRjlpcbn+MfKJEUyqN80DYVQi3QlMOnSMbiqLGOjNcWDn1BuF2NEyJuxLgJUHZgNEJ4uX4SF38LnpED06w2aIF3s6rWRJLXCcIvfqXn9ac4OdHAqPqKGKNzi0CQYFjDji/0kLzOLctt2H2QrIFK6qewkRf5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791556670; c=relaxed/simple;
	bh=p1F8safINLCSBZ9wkY6CcuBdKpiRtmwSdSx4OkzmuDc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GuG3CdBTfdyPHD8NDj0xMaRMl8uskU1Xjua180vTZ20GkYNlgmA6Ls10JVw0K485+etDINdIqfBSbf8o/3klt/4yIs6Zw+Ch8gCOjjalBJoOp0y2O1xfcGCiOhsF8FcmDShG69xpM6SCUk1YWcd1Tb8Shb0OQu2QS8Hm+mXKp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=osYILKjJ; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="osYILKjJ"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-14394530ec6so4354686c88.1
        for <linux-kselftest@vger.kernel.org>; Fri, 09 Oct 2026 07:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791556668; x=1792161468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9da5zk0GHj2rwz2lfan29dlM/wk/e0PgyHn2IrcmKk=;
        b=osYILKjJnqtc0TkJ88vYBKZzNr9hTIkvA63C9nZnyMdxiK+zfxashWq0tcUZvasZKY
         kuISinulQXkq+rOjFEk4POY3fAN4MeRQf4ek0ERdJPlbJQepFBlq5nBVd1xYXFW481Mc
         BcNKx0VnuDOWSxjdPJtd64Ggo6eBSwJ28g8JPzny6x9rkuCMF9g0F26QjTlk1VSILKgC
         DxJ1kQ3+9P4f7vlLVYvw3aG15OBhuC4Iovyn7LteW4NZgr1rMW+6Mpm1odD0hI6vAVeo
         0Rc9ZRlFe4PMQbrVNCkIoknQfZyusGKvLRhwZqDMXoUvfxBvTuazkMC+UHc7hHsPWtTy
         dIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556668; x=1792161468;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9da5zk0GHj2rwz2lfan29dlM/wk/e0PgyHn2IrcmKk=;
        b=vrJjJ48evHiKMaVzr4u4syKcl81Dcq++IB/paRLCr900luVxA5wZrDYJeq5IXwuEzX
         bip+3Xm7MZQXK9cgsZ4uadVlB+G1652WQ8HuDJBYv6kno3Q16ns3DvliYzIiVwmPPDsI
         2b/RC0HHABlmko8ZGrmABVYXvBFLDQ6hDdPUd0sPSSF+p+wZPIGgBoguUHkg7fPKZbgK
         On/en+ZARSHMYZKYOHj1nkrP0SpNJXyADAASOd21f4Qh5WdnuqpdgeCgKzBlwHQFKIbA
         hMIhWCLOTNGBk7yoV9uyBTjsGBsb6LZBLieocoJME8V7yAU3KVzRxRtE/rLdpe9B/e01
         CmlA==
X-Forwarded-Encrypted: i=1; AKwUvBw1KSs/eYmtMwLI2+q2QCXKQssLJLncgLWgh+pMHuwDKYM/VKYcU47d24xhonQfwv4ankNLQRIhgKzr2qQqZgk=@vger.kernel.org
X-Gm-Message-State: AFuF++mSMKojYCkHYt3tRrhn/rHG7sLk6H61NITsCOm0Mhws8J6dE5TU
	7wdnI+l5nkDFOFbChtQzcyxcRwFSqstXiGl4/DdfjEStDB9ETo3nDA3U48IJID1OvKw=
X-Gm-Gg: AYBFou1P10zi7tySPAJOUJ3RQgAu6kYj5qXVyuPZmiX/2HzNbMGTJFJh/PMej9pUfhL
	oTtZ8ngKJRQeJkSOWUaxTB7ynRRoQzgdOLC0nsdjDFCIF2IL8VlpkVpYPyKiXw6v4s9VLKwGXUt
	RPFqYutwuqadUi8tU2/LrdXqJ/Lm8WPy7OHJC6sBthi0ObMOBTJvSs8ADvyDmIJMwI/i//maWvd
	3JeBvZyZLXa1I+nnmudstMBE6jbbSezlS4m+fC13uaUXpXKW/YAgbKgXFva02UZea3+aTNpAn6A
	h4idgphY5HR00VOuC0dFDcuv0r4hVCy+5R8DM9pvE/zxnT09QBEr6COqKFQ9iMShO2p/URxa97T
	lYYOfU3J1i9cgyjdPNK17FzpVq4M8OZ6lesIY0608HP+uCMd2F/CyktwrrkRWXrW0zX8oORNCuv
	9vq9Ra31O7j4osJxouhGxjJi6+XTBHsDPiDYmZiKfqgdxfFKl9A5O8/WH6PMdTsgaepA/l+3qVZ
	Edfc4oTMUivv5eI5axFYbSXe2BfFOJhDphi7kGmj1SVwvSOhGOpr409jBIuZ6W55yGPXYtTWdwH
	NitOztE+Vw==
X-Received: by 2002:a05:7022:7f10:b0:143:3c9f:10a6 with SMTP id a92af1059eb24-16a57734472mr2827175c88.4.1791556668232;
        Fri, 09 Oct 2026 07:37:48 -0700 (PDT)
Received: from xps16.local ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2d2db98sm6603150c88.10.2026.10.09.07.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 07:37:46 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, Shuah Khan <shuah@kernel.org>, 
 Uday Shankar <ushankar@purestorage.com>, Qiliang Yuan <odys.yuan@gmail.com>
Cc: Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
References: <20261008-bug-ublk-selftest-fault-inject-delay-v1-0-a96af7ead06e@gmail.com>
Subject: Re: [PATCH 0/2] selftests: ublk: fix the fault_inject delay
Message-Id: <179155666606.221695.3172868322177231667.b4-ty@b4>
Date: Fri, 09 Oct 2026 08:37:46 -0600
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 08 Oct 2026 22:45:38 +0800, Qiliang Yuan wrote:
> The delay set by --delay_us on the fault_inject target is lost in two
> ways. Its timespec is read after it has gone out of scope, which makes
> generic_06 fail, and any other completion on the ring ends it early when
> more than one I/O is in flight. Patch 1 keeps the timespec alive until
> the SQE is submitted, and patch 2 makes the delay a pure timeout.
> 
> With both patches, a 1 s delay holds every I/O for 1.000 s at queue
> depth 4.
> 
> [...]

Applied, thanks!

[1/2] selftests: ublk: don't keep the fault_inject timespec on the stack
      commit: 955cba87d9ed334fbe0b669b35b4abcddd7f9929
[2/2] selftests: ublk: make the fault_inject delay a pure timeout
      commit: 69ae59173a5668d015ab2733c8628ed542f00ccc

Best regards,
-- 
Jens Axboe



