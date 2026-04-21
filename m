Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAA8381B1B
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 21:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805673; cv=none; b=IcPvqzjrUaSEr/YTbQwmP9S0fwExNyzADym41M3wnZanhac+ynl/yaXgqknjQlqXf4gZeE+ShP3eIrfOwI/2bxNrZPqbyfVdhZ+yD6NW4OGFDIjgoD8GbPId4vmavJ34qAfKv7QqIQN9HZT/k9O9XOo6oamliDkQw2IiZPHlmMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805673; c=relaxed/simple;
	bh=a4ioXq7GCu9ZHZCCYlN3qWWxkA2Z1IF6fJUhQYxTSo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLtvBSOyeBtb4sPKBR2ea6VOQ/HUO1caWHvXciGzOFnbSTCNkrWeNNb9ecaW/aEZXnjvaHv+u6YbZeMjkVQZVULb5o0oCh8F44Geo7L1D+gw4fuSC6ClAIhIaBaPVHc78f9TtmWP4skeVB/2PHz7PZQo0fy9n0V7AMZbEpZxsZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Cuo41REd; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Cuo41REd"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79827d28fc4so46073057b3.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 14:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1776805671; x=1777410471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4ioXq7GCu9ZHZCCYlN3qWWxkA2Z1IF6fJUhQYxTSo8=;
        b=Cuo41REdwqnfkE6Xb7l4KSv4/sB1yDNdJ3cDP+TNhCo2l7nRisNkPfPe8TBtXTeTKC
         0WZQAqL94pwUMrkQIq6BpBMQtcogPtqFbLKVlzbze1Xnfm3jGmRGr2AKluquDzGBQTHx
         rexQVLNltdxE7v5PPMcAr4GOEQ8he0fhUX5NUNp9StiJzsfgrQ2JcAZQnL2+HyxSBWaX
         I6p2SzTF9ReHE6AFwxIEgO0sin09/uWwdeYDL8s91Mhu7Sp99GA58Tni1i8D3eEC0CBi
         X8i9bqQSIc5ZcFnD8lBi8P7HnQYbiTRLYu3cZ3m1EIw1jF1GuskJZx2/BGBe0Q77tNwX
         4/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776805671; x=1777410471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4ioXq7GCu9ZHZCCYlN3qWWxkA2Z1IF6fJUhQYxTSo8=;
        b=FPXlWK2HgLk5qi4hXM0lyOlxN9wc7i/W/kxvW58ebMDPltJBmds0EVjd/LPBuTSuDf
         MsfZpI2V+n9OffCAW1XyrOR/fyW+poKy3i2J6+GGhIaWekcDRVf7I09gObGe9qeCAD68
         5fy++dZxlPlJahQR98jbtJ5YDpZD9SMLtN0md9qauTl/5zWV63/FuVneVl8D/AIt0TxN
         XVhD/0l2Jreqvlv39e9PFqxdeEmVB9blgpQyiVqil+g7rAuOd5vZY50EU3yoQcQSEphI
         1pcy+mXJDteRMd9crbIfgxuLloYqWhxcFe+wFWbra9uc7EGigaQzJX83LXjxGZmzqPhf
         PNXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rJgojNmxUKty+4M4kNfXKmGnooPC5IbRIPa3Qgsv4XHaPKoFuuGfwxL86rIEj3ASBEJVXNdYifdab3epkR/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH9kQZfxL0IDwCcwfSEhL8UMixCl9xuBLM8tzkALohajW2PMLs
	PxMscYJtPvbiBp2jgZe2VEpHkh41H/D2L5jzxmeDpOISsIO1xKX4ykpBtb650bAmwWs=
X-Gm-Gg: AeBDietZStyBrvZrgEzZ5tcu8uFDHR/OIbT0JqQoMIi2KdHhHIw+PogYWMcjqvilETK
	P/lJLoJ+CmvhMSnqiJ65IS8KVZxX+/Inypa4qL6gfRnHwKohyeFHkCC+XONllQ8RqioBcaPcwI1
	wGwlkCpqgIkSeRnXbYrKRUZwKOyEtQRcyBnheZMRD2zuaQrY4R13CvI4zFhzZTRTn+gYfjgCHXs
	aMC8PI/uVZIGUntiONimN48NqFfAwqm3jUy1C4qnyeoq1ThJggfMDAmO7avNKDiq+VjgSXo+nlU
	bcBL0AhMpIg/SQp7ln4tVfWHDJGGKqnIIRQlztvPy4UbYqgVkw5AVyxBMVTTEJ6Y7uBNyq+5SP/
	EplpKPhctLslvnHzTi/B0SK7JyQe5JxvhZJqIxZg2S7HD9C5HDkF1h2e0/V4aBZXru2Ibd7EOg6
	a8OT9jsbfu8Rz55io0UcqtdIo=
X-Received: by 2002:a05:690c:a054:b0:7ba:ef98:9712 with SMTP id 00721157ae682-7baef98a6e9mr82622297b3.11.1776805670803;
        Tue, 21 Apr 2026 14:07:50 -0700 (PDT)
Received: from CMGLRV3 ([2a09:bac6:947f:3af::5e:42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee89da0csm61303767b3.8.2026.04.21.14.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 14:07:50 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:07:47 -0500
From: Frederick Lawler <fred@cloudflare.com>
To: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Eric Paris <eparis@redhat.com>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	=?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	=?iso-8859-1?Q?G=FCnther?= Noack <gnoack@google.com>
Cc: linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
	audit@vger.kernel.org, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@cloudflare.com
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF
 LSM programs via BPF kfuncs
Message-ID: <aefnIw1Tx_2r5nkS@CMGLRV3>
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>

Hi folks,

I was accepted to speak a little bit about this patch series at Linux
Security Summit this May [1]. I'm going to use this opportunity to
re-iterate some of the motivation, what can be done today with BPF,
drawbacks, and wrap up with discussion topics. I'd love to hear feedback
from audit, BPF, and security folks to work towards a viable solution that
addresses shortcomings to allow for better integration with BPF.

Best,
Fred

[1]: https://lssna2026.sched.com/event/2KEc3/bridging-bpf-lsm-and-the-linux-audit-subsystem-frederick-lawler-cloudflare?iframe=yes&w=100%&sidebar=yes&bg=no
