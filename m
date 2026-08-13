Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7D3279DB6
	for <linux-kselftest@vger.kernel.org>; Thu, 13 Aug 2026 06:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602906; cv=none; b=KDlgq4sEAhR6j6JkqDrktchSVJOUNS0TeJWueDSvp6cSOl63BGETBOa7Xkrn5eTZi3i8vIlm/POyltV67yPEw7ES7I3o5K1ygZMHqcnIEniVB8jwk05wYyHBqHa1wvSnXPKd9Q5sk3d4wN7tiamaAuB8Oes0MQtLVSH09belNa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602906; c=relaxed/simple;
	bh=xQUgyJLWEUo8rNSfcs9RsMhAZwGlUEbBjVggc4DxqJQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fzPXDUmf6fQ+CNlAb6VNDGhZJVTx35C93qiSbyqyMvkgjvHJRFAQSa2RPmaj9iPnOL7SzTtlwezwUIzgGvfobpHT4YOFqEbZa7taTTStnS8QoZGCSSSJ/Oc2+mQk2Eug5Q9Y9jTE2Nca8Csy+2dZ7NzPTiOzJtMClKIrtxvR8Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NMz0yblI; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NMz0yblI"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso2014804a91.3
        for <linux-kselftest@vger.kernel.org>; Wed, 12 Aug 2026 23:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786602905; x=1787207705; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQUgyJLWEUo8rNSfcs9RsMhAZwGlUEbBjVggc4DxqJQ=;
        b=NMz0yblIPKIm7aZMNWEGvWvjp6BBkZZPO5iGXeN7cXvjzVWQ3ZXm+WmIwUsYm+gB2E
         SEU2ybIYUsjOrSKgX9T1zswD5E2ajSFI8VRZYsEGe/pxGMjSMdUqlpeIKMgp+PY+VWIZ
         x1oLgKfOsTU22bqeu345IuZCNzmVT/31ddFqSSwV5jeIF0SCD0Jx50Jr0JhwiCsVMk+L
         UswmGbOnZzrn2HqjVYInsrn0rPpY3TxtVarX/fo8IAbfY04t5fmkole3+4Mv6AifR/53
         CMJlGOUWuwXDRk/3mgBPBWDYVfQuUY4tX0ieZfx/Bk62guETDNZ4xrI6AlDcnNFnxiB9
         Z1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602905; x=1787207705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQUgyJLWEUo8rNSfcs9RsMhAZwGlUEbBjVggc4DxqJQ=;
        b=YQzi5c8H2sWIX1MvhLQM0CXLGrujVmRp2qp301dLZrKgk8bwua13lZzocribKg9j95
         YngACcgcQQ1o20WUOytkTec/EgHgId+Jv+s7H+iCBsGCH9kVtzgrjTgG+fvWPpwXM1mT
         diF1xX3WBTV7R4g8BBUai/9F/gxdFav6bnoluISz2aQTPbgTVVgJOearyGhVTykRVbJ3
         sV/q/xvEZJRwX80PvDRw/fnbePXEnyFItb9zjScxwiVHaqPx0VherOYgos8WdIJ1hoWR
         9aCc85+1qM4NmJEabwqDl6Bcd/veD9AHegDrQyhT+Sgwdf5/hRqUNNd/Eu3NmucVWZVQ
         aA/g==
X-Gm-Message-State: AOJu0YzdxzVyfAUrdroZz7fWNu9aorCbmddhTYRGHoHdxkGxjQxSjzH1
	JmWQdhqVAZlZr+90JFJJkc/9xlGzaq4EX47O//8UzE+umkPzEhQtouzV9VJ97LVMNcsBqZPv49H
	liA==
X-Received: from pjbft2.prod.google.com ([2002:a17:90b:f82:b0:381:1eec:b454])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:17ca:b0:38e:6bd7:fbbf
 with SMTP id 98e67ed59e1d1-3931e29a12fmr3604505a91.20.1786602904812; Wed, 12
 Aug 2026 23:35:04 -0700 (PDT)
Date: Thu, 13 Aug 2026 06:35:02 +0000
In-Reply-To: <20260615150119ee47a1aa@mail.local>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260615150119ee47a1aa@mail.local>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813063503.4023719-1-wakel@google.com>
Subject: Re: [PATCH] selftests: rtc: fix flaky date_read_loop test
From: Wake Liu <wakel@google.com>
To: Shuah Khan <shuah@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-kselftest@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuah,

A gentle ping on this patch. Alexandre has already provided his Acked-by:
https://lore.kernel.org/linux-kselftest/20260615150119ee47a1aa@mail.local/

Could you please consider picking this up for kselftest/next when you have time?

Thanks,
Wake
