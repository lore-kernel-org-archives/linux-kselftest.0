Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446307;
	b=l6hXgvhjhbZIvJKuJVxSluxJsEWHI6DEkafN4hk/CiY1exCA8zu8QI4oaGQqJNuoWQ8x
	 KhuqMEjYQMkk7/Ixa8RVDcAtThChx4yurCGZ9HykJ5kJJT7bPsWJCEfBIhy3NjVPo6Weh
	 35SgrAAX7PTdIj+B18nBARCAT/TuM8yBVRBaPRmxjntcpmnKM+UHhK5aGFJUdaSMlrW3i
	 uYgUXVP68EQhDmsmVZMpRw7+fyecFWYGcyAayfx/2Aq2MziEMenOB0eB6Jtdn/N2EoCq0
	 0LKJp90cl1wSXuEfz0oagcmuiVMXVOP91LuvRyJYhAURV2pA4f4aNBffyYKsx6OrMLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lv7P97cFEnUlqcS6xftzBXprT2lVDyXxXMjQGY9uQEo=;
	b=TNbichmot2Lu36Aa0l07w+C1yF7JPyQqZZig5mztD2orhIZpjTuModCVqKB6J3AH823h
	 83YkkEXgqy9AysAjNyQoGP3/IqSOM0RwcS5FPogxbBRoT5cf4++F4XcvFZM6/MR4Ri5K6
	 Ju4mKP//s6pGxR2wGOKgUm/oteuHEmREA0fCE0VIylh9iHTXEXk+hwD1UQdwCkUU9zwTT
	 u3MB9SfhnYPoyU9PtOmVCTQcembggl2AY7gadBdCl4MIHRP+YnMI57WJppZhb6WIcM6wR
	 sIAuW+tW4CHbqNYuup5og8dag5U1C3ZvFslfzO2Nbt4utkmSNbZ7wcsMuEeZNTugyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sAiho/AR";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0305D606A31A
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 15:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0305D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sAiho/AR
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cde0daf3a2aso1356591a12.3
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 07:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446306; x=1796051106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lv7P97cFEnUlqcS6xftzBXprT2lVDyXxXMjQGY9uQEo=;
        b=sAiho/ARlFCrUYiUg3TGQRB/nWLToumqe+R53/kzlcTzIDvqND39ncl/LkFFcKj98X
         yK+er0/q/yFMv7DlW//JFAMOOr0OrvYkdlWuBPLDRi3b62YxlfqKozS6IRg25/1BjpzI
         dlf6xZ0l3TyhnygEX67Udv8RoZFdBSp4eLWVrQ5Gav4JtPAyh2ND5OXUsQZpmgC1GCJx
         dKwt2G08KAqEv8HTpDFmKmUskbSkm3g2l5HCEFpKSVXGRzWk2ZS2PmTjdCDAphRa44Tr
         Tw6b3J9FlDvRvXOqyXF3WPwb2/HPegGFneSQkMXRvKkC1ERYhRPaba6W2WW1ES9P1SG/
         YShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446306; x=1796051106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lv7P97cFEnUlqcS6xftzBXprT2lVDyXxXMjQGY9uQEo=;
        b=eDX2t+DvrXc5q+X5t+hOxgZaJ02QYX52932mVcEhvCjS+3JBv1wlyVn27BrZHzsWqp
         QqR+SmTQK7PjAtuhZvxhhOUl69DuH2gnmu1fZ2FLqZeBJ0RUGLBSdgb9Z/cCUHfWiakI
         SsvtApHw/R6mkuJJ9R4RLcEpaPpUjTeFobhePZW7y+e3eXw+BR//cRZpokqX3V/R3cat
         jZTY46t4BbfYBcndJrbwgeKT20H1EC69L9YGph+xoJSiK9Rh2/AjHJgpeq2gN3uobD8z
         DJdtMX90XTwpYmwmSZN1MkIhWOQMVDsgam4E9Jj5+fsJWGHWRMcg0peVQbBEe0sTrgjT
         0Fbg==
