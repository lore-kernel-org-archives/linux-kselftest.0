Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441A440FD94
	for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 18:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636552; cv=none; b=SeR16z/91GaZT++J1bGonFIAhLGlb6d7QC6VDfbTd2hjHGO2DB3e7MaFhr4ej4/EsDFrpGT2OojGsSj3+ZfXlwdRnS8SwcWeC43qzVNgZQcQS1J+iDCn1U8e5AWbx7r4ItK7lzhft6Lcj7g7Uhuf0GVQqP1OrN9Y62CUSQPWdfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636552; c=relaxed/simple;
	bh=HcpjVfTRCC/nPL4AsdXi+Re5QhxrdRbCpCjf1GBzvEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0z9vzguzJMavVJmZ+kHlaCgiVhpyk0Mk1T3rL+duakSAgufiHKl7VmB6X5Bt72gRikyuQcEzzilUsrAHvajRrZevHNWmYiyFqiT0mlqvrgf1G80qYzLIbzHZWQLAnZN+8f3AYUBHMxuiSvbyJh3jmfM86cnQwGTQkdpq5oJiwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HD28Nqwl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=m9AB5tr0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HD28Nqwl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="m9AB5tr0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774636550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/93MB1/qzDoWw1DCi0QW275S51oBz7F7ihG0OjaMgY=;
	b=HD28NqwlLQ2/aC58pdp0UjV5WF4DCSaML9MdfC5BdqnD379/xhE8wAcXq1Uv79UtxLQ/ae
	41GyHxd5Lqm9yHuY6NPfgNEoclJIc/TzEtTDVlSn4FLEuwUVhNaTsLY7Tl4cV3uraISmge
	p1z9CdGWbwBilp6PWOEwnVgxIhZ4D5o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-bdwwLbyBM5abi5dRLm0kyg-1; Fri, 27 Mar 2026 14:35:48 -0400
X-MC-Unique: bdwwLbyBM5abi5dRLm0kyg-1
X-Mimecast-MFC-AGG-ID: bdwwLbyBM5abi5dRLm0kyg_1774636548
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cfcebeb1f3so369361885a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 27 Mar 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774636548; x=1775241348; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/93MB1/qzDoWw1DCi0QW275S51oBz7F7ihG0OjaMgY=;
        b=m9AB5tr0wGg8MfgojJf3B+QYY+ycwtDUxd+w8w576/LSNU2Gb5BxqqqIkHevhv4aEp
         MbG99X2E7IsNcah02Yum4FEdKtb6mTwq4V1j+jf3f3X5eTOF4jMTHXK5pdOy8fDUb6bM
         oc2Tf8Z743GD6oS8PO1x8WEhwOr2JGd9+HAWGbjrZnBeOiL6dpzA5UE6LEUo+RBAdQFT
         ns7cnU80gIMEWyIdEQuFXMc8zz8nb9stKl2iKyEXS9UOq+LeEE0KnIB2RUaZtHUDiGdL
         LBHnEvFzPr8udontLGYMV7iGHVpuVUZA5emsjxvA1vXQ1b7fBZmBqf22y4g6GNY46pu6
         ixqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774636548; x=1775241348;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/93MB1/qzDoWw1DCi0QW275S51oBz7F7ihG0OjaMgY=;
        b=mZCgJRAxQxIKfmLuaQ2GqlNa6gEtSzA3RVHcyz9aJhV7SXIDja1nmNciRsslSRwJio
         Dg/z8Xels3QBVNYn72u6+B03vpdKFtHovEXwp7sI6oh1UtEan+iguBA3MuwSjaxdHdZ5
         gy7nDXoKNOje9VKrfk1AI79flX1qupcyA1+at3K7OVSqrILm+XEHd6kba/rMLeMZHk4D
         Xtp8/uDXAY2+XMXNOh3miSBBQp6WAk0O/86fIkvzKIUUmpm77a212r6lLsT5+4ECFE8B
         5aXOXylhUnLv2lHYqtyQiKZd1qOxBdaVzCiTTHBSJkDrtVoe59n7rxQ8bqNx/+ftnY3x
         j7JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbrZqygmTl/zjYivldus9qrafyjDo2jkUMHkMLltxiHHQXu9bSwaJSDA/SsH7c2jIGbhShjr1GBgcvry4qx10=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpovYR8jvf8Ql8gKXh8DuNwxB8hd0FBGc0q8Y4VhPiKwsn0zpH
	yOfxI8EDPvmFzv4nExznL2zcHmSAVYkdHjNLcdXP492VFAdo014bNqobKWJvX/+CBF03/7W9vl9
	2cJWX9/LJrzWugqcn4Gz8Cd7aZzKev9GRW3X9MyPIIbUr3FaOsyeAnICa8t4VSeOnfVI0JA==
