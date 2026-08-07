Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D21541A90B
	for <linux-kselftest@vger.kernel.org>; Fri,  7 Aug 2026 10:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097506; cv=pass; b=anYWGcj0+VfcBbFaebYGreZZvcU/ru6xzEoFwpvPIT1ZQvwvqs0s01A7oOcu9nfL31A/75CAjMWrQb+NbufHgShR/xhoygtnFKbTyghrOBmNnQHHHS/ancqW+43JYmUoxO8Nm3UUHfT5LJHTRWaPXDdVfkttsaCVE1ca0qeqXl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097506; c=relaxed/simple;
	bh=zdxgfaDL7vWIO0bJwbL8U29BOQdGbtp0IGf3LADiyZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sot/O6Tqlp+o/MNK9qBvbQ5yXhjb7qs8220KRK+uhRE5NC+zXkByHN+30KXzexZKInuMm0oinArxMZ1EbvZ2IfD4XqorCfJ180E5BEeAXC4rf1NeS3g7F/kQAIEB+kJJZ1YgzlxRxAgDpafnS4bD3315uHmVwiu3G8XnPruqdQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1xH8h3P; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1xH8h3P"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so3127585e87.3
        for <linux-kselftest@vger.kernel.org>; Fri, 07 Aug 2026 03:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786097502; cv=none;
        d=google.com; s=arc-20260327;
        b=oyUxDlQN24kJ+CUg6aI4e6B4kAlKiSyQJV36oXGwqLXsIodpgxHy5lgmb6l3D6y+Af
         vIicX339Y0XY7sOU9gxj5ZK7n4sygveeRSC8fgkZHBViQwp1rOmans1YZ2NYQUG5Ik0y
         KWGWpCxIbFschK2+ldvuDrhtpsUUup8cwlPBy0c3LfPxt1acMPaeFteLAOzZcq8sQsI8
         KZvXszfXsINT8MD7/xj/vOQsimbnuIYNu7pn/wSHiwIYYykHg5jKL5LPap1bqmLVXPYw
         yiYHCZSH8wLJEFVD7aXQB2gQmLyQL5+oMPEsyhPf+r+wDuR3y465wBeoOuvnA7DNRr2l
         +FMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zdxgfaDL7vWIO0bJwbL8U29BOQdGbtp0IGf3LADiyZE=;
        fh=OoVIbzqTwaYGokv9kr7vqWQTx4G+P4h7oSSWzlQ8CCw=;
        b=QA7an2hZayIeU2rgd0T6aP7C9rp40wRm3T0rVq7AgFPEunUE++5qpvJJbEaLa6nQ+M
         nB1OM2P5XBZ1zHdvKoM7EwjYU+Yz0FcR20XxIZRtdKazB5EMSESnkI1HC0AD/ajHoO/G
         JMlqHD0eOhC/N9Iwb/3e79O+TujthBMqfxWu2bIPuTPC5csRZjGNmkSQUrlxz6whlTKl
         8pImtssB6cCQYK+78Ex7sK4Cyp4cFVN1c6e4nH+UYe+/1rkR7BxnmeuSz7aT3kIp7p76
         AnBWdFtPgshQH0i73JkQle88ui8knO4GUpMG/9ntXUnVBigRwcQlsu29eDaLO9Iq5ZOX
         ZMBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097502; x=1786702302; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdxgfaDL7vWIO0bJwbL8U29BOQdGbtp0IGf3LADiyZE=;
        b=o1xH8h3PoPK7IypM0GqH70jZ3+OosLSF+7OFQOvZ1Mg+n4OZ1lnxIwoJSR87ElfQng
         cBUDEz9NxoKshr5bb4aPpVWH4cJbrNT8IspV5Km+jAaQ4wRkkh4neqmSkSf6t1rFfcpy
         QC2aCvcQpJ8IGwKGyU7lCCD2x+GfWZ++hIs254CnhNwTx6M3sAwxzAqMd6GlImNuGcOT
         6ozznhNzcgblueqFH4q5vdIzdTfxos9xu7zeRmXcHyuTyfk6SVfzy5xKeMtz9PMYZELI
         0rIJJZObFs3hJLhqI1v8hb9ipB0sf1YlW/w6BQ5ESOKYQiWRFXnNlz9mRn8uMrsNB7rd
         pNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097502; x=1786702302;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zdxgfaDL7vWIO0bJwbL8U29BOQdGbtp0IGf3LADiyZE=;
        b=e7Z/sTYLe4ffpMDnVpm2MDgAmoMbRPxcqBIcQCcHkslFSLP1U9/3fZk3w2l2ZviJKi
         HkbzeEoTvwVSvZg0bXRgUgSikpA0f/FVhAzed6QSdCkxTo0779PEkyGMRRI8M3JKF/Da
         x9RttGe0e6KIfJUa6G3nnqmZoHIhaw++lg3D1U4YvPij0XcBg/uVJe/V/iXv7eYhfvLY
         9yyP6Fb110QWKZ7wkA+/HuHFF/pxRcquFamOKwWd/ke6TK0ksDnr2eqARG/SBqmkYYIW
         sIg8JtODxKQ54aUuY0/2UfGpWWkiodeNSjQGn9DpcW4iB/njpLFXCISCA9lUOSD7mwin
         KiqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdSNNYqo/Z5GC1bTpPjC5tl9HZsgq/+maZW3sgZyQDC9Vzd7v9ZuETZksq0V/IQvKcH1MiGxqa0/sBs5tABpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeNE+/JatBq11baU2h/ks5JI2XFYVDtK1pG4iu+RRu+nmBJ7p4
	p5rBty5JmJ1JS5rOSQnYxI4MWdrH744IZzOby9mAuTEVcmgt+H2yP7uu98LtBQIzGukRAYwrIQY
	IPWce8/XlpKDpIJms2+Xy8FdCFJ8bXNQ=
