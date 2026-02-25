Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEBF3A7827
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772024812; cv=none; b=NCgWjSoQm+vt/fXecaKNo7ehsz9VFA0ZM2rt2hC0a9kvUUQoDki4Nk4PQajKAa9K75o1E7m8xh4O741r0viZj0PTW7UrnkGezak+gIJ9mpzom9D3pmoawJkUrQlo/2G5P4aTrIvjdXultmvspdAzspFaepvcRJ5XKR2zJdWWM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772024812; c=relaxed/simple;
	bh=P1KUZVcv71vqEO+U/iRcLVykTw0aayw2sEqdbMiSuHM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ob8PE1KmIrhjp5mWJBRrTXCAxW3Ja6or/D9ypXnnkwxYk4VpaEZPBKyNwKlEn3UQaeeFUrZwMrJfZe4y10j8J7ULQ2Zsqeg9oOjaW+RdL250dQ2eI4y5JH/bhvGZ4QOvFCAZZLaQgpHf5ZY2ElLKNsXDG79mzdMyuGds9KywfMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wKbItb+S; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wKbItb+S"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43637c70876so3180047f8f.2
        for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 05:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772024809; x=1772629609; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhfcOamQNKKUszfBefT5UFzLpGObxUPREg/uXcwiU6s=;
        b=wKbItb+SASsSk2PqCVZueNG3n6FSIKjkVtqW4XIz9uy8tx4VWLjnd/X5zv1TmNc1YI
         LhKQCIgrrELkbbljqGeKMyshEI5UTCHmS8tMopW+t8gjL4g1Bl6yZ+ufem3fJmIJMh8i
         lsUbsGz3bKNodEMadIskEqTsMvDxgRM8KsXZk5HapVMj5TCuTuMCJTOzyHQAvlltcHth
         G5QvyV9iexDYS11f8vWX/YsHUXa046I0FVA/tgoG/VNsGJtoR6I9fGPXhx1dKJSLk0aC
         05FD4vqhIEwncyuBI9GpDsWL8cGWClxBpiXtE9IhNxFXAoiwcuPR82EI+dSLUFa9m/iZ
         Qo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772024809; x=1772629609;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VhfcOamQNKKUszfBefT5UFzLpGObxUPREg/uXcwiU6s=;
        b=pFY+Ssg8w2id8qaAYz4Pcg5zL1wp+Reowr87f12Kr+IzaI88ArGo4xXOvn6o3Kgbhe
         Uqk3dNcYAav9/QB//KrtnjnI0QlEkyv7MU2rk4vOwqAZ1f+HcYqANOghnNhvdD5cq7sU
         an7Y9UBwulc7RwLbqttLkxWZ5qn9IQRVkoSeoLlTeUrKPm0FmYLCrfaZ1SHsAYH/z4Yo
         BAj9QwLoa5Kz8H9AnRKJhRTqS1ZGpG/3FQgP6URgXCy3PkWCNucbLKg8V5byxurCnvUG
         x7SUd5bONxdWgj2/xcs5yFZb+rlOq+G7nV07xr7zRdcLbHzql3/ed4IfwNjC086HaWrv
         L55Q==
X-Forwarded-Encrypted: i=1; AJvYcCX43D8coUJ8j6uRib1eO5GFlb5UMQgqOw5Obb/5zEvjQHZJt9N8eVyo9NL02wkfdzGZnAlNCSyF+eJKfx7pdZo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IJWeiIL/RZzkyPT1fVdjVx/bn6eT2VWg0aBAG/r1VHgx18ek
	mScbEApbte+P4tqnlZz8973KMxZzWOZDUszTcJXbQArvQzLp5bLtrY4IaoGRfcn3WMbP5RmQ4J7
	FU7XQsZPzEKehqg==
X-Received: from wro14.prod.google.com ([2002:a05:6000:41ce:b0:436:d0e9:837c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f86:0:b0:431:808:2d58 with SMTP id ffacd0b85a97d-43994304901mr728417f8f.51.1772024808739;
 Wed, 25 Feb 2026 05:06:48 -0800 (PST)
Date: Wed, 25 Feb 2026 13:06:47 +0000
In-Reply-To: <20260225010833.11301-1-liuhangbin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260225010833.11301-1-liuhangbin@gmail.com>
X-Mailer: aerc 0.21.0
Message-ID: <DGO2DAIFY07Y.367VMZA7XGT4U@google.com>
Subject: Re: [PATCHv3] selftests: Use ktap helpers for runner.sh
From: Brendan Jackman <jackmanb@google.com>
To: Hangbin Liu <liuhangbin@gmail.com>, <linux-kselftest@vger.kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Brendan Jackman <jackmanb@google.com>, <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed Feb 25, 2026 at 1:08 AM UTC, Hangbin Liu wrote:
> Instead of manually writing ktap messages, we should use the formal
> ktap helpers in runner.sh. Brendan did some work in d9e6269e3303
> ("selftests/run_kselftest.sh: exit with error if tests fail") to make
> run_kselftest.sh exit with the correct return value. However, the output
> does not include the total results, such as how many tests passed or fail=
ed.
>
> Let=E2=80=99s convert all manually printed messages in runner.sh to use t=
he
> formal ktap helpers. Here are what I changed:
>
>   1. Move TAP header from runner.sh to run_kselftest.sh, since run_kselft=
est.sh
>      is the only caller of run_many().
>   2. In run_kselftest.sh, call run_many() in main process to count the
>      pass/fail numbers.
>   3. In run_kselftest.sh, do not generate kselftest_failures_file. Just
>      use ktap_print_totals to report the result.
>   4. In runner.sh run_one(), get the return value and use ktap helpers fo=
r
>      all pass/fail reporting. This allows counting pass/fail numbers in t=
he
>      main process.
>   5. In runner.sh run_in_netns(), also return the correct rc, so we can
>      count results during wait.
>
> After the change, the printed result looks like:
>
>   not ok 4 4 selftests: clone3: clone3_cap_checkpoint_restore # exit=3D1
>   # Totals: pass:3 fail:1 xfail:0 xpass:0 skip:0 error:0
>
>   ]# echo $?
>   1
>
> Tested-by: Brendan Jackman <jackmanb@google.com>

Thanks,

Reviewed-by: Brendan Jackman <jackmanb@google.com>
