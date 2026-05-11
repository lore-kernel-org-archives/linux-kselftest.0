Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA99344A724
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778520887; cv=none; b=eaJiVtJAWoD4wI7zFZ8uDRMGSezbX/mWoe6kpNYXORgbfrHb49K544Uhmcn99ig63GcDzjjAEaWZRjdoDTArxHaFkLz1EEYoWUwFui+SxYzc7NO2DLT93IreRI6IK+I61XPaGJtcl4br9ggNoBE34sTXRlwaZAuccdJPwmN2qig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778520887; c=relaxed/simple;
	bh=Nbe4NKmXpjo6QDgZuFnpgq1FjNWcLKrfdFTKUGYw4Ys=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=n+TBWo0WKT6xVw9ZUUsVHEFkINU7pPJx5uNK25StPODGictWfdY/1tkSLPdzm4sxpCWcmdHqf6u7GJJRq6U18z3U9H5/XT0BMRrKNzDNOlcsznZtg1iEYd5txM8nXmJ7o35/A/+oNZ12OkoBRzoxC50jIec19/QPtBlp6WiyDLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qNk+p9CP; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qNk+p9CP"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so5447245eec.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778520885; x=1779125685; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u4Kov9/dGvAf6qm0HsBF/ljzhn82MvaUJ7qqTw/jn+I=;
        b=qNk+p9CP+IRN72uv96CH8mTasDCrqdE+6IaDtRMTYxwdiU4gk0jTcq2s7M6FUCQvcA
         UkONvRqcd2UjlxhjNbMEYV8wXUXqjZWw91REeYs7AuiKAmb5nj4HXdcH+lwunCbMigK/
         ZsY1XPSmBH5wUChQE3vSu7q9Xpp0/MXCIxUOLnSfXToog19a+xl/WhFqT3vk+D6F1Smv
         u5czLwwvbY9x1ijx3niZUdyFuw8qYjr/1uvfVE6SOLVPJK3ugZDflFLG0b8kn2tS5+GN
         8vyN+hFjhIR6TNN39xOmCAg/IXWD2AJPCZwBiDBA3tmF4IE6QWim7pvtFhfBsEa3cQnV
         FQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778520885; x=1779125685;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4Kov9/dGvAf6qm0HsBF/ljzhn82MvaUJ7qqTw/jn+I=;
        b=FgTw62lknG3ctckuYyKZ83xlL3mt1lN0E3c64RFR/dD70vG++dW0PTv8Ls92SiKDTU
         Jvdn1leUbU6Ao900a7LRORJoQ6h+r6nkOP8bPHYd8CsgduoIENFNLPUivCLRAvaICY1F
         BpZcTEzH+1/BxBf9sHXdOfun3m/sfEFMZL7HKNadEC2Wz1xZiNVfteTCn4xf+35baOj3
         b6m2BGnqdaOs0BcB8T3VMkCnv0TjHoUL1gQBWR/KzdYZ/oi7XbBbalAIl1jRBBA/O2Uh
         H4S6kq0qw4ZlosHJE5s9uEZj9I8YYY1UcGthGNZ+WlaxsglPsK8pWPQpULFtXQHJxifI
         lxaw==
X-Forwarded-Encrypted: i=1; AFNElJ8FIkcKqZtdt5e57Gfe23OjMBlKZvr+C4fTeq+quAMr0C7kbWQyaS5kjBsrUUGebbp2ELk/JSgP5nDwo6uo8b4=@vger.kernel.org
X-Gm-Message-State: AOJu0YygknOL2X03M+U+rg0CKRvuzJIbHJgp+syhkJQaLiYEdDBY352E
	qBePwsPAQIhc6ajmUTF6k3A0VtzWZvDomsW44kYo97OkfChkCMe11xua92gB1b2sy/4k4Kdbh0/
	63IvQXpsvDQ==
X-Received: from dyz23.prod.google.com ([2002:a05:693c:4097:b0:2da:2525:9f3])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:3207:b0:2c5:60d0:701e
 with SMTP id 5a478bee46e88-2f85bb73083mr7323594eec.3.1778520884334; Mon, 11
 May 2026 10:34:44 -0700 (PDT)
Date: Mon, 11 May 2026 17:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511173411.267628-1-pratmal@google.com>
Subject: [PATCH v3 0/2] selftests/mm: use pattern matching in .gitignore
From: pratmal@google.com
To: akpm@linux-foundation.org, shuah@kernel.org
Cc: yosry@kernel.org, david@kernel.org, ljs@kernel.org, 
	Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

The current selftests/mm/.gitignore hardcodes each generated test binary
by name, which requires manual updates every time a new test is added.

This series switches to a pattern-matching approach (similar to KVM
selftests), ignoring everything by default and allowing specific source
extensions. To accommodate this without tracking generated headers,
local_config.h is renamed to local_config.h_gen.

Changelog since v2:
- Split the changes into two separate patches (header rename and
  .gitignore update)
- Added Suggested-by for David Hildenbrand for the header rename approach.
- Dropped David's and Yosry's Reviewed-by tags.
- Kept Lorenzo Stoakes's Reviewed-by and added Mike Rapoport's Acked-by.

Changelog since v1 (RFC):
- Renamed local_config.h to local_config.h_gen to avoid conflict with !*.h.
- Updated Makefile, check_config.sh, and affected .c files for the rename.
- Removed *.mod.c as it was unnecessary.

Pratyush Mallick (2):
  selftests/mm: use pattern matching in .gitignore
  selftests/mm: rename local_config.h to local_config.h_gen

 tools/testing/selftests/mm/.gitignore      | 71 +++-------------------
 tools/testing/selftests/mm/Makefile        |  6 +-
 tools/testing/selftests/mm/check_config.sh |  2 +-
 tools/testing/selftests/mm/cow.c           |  2 +-
 tools/testing/selftests/mm/gup_longterm.c  |  2 +-
 5 files changed, 15 insertions(+), 68 deletions(-)

-- 
2.54.0.563.g4f69b47b94-goog