X-Gm-Gg: AR+sD13O5a3+UctYkF/DQo2AZZddFQ0ZSQiq8vBeGW5m+j8OxwsOEHGNd7OqyP/DDzp
	yg65zxf3stmY41dWcalzQgOmr5ZdxqLYgEMumUy+JLoapHZFgc0QiDRIyl5C2FYox/W7Ap50B2A
	v8vmX/dZdJ4N66GS1qzcPtw7HloIMJw5+JDSFPBBbilOkNErgCFPgsnKKmYusP01ixRUQ9uV1sV
	P6SArSDPZ7H5UCKGDhJBND0zfsrYOqebVn1Dna9SriE0BXuOlBswgy+VOf6m9d19iou6pddwu0/
	UkAnLXe+9GTkFJqzPQ2BaNYYh7O6O5dQKbq4cGesfv8r9bHBn0T1/orJLNom6l3qXudhpz297ci
	tHpaj5a4WeXNx94J88PmT7gvujS4eWUy+1su9xLm111kLhw==
X-Received: by 2002:a05:6512:304d:b0:5b2:c5d5:6151 with SMTP id
 2adb3069b0e04-5b2f4cdc528mr3181669e87.48.1786097502040; Fri, 07 Aug 2026
 03:11:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804014714.4362-1-sigefriedhyy@gmail.com> <CA+7S2vKRASitG1pK_RPG1L-hDsJyev1q-+ViRhCppBg9aFuZvQ@mail.gmail.com>
In-Reply-To: <CA+7S2vKRASitG1pK_RPG1L-hDsJyev1q-+ViRhCppBg9aFuZvQ@mail.gmail.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 7 Aug 2026 19:11:29 +0900
X-Gm-Features: AUfX_mz5tZNDcI8fdqNR9f_r1Yx0gpuNJ8HlfuHmCbVxvf05NeUXUhbQZ5sIHZE
Message-ID: <CA+7S2v+upifiRtBmGjHqBbOLFWn_m1dj+mezi7rFZGYLb-DChQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 00/10] ipv6: report why a route was deleted in RTM_DELROUTE
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Chris J Arges <carges@cloudflare.com>, Daniel Zahka <daniel.zahka@gmail.com>, 
	David Ahern <dsahern@kernel.org>, David Wei <dw@davidwei.uk>, 
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Gal Pressman <gal@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jakub Kicinski <kuba@kernel.org>, Nimrod Oren <noren@nvidia.com>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reply to comment in the other sashiko run:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260804014714.4362-1-sigefriedhyy%40gmail.com

> Should the netlink socket returned here be closed by the callers?
> [...] Would a defer(rtnl.close) [...] make teardown explicit?

> Same question for this raw ICMPv6 socket [...] Would a
> defer(sock.close) here be preferable?

> is the stated reason for the retry loop accurate? [...]
> addrconf_dad_begin() takes the early branch and never sends a DAD
> probe at all [...] Could the docstring describe that tentative
> window instead?

The comments above look valid, but I do not think they affect the
correctness of the test code, so it does not seem worth sending a v6
just to fix them. If a v6 is needed for other reasons, I will fix
them there.

> Should the #else branch also get a stub for ip6_del_rt_reason()?

The ip6_del_rt() stub exists only because __remove_nexthop_fib() in
net/ipv4/nexthop.c is obj-y and calls it with CONFIG_IPV6=n. The new
helper has no caller outside net/ipv6/, so a stub for it would be
dead code. I would rather add one when a caller needs it.

Thanks,

Yuyang
