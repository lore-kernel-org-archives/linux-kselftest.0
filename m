Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE2B3815E7
	for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 21:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769896610; cv=none; b=lXNWI0HT1QOfZqZdXFq4G54VOfB/OqFLEXq0HHw3sedIny9SMj6swgujl4pq2qs7ENjztFuhOWYdQdAmKc3zAT15GXbPC+bwLh+iA0iIbisreOgaE2HyUpLbMowpCpuI4NLWDHuvLOLZ4PK8NAh4iJxBjG1nhk86juTogdF1qU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769896610; c=relaxed/simple;
	bh=Cnde7RT7deu0GiX3Nv+i2rIR0zxPjjjarC87IOuNe0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NDEHnB6EVq9TDq4lHw1JrEVwpcNT0un3wVReHBW/4hJqd4NDQd/rvJqz/C8ld/dnZGC+AYa0e3+kJPJLT2RoC64xY5AIDX4f/yuyQ3k+9gRSq2zzoWG1SAfJyB7EO6+3KAjyUFXK4th+tW+F5Eayot58pVvPwORA+0sPcNxdqCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=WhpXkmBF; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="WhpXkmBF"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45f053b7b90so2163072b6e.0
        for <linux-kselftest@vger.kernel.org>; Sat, 31 Jan 2026 13:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1769896607; x=1770501407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptL9k6O4m1hRyeAjWpsh/OFfaDo41W1gBK3nnyvFljY=;
        b=WhpXkmBFNtPj4If20hHz+EjGW8/yhZMhyxvdUwycg49ITVvG6gQprGqZK2gUos08iw
         68uy2wTeGi6n33pdjBcnazkKfa+QvN2SSxhOMBPrxx6HFYvGC8uZwbMA7UTN15QfNJA5
         5qny6HIwB5ixPyhd9vGCsIvtVkTqb+9c55chzlMCf3rIdM2VD1IjZ7JjtIgEaPj3rgYK
         9vkDhXq2jI3Uiru97DMSWOLBZm5r1I9+Og82QmqngwsPgMqa/cEa4yP70RTY6aH4DRH5
         kcYHSltdvphccBAJnDDopYQHWiDUkHTgzUEGRdDdSW/HtyA/OmnlPRMXRnkafcobJ6jL
         DqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769896607; x=1770501407;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ptL9k6O4m1hRyeAjWpsh/OFfaDo41W1gBK3nnyvFljY=;
        b=rx1HXZwNH23JB2WTgFokLXy/To49aX31UaS2oZHz25T0tzPsNXyJCxpziqnQO8ojFG
         sdmOCae8x3fzpKs9R26CdieBf3nXZUc3kEH8hqy0DwkcAZzEIyU2ygIntWRm6t0PpvuJ
         db959sO1WjdYabF7GH7n1ChL5DUMJx81oFQxQIsk/RyK4JezEKMkwBtE6Ag2JFqw5h2f
         InStwgvslbfy+maxauep3ngC3UR7f/mGEwOyOx8b3509/eCrm6nMP/nHdmOR78eZIog8
         EirfK8YUeRc3dQiLXRbSKxIo13Ar25VVbp3gLyQQpgCqwTmkiJYynTN8ELjdfhBCrfCP
         mO9g==
X-Forwarded-Encrypted: i=1; AJvYcCX9OlnjHQBlFuFqxFW1HKUcs0N/kmYx8IYPhqZNwGRQ3KGkeaEApoehbsGyOYDT3ab/GVFjDzU86HdRIfX/LNQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycEjJNbzZNX8SEOnWzUdJE4YeTQHxK4nXwUljFPChNtrfrz0SX
	zFHa1KrW3D/BuSQmFGhK+UiwRcrV9I08ZbXsWf5AH64RbfeVvJ4FYTU0BjtDoiaWPTY=
X-Gm-Gg: AZuq6aLXZH0pyD7ERUUKCd2tPML0YTrOt9JZi+EVx0GuDkysLBKaMEHV5CgD4RLPgiQ
	w++2hUzcToTZVky9U9s+GD1bTlIZY0r9bTqxUXdo9dp4bnJrHWX0/RVLsySQ2YHRGecxdZifSA6
	Xc8CKgbtk1mxzdFJTm+jO3VWiZYqJjiKXqrrD8aIJGI3YwzuRtH+e0n5jgoCgbHGjt52WL7R6I7
	LYGudgt8OqMZPhmJA38tadivkCWGOOn+gFSnY6SAuZw3bRrIVZzrf0eJLCIlEbvsYegHQFLmiTG
	BqSruPWeZmCquwGYRm3yQtz5CJLBZuFcyDOq3ktbHpXgK0DF7Efhvo+w2k41jebCRUiK0qPO09g
	dBAZZCYprhVDDTmNqwALQ4+flJBSxU1pzWrFCnLEpeKG4bg+wU5hjzQUarNzIzXBaFai46vLut6
	gav9BBrc+SWj/CTuzCQY3qeFbrPlrUbkW5k5puZLxCLA3Am6jYIVex7F8/+03eW4ad
X-Received: by 2002:a05:6808:15a6:b0:45e:6560:9be7 with SMTP id 5614622812f47-45f34c17011mr3543667b6e.30.1769896607013;
        Sat, 31 Jan 2026 13:56:47 -0800 (PST)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40980497603sm6590116fac.21.2026.01.31.13.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 13:56:46 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Ming Lei <ming.lei@redhat.com>
Cc: Caleb Sander Mateos <csander@purestorage.com>, 
 Uday Shankar <ushankar@purestorage.com>, 
 Alexander Atanasov <alex@zazolabs.com>, linux-kselftest@vger.kernel.org, 
 Shuah Khan <shuah@kernel.org>
In-Reply-To: <20260131162342.13872-1-ming.lei@redhat.com>
References: <20260131162342.13872-1-ming.lei@redhat.com>
Subject: Re: [PATCH 0/9] selftests: ublk: test infrastructure improvements
Message-Id: <176989660568.986261.3271100183902901255.b4-ty@kernel.dk>
Date: Sat, 31 Jan 2026 14:56:45 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 01 Feb 2026 00:23:31 +0800, Ming Lei wrote:
> This series improves the ublk selftests infrastructure with better
> organization and parallel test execution support.
> 
> Key improvements:
> 
> 1. Infrastructure enhancements:
>    - Add helper functions for device cleanup and parallel execution
>    - Implement group-based test targets for running test subsets
>    - Track created devices for proper per-test cleanup
>    - Increase timeouts to accommodate parallel test execution
>    - Test time can be reduced to 1/3 with parallel execution by passing JOBS=8
> 
> [...]

Applied, thanks!

[1/9] selftests: ublk: simplify UBLK_TEST_DIR handling
      commit: 5af302a15a1d628a025a78892001fe8afea90c60
[2/9] selftests: ublk: refactor test_loop_08 into separate functions
      commit: 842b6520e579b8bd7d6ea09937e1fb7729cce1c5
[3/9] selftests: ublk: add _ublk_del_dev helper function
      commit: 92734a4f3a7a5449b0c7d0160ba658a2b665c31b
[4/9] selftests: ublk: track created devices for per-test cleanup
      commit: 2021e6109de3e97adfce262c40a657ff206ef495
[5/9] selftests: ublk: add group-based test targets
      commit: b6bbc3bec19efd557f888d78865b627b80b37a32
[6/9] selftests: ublk: add _ublk_sleep helper for parallel execution
      commit: 64406dd2f69fe27921c7bf06088871c002cf6186
[7/9] selftests: ublk: increase timeouts for parallel test execution
      commit: 56a08b87f9f2a763cb5546f83b78ebe1e96260af
[8/9] selftests: ublk: reorganize tests into integrity and recover groups
      commit: d9a36ab302b1c90d8f03a3b13538b8676eb6ed3b
[9/9] selftests: ublk: improve I/O ordering test with bpftrace
      commit: 5314d25afbc44d0449fa2519d2c9d7f3c319f74c

Best regards,
-- 
Jens Axboe