X-Gm-Gg: ATEYQzzpC7/Csqc/j/WSm+nC03yu7+sCsaDlsFSfnxv/DWPRyWF9HIZPEukUTy0zuEk
	jrTIZrWjZ2pfd/peQlJyHc2duI0VF9LtMdNkBrcM41HbFTaVQ8ur1TtChQMhs6UXy2uEFUaNgkx
	JKOz9h3kigutW+9k24ihS57r9hia+T/lD4yEZrZzF6OT6Yt1cb3xhXhK7GZxMcdXdU2L/9QP7YR
	JXhgoQlQqnxL72QeH6oGNisbb2ZMIMPnfUt+c10PaMDploNlwjicCqCCDkW8vYOxQQhzYg8iifM
	X1YwWFNzL5BGfQJCva9Pl1NMzVu2DRZQUALSsaAUn6KtDQS2MjfczZOcnQHCd0e0L97Po5BMbu+
	hsiLUMgl/Zen0PdF7tzSq2sP0hWYuhwoWMnqtmnEi2NSc/T6AQxCgEU48
X-Received: by 2002:a05:620a:7010:b0:8cf:bbf0:ff55 with SMTP id af79cd13be357-8d01c7df86dmr471920485a.51.1774636548026;
        Fri, 27 Mar 2026 11:35:48 -0700 (PDT)
X-Received: by 2002:a05:620a:7010:b0:8cf:bbf0:ff55 with SMTP id af79cd13be357-8d01c7df86dmr471913785a.51.1774636547504;
        Fri, 27 Mar 2026 11:35:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d00e4ca250sm558769285a.25.2026.03.27.11.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 11:35:46 -0700 (PDT)
Date: Fri, 27 Mar 2026 14:35:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Alberto Ruiz <aruiz@redhat.com>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v7 0/8] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <acbOAJRgsWJuVY3j@redhat.com>
References: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260323-clk-scaling-v7-0-8e7193dc9405@redhat.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

On Mon, Mar 23, 2026 at 01:24:51PM -0400, Brian Masney wrote:
> The Common Clock Framework is expected to keep a clock’s rate stable
> after setting a new rate with:
> 
>     clk_set_rate(clk, NEW_RATE);
> 
> Clock consumers do not know about the clock hierarchy, sibling clocks,
> or the type of clocks involved. However, several longstanding issues
> affect how rate changes propagate through the clock tree when
> CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:
> 
> - A clock in some cases can unknowingly change a sibling clock's rate.
> 
> - No negotiation is done with the sibling clocks, so an inappropriate
>   or less than ideal parent rate can be selected.
> 
> A selection of some real world examples of where this shows up is at
> [1]. DRM needs to run at precise clock rates, and this issue shows up
> there, however will also show up in other subsystems that require
> precise clock rates, such as sound.
> 
> This series introduces kunit tests to illustrate the current behavior in
> the clk core. As discussed at Linux Plumbers Conference 2025 in Tokyo
> [2], it was suggested to move the negotiation logic into the clk
> providers themselves so that only the clks with this issue can have
> their rate preserved, and add some common helpers to the clk core.

Sashiko identified a few issues with this series, so I'll post a new
version with the fixes.

https://sashiko.dev/#/patchset/20260323-clk-scaling-v7-0-8e7193dc9405%40redhat.com

Brian