X-Forwarded-Encrypted: i=1; AL+hErENb1e58DPh9WufFiO64YD8W5bQE8xYe9X3baun7ivpPnUB1yFvcwg2V79yQ9xnCKJOn3Z/osP46f1V2t0mK1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MdvID+oWVmbq+rO51u7qiLOC/YFpY1xNKzPZ1MK0MYWu2vAXU
	579aFicLBZQO+UHXn8zfm+d3dGQyXB4zMs/sSk35s5ov25RUxH3DKQU6
X-Gm-Gg: AZFdTZepAOMNd1TnXYrxuXc2560SL8XJ1kFpNM3KLodU/OqJ2U9olTG9jRli/y/jA+l
	2Wk/ywgXqzLoJhY+YmvPcCNF8S5V6r2O534ZzIMD9Pujk3KZGY3f6wx978ZYILrp/loy3EznAeI
	hb/dQ3cEPtc2kkmOWTtYx597o0i4HGLMf0Y3zXbi8RKWGcnAfOG+QzIz2gKuHXwElUbSR0oWCJX
	QA/TMbei/9twZ4+Nq+h5OTba4gaXT9QKjhB/X+SVBy8FxyC8AaYOwkIPIOTzBq6yWgQtVvZT914
	Y2EjYJtLNTuRdS2ocvp59XSwRajBYDGSy95QNvKy95Aq2GhbVkKpDXo9gt74m8lIIy3XQd1f3Yr
	4zpJTNsGXmYgDLgFqNxteLwigNAz70PCikieLaYWtD5HCtpR8D6mw0cX79dWfoPNJprq8+4Oq4n
	4hTRjwwjHELCRDjuKPqJaPjczkpKsBr/gUVzrxuXnxUYDmQQXNxXlqu9SDd/YsqMDZiBg9Ivzpv
	kAwZEVstBNU2yLlw7w9z5lgoyExjUFFJVHGr+dOorZ7kuVipRK+2Z2JZeDXYo0Kp8AD6c0eDaIY
	oIRut6Nl5bfBsOtaF4qV8iv/pRR4Q/84Cn8AIa6XjSyMC54JeR0ezu3QHl+UNtzANP9Htf8=
X-Received: by 2002:a17:90b:180b:b0:3b4:1336:4f53 with SMTP id 98e67ed59e1d1-3b41c7d5c11mr9976213a91.1.1795446306224;
        Mon, 23 Nov 2026 07:05:06 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b217a5bsm7853738a91.0.2026.11.23.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:05:05 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Miaohe Lin <linmiaohe@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Naoya Horiguchi <nao.horiguchi@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests/mm: skip hard dirty page-cache test on FUSE
Date: Mon, 23 Nov 2026 23:04:59 +0800
Message-ID: <20261123150459.2211177-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <25ecd9ad-7c5c-16ff-5197-5703622a88b1@huawei.com>
References: <25ecd9ad-7c5c-16ff-5197-5703622a88b1@huawei.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 23, 2026 at 11:06:45AM +0800, Miaohe Lin wrote:
> Would it be better to add a helper? I doubt there might be more
> unsupported filesystem.

Thanks for the ack. There are more (CIFS and orangefs also report the
error on close()), but Andrew has since replaced this patch in mm-new
with e747ed2c3418 ("selftests/mm: check that fsync() reports
hard-poisoned dirty page-cache"), which needs no per-filesystem list.
My patch can be dropped.

I tested mm-new 87cdbd9bd631, which has e747ed2c3418 and 44191f78d131,
in a virtme-ng guest. memory-failure now passes from virtiofs, where it
failed before, still passes on ext4, and 50 runs in a row on each were
clean. I did not hit the unpoison -EBUSY on virtiofs even without the
ftruncate(), so that part is not covered here.

Tested with the help of an AI coding assistant. For both e747ed2c3418
and 44191f78d131:

Tested-by: Kurt Lin <lylin1023@gmail.com>
