Received: from mail-qv2-f8.google.com (mail-qv2-f8.google.com [74.125.230.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3AD550DB2
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967421; cv=pass; b=mdQjz/rzOXSdNtxn945oy3QYGEd2s0rPO9FzpJSWX+O8uK8SMcwqrd1bLXQOwGd3DoXkbyHn/aR2o+8RY/MPP2Bsa5wHxpY4lv22RqL1lSpJKay37MN4hRVzIxkO1wjLVAsrlmFEch+BA4PJ/jywQWzthUJaAJ6JAUXOctV5CEg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967421; c=relaxed/simple;
	bh=SA7Td8hb85CBy8oraWrnruNca4awi7kqVSAb++Vl8NQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bj0YJH3bi1r7XKFMEbf+LeYzwGCY5IgK7F+QWeGB07XdRWS6LN69axvjtS0PPtX6lABnz5u+RximzfiipUM8vwras/Lkx8Tx6WG9goNjv/VsTXY28mmlG0DY/4+SR063BVjxpPkQC/mU9GqTNVlZxA0TMJZuSWTw/XXrh8/B34c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjmMQURa; arc=pass smtp.client-ip=74.125.230.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjmMQURa"
Received: by mail-qv2-f8.google.com with SMTP id 6a1803df08f44-91071ef28ebso670586d6.0
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967419; cv=none;
        d=google.com; s=arc-20260327;
        b=hqDbYWZGrh9z6IxbNm4sB3MAkTDm/+KZwOg7QodeIYGZLZ1EGfS2ZUojTLKEVLBeEN
         TRf0CHfuh1Igb/7Xzt7RcHO5qo/ipoQjQ4HFbFONCZshAbd4mvSSTPLQ9md5FRNqelx3
         AEJjbO8HviLGj9n525Pp1WqpgwtH5outZX94vD6b4+qvNvtUXnV1Gm6QkRe0S05m6jnK
         +y0oIfJvlqz60KMTAP9gvvcN14iFPY6avyCTSzS8GMEpSZjCOGXIA+Vi8FyGrycG61gg
         hAqobDAXWuRgHTqLvstjpuc+Ai1n8HwB1Wh7491gaTO56hKWv5nr4fLMkxBOHVYYv2e1
         feKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        fh=zVCmOYdVheq2cvA78x9jlQp96glTQc5UqLd3q1LZpck=;
        b=oTq9CjH/oa5TSBpDuBZFlh5g7JV9TiEC7oYfoDZarJfX3Cw/FORKsP8LmHqSWENW3r
         X6LJoSJ4DtOlgOBdjYtAupWZj64tk1ZvGEhBKjZFtEvRh12BXGNY1SAawBC9JlUX8+4r
         8HgkYDVxK4V7EoRyni9PbOzjEnDF6N5gbadAyyI6D5k8s/4h4YZyNURax+K8ldBov6GA
         J/8rztuU31zv6atevHwbw3yf+eb4xG6gh2In+539E/gozGLpFbRPCJ4EFt1WMYp07RHD
         mHlu/VaS10AmOOQTQSFjzrYeMcjFeeH3SWTal81BoYhKL5oOx4InSFoBFjz0s8ofSolW
         St8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967419; x=1789572219; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        b=KjmMQURaBLdIXkU6eMbqlqE6ZhoI092ewwf0QRO9UNzaGu9NIqO0edyXm+s8exGNZ1
         I3Z3HNhondVcGQSYhz1ifBSsNus+dOi8T7u24tKp+MBWzDRTnsUZWL1eJh39ZSgWjBph
         o3lEZyZu2PzikwWd36U1t1iiBS4RB3vWPKJFFqbkWdtVrdEhCfWfSW5hV7YJgaj6Rat0
         z94B6DIo1d9Dwb9c4P55mjOuQN3zyKiXilyuJO6awkqRpqCwobkh8XMz35qQsX0/6FqV
         xTSUulUvajXrzqOpXnz/jW50i5DEMozkgZbW4THA9tRd1DcAOhkPhSaTH2XkNwKeNBr2
         JjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967419; x=1789572219;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a49SZDeZdDlL0wb0CKipnoebXvB1XQTCDMiFWh6kHAw=;
        b=IOMBZNsS5/g7Ympat7J7a1V83ctblpSHZDQ/GO6mV0uMI8SdQwVbNj3dx4pTwQz3Qu
         uOzM8N1KxKQzZNCoEAiaJnYb/gkvhng2np6yLzYoMlYUpHtfsRsODwdT+uro2B1a3l3l
         f36sIQYLwJAnJd3TVwQejqMcIadQwr20tQBgct6RsjzN1HvmFGasQ0IO/XgiMgHbHEf+
         0sPic6UPtiDghMgePc/Pu7ADhFUuweQDOU03x3OAgejv9sIrADzBJzi+fA7eNxTuCcTm
         x7iOEzgKUfoJ8AiFVDCmB7Z4YD6GW2O9jb0Vb01MANrBsdJl5nyz8rScz0A/LV5hx+wv
         0jlQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUKMrqHqLaTR/MGyhw6DpRFTFpQVE4mc7EWyo2q2TsGb0O7+vX1mvP8/UrsPPDmuYq92yK7a9jdGfGtJIZ6Os=@vger.kernel.org
X-Gm-Message-State: AFuF++nb/wR6j9RWK/xPKTV9pWCqbrWYOaBKZby/iPcwP4WuFRdxH5Ub
	LJlCQHOvs/BR5eZ3dQV+zVOK5u14vjvTOPYhF/zsmf1BVRrSKf2pB4Bf7yUWwwSfxyLnjMdJ6/X
	EsKlkh6qnaHAtH93p4BoPKVaj/AlxnLw=
X-Gm-Gg: AYBFou2jFqQCmRxYypxwrYZ2hNin8bfvnEneaubq3Lwo/3IB2igAhPhMP07/6u32NKr
	T4rQwfqNapyPufFXpytlaj9DuVoj0kgMPHCoHzkw0pQ1L3K0QUnjZ+dcLeqHJxGn1FD9QZeK25+
	ii3+08F2rzAfp9XDf2C46HKi9DoDxcAk8AXENLlJhW2v8V6h4T3hysrRalW+hhzmpn60glfw/6b
	4km6/iRf4oREPqI/RVUCf4/+0B6G2nbIDzZqEjd4P8gFaQZHU1zDn9muh/gDou/emv21M+/CxQw
	1OCpizThM6xz+PQv5aeT3Ds2qXfB0/cScWxe8ylhiOu3vZ3kvfk/fg==
X-Received: by 2002:a05:6214:8099:b0:911:2a7e:abbb with SMTP id
 6a1803df08f44-9112a7eabedmr11006266d6.14.1788967418682; Wed, 09 Sep 2026
 08:23:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:37 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
Date: Wed, 9 Sep 2026 08:23:37 -0700
X-Gm-Features: AcwNN1VV4AKxkj7aCdqQGI55bwKoeCFok0WoknLMsCk-ys-8GZWamlq1JVGaXEo
Message-ID: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Subject: [PATCH RESEND v3 0/2] selftests/mm: Validate selections and scope
 memfd_secret setup
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: text/plain; charset="UTF-8"

run_vmtests.sh can reach test setup after invalid options or category
selections. Its memfd_secret preparation can also change ptrace_scope
when that category was not selected.

Patch 1 rejects invalid selections before setup. Patch 2 gates
memfd_secret preparation on category selection and executable presence.

This replaces my earlier Gmail resend, whose outbound delivery wrapped
long lines and damaged patch whitespace. Thanks to David for reporting it.
The patches are unchanged and are attached as text/plain to preserve
their contents. I switched to Gmail because my previous address had
delivery problems.

Both patches remain based on mm-unstable b02c77c78ff7. The parser checks
and focused VM selection tests reported in the previous posting passed;
there are no code changes in this resend.

Changes in v3:
- Initialize VM_SELFTEST_ITEMS to "default" before getopts, as David
  suggested. Only -t changes the selection.
- Use Assisted-by: LLM in both patches.
- Carry David's Acked-by on patch 2, unchanged from v2.

Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected
