Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9631F38F92B
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 02:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111496; cv=none; b=JRJW/hGiYmfQoTvr2Wp/SBF8mNzrmUljAhl0RPHTVyAeuTg8DMCS4io9lxplWc79REO5XVBqDTc5HnzGgpASgIYkFPP9V6Q42/ktvOAnOq2TM21xyRe2jCCOU3kiY1nuOigQh8+dLyrZt7WxoUmTgtzZDAvqwvIWCmihw2D4TMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111496; c=relaxed/simple;
	bh=u9j+xgVObMny+agGJpZVkmxDCmbUT+kh/QsUz4DoAng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUBlQo1FYos2e8NBG6hz7PsSBT3P+sAlzHT/6YfwAKUHoLS8QtE0e5hMNSTKXTkC4PUvoYV2YWwL8ayVD8pzijWDMvH5rlXuAjdqV3THjGOHk8/7B0kvXZ9x1LSZx0iQACX28xfqB9oSvVYHr/PxBsTumhVe3a+CFtEbBWhBz60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Azb/5mhM; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Azb/5mhM"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso8158006eec.0
        for <linux-kselftest@vger.kernel.org>; Mon, 09 Mar 2026 19:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1773111495; x=1773716295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sxlH9X74vyhrxb5FVYtDdw9Y8Mx6idydU5k2uIXNGOU=;
        b=Azb/5mhMlJKFl3T0E3ZPIrVTL1lVrsQ1TPBSOCdJUCtjU1gCrQ0BaMA/LiZ3ReBMrC
         PdCvfNahRsP03FROzzU+FbynqYTzpLVEpjqn6KM3Vooh5FgBUSziOMpVZvJrxCI/eR0G
         aRWtD45lUSUzQPb46AQnhfpoqL+tk2t8KfqOYqdi5hx/S24Wsv93432CpkAU3y6iHORv
         yAMFDv56X93PCY09OaeQvKVtPeIVUSkC5UjOZk5f5e5LuHVrHuC3994ifJL6Z3RpVKjD
         f30snzh/LS52rZwSczmvh0XehV3rbdMGUc9+WC+nX6OXkM3qA9aL9IJRMXmrohoCLcaw
         7uIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111495; x=1773716295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxlH9X74vyhrxb5FVYtDdw9Y8Mx6idydU5k2uIXNGOU=;
        b=ifgS10/0LQiKYKFbwybjsafs+63I8jf1k8sn+ap2x18C8ORC/9qW3Z3CBObZVH5Y/Z
         XTyvnwYOb64mtPiymwha59XMvfzwUYOjH5kyjR/SqkIsUSd+2+yp9mwyEGSfEk5YjQG5
         wFiEFFtPE+E1LiiR8UBLa9EMqECDp3PG73CHdmP0fnn/eaFK6my98u93Ny8RLaInSXAx
         gScwZGv+fTCBrA99hkaNjHymDJAR8VtJYqNc9pu3UPrSwtcJK6/ixh9X5dLeLpblqDTz
         Zv6PWELOA8GHGrUj8bzcVeH6qp1LBYhmKs9nNN5CSUFKozBp+cHDSkpMpyQMJLYez6t8
         g8DA==
X-Forwarded-Encrypted: i=1; AJvYcCVcn/XfhRDAk7xDlGSDUrA5oK5Ay6Fe5QD2SHWX6mYKJHXgEBjLj4ctHAzfYgUccQJeG2rCYB5eZFfdgDQAlBQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsgrmPmto/45uLLmZKfnHwqdipAlltzUz1rW6gQEegyjgh7QZs
	QLOTrMHnTTcvqqW5/n6FUc9IXoPM5v2r14MspfXQfUDgaft9hlP0U8VHJbTU9qw9TFQ=
X-Gm-Gg: ATEYQzzKxIgeiH3zX/911BqXX0QzMuJf9SISuOR6eab275an1/va8lWo7dJ6aPJg66X
	V/+w0A7ITFQsdETVEtQUP5LMJBEsii3yLgryV380OZ749DeeNtJc3eo7apb9T2fzB6n2VSrceyt
	NUN9nSVk10fvbihjHXAvYSKQxzZQU/yRTuG+zOeCZInLJY1uu0btENMqhr8KcUig0fNEA6+7XR8
	cEFZ2V+jHiqt6ZnwwyVanhRZ3Mm/9Ae5U8ZbmxiTQ79nLnmBShFRmGkHZgzLYyv1yzaOrdhz9X4
	K2Rm3H2DifZcWQ0IDg2dpRUiMYKnZZatBlHLKYMVQPtGWzY2pc6L2QhkVW6Vo9NiPASa/eSX7iV
	862duqdLVBSF47U5X34dHsTTP9CQ/M5iht12EChtSpZubHD4kCXCtwphCZ9Ua1PvtE3PTVIcOKh
	r326saClh/J+iXmfDlGfltKYxcmG5gxCWI
X-Received: by 2002:a05:7022:4588:b0:123:2de5:346e with SMTP id a92af1059eb24-128ddd84d17mr826349c88.0.1773111494689;
        Mon, 09 Mar 2026 19:58:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128c3f43593sm12578580c88.9.2026.03.09.19.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 19:58:14 -0700 (PDT)
Date: Mon, 9 Mar 2026 19:58:12 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: thecharlesjenkins@gmail.com
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Andy Chiu <andybnac@gmail.com>, linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
Message-ID: <aa-IxLzWVVGN88XL@debug.ba.rivosinc.com>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com>
 <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>

On Mon, Mar 09, 2026 at 06:52:13PM -0700, Charlie Jenkins via B4 Relay wrote:
>From: Charlie Jenkins <thecharlesjenkins@gmail.com>
>
>The cfi selftest was missing a license so add it.
>
>Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>

>---
> tools/testing/selftests/riscv/cfi/Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/tools/testing/selftests/riscv/cfi/Makefile b/tools/testing/selftests/riscv/cfi/Makefile
>index 96a4dc4b69c3..93b4738c0e2e 100644
>--- a/tools/testing/selftests/riscv/cfi/Makefile
>+++ b/tools/testing/selftests/riscv/cfi/Makefile
>@@ -1,3 +1,5 @@
>+# SPDX-License-Identifier: GPL-2.0
>+
> CFLAGS += $(KHDR_INCLUDES)
> CFLAGS += -I$(top_srcdir)/tools/include
>
>
>-- 
>2.52.0
>
>
